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
        nixd
        gopls
        php
        isort
        julia
        pyright
        yamlfmt
        statix
        deadnix
        yarn-berry
        lemminx
        ueberzug
        html-tidy
        libxml2Python
        sonarlint-ls

        # Builders
        cargo
        mermaid-cli
        temurin-bin-24
        markdown-oxide
        python313Packages.python
        bash-language-server
        python313Packages.pip
        yaml-language-server
        php84Packages.composer
        spectral-language-server
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
