username:
  { config, pkgs, ... }:
  {
    users.users.${username}.packages = with pkgs; [ tmux ];

    programs.tmux = {
      enable = true;
      extraConfig = ''
        set-option -g default-shell /etc/profiles/per-user/${username}/bin/zsh
      '';
    };
  }