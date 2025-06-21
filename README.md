# Orfeo Toolbox 9.1.1 – Debian Packaging

This repository provides an unofficial repackaging of [Orfeo Toolbox (OTB)](https://www.orfeo-toolbox.org) version 9.1.1, extracted from a Docker image, and repackaged into modular `.deb` packages suitable for Debian-based systems.

## 🧱 Project Structure

```
.
├── dist/
│   └── otb-9.1.1/           ← Full extracted OTB install (from Docker)
├── build-debs.sh            ← Build script for modular .deb packages
├── LICENSE                  ← Apache 2.0 license from OTB
└── README.md
```

---

## ⚙️ How to Build the `.deb` Packages

### 1. Clone the repository

```bash
git clone https://github.com/veogeo/OTB-9-ubuntu24.git
cd OTB-9-ubuntu24
```

### 2. Place OTB files under `dist/`

If not already present, copy your extracted OTB installation into:

```bash
dist/otb-9.1.1/
```

The structure should include:

```
bin/          ← CLI binaries
include/      ← Headers for development
lib/          ← Shared libraries and CMake files
share/        ← Auxiliary files
lib/python*/  ← (optional) Python bindings
```

### 3. Run the packaging script

```bash
chmod +x build-debs.sh
./build-debs.sh
```

This will generate:

- `otb-bin_9.1.1_amd64.deb`
- `libotb-dev_9.1.1_amd64.deb`
- `python3-otb_9.1.1_amd64.deb` (only if Python bindings exist)
- `otb-examples_9.1.1_all.deb` (optional, if examples exist)

---

## 🧪 Installation

```bash
sudo dpkg -i *.deb
```

This will install OTB under `/opt/otb-9.1.1/` with optional symbolic links under `/usr/local/bin` for easy CLI access (if configured).

---

## ⚠️ Important Notes

- If you **move the OTB installation directory** after package installation, you **must reset internal paths**:

  ```bash
  rm /opt/otb-9.1.1/tools/install_done.txt
  source /opt/otb-9.1.1/otbenv.profile sh recompile_bindings.sh
  ```

- This only needs to be done **once after relocation**, not on every shell startup.

- This repository does **not modify the original binaries** from OTB.

- To ensure full runtime availability, you may add to your environment:

  ```bash
  source /opt/otb-9.1.1/otbenv.profile 
  ```

---

## 📦 Package Breakdown

| Package         | Contents                        | Depends On           |
|-----------------|---------------------------------|----------------------|
| `otb-bin`       | CLI binaries, shared tools      | -                    |
| `libotb-dev`    | C++ headers, CMake config files | `otb-bin`            |
| `python3-otb`   | Python 3 bindings               | `otb-bin`, `python3` |
| `otb-examples`  | Optional scripts and examples   | `otb-bin`            |

---

## 📄 License

This repository contains an **unofficial repackaging** of [Orfeo Toolbox (OTB)](https://www.orfeo-toolbox.org), version 9.1.1, originally licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

> © 2006–2025 CNES and contributors to the OTB project

This work is not affiliated with or endorsed by the official OTB project.

---

## 🔗 References

- [Orfeo Toolbox homepage](https://www.orfeo-toolbox.org)
- [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
