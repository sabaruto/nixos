{ lib, config, ... }:
with lib;
let
  cfg = config.localModules;
  dotfilesDirectory =
    "${config.home.homeDirectory}/github.com/sabaruto/nixos/modules/dotfiles";
in {
  options.localModules = { };

  config = {
    home.file = {
      "nvim" = mkIf cfg.apps.neovim.enable {
        enable = true;
        recursive = true;
        source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/nvim";
        target = ".config/nvim";
      };

      ".oh-my-zsh" = mkIf cfg.shells.zsh.enable {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
          "${dotfilesDirectory}/dot_oh-my-zsh";
        target = ".oh-my-zsh";
      };

      "oh-my-posh" = mkIf cfg.cmd.oh-my-posh.enable {
        enable = true;
        recursive = true;
        source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/oh-my-posh";
        target = ".config/oh-my-posh";
      };

      ".wezterm.lua" = mkIf cfg.apps.wezterm.enable {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
          "${dotfilesDirectory}/dot_wezterm.lua";
        target = ".wezterm.lua";
      };

      "alacritty" = mkIf cfg.apps.alacritty.enable {
        enable = true;
        recursive = true;
        source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/alacritty";
        target = ".config/alacritty";
      };

      "hypr" = mkIf (cfg.desktopEnvironment == "hyprland") {
        enable = true;
        recursive = true;
        source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/hypr";
        target = ".config/hypr";
      };

      "waybar" = mkIf (cfg.desktopEnvironment == "hyprland") {
        enable = true;
        recursive = true;
        source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/waybar";
        target = ".config/waybar";
      };

      "pictures" = {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
          "${dotfilesDirectory}/dot_pictures";
        target = ".pictures";
      };

      "ghostty" = {
        enable = true;
        recursive = true;
        source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/ghostty";
        target = ".config/ghostty";
      };
    };
  };
}
