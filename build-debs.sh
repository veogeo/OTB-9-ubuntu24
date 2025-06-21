#!/bin/bash
set -e

OTB_DIR="./dist/otb-9.1.1"
BUILD_DIR="./build"
VERSION="9.1.1"
ARCH="amd64"

mkdir -p "$BUILD_DIR"

# 1. otb-bin
BIN_DIR="$BUILD_DIR/otb-bin/opt/otb-$VERSION"
mkdir -p "$BIN_DIR" "$BUILD_DIR/otb-bin/DEBIAN"

cp -r "$OTB_DIR/bin" "$BIN_DIR/"
cp -r "$OTB_DIR/share" "$BIN_DIR/"
cp -r "$OTB_DIR/tools" "$BIN_DIR/" 2>/dev/null || true

cat > "$BUILD_DIR/otb-bin/DEBIAN/control" <<EOF
Package: otb-bin
Version: $VERSION
Section: science
Priority: optional
Architecture: $ARCH
Maintainer: You <your@email.com>
Description: Orfeo Toolbox $VERSION - Main binaries and tools
EOF

# 2. libotb-dev
DEV_DIR="$BUILD_DIR/libotb-dev/opt/otb-$VERSION"
mkdir -p "$DEV_DIR" "$BUILD_DIR/libotb-dev/DEBIAN"

cp -r "$OTB_DIR/include" "$DEV_DIR/"
cp -r "$OTB_DIR/lib/cmake" "$DEV_DIR/lib/"
find "$OTB_DIR/lib" -name '*.so' -exec cp {} "$DEV_DIR/lib/" \;

cat > "$BUILD_DIR/libotb-dev/DEBIAN/control" <<EOF
Package: libotb-dev
Version: $VERSION
Section: libdevel
Priority: optional
Architecture: $ARCH
Maintainer: You <your@email.com>
Description: Orfeo Toolbox $VERSION - Development files (CMake, headers)
Depends: otb-bin (= $VERSION)
EOF

# 3. python3-otb (optional)
if compgen -G "$OTB_DIR/lib/python3*" > /dev/null; then
  PY_DIR="$BUILD_DIR/python3-otb/opt/otb-$VERSION"
  mkdir -p "$PY_DIR" "$BUILD_DIR/python3-otb/DEBIAN"
  cp -r "$OTB_DIR/lib/python3"* "$PY_DIR/lib/"

  cat > "$BUILD_DIR/python3-otb/DEBIAN/control" <<EOF
Package: python3-otb
Version: $VERSION
Section: python
Priority: optional
Architecture: $ARCH
Maintainer: You <your@email.com>
Description: Orfeo Toolbox $VERSION - Python bindings
Depends: otb-bin (= $VERSION), python3
EOF
fi

# 4. otb-examples (optional)
if [ -d "$OTB_DIR/examples" ]; then
  EX_DIR="$BUILD_DIR/otb-examples/opt/otb-$VERSION"
  mkdir -p "$EX_DIR" "$BUILD_DIR/otb-examples/DEBIAN"
  cp -r "$OTB_DIR/examples" "$EX_DIR/"

  cat > "$BUILD_DIR/otb-examples/DEBIAN/control" <<EOF
Package: otb-examples
Version: $VERSION
Section: doc
Priority: optional
Architecture: all
Maintainer: You <your@email.com>
Description: Orfeo Toolbox $VERSION - Example scripts and data
Depends: otb-bin (= $VERSION)
EOF
fi

# Build all .deb packages
for pkg in otb-bin libotb-dev python3-otb otb-examples; do
  if [ -d "$BUILD_DIR/$pkg" ]; then
    dpkg-deb --build "$BUILD_DIR/$pkg"
  fi
done
