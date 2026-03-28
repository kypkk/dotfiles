{ config, pkgs, ... }:

{
  programs.gh = {
    enable = true;
    settings = {
      version = 1;
      git_protocol = "https";
      prompt = "enabled";
      spinner = "enabled";
      aliases = {
        co = "pr checkout";
      };
    };
  };
}
