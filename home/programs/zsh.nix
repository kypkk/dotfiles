{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vim = "nvim";
      lg = "lazygit";
      ls = "lsd";
      la = "lsd -a";
      ll = "lsd -l";

      gst = "git status";
    };

    initContent = ''
      ${pkgs.lib.optionalString pkgs.stdenv.isDarwin ''
        # -------- Homebrew --------
        eval "$(/opt/homebrew/bin/brew shellenv)"
      ''}

      # -------- Powerlevel10k instant prompt --------
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      # -------- Theme --------
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

      ${pkgs.lib.optionalString pkgs.stdenv.isDarwin ''
        # -------- Conda (macOS via Homebrew) --------
        export CONDA_HOME="/opt/homebrew/Caskroom/miniconda/base"
        if [ -x "$CONDA_HOME/bin/conda" ]; then
          __conda_setup="$("$CONDA_HOME/bin/conda" shell.zsh hook 2> /dev/null)"
          if [ $? -eq 0 ]; then
            eval "$__conda_setup"
          else
            export PATH="$CONDA_HOME/bin:$PATH"
          fi
          unset __conda_setup
        fi
      ''}

      # -------- NVM (official install in ~/.nvm) --------
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

      nvm use default >/dev/null 2>&1 || true
    '';
  };

  home.file.".p10k.zsh".source =
    if pkgs.stdenv.isDarwin then ../p10k.zsh else ../p10k-nixos.zsh;
}
