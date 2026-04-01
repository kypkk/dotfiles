{ config, pkgs, ... }:

{
  programs.gh = {
    enable = true;
    settings = {
      version = 1;
      git_protocol = "ssh";
      prompt = "enabled";
      spinner = "enabled";
      aliases = {
        co = "pr checkout";
      };
    };
  };
}
