{ config, lib, pkgs, ... }:
with lib;
let cfg = config.localModules.apps.neovim;
in {
  options.localModules.apps.neovim.enable = mkEnableOption "neovim";

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        # GUI
        neovide

        # fuzzy search
        fzf
        fd

        # tree-sitter exe
        tree-sitter

        # grep improvement
        ripgrep

        # Coloscripts
        dwt1-shell-color-scripts

        # clipboard managers
        xsel

        # fonts
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
        nerd-fonts.martian-mono

        lua51Packages.lua

        # git improvement
        lazygit

        # nodejs_24
        go
        jq
        sqlite

        imagemagick
        vscode-langservers-extracted

        # node package builder
        node2nix

        luajitPackages.luarocks-nix
        glow

        # Builders
        gcc
        deno
        cmake
        gnumake

        # lsp / formatters
        nil
        nixd
        gopls
        vale
        php
        isort
        julia
        pyright
        yamlfmt
        statix
        deadnix
        yarn-berry
        lemminx
        ueberzugpp
        asciidoc
        html-tidy
        asciidoctor
        libxml2Python
        sonarlint-ls
        uncrustify
        google-java-format

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
        lua-language-server
        spectral-language-server
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
