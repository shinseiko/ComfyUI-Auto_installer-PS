# UmeAiRT's ComfyUI Auto-Installer

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)
![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

This project provides a suite of PowerShell scripts to fully automate the installation and configuration of ComfyUI on Windows. The approach uses a clean installation based on `git` and a Python virtual environment (`venv`), ensuring an isolated, easy-to-update, and maintainable setup.

## Features

- **Clean Installation:** Clones the latest version of ComfyUI from the official repository and installs it in a dedicated Anaconda Python virtual environment.
- **Dependency Management:** Automatically checks for and installs necessary tools:
    - Anaconda Python 3.13 (if not present on the system)
    - Git
    - 7-Zip
    - Aria2 (for accelerated downloads)
- **CSV-Managed Custom Nodes:** Installs a comprehensive list of custom nodes defined in an external `custom_nodes.csv` file, making it simple to add new nodes.
- **Interactive Model Downloaders:** A PowerShell menu (`Download-Models.ps1`) lets you pick and download model packs (FLUX, WAN, HIDREAM, LTX, QWEN, Z-IMAGE) at any time.
- **Dedicated Update Script:** `Update-ComfyUI.ps1` updates ComfyUI, all custom nodes, and workflows with a single command. Supports optional snapshot safety so you can roll back if something breaks.
- **Pure-launcher `.bat` files:** Every `.bat` file is a thin wrapper — it detects `pwsh`/`powershell`, sets a clean Python environment, and delegates entirely to the corresponding `.ps1`. No logic lives in batch.
- **Supplementary modules:** The script also installs some complex modules such as: Sageattention, Triton, Visual Studio Build Tools, ...
- **Workflow included:** A large amount of workflows are pre-installed for each model.

## Prerequisites

- Windows 10 or Windows 11 (64-bit).
- An active internet connection.
- CUDA 13.0.
- Python 3.13.
- GIT for Windows.

## Installation and Usage

The entire process is designed to be as simple as possible.

1.  **Download the Project:** Download `UmeAiRT-Install-ComfyUI.bat` from GitHub and put it to a folder of your choice (e.g., `C:\UmeAiRT-Installer`).

2.  **Run the Installer:**
    - Run the file `UmeAiRT-Install-ComfyUI.bat`.
    - It will ask for administrator privileges. Please accept.
    - The script will first download the latest versions of all installation scripts from the repository to ensure you are using the most recent version.

3.  **Follow the Instructions:**
    - The main installation script will then launch. It will install Python (if necessary), Git, 7-Zip, Aria2, and then ComfyUI.
    - Next, it will install all custom nodes and their Python dependencies into the virtual environment.
    - Finally, it will ask you a series of questions about which model packs you wish to download. Simply answer `Y` (yes) or `N` (no) to each question.

At the end of the process, your ComfyUI installation will be complete and ready to use.

## Post-Installation Usage

Four `.bat` files are available in your folder to manage the application:

- **`UmeAiRT-Start-ComfyUI.bat`**
    - **Launches ComfyUI** in standard (performance) mode.

- **`UmeAiRT-Start-ComfyUI_LowVRAM.bat`**
    - **Launches ComfyUI** with low-VRAM / stability flags for cards with limited memory.

- **`UmeAiRT-Download_models.bat`**
    - Opens the **model downloader menu** so you can add more model packs at any time without reinstalling. Presents a numbered menu of available packs (FLUX, WAN2.1, WAN2.2, HIDREAM, LTX1, LTX2, QWEN, Z-IMAGE).

- **`UmeAiRT-Update-ComfyUI.bat`**
    - **Updates your entire installation** — ComfyUI core, all custom nodes, and workflows — and installs any new Python dependencies. Pass `--snapshot <path>` to back up a JSON snapshot before updating.

## File Structure

- **`/` (your root folder)**
    - `UmeAiRT-Install-ComfyUI.bat` — main installer launcher
    - `UmeAiRT-Start-ComfyUI.bat` — launch ComfyUI (standard mode)
    - `UmeAiRT-Start-ComfyUI_LowVRAM.bat` — launch ComfyUI (low VRAM mode)
    - `UmeAiRT-Update-ComfyUI.bat` — update launcher
    - `UmeAiRT-Download_models.bat` — model downloader launcher
    - **`scripts/`** — all PowerShell scripts
        - `Install-ComfyUI.ps1` / `Install-ComfyUI-Phase1.ps1` / `Install-ComfyUI-Phase2.ps1`
        - `Update-ComfyUI.ps1`
        - `Start-ComfyUI.ps1`
        - `Download-Models.ps1` — menu dispatcher for model downloads
        - `Download-FLUX-Models.ps1` (and other per-model downloaders)
        - `UmeAiRTUtils.psm1` — shared utility functions
        - `custom_nodes.csv` — list of custom nodes to install
        - `dependencies.json` — external tool definitions with SHA-256 verification
    - **`ComfyUI/`** — created after installation, contains the application
    - **`logs/`** — created at runtime, contains installation/update logs

## Contributing

Suggestions and contributions are welcome. If you find a bug or have an idea for an improvement to the scripts, feel free to open an "Issue" on this GitHub repository.

## License

This project is under the MIT License. See the `LICENSE` file for more details.

## Acknowledgements

- To **Comfyanonymous** for creating the incredible ComfyUI.
- To the authors of all the **custom nodes** that enrich the ecosystem.
