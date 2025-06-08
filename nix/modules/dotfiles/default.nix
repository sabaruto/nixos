{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.localModules;
  dotfilesDirectory =
    "${config.home.homeDirectory}/github.com/sabaruto/nixos/nix/modules/dotfiles";
in
{
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
        source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/.oh-my-zsh";
        target = ".oh-my-zsh";
      };

      ".wezterm.lua" = mkIf cfg.apps.wezterm.enable {
        enable = true;
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
          "${dotfilesDirectory}/.wezterm.lua";
        target = ".wezterm.lua";
      };
    };
  };
}
