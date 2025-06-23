#!/bin/bash
set -e

OTB_VERSION=9.1.1
OTB_PKG="otb-${OTB_VERSION}"
OTB_TAR="${OTB_PKG}.tar.gz"
OTB_TAR_URL="https://gitlab.orfeo-toolbox.org/orfeotoolbox/otb/-/archive/${OTB_VERSION}/${OTB_TAR}"

SRC_DIR="$(pwd)/${OTB_PKG}"
SB_DIR="$(pwd)/build-superbuild-${OTB_VERSION}"
INSTALL_DIR="/opt/${OTB_PKG}"
BUILD_DEB="$(pwd)/build-deb-${OTB_VERSION}"

# 🧩 Instalar dependencias del sistema
echo "📦 Instalando dependencias del sistema..."
sudo apt update
sudo apt install -y --no-install-recommends \
  ca-certificates curl make cmake g++ gcc git git-lfs libtool swig \
  build-essential cmake git wget rsync fakeroot dpkg-dev devscripts \
  libgdal-dev qtbase5-dev qttools5-dev qttools5-dev-tools libboost-all-dev \
  libboost-all-dev libtiff-dev libjpeg-dev libpng-dev zlib1g-dev  patch \
  libexpat1-dev libcurl4-openssl-dev libopenthreads-dev libopenjp2-7-dev \
  python3 python3-dev python3-numpy python3-pip libfreetype-dev pkg-config \
  libopenjp2-7-dev libgeos-dev libxt-dev libmuparser-dev libmuparser2v5

# 📥 Descargar fuente de OTB
if [ ! -d "$SRC_DIR" ]; then
  if [ ! -f "$OTB_TAR" ]; then
    echo "📥 Descargando $OTB_TAR..."
    wget -c -O "$OTB_TAR" "$OTB_TAR_URL"
  fi
  tar xzf "$OTB_TAR"
fi

# ⚙️ Configurar y compilar con SuperBuild
echo "🛠️ Configurando SuperBuild..."
rm -rf "$SB_DIR"
mkdir -p "$SB_DIR"
cp Local.cmake "$SB_DIR/"
cd "$SB_DIR"

cmake "../${OTB_PKG}/SuperBuild" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" \
  -DOTB_WRAP_PYTHON=ON \
  -DBUILD_TESTING=OFF

echo "🔨 Compilando todo con make..."
make -j"$(nproc)"
cd -

# 📦 Crear paquetes .deb
echo "📦 Generando paquetes .deb desde $INSTALL_DIR"
rm -rf "$BUILD_DEB"
mkdir -p "$BUILD_DEB"


## libotb-dev
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
Depends: otb-bin (= 9.1.1)
EOF

rsync -a "$INSTALL_DIR/include" "$PKG_DEV/$INSTALL_DIR/"
rsync -a "$INSTALL_DIR/lib/cmake" "$PKG_DEV/$INSTALL_DIR/lib/"
# rsync -a "$INSTALL_DIR/lib/pkgconfig" "$PKG_DEV/$INSTALL_DIR/lib/"

mv "$INSTALL_DIR/lib/cmake" /tmp

# 🩹 Corrigir otbenv.profile para usar rutas del sistema
OTBENV="$PKG_DEV/../../otb-9.1.1/Packaging/Files/otbenv.profile"
POSTINSTALL="$PKG_DEV/../../otb-9.1.1/Packaging/Files/post_install.sh.in"

echo "🩹 Corrigiendo $OTBENV..."

# Asignar variables a rutas del sistema
sed -i "s|^\(GDAL_DATA=\).*|\1\"/usr/share/gdal\"|" "$OTBENV"
sed -i "s|^\(PROJ_LIB=\).*|\1\"/usr/share/proj\"|" "$OTBENV"
sed -i "s|^\(CMAKE_PREFIX_PATH=\).*|\1\"/opt/${OTB_PKG}\"|" "$OTBENV"
sed -i "s|^\(LD_LIBRARY_PATH=\).*|\1\"\$LD_LIBRARY_PATH:/opt/${OTB_PKG}/lib\"|" "$OTBENV"
sed -i "s|^export LD_LIBRARY_PATH=\"\\\$OTB_INSTALL_DIR/lib:\\\$LD_LIBRARY_PATH\"|export LD_LIBRARY_PATH=\"\\\$LD_LIBRARY_PATH:\\\$OTB_INSTALL_DIR/lib\"|" "$OTBENV"

sed -i "/# export PYTHONPATH to import otbApplication.py/,/fi/ {
  /# export PYTHONPATH to import otbApplication.py/d
  /PYTHONPATH/d
  /if/d
  /  PYTHONPATH/d
  /else/d
  /  PYTHONPATH/d
  /fi/d
}" "$OTBENV"

# gdal-config
sed -i "s|sed -i \"s/\\/builds\\/otb\\/xdk/\\\$OTB_INSTALL_DIR/g\" \"\\\$OTB_INSTALL_DIR\"/bin/gdal-config|sed -i \"s/\\/builds\\/otb\\/xdk/\\/usr/g\" /usr/bin/gdal-config|" "$POSTINSTALL"

# curl-config
sed -i "s|sed -i \"s/\\/builds\\/otb\\/xdk/\\\$OTB_INSTALL_DIR/g\" \"\\\$OTB_INSTALL_DIR\"/bin/curl-config|sed -i \"s/\\/builds\\/otb\\/xdk/\\/usr/g\" /usr/bin/curl-config|" "$POSTINSTALL"




## python3-otb
PKG_PY="$BUILD_DEB/python3-${OTB_PKG}"
mkdir -p "$PKG_PY/DEBIAN"
mkdir -p "$PKG_PY/$INSTALL_DIR/lib/otb"

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

# 🔧 Final
find "$BUILD_DEB" -type d -exec chmod 755 {} \;

mv "$INSTALL_DIR/lib/otb/python" /tmp


## otb-bin
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
  --include 'bin/' \
  --include 'lib/' \
  --include 'share/' \
  --include 'bin/*' \
  --include 'lib/*' \
  --include 'share/*' \
  --include 'bin/**' \
  --include 'lib/**' \
  --include 'share/**' \
  --include 'bin/***' \
  --include 'lib/***' \
  --include 'share/***' \
  --exclude='include' \
  --exclude='cmake'

# Regresar las bibliotecas de OTB y Python a sus ubicaciones originales
mv /tmp/cmake "$INSTALL_DIR"/lib/
mv /tmp/python "$INSTALL_DIR"/lib/otb/

echo "📦 Construyendo paquetes .deb..."
dpkg-deb --build "$PKG_BIN"
dpkg-deb --build "$PKG_PY"
dpkg-deb --build "$PKG_DEV"

echo "✅ Paquetes generados:"
ls -lh "$BUILD_DEB"/*.deb
