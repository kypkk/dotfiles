{ config, pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins "time battery weather"
          set -g @dracula-show-powerline true
          set -g @dracula-show-flags true
          set -g @dracula-show-fahrenheit false
          set -g @dracula-fixed-location "Houston, TX"
          set -g @dracula-show-left-icon session
          set -g @dracula-border-contrast true
          set -g @dracula-battery-label "Battery"
          set -g @dracula-show-timezone true
        '';
      }
    ];

    extraConfig = ''
      ${lib.optionalString pkgs.stdenv.isDarwin ''set-option -g default-command "arch -arch arm64 /bin/zsh"''}

setw -g pane-base-index 1
      set-option -g renumber-windows on

      bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
      bind -n WheelDownPane select-pane -t= \; send-keys -M
      bind -n C-WheelUpPane select-pane -t= \; copy-mode -e \; send-keys -M
      bind -T copy-mode-vi    C-WheelUpPane   send-keys -X halfpage-up
      bind -T copy-mode-vi    C-WheelDownPane send-keys -X halfpage-down
      bind -T copy-mode-emacs C-WheelUpPane   send-keys -X halfpage-up
      bind -T copy-mode-emacs C-WheelDownPane send-keys -X halfpage-down

      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "${if pkgs.stdenv.isDarwin then "pbcopy" else "xclip -selection clipboard"}"
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "${if pkgs.stdenv.isDarwin then "pbcopy" else "xclip -selection clipboard"}"

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set -g status-position top

      bind '"' split-window -v -c "#{pane_current_path}"
    '';
  };
}
