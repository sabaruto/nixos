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

        markdown-oxide

        # fonts
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono

        # git improvement
        lazygit

        nodejs
        go
        jq
        zk

        # Builders
        gcc
        gnumake

        # linters / formatters
        vale
        statix
        stylua
        selene
        deadnix
        semgrep
        lemminx
        codespell
        stylelint
        proselint
        nixfmt-rfc-style
        markdownlint-cli
        jdt-language-server
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    localModules.lib.links = [
      {
        sourcePath = "${path}";
        symbolicLink = "${config.home.homeDirectory}/.config/nvim";
      }
    ];
  };
}
