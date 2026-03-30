{ config, pkgs, lib, ... }:

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
    fastfetch

    # CLI tools
    bat
    fd
    jq
    yq
    wget
    tree
    tldr
    ripgrep
    ncdu
    httpie
    shellcheck
    entr
    pv
    rlwrap
    socat
    ouch
    magic-wormhole
    jc
    diff-so-fancy
    asciinema

    # Git
    git-lfs
    gitleaks
    tig

    # System monitoring
    htop
    gotop
    viddy
    procs

    # Media
    ffmpeg
    imagemagick
    tesseract
    yt-dlp

    # Cloud & infra
    awscli2
    azure-cli
    terraform
    kubectl
    kubernetes-helm
    k9s
    kubectx
    kustomize
    minikube

    # Build tools
    cmake
    ninja
    gradle
    maven

    # Network
    nmap
    mtr
    iperf3
    mosh
    gnupg

    # Fun/terminal
    cmatrix
    lolcat
    sl
    cowsay
    toilet

    # Misc
    hugo
    pandoc
    graphviz
    yamllint
    sqlmap
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    mas      # Mac App Store CLI — macOS only
    gnused   # Linux already ships GNU sed
    gnutar   # Linux already ships GNU tar
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    xclip    # clipboard support on Linux
  ];
}
