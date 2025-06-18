{ config, lib, pkgs, ... }:
with lib;
let cfg = config.localModules.apps.neovim;
in {
  options.localModules.apps.neovim.enable = mkEnableOption "neovim";

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
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
        nerd-fonts.martian-mono

        lua51Packages.lua

        # git improvement
        lazygit

        nodejs
        go
        jq
        sqlite

        imagemagick
        vscode-langservers-extracted

        # node package builder
        node2nix

        luajitPackages.luarocks-nix

        # Builders
        gcc
        cmake
        gnumake

        # lsp / formatters
        nil
        gopls
        php
        julia
        lemminx
        yamlfmt
        html-tidy
        libxml2Python
        sonarlint-ls

        # Builders
        cargo
        mermaid-cli
        python313Packages.python
        python313Packages.pip
        temurin-bin-24
        spectral-language-server
        php84Packages.composer
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
