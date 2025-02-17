{ config, pkgs, appimageTools, fetchurl, ... }:
let
  username = "dosia";
  zenApp = import ../derivations/zen.nix { inherit pkgs; };
  googleCursor = import ../desktop-environment/google-cursor.nix {inherit pkgs; };
  tmux = (import ../apps/tmux.nix) username;
  git = (import ../apps/git.nix) username;
in
{
  imports = 
  [
      # Desktop Environment
      ../desktop-environment/gnome.nix

      # Steam
      ../apps/steam.nix

      tmux

      git
  ];

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
      vscode

      # ZSH Configuration
      zsh
      oh-my-zsh
      zsh-autocomplete

      # Chromium Browser
      brave

      # Current browser
      zenApp

      # Zoom
      zoom-us

      # Curosr
      googleCursor

      tree
    ];
  };

  programs.zsh.enable = true;
}
