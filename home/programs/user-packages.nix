{ config, pkgs, lib, isServer ? false, ... }:

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
    claude-code

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

    # Network
    nmap
    mtr
    iperf3
    mosh
    gnupg

    # Python
    uv
  ] ++ lib.optionals (!isServer) [
    # Dev machine only — heavy to compile on ARM/server
    # Media
    ffmpeg
    imagemagick
    tesseract
    yt-dlp

    # Database
    postgresql

    # Cloud & infra
    awscli2
    azure-cli
    google-cloud-sdk
    terraform
    kubectl
    kubernetes-helm
    k9s
    kubectx
    kustomize
    minikube

    # Go
    go-task
    golangci-lint

    # Build tools
    cmake
    ninja
    gradle
    maven

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

    # Node.js
    bun
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    mas      # Mac App Store CLI — macOS only
    gnused   # Linux already ships GNU sed
    gnutar   # Linux already ships GNU tar
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    xclip    # clipboard support on Linux
  ];
}
