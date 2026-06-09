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
    go-task        # task runner (binary: `task`)
    golangci-lint  # Go linters aggregator

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

    # Node.js
    bun

    # Python
    uv
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    mas      # Mac App Store CLI — macOS only
    gnused   # Linux already ships GNU sed
    gnutar   # Linux already ships GNU tar
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    xclip    # clipboard support on Linux
  ];
}
