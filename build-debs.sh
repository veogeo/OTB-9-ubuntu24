#!/bin/bash
set -e

VERSION="9.1.1"
API_VERSION="9.1"
ARCH="amd64"
SRC_DIR="./dist/otb-$VERSION"
PKGROOT="/tmp/pkgroot"
FINAL_DIR="$PKGROOT/otb-$VERSION"
BUILD_DIR="./build"

INSTALL_PREFIX="/opt/otb-$VERSION"

# Limpieza
rm -rf "$PKGROOT" "$BUILD_DIR"
mkdir -p "$FINAL_DIR" "$BUILD_DIR"

echo "📁 Copiando OTB en $FINAL_DIR"
cp -r "$SRC_DIR"/* "$FINAL_DIR/"

echo "🔁 Regenerando bindings de Python"
cd "$FINAL_DIR"
find "$FINAL_DIR/bin/" -xtype l -exec rm -v {} \;
find "$FINAL_DIR/bin/" -type f -exec chmod +x {} \;
rm -f tools/install_done.txt
source ./otbenv.profile
cd - > /dev/null

# 1. otb-bin
PKG_BIN="$BUILD_DIR/otb-bin"
mkdir -p "$PKG_BIN/DEBIAN"
mkdir -p "$PKG_BIN$INSTALL_PREFIX"

rsync -a \
  --exclude='lib/cmake' \
  --exclude='include' \
  "$FINAL_DIR/" "$PKG_BIN$INSTALL_PREFIX/"

# 🔧 Reescribir otbcli y otbgui para que usen la ruta absoluta correcta a otbenv.profile
for script in otbcli otbgui; do
  WRAPPER="$BUILD_DIR/otb-bin/opt/otb-$VERSION/bin/$script"
  if [ -f "$WRAPPER" ]; then
    sed -i '1 s|^#!.*|#!/bin/bash|' "$WRAPPER"
    sed -i 's|\. "\$CURRENT_SCRIPT_DIR/../otbenv\.profile"|. /opt/otb-'"$VERSION"'/otbenv.profile|' "$WRAPPER"
  fi
done

# Wrapper de entorno
mkdir -p "$PKG_BIN/etc/profile.d"
cat > "$PKG_BIN/etc/profile.d/otb-$VERSION.sh" <<EOF
#!/bin/bash
export OTB_HOME=$INSTALL_PREFIX
export PATH=\$OTB_HOME/bin:\$PATH
export LD_LIBRARY_PATH=\$OTB_HOME/lib:\$LD_LIBRARY_PATH
export PYTHONPATH=\$OTB_HOME/lib/python3/dist-packages:\$PYTHONPATH
export PKG_CONFIG_PATH=\$OTB_HOME/lib/pkgconfig:\$PKG_CONFIG_PATH
export CMAKE_PREFIX_PATH=\$OTB_HOME
EOF

chmod +x "$PKG_BIN/etc/profile.d/otb-$VERSION.sh"

cat > "$PKG_BIN/DEBIAN/control" <<EOF
Package: otb-bin
Version: $VERSION
Section: science
Priority: optional
Architecture: $ARCH
Maintainer: You <your@email.com>
Description: Orfeo Toolbox $VERSION (instalado en /opt/otb-$VERSION)
EOF

# 2. libotb-dev
PKG_DEV="$BUILD_DIR/libotb-dev"
mkdir -p "$PKG_DEV/DEBIAN"
mkdir -p "$PKG_DEV$INSTALL_PREFIX/include/OTB-$API_VERSION"
mkdir -p "$PKG_DEV$INSTALL_PREFIX/lib/cmake/OTB-$API_VERSION"
mkdir -p "$PKG_DEV$INSTALL_PREFIX/lib/pkgconfig"

cp -r "$FINAL_DIR/include/"* "$PKG_DEV$INSTALL_PREFIX/include/"
cp -r "$FINAL_DIR/lib/cmake/OTB-$API_VERSION/"* "$PKG_DEV$INSTALL_PREFIX/lib/cmake/OTB-$API_VERSION/"

ITK_VERSION=$(basename "$(find "$FINAL_DIR/include" -maxdepth 1 -type d -name 'ITK-*' | head -n1)")

# Buscar bibliotecas de OTB
OTB_LIBS=$(find "$FINAL_DIR/lib" -maxdepth 1 -type f -name 'lib*.so*' \
  | sed -E 's|.*/lib(.*)\.so.*|\1|' \
  | sort -u \
  | sed 's/^/-l/')

# Buscar bibliotecas de ITK
ITK_LIBS=$(find "$FINAL_DIR/lib" -maxdepth 1 -type f -name 'libITK*.so*' \
  | sed -E 's|.*/lib(.*)\.so.*|\1|' \
  | sort -u \
  | sed 's/^/-l/')

echo $ITK_LIBS

# LIBS="$OTB_LIBS $ITK_LIBS"
LIBS="$OTB_LIBS"

cat > "$PKG_DEV$INSTALL_PREFIX/lib/pkgconfig/otb.pc" <<EOF
prefix=$INSTALL_PREFIX
exec_prefix=\${prefix}
includedir=\${prefix}/include/OTB-$API_VERSION
libdir=\${exec_prefix}/lib

Name: OTB
Description: Orfeo Toolbox
Version: $VERSION
Cflags: -I\${includedir} -I\${prefix}/include -I\${prefix}/include/${ITK_VERSION}
Libs: -L\${libdir} $LIBS
EOF

cat > "$PKG_DEV/DEBIAN/control" <<EOF
Package: libotb-dev
Version: $VERSION
Section: libdevel
Priority: optional
Architecture: $ARCH
Maintainer: You
Description: Orfeo Toolbox $VERSION headers, CMake y pkg-config (instalado en /opt/otb-$VERSION)
Depends: otb-bin (= $VERSION)
EOF

# 3. python3-otb
if [ -f "$FINAL_DIR/lib/otb/python/_otbApplication.so" ]; then
  PKG_PY="$BUILD_DIR/python3-otb"
  mkdir -p "$PKG_PY/DEBIAN"
  mkdir -p "$PKG_PY$INSTALL_PREFIX/lib/python3/dist-packages/otb"

  cp "$FINAL_DIR/lib/otb/python/"* "$PKG_PY$INSTALL_PREFIX/lib/python3/dist-packages/otb/"

  cat > "$PKG_PY/DEBIAN/control" <<EOF
Package: python3-otb
Version: $VERSION
Section: python
Priority: optional
Architecture: $ARCH
Maintainer: You
Description: Python bindings para OTB $VERSION (instalado en /opt/otb-$VERSION)
Depends: otb-bin (= $VERSION), python3
EOF
fi

# 4. otb-examples
if [ -d "$FINAL_DIR/examples" ]; then
  PKG_EX="$BUILD_DIR/otb-examples"
  mkdir -p "$PKG_EX/DEBIAN"
  mkdir -p "$PKG_EX$INSTALL_PREFIX/examples"
  cp -r "$FINAL_DIR/examples/"* "$PKG_EX$INSTALL_PREFIX/examples/"

  cat > "$PKG_EX/DEBIAN/control" <<EOF
Package: otb-examples
Version: $VERSION
Section: doc
Priority: optional
Architecture: all
Maintainer: You
Description: Ejemplos de OTB $VERSION (instalado en /opt/otb-$VERSION)
Depends: otb-bin (= $VERSION)
EOF
fi

# Generar .deb
for pkg in otb-bin libotb-dev python3-otb otb-examples; do
  if [ -d "$BUILD_DIR/$pkg" ]; then
    dpkg-deb --build "$BUILD_DIR/$pkg"
  fi
done

echo "✅ ¡Listo! Paquetes .deb generados en $BUILD_DIR/"

