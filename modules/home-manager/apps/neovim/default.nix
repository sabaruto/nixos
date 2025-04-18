{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.neovim;
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

      file.".config/nvim/lua" = {
        source = ./lua;
        recursive = true;
      };
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;

      plugins = with pkgs.vimPlugins; [
        {
          plugin = lazy-nvim;
        }
      ];

      extraLuaConfig = readFile ./init.lua;
    };
  };
}
