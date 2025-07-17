{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.neovim;
  dotfilesDir = config.localModules.const.dotfiles;
in
{
  options.localModules.apps.neovim.enable = mkEnableOption "neovim";

  config = mkIf cfg.enable {
    localModules.lib.home-files = [
      {
        name = "nvim";
        recursive = true;
        source = "${dotfilesDir}/nvim";
        target = ".config/nvim";
      }
    ];

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
        nerd-fonts.lilex

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
        asciidoc
        asciidoctor
        deadnix
        google-java-format
        gopls
        html-tidy
        isort
        julia
        lemminx
        libxml2Python
        nil
        nixd
        php
        pyright
        sonarlint-ls
        statix
        ueberzugpp
        uncrustify
        vale
        yamlfmt
        yarn-berry

        # Builders
        bash-language-server
        cargo
        lua-language-server
        markdown-oxide
        mermaid-cli
        python313Packages.pip
        python313Packages.python
        spectral-language-server
        temurin-bin-24
        yaml-language-server
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
