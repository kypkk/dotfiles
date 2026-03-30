{ isDarwin, lib, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/gh.nix
    ./programs/tmux.nix
    ./programs/nvim.nix
    ./programs/neofetch.nix
    ./programs/user-packages.nix
  ] ++ lib.optionals isDarwin [
    ./programs/iterm.nix
  ];

  home.stateVersion = "25.05";
}
