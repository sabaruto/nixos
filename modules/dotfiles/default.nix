{ lib, config, ... }:
with lib;
let
  cfg = config.localModules;
  dotfilesDirectory = "${config.home.homeDirectory}/github.com/sabaruto/nixos/modules/dotfiles";
in
{
  options.localModules.const.dotfiles = mkOption {
    type = types.str;
    default = "${config.home.homeDirectory}/github.com/sabaruto/nixos/modules/dotfiles";
  };

  config = {
    localModules.lib.home-files = [
      {
        name = "nixpkgs";
        recursive = true;
        source = "${dotfilesDirectory}/nixpkgs";
        target = ".config/nixpkgs";
      }

      {
        name = "pictures";
        recursive = true;
        source = "${dotfilesDirectory}/dot_pictures";
        target = ".pictures";
      }
    ];

    home.file = {
      ".oh-my-zsh" = mkIf cfg.shells.zsh.enable {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/dot_oh-my-zsh";
        target = ".oh-my-zsh";
      };

      "oh-my-posh" = mkIf cfg.cmd.oh-my-posh.enable {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/oh-my-posh";
        target = ".config/oh-my-posh";
      };

      "alacritty" = mkIf cfg.apps.alacritty.enable {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/alacritty";
        target = ".config/alacritty";
      };

      "hypr" = mkIf (cfg.desktopEnvironment == "hyprland") {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/hypr";
        target = ".config/hypr";
      };

      "waybar" = mkIf (cfg.desktopEnvironment == "hyprland") {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/waybar";
        target = ".config/waybar";
      };
    };
  };
}
