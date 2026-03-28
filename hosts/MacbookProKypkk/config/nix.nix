{ ... }:

{
  # Nix daemon is managed by the Nix installer (Determinate Systems),
  # not by nix-darwin. Flakes are enabled by the installer by default.
  nix.enable = false;
}
