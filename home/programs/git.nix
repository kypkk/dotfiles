{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "kypkk";
        email = "kypss50102@gmail.com";
      };

      core.editor = "nvim";

      pull.rebase = true;
      push.default = "simple";

      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        gt = "status";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
