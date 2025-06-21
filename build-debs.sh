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

# 🧹 Remove self-referencing or broken symlinks
find "$FINAL_DIR/bin/" -xtype l -exec rm -v {} \;

# ✅ Only chmod real files
find "$FINAL_DIR/bin/" -type f -exec chmod +x {} \;

rm -f tools/install_done.txt
source ./otbenv.profile

cd - >/dev/null


# 1. otb-bin
mkdir -p "$BUILD_DIR/otb-bin/DEBIAN"
cp -r "$PKGROOT" "$BUILD_DIR/otb-bin/"

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
mkdir -p "$BUILD_DIR/libotb-dev"
cp -r "$FINAL_DIR/include" "$BUILD_DIR/libotb-dev/otb-$VERSION/"
mkdir -p "$BUILD_DIR/libotb-dev/otb-$VERSION/lib"
cp -r "$FINAL_DIR/lib/cmake" "$BUILD_DIR/libotb-dev/otb-$VERSION/lib/"
find "$FINAL_DIR/lib" -name '*.so' -exec cp {} "$BUILD_DIR/libotb-dev/otb-$VERSION/lib/" \;

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

# 3. python3-otb (only if present)
# if compgen -G "$FINAL_DIR/lib/python3*" > /dev/null; then
if [ -f "$FINAL_DIR/lib/otb/python/_otbApplication.so" ]; then
  mkdir -p "$BUILD_DIR/python3-otb/DEBIAN"
  DEST_LIB="$BUILD_DIR/python3-otb/otb-$VERSION/lib/otb"
  mkdir -p "$DEST_LIB"

  cp -r "$FINAL_DIR/lib/otb/python" "$DEST_LIB/"

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
  mkdir -p "$BUILD_DIR/otb-examples"
  cp -r "$FINAL_DIR/examples" "$BUILD_DIR/otb-examples/otb-$VERSION/"

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
