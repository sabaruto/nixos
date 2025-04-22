{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.neovim;
  path = "${config.home.homeDirectory}/nixos/modules/home-manager/apps/neovim";
in
{
  options.localModules.apps.neovim.enable = mkEnableOption "neovim";

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        # language servers
        vscode-langservers-extracted

        # fuzzy search
        fzf
        fd

        # tree-sitter exe
        tree-sitter

        # grep improvement
        ripgrep

        # fonts
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono

        nodejs
        gcc
        gnumake
      ];

      # TODO: Add dotfile path as a home-manager module
      activation = {
        directlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          $DRY_RUN_CMD ln -sfvn  ${path}/lua ${config.home.homeDirectory}/.config/nvim
          $DRY_RUN_CMD ln -sfvn  ${path}/init.lua ${config.home.homeDirectory}/.config/nvim
        '';
      };
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
