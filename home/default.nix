{ ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/gh.nix
    ./programs/tmux.nix
    ./programs/nvim.nix
    ./programs/neofetch.nix
    ./programs/iterm.nix
    ./programs/user-packages.nix
  ];

  home.stateVersion = "25.05";
}
