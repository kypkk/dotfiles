{ config, pkgs, isServer ? false, ... }:

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
        # Pi uses its own ed25519 key; Mac and VM keep id_rsa
        identityFile = if isServer then "~/.ssh/id_ed25519" else "~/.ssh/id_rsa";
      };

      "nixos-vm" = {
        hostname = "10.211.55.4";
        user = "kangkang";
        setEnv = { TERM = "xterm-256color"; };
      };

      "pi" = {
        hostname = "100.115.117.19";
        user = "kypkk";
        setEnv = { TERM = "xterm-256color"; };
      };
    };
  };
}
