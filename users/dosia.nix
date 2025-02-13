{ config, pkgs, ... }:
{
  users.users.dosia = {
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
      vscode
      tmux
      zsh

      # Chromium Browser
      brave
    ];
  };
}
