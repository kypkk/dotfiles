# mac-setup

Declarative macOS system configuration using Nix Flakes, nix-darwin, and home-manager for an Apple Silicon MacBook Pro.

## Overview

This repository manages the entire system configuration for a macOS development environment in a reproducible, declarative way:

- **[Nix Flakes](https://nixos.wiki/wiki/Flakes)** — Reproducible, locked dependency management
- **[nix-darwin](https://github.com/LnL7/nix-darwin)** — macOS system settings and configuration
- **[home-manager](https://github.com/nix-community/home-manager)** — User-level dotfiles and program configuration
- **Homebrew** — GUI applications and macOS-specific casks

## Structure

```
mac-setup/
├── flake.nix                    # Flake entrypoint — inputs & outputs
├── home/                        # home-manager configuration
│   ├── default.nix              # Imports all program modules
│   ├── programs/                # Per-program configuration
├── hosts/
│   └── MacbookProKypkk/         # Host-specific configuration
│       ├── default.nix
|       └── config/
|           ├── system.nix       # macOS system settings & fonts
|           ├── nix.nix          # Nix daemon & experimental features
|           └── homebrew.nix     # Homebrew casks & packages
```

## Prerequisites

- macOS on Apple Silicon (aarch64-darwin)
- Xcode Command Line Tools: `xcode-select --install`

## Usage

### First-time setup on a new machine

```bash
git clone git@github.com:kypkk/dotfiles.git ~/mac-setup
cd ~/mac-setup
./install.sh
```

`install.sh` will:
1. Install [Nix](https://install.determinate.systems/) if not present (flakes enabled by default)
2. Install [Homebrew](https://brew.sh/) if not present
3. Detect your hostname and apply the matching flake target
4. Run `nix run nix-darwin -- switch --flake .#<hostname>`

### Apply configuration (existing machine)

```bash
darwin-rebuild switch --flake .#kypkk
```

### Update inputs

```bash
nix flake update
darwin-rebuild switch --flake .#kypkk
```

### Adding a new machine

1. Create a new host directory: `hosts/<MachineName>/`
2. Add a `darwinConfigurations` entry in `flake.nix`
3. Run `./install.sh` on the new machine

## What's Configured

### Shell & Terminal

| Tool         | Details                                                                         |
| ------------ | ------------------------------------------------------------------------------- |
| **Zsh**      | Powerlevel10k theme, auto-suggestions, syntax highlighting, NVM & Conda support |
| **Tmux**     | Prefix `Ctrl+S`, Dracula theme, Vim-style navigation, mouse support             |
| **iTerm2**   | Custom keymap                                                                   |
| **Neofetch** | Custom system info display                                                      |

### Development Tools

| Category            | Tools                                                                   |
| ------------------- | ----------------------------------------------------------------------- |
| **Editors**         | Neovim (NvChad + LSP), Cursor, VS Code, IntelliJ IDEA, PyCharm          |
| **Version Control** | Git (delta diffs, rebase-pull), GitHub CLI, git-lfs, gitleaks, tig      |
| **Containers**      | Docker, Orbstack, minikube                                              |
| **Infrastructure**  | Terraform, kubectl, helm, k9s, kubectx, kustomize                       |
| **Cloud**           | AWS CLI v2, Azure CLI                                                   |
| **Languages**       | NVM (Node.js), Conda (Python), Maven/Gradle (Java), CMake/Ninja (C/C++) |

### Neovim (NvChad)

Configured with [NvChad](https://nvchad.com/) framework and Lazy.nvim:

- **LSP**: Mason, nvim-lspconfig, nvim-cmp, LuaSnip
- **Navigation**: Telescope, nvim-tree, which-key
- **Syntax**: Treesitter, nvim-colorizer
- **Git**: Gitsigns
- **UI**: NvChad base46 themes, indent-blankline, nvim-web-devicons

### CLI Utilities

| Category          | Tools                                         |
| ----------------- | --------------------------------------------- |
| **File & Search** | lsd, fd, ripgrep, bat, tree                   |
| **Data**          | jq, yq, jc, diff-so-fancy                     |
| **Network**       | nmap, mtr, iperf3, mosh, ngrok                |
| **Media**         | ffmpeg, ImageMagick, yt-dlp, tesseract        |
| **System**        | htop, gotop, procs, ncdu, viddy               |
| **Security**      | GnuPG, sqlmap                                 |
| **Misc**          | pandoc, hugo, asciinema, magic-wormhole, ouch |

### GUI Applications (Homebrew)

| Category          | Apps                                                       |
| ----------------- | ---------------------------------------------------------- |
| **Browsers**      | Arc, Google Chrome, Microsoft Edge                         |
| **Communication** | Discord, WhatsApp, Zoom                                    |
| **AI**            | Claude, ChatGPT                                            |
| **Data & Design** | Figma, Heptabase, TradingView, PopSQL, Azure Data Studio   |
| **Media**         | IINA, Dropbox                                              |
| **Utilities**     | Raycast, Ghostty, Typora, Wireshark, DeepL, The Unarchiver |
| **API**           | Postman                                                    |

### Fonts

- JetBrains Mono Nerd Font
- Hack Nerd Font
- Fira Code Nerd Font

## Host

| Key      | Value                            |
| -------- | -------------------------------- |
| Hostname | `kypkk`                          |
| User     | `kangkang`                       |
| Platform | `aarch64-darwin` (Apple Silicon) |
| Home     | `/Users/kangkang`                |
