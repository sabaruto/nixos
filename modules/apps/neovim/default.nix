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

  tree-sitter-d2 = pkgs.vimUtils.buildVimPlugin {
    name = "tree-sitter-d2";
    src = pkgs.fetchFromGitHub {
      owner = "ravsii";
      repo = "tree-sitter-d2";
      hash = "sha256-mclMRkDsjCq4ED6J6eMBVNgYyS507cpmkfInrJYGg1g=";
      tag = "v0.7.1";
    };
  };

  build-dependent-pkgs = with pkgs; [
    acl
    attr
    bzip2
    curl
    libsodium
    libssh
    libxml2
    openssl
    stdenv.cc.cc
    systemd
    util-linux
    xz
    zlib
    zstd
    glib
    libcxx
  ];

  makePkgConfigPath = x: makeSearchPathOutput "dev" "lib/pkgconfig" x;
  makeIncludePath = x: makeSearchPathOutput "dev" "include" x;

  nvim-depends-library = pkgs.buildEnv {
    name = "nvim-depends-library";
    paths = map lib.getLib build-dependent-pkgs;
    extraPrefix = "/lib/nvim-depends";
    pathsToLink = [ "/lib" ];
    ignoreCollisions = true;
  };

  nvim-depends-include = pkgs.buildEnv {
    name = "nvim-depends-include";
    paths = splitString ":" (makeIncludePath build-dependent-pkgs);
    extraPrefix = "/lib/nvim-depends/include";
    ignoreCollisions = true;
  };

  nvim-depends-pkgconfig = pkgs.buildEnv {
    name = "nvim-depends-pkgconfig";
    paths = splitString ":" (makePkgConfigPath build-dependent-pkgs);
    extraPrefix = "/lib/nvim-depends/pkgconfig";
    ignoreCollisions = true;
  };

  buildEnv = [
    "CPATH=${config.home.profileDirectory}/lib/nvim-depends/include"
    "CPLUS_INCLUDE_PATH=${config.home.profileDirectory}/lib/nvim-depends/include/c++/v1"
    "LD_LIBRARY_PATH=${config.home.profileDirectory}/lib/nvim-depends/lib"
    "LIBRARY_PATH=${config.home.profileDirectory}/lib/nvim-depends/lib"
    "NIX_LD_LIBRARY_PATH=${config.home.profileDirectory}/lib/nvim-depends/lib"
    "PKG_CONFIG_PATH=${config.home.profileDirectory}/lib/nvim-depends/pkgconfig"
  ];
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

        patchelf

        nvim-depends-include
        nvim-depends-library
        nvim-depends-pkgconfig

        # GUI
        # neovide

        # fuzzy search
        fzf
        fd

        # tree-sitter exe
        tree-sitter

        # grep improvement
        ripgrep

        # Colour scripts
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
        # luajitPackages.fzf-lua

        # Builders
        gcc
        deno
        cmake
        gnumake

        # lsp / formatters
        black
        cspell-lsp
        deadnix
        isort
        julia
        jwt-cli
        lemminx
        nil
        nixd
        nodePackages.cspell
        php
        prettierd
        pyright
        statix
        stylua
        ueberzugpp
        vale
        yamlfmt

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

      extraOutputsToInstall = [
        "nvim-depends"
      ];

      shellAliases.nvim =
        (concatStringsSep " " buildEnv)
        + " SQLITE_CLIB_PATH=${pkgs.sqlite.out}/lib/libsqlite3.so "
        + "nvim";

      sessionVariables = {
        PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
        PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
      };
    };
    programs.neovim = {
      enable = true;

      defaultEditor = true;
      withPython3 = true;
      withNodeJs = true;

      extraPackages = with pkgs; [
        doq
        sqlite
        cargo
        clang
        cmake
        gcc
        gnumake
        ninja
        pkg-config
        yarn
      ];

      extraLuaPackages = ls: with ls; [ luarocks ];

      plugins = with pkgs.vimPlugins; [
        # tree-sitter
        nvim-treesitter.withAllGrammars

        (nvim-treesitter.withPlugins (_: [ tree-sitter-d2 ]))

        # Icons
        nvim-web-devicons

        # folding
        nvim-ufo

        # Autocomplete
        blink-cmp
        blink-compat
        blink-pairs

        persistence-nvim

        direnv-vim
        flash-nvim
        noice-nvim
        snacks-nvim
        rose-pine
        which-key-nvim
        better-escape-nvim
        neo-tree-nvim

        lualine-nvim

        # LSP
        nvim-lspconfig
        nvim-dap
        nvim-java
        nvim-java-test
        nvim-java-dap
        cspell-nvim
        tree-sitter-d2
        kulala-nvim
        mason-nvim
        mason-lspconfig-nvim
        mason-nvim-dap-nvim

        # Formatting / diagnostics
        conform-nvim
        nvim-lint
        trouble-nvim
        tiny-inline-diagnostic-nvim

        # Markdown
        # zk-nvim
        render-markdown-nvim

        # Mini
        mini-ai
        mini-pairs
        mini-surround
        mini-comment
        mini-splitjoin
        mini-icons
        mini-indentscope
        mini-files
        mini-move
        mini-operators
        mini-animate
        mini-files

        # git
        gitsigns-nvim
        diffview-nvim

        # telescope
        telescope-nvim
        telescope-fzf-native-nvim
        telescope-ui-select-nvim
        telescope-dap-nvim
        telescope-media-files-nvim
        telescope-git-conflicts-nvim
        telescope-file-browser-nvim
      ];
    };
  };
}
