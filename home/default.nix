{ config, pkgs, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/user-packages.nix
  ];

  home.stateVersion = "25.05";
}
