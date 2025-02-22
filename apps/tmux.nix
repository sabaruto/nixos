{ config, home, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";

    # Defualts
    sensibleOnTop = true;
    shell = "${pkgs.zsh}/bin/zsh";
    mouse = true;

    # prefix key
    prefix = "C-Space";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'latte'";
      }
    ];
    
    extraConfig = ''
      # allow clipboard use
      set -g set-clipboard on
      
      # split panes using | and -
      # also set the new plane's directory to the origninators
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'
      unbind '"'
      unbind %

      # switch panes using Alt-Arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
    '';
  };
}
