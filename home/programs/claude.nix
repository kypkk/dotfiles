{ config, ... }:

{
  # Use out-of-store symlinks so CLAUDE.md stays live-editable from the repo
  home.file.".claude/CLAUDE.md".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nix-config/home/claude/CLAUDE.md";

  home.file.".claude/RTK.md".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nix-config/home/claude/RTK.md";
}
