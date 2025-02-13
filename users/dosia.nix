{ config, pkgs, appimageTools, fetchurl, ... }:
let
  username = "dosia";
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = "Theodosia Kalu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Password Manager
      _1password-gui
      
      # Music Services
      tidal-hifi
      spotify

      # Development
      git
      git-lfs
      vscode
      tmux

      # ZSH Configuration
      zsh
      oh-my-zsh
      zsh-autocomplete

      # Chromium Browser
      brave
    ];
  };

  # This user uses app images
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set-option -g default-shell /etc/profiles/per-user/${username}/bin/zsh
    '';
  };

  programs.zsh.enable = true;
}
