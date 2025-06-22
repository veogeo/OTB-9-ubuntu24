#!/bin/bash
set -e

OTB_VERSION=9.1.1
OTB_MAJOR=9.1
OTB_PKG="otb-${OTB_VERSION}"
OTB_TAR="otb-${OTB_VERSION}.tar.gz"
OTB_TAR_URL="https://gitlab.orfeo-toolbox.org/orfeotoolbox/otb/-/archive/${OTB_VERSION}/${OTB_TAR}"
SRC_DIR="$(pwd)/otb-${OTB_VERSION}"
BUILD_SRC="$(pwd)/build-otb-src"
INSTALL_DIR="/opt/otb-${OTB_VERSION}"
BUILD_DEB="$(pwd)/build-otb-${OTB_VERSION}"

echo "📥 Verificando código fuente..."
if [ ! -d "$SRC_DIR" ]; then
  if [ ! -f "$OTB_TAR" ]; then
    echo "📥 Descargando $OTB_TAR..."
    wget -c -O "$OTB_TAR" "$OTB_TAR_URL"
  fi
  tar xzf "$OTB_TAR"
fi

echo "🛠️ Compilando OTB desde fuente..."
rm -rf "$BUILD_SRC"
mkdir -p "$BUILD_SRC"
cd "$BUILD_SRC"
if [ ! -d /usr/lib/x86_64-linux-gnu/cmake/ITK-5.3/ITKModuleAPI.cmake ]; then
  echo "🔧 Moviendo ITKModuleAPI.cmake a /tmp para evitar conflictos..."
  sudo mv /usr/lib/x86_64-linux-gnu/cmake/ITK-5.3/ITKModuleAPI.cmake /tmp
fi
cmake "$SRC_DIR" -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" -DCMAKE_BUILD_TYPE=Release
make -j"$(nproc)"
sudo make install
cd -

echo "📦 Generando paquetes .deb desde $INSTALL_DIR"
rm -rf "$BUILD_DEB"
mkdir -p "$BUILD_DEB"

##############################################
# 🔹 Paquete otb-bin
##############################################
PKG_BIN="$BUILD_DEB/${OTB_PKG}-bin"
mkdir -p "$PKG_BIN/DEBIAN"
mkdir -p "$PKG_BIN/$INSTALL_DIR"

cat > "$PKG_BIN/DEBIAN/control" <<EOF
Package: otb-bin
Version: $OTB_VERSION
Section: science
Priority: optional
Architecture: amd64
Maintainer: TuNombre <tu@email.com>
Description: Orfeo Toolbox $OTB_VERSION (binarios y librerías principales)
EOF

rsync -a "$INSTALL_DIR/" "$PKG_BIN/$INSTALL_DIR/" \
  --include 'bin/***' \
  --include 'lib/***' \
  --include 'share/***' \
  --exclude='include' \
  --exclude='cmake' \
  --exclude='*.h' \
  --delete

##############################################
# 🔹 Paquete python3-otb
##############################################
PKG_PY="$BUILD_DEB/python3-${OTB_PKG}"
mkdir -p "$PKG_PY/DEBIAN"
mkdir -p "$PKG_PY/$INSTALL_DIR"

cat > "$PKG_PY/DEBIAN/control" <<EOF
Package: python3-otb
Version: $OTB_VERSION
Section: science
Priority: optional
Architecture: amd64
Maintainer: TuNombre <tu@email.com>
Depends: python3
Description: Orfeo Toolbox $OTB_VERSION (bindings de Python 3)
EOF

rsync -a "$INSTALL_DIR/lib/otb/python" "$PKG_PY/$INSTALL_DIR/lib/otb/"

##############################################
# 🔹 Paquete libotb-dev
##############################################
PKG_DEV="$BUILD_DEB/libotb-dev"
mkdir -p "$PKG_DEV/DEBIAN"
mkdir -p "$PKG_DEV/$INSTALL_DIR"

cat > "$PKG_DEV/DEBIAN/control" <<EOF
Package: libotb-dev
Version: $OTB_VERSION
Section: libdevel
Priority: optional
Architecture: amd64
Maintainer: TuNombre <tu@email.com>
Description: Orfeo Toolbox $OTB_VERSION (archivos de desarrollo)
EOF

rsync -a "$INSTALL_DIR/include" "$PKG_DEV/$INSTALL_DIR/"
rsync -a "$INSTALL_DIR/lib/cmake" "$PKG_DEV/$INSTALL_DIR/lib/"
rsync -a "$INSTALL_DIR/lib/pkgconfig" "$PKG_DEV/$INSTALL_DIR/lib/"

##############################################
# 🔧 Permisos y construcción
##############################################
find "$BUILD_DEB" -type d -exec chmod 755 {} \;

echo "📦 Construyendo paquetes .deb..."
dpkg-deb --build "$PKG_BIN"
dpkg-deb --build "$PKG_PY"
dpkg-deb --build "$PKG_DEV"

sudo mv /tmp/ITKModuleAPI.cmake  /usr/lib/x86_64-linux-gnu/cmake/ITK-5.3/

if [ -d /tmp/ITKModuleAPI.cmake ]; then
  echo "🔧 Restaurando ITKModuleAPI.cmake..."
  sudo mv /usr/lib/x86_64-linux-gnu/cmake/ITK-5.3/ITKModuleAPI.cmake /tmp
fi

echo "✅ Paquetes generados en $BUILD_DEB:"
ls -lh "$BUILD_DEB"/*.deb
