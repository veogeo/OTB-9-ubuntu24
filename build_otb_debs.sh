#!/bin/bash
set -e

# 📍 Ruta final de instalación de OTB (aislada)
OTB_DIR="/opt/otb-9.1.1"
OTB_TAR_URL="https://gitlab.orfeo-toolbox.org/orfeotoolbox/otb/-/archive/9.1.1/otb-9.1.1.tar.gz"
SRC_DIR="$(pwd)/otb-9.1.1"

# 🔽 Descargar y descomprimir fuente si no existe
if [ ! -d "$SRC_DIR" ]; then
  echo "📥 Descargando fuente de OTB 9.1.1..."
  wget -c -O otb-9.1.1.tar.gz "$OTB_TAR_URL"
  tar xzf otb-9.1.1.tar.gz
fi

# 🔎 Detectar versión desde archivo de configuración
OTB_VERSION=$(grep -Po '(?<=set\(OTB_VERSION_STRING ")[^"]+' "$OTB_DIR/lib/cmake/OTB*/OTBConfig.cmake" | head -1)
OTB_MAJOR=$(echo "$OTB_VERSION" | cut -d. -f1)
OTB_PKG="otb-${OTB_VERSION}"

# 📁 Directorio temporal de trabajo
BUILD_DIR="$(pwd)/build-otb-${OTB_VERSION}"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

echo "📦 Generando paquetes .deb para OTB $OTB_VERSION desde $OTB_DIR"

##############################################
# 🔹 Paquete otb-bin
##############################################
PKG_BIN="$BUILD_DIR/${OTB_PKG}-bin"
mkdir -p "$PKG_BIN/DEBIAN"
mkdir -p "$PKG_BIN/$OTB_DIR"

cat > "$PKG_BIN/DEBIAN/control" <<EOF
Package: otb-bin
Version: $OTB_VERSION
Section: science
Priority: optional
Architecture: amd64
Maintainer: TuNombre <tu@email.com>
Description: Orfeo Toolbox $OTB_VERSION (binarios y librerías principales)
EOF

rsync -a "$OTB_DIR/" "$PKG_BIN/$OTB_DIR/" \
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
PKG_PY="$BUILD_DIR/python3-${OTB_PKG}"
mkdir -p "$PKG_PY/DEBIAN"
mkdir -p "$PKG_PY/$OTB_DIR"

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

rsync -a "$OTB_DIR/lib/otb/python" "$PKG_PY/$OTB_DIR/lib/otb/"

##############################################
# 🔹 Paquete libotb-dev
##############################################
PKG_DEV="$BUILD_DIR/libotb-dev"
mkdir -p "$PKG_DEV/DEBIAN"
mkdir -p "$PKG_DEV/$OTB_DIR"

cat > "$PKG_DEV/DEBIAN/control" <<EOF
Package: libotb-dev
Version: $OTB_VERSION
Section: libdevel
Priority: optional
Architecture: amd64
Maintainer: TuNombre <tu@email.com>
Description: Orfeo Toolbox $OTB_VERSION (archivos de desarrollo)
EOF

rsync -a "$OTB_DIR/include" "$PKG_DEV/$OTB_DIR/"
rsync -a "$OTB_DIR/lib/cmake" "$PKG_DEV/$OTB_DIR/lib/"
rsync -a "$OTB_DIR/lib/pkgconfig" "$PKG_DEV/$OTB_DIR/lib/"

##############################################
# 🔧 Permisos y construcción
##############################################
find "$BUILD_DIR" -type d -exec chmod 755 {} \;

echo "📦 Construyendo paquetes .deb..."
dpkg-deb --build "$PKG_BIN"
dpkg-deb --build "$PKG_PY"
dpkg-deb --build "$PKG_DEV"

echo "✅ Paquetes generados en $BUILD_DIR:"
ls -lh "$BUILD_DIR"/*.deb
