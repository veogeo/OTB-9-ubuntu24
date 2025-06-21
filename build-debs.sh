#!/bin/bash
set -e

VERSION="9.1.1"
ARCH="amd64"
SRC_DIR="./dist/otb-$VERSION"
PKGROOT="/tmp/pkgroot"
FINAL_DIR="$PKGROOT/otb-$VERSION"
BUILD_DIR="./build"

# Limpieza
rm -rf "$PKGROOT" "$BUILD_DIR"
mkdir -p "$FINAL_DIR" "$BUILD_DIR"

echo "📁 Copying OTB source into $FINAL_DIR"
cp -r "$SRC_DIR"/* "$FINAL_DIR/"

echo "🔁 Re-generating Python bindings in $FINAL_DIR"
cd "$FINAL_DIR"

find "$FINAL_DIR/bin/" -xtype l -exec rm -v {} \;
find "$FINAL_DIR/bin/" -type f -exec chmod +x {} \;

rm -f tools/install_done.txt
source ./otbenv.profile
cd - > /dev/null

# 1. otb-bin
mkdir -p "$BUILD_DIR/otb-bin/DEBIAN"
mkdir -p "$BUILD_DIR/otb-bin/usr/lib/otb-$VERSION"
mkdir -p "$BUILD_DIR/otb-bin/usr/bin"

rsync -a --exclude 'cmake' "$FINAL_DIR/" "$BUILD_DIR/otb-bin/usr/lib/otb-$VERSION/"

for exe in "$BUILD_DIR/otb-bin/usr/lib/otb-$VERSION/bin/"*; do
  [ -x "$exe" ] || continue
  exe_name=$(basename "$exe")

  # ⚠️ Excluir binarios si ya existen en el sistema como parte de otro paquete
  if dpkg -S "/usr/bin/$exe_name" 2>/dev/null | grep -vq "no path found" && dpkg -S "/usr/bin/$exe_name" 2>/dev/null | grep -qv otb; then
    echo "⏩ Skipping system-installed binary: $exe_name (belongs to another package)"
    continue
  fi

  ln -s "/usr/lib/otb-$VERSION/bin/$exe_name" "$BUILD_DIR/otb-bin/usr/bin/$exe_name"
done

mkdir -p "$BUILD_DIR/otb-bin/etc/profile.d"
ln -s "/usr/lib/otb-$VERSION/otbenv.profile" "$BUILD_DIR/otb-bin/etc/profile.d/otb.sh"

cat > "$BUILD_DIR/otb-bin/DEBIAN/control" <<EOF
Package: otb-bin
Version: $VERSION
Section: science
Priority: optional
Architecture: $ARCH
Maintainer: You <your@email.com>
Description: Orfeo Toolbox $VERSION - Main binaries and shared files
EOF

# 2. libotb-dev
mkdir -p "$BUILD_DIR/libotb-dev/DEBIAN"
mkdir -p "$BUILD_DIR/libotb-dev/usr/include/otb"
mkdir -p "$BUILD_DIR/libotb-dev/usr/lib/otb-$VERSION/lib"

cp -r "$FINAL_DIR/include/"* "$BUILD_DIR/libotb-dev/usr/include/otb/"
cp -r "$FINAL_DIR/lib/cmake" "$BUILD_DIR/libotb-dev/usr/lib/otb-$VERSION/lib/"

# Solo copiar symlinks de desarrollo (no las .so reales)
find "$FINAL_DIR/lib" -type l -name 'lib*.so' -exec cp --dereference {} "$BUILD_DIR/libotb-dev/usr/lib/otb-$VERSION/lib/" \;

cat > "$BUILD_DIR/libotb-dev/DEBIAN/control" <<EOF
Package: libotb-dev
Version: $VERSION
Section: libdevel
Priority: optional
Architecture: $ARCH
Maintainer: You
Description: Orfeo Toolbox $VERSION - C++ headers and CMake configs
Depends: otb-bin (= $VERSION)
EOF

# 3. python3-otb
if [ -f "$FINAL_DIR/lib/otb/python/_otbApplication.so" ]; then
  mkdir -p "$BUILD_DIR/python3-otb/DEBIAN"
  mkdir -p "$BUILD_DIR/python3-otb/usr/lib/python3/dist-packages/otb"

  cp "$FINAL_DIR/lib/otb/python/"* "$BUILD_DIR/python3-otb/usr/lib/python3/dist-packages/otb/"

  cat > "$BUILD_DIR/python3-otb/DEBIAN/control" <<EOF
Package: python3-otb
Version: $VERSION
Section: python
Priority: optional
Architecture: $ARCH
Maintainer: You
Description: Orfeo Toolbox $VERSION - Python bindings
Depends: otb-bin (= $VERSION), python3
EOF
fi

# 4. otb-examples
if [ -d "$FINAL_DIR/examples" ]; then
  mkdir -p "$BUILD_DIR/otb-examples/DEBIAN"
  mkdir -p "$BUILD_DIR/otb-examples/usr/share/doc/otb-$VERSION/examples"
  cp -r "$FINAL_DIR/examples/"* "$BUILD_DIR/otb-examples/usr/share/doc/otb-$VERSION/examples/"

  cat > "$BUILD_DIR/otb-examples/DEBIAN/control" <<EOF
Package: otb-examples
Version: $VERSION
Section: doc
Priority: optional
Architecture: all
Maintainer: You
Description: Orfeo Toolbox $VERSION - Example scripts and usage samples
Depends: otb-bin (= $VERSION)
EOF
fi

# Empaquetar todo
for pkg in otb-bin libotb-dev python3-otb otb-examples; do
  if [ -d "$BUILD_DIR/$pkg" ]; then
    dpkg-deb --build "$BUILD_DIR/$pkg"
  fi
done

echo "✅ Done! .deb packages generated in $BUILD_DIR/"
