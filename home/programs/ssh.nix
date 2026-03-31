{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        serverAliveInterval = 60;
        addKeysToAgent = "yes";
      };

      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_rsa";
      };

      "nixos-vm" = {
        hostname = "10.211.55.4";
        user = "kangkang";
        setEnv = { TERM = "xterm-256color"; };
      };
    };
  };
}
