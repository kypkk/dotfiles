@RTK.md

# System Setup

## This machine is managed by Nix Flakes

**Do NOT recommend `brew install` for CLI tools.** This system uses Nix for package management. When suggesting how to install anything, always recommend the Nix-based approach.

### How packages are managed

| What | Where | How to add |
|---|---|---|
| CLI tools (all platforms) | `~/nix-config/home/programs/user-packages.nix` | Add to `home.packages` list |
| GUI apps (macOS) | `~/nix-config/hosts/MacbookProKypkk/config/homebrew.nix` | Add to `casks` list |
| CLI via Homebrew (macOS) | `~/nix-config/hosts/MacbookProKypkk/config/homebrew.nix` | Add to `brews` list |
| macOS system settings | `~/nix-config/hosts/MacbookProKypkk/config/system.nix` | `system.defaults.*` |

### After making changes, rebuild with:
```bash
darwin-rebuild switch --flake ~/nix-config#kypkk
```

### Machine info
- **MacBook Pro** — `aarch64-darwin`, flake target `darwinConfigurations.kypkk`
- **NixOS VM** — `aarch64-linux` (Parallels), flake target `nixosConfigurations.nixos-vm`
- **EC2 Ubuntu** — `x86_64-linux`, standalone home-manager target `homeConfigurations.ubuntu@ec2`
- **Repo**: `~/nix-config` (remote: `git@github.com:kypkk/dotfiles.git`)

### Rules for this session
- Suggest `nix` packages, not `brew install <cli-tool>`
- Homebrew is only for GUI **casks** or tools not available in nixpkgs
- New files must be `git add`-ed before `darwin-rebuild` can see them
- `nix.enable = false` on macOS — Determinate Systems manages nix, not nix-darwin
