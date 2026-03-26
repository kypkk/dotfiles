{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.kangkang = {
    home = "/Users/kangkang";
  };

  system.primaryUser = "kangkang";

  nix.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = 6;
}