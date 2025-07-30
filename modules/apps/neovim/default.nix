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
        # neovide

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
        nerd-fonts.lilex

        lua51Packages.lua

        # git improvement
        lazygit

        nodejs_24
        jq
        sqlite
        d2
        playwright
        python313Packages.playwright
        playwright-driver.browsers

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
        deadnix
        isort
        julia
        lemminx
        nil
        nixd
        php
        statix
        ueberzugpp
        vale
        yamlfmt
        pyright
        prettierd

        # Builders
        bash-language-server
        cargo
        lua-language-server
        mermaid-cli
        python313Packages.pip
        python313Packages.python
        spectral-language-server
        yaml-language-server
      ];

      sessionVariables = {
        PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
        PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
      };
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
