# nix-config

Declarative system configuration using Nix Flakes, nix-darwin, and home-manager — supporting both macOS (Apple Silicon) and NixOS (VM).

## Overview

This repository manages the entire system configuration across machines in a reproducible, declarative way:

- **[Nix Flakes](https://nixos.wiki/wiki/Flakes)** — Reproducible, locked dependency management
- **[nix-darwin](https://github.com/LnL7/nix-darwin)** — macOS system settings and configuration
- **[home-manager](https://github.com/nix-community/home-manager)** — User-level dotfiles and program configuration (shared across platforms)
- **Homebrew** — GUI applications and macOS-specific casks

## Structure

```
nix-config/
├── flake.nix                        # Flake entrypoint — inputs & outputs
├── install.sh                       # Bootstrap script for new machines
├── home/                            # Shared home-manager configuration
│   ├── default.nix                  # Imports all program modules (platform-aware)
│   ├── programs/                    # Per-program configuration
│   ├── nvim/                        # Neovim config (NvChad)
│   ├── iterm/                       # iTerm2 keymap
│   └── neofetch/                    # Neofetch config
├── hosts/
│   ├── MacbookProKypkk/             # macOS host
│   │   ├── default.nix
│   │   └── config/
│   │       ├── system.nix           # macOS system defaults & fonts
│   │       ├── nix.nix              # Nix daemon settings
│   │       └── homebrew.nix         # Homebrew casks
│   └── nixos-vm/                    # NixOS VM host (Parallels, aarch64)
│       ├── default.nix
│       └── config/
│           └── hardware-configuration.nix
└── modules/
    └── nixos/                       # Shared NixOS modules
        ├── boot.nix                 # systemd-boot, EFI
        ├── locale.nix               # Timezone, locale
        └── desktop.nix              # GNOME, GDM, PipeWire
```

## Hosts

| Hostname   | Platform         | Flake Target                   |
| ---------- | ---------------- | ------------------------------ |
| `kypkk`    | `aarch64-darwin` | `darwinConfigurations.kypkk`   |
| `nixos-vm` | `aarch64-linux`  | `nixosConfigurations.nixos-vm` |

## Prerequisites

**macOS:**

- Apple Silicon Mac
- Xcode Command Line Tools: `xcode-select --install`

**NixOS VM:**

- NixOS installed (see [NixOS Manual](https://nixos.org/manual/nixos/stable/))

## Usage

### First-time setup (macOS)

```bash
git clone git@github.com:kypkk/dotfiles.git ~/nix-config
cd ~/nix-config
./install.sh
```

`install.sh` will:

1. Install [Nix](https://install.determinate.systems/) if not present (flakes enabled by default)
2. Install [Homebrew](https://brew.sh/) if not present
3. Detect your hostname and apply the matching flake target
4. Run `nix run nix-darwin -- switch --flake .#<hostname>`

### Apply configuration

**macOS:**

```bash
darwin-rebuild switch --flake .#kypkk
```

**NixOS:**

```bash
sudo nixos-rebuild switch --flake .#nixos-vm
```

### Update inputs

```bash
nix flake update
darwin-rebuild switch --flake .#kypkk        # macOS
sudo nixos-rebuild switch --flake .#nixos-vm  # NixOS
```

### Adding a new machine

1. Create a new host directory under `hosts/<MachineName>/`
2. Add a `darwinConfigurations` or `nixosConfigurations` entry in `flake.nix`
3. Run `./install.sh` (macOS) or `sudo nixos-rebuild switch --flake .#<hostname>` (NixOS)

## What's Configured

### Shell & Terminal

| Tool         | Details                                                                         |
| ------------ | ------------------------------------------------------------------------------- |
| **Zsh**      | Powerlevel10k theme, auto-suggestions, syntax highlighting, NVM & Conda support |
| **Tmux**     | Prefix `Ctrl+S`, Dracula theme, Vim-style navigation, mouse support             |
| **iTerm2**   | Custom keymap (macOS only)                                                      |
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

### GUI Applications (Homebrew — macOS only)

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
