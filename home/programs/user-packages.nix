{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = with pkgs; [
    git
    neovim
    lazygit
    lsd
    zsh-powerlevel10k
    nerd-fonts.jetbrains-mono
  ];
}
