{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.localModules.apps.neovim;
  path =
    "${config.home.homeDirectory}/nixos/modules/home-manager/default/apps/neovim";
in {
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
        nixd

        # fonts
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
        nerd-fonts.martian-mono

        lua51Packages.lua

        # git improvement
        lazygit

        nodejs
        go
        jq

        # node package builder
        node2nix

        luajitPackages.luarocks-nix

        # Builders
        gcc
        cmake
        gnumake

        # mason languages
        php
        julia
        cargo
        python313Packages.python
        python313Packages.pip
        temurin-bin-24
        php84Packages.composer

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
        kulala-fmt
        nixfmt-rfc-style
        markdownlint-cli
        jdt-language-server
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink path;
  };
}
