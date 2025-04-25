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

        # linters / formatters
        statix
        nixfmt
        deadnix
        semgrep
        codespell
        stylelint
        proselint
        markdownlint-cli
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    localModules.lib.links = [
      {
        sourcePath = "${path}/lua";
        symbolicLink = "${config.home.homeDirectory}/.config/nvim/lua";
      }
      {
        sourcePath = "${path}/init.lua";
        symbolicLink = "${config.home.homeDirectory}/.config/nvim/init.lua";
      }
    ];
  };
}
