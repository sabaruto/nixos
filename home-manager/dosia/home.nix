{ lib, config, pkgs, ... }:
let
  zen = import ../../derivations/zen.nix { inherit pkgs; };
in
{
  imports = 
  [
    # Base manager
    ../base.nix

    # ------------------------------
    # Configured programs
    # ------------------------------

    # Development
    ../../apps/zsh.nix

    ../../apps/tmux.nix

    ../../apps/micro.nix

    ../../apps/emacs.nix

    ../../apps/git.nix

    ../../apps/kitty.nix

    # ------------------------------
    # Vscode Packages
    # ------------------------------

    # default
    ../../apps/vscode.nix

    # Themes
    ../../apps/vscode-extensions/themes.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "dosia";
    homeDirectory = lib.mkDefault "/home/dosia";
  
    packages = with pkgs; [
      # Password Manager
      _1password-gui
      
      # Music Services
      tidal-hifi
      spotify

      # Chromium Browser
      brave
      firefox

      # Current browser
      zen

      # Zoom
      zoom-us

      # Cursor
      google-cursor
    ];

    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.11";
  };
}
