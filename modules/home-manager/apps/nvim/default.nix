{
  config,
  lib,
  pkgs,
  ...
}:
with lib;

let
  cfg = config.localModules.apps;
in
{
  imports = [
    ./plugin/treesitter-textobjects
    ./plugin/treesitter
    ./plugin/telescope
    ./plugin/obsidian
    ./plugin/cmp
    ./plugin/lsp
    ./plugin/conform-nvim
    ./plugin/tmux-navigator
    ./plugin/trouble
    ./plugin/dap
    ./plugin/noice
  ];

  options.localModules.apps.nvim.enable = mkEnableOption "nvim";

  config = mkIf cfg.nvim.enable {

    localModules.apps.nvim = {
      treesitter.enable = true;
      treesitter-textobjects.enable = true;

      tmux-navigator.enable = true;
      conform-nvim.enable = true;
      telescope.enable = true;
      obsidian.enable = true;
      trouble.enable = true;
      noice.enable = true;
      dap.enable = true;
      cmp.enable = true;
      lsp.enable = true;
    };

    home.packages = with pkgs; [
      # creating packages from URLs
      nix-init

      # find hash of packages
      nix-prefetch

      # nix formatter
      nixfmt-rfc-style
      nixd

      # language servers
      lua
      lua-language-server
      vscode-langservers-extracted

      # fuzzy search
      fzf
      fd

      # golang
      go
      gopls
      delve

      # python
      python312Packages.debugpy

      # grep improvement
      ripgrep

      # fonts
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
    ];

    fonts.fontconfig.enable = true;

    programs.nixvim = {
      enable = true;
      clipboard.providers.xclip.enable = true;

      extraConfigLua = (readFile ./plugin/config.lua) + (readFile ./plugin/keymaps.lua);

      plugins = {
        nix.enable = true;
        nvim-surround.enable = true;
        project-nvim.enable = true;
        web-devicons.enable = true;
        leap.enable = true;
        nui.enable = true;
        dashboard.enable = true;
        dropbar.enable = true;
        lualine.enable = true;
        lz-n.enable = true;
        notify.enable = true;
        rainbow-delimiters.enable = true;
        image.enable = true;
        friendly-snippets.enable = true;

        rest = {
          enable = true;
          enableTelescope = true;
        };

        diagram = {
          enable = true;

          settings = {
            renderer_options = {
              mermaid.theme = "forest";
            };

            integrations = [
              {
                __raw = "require('diagram.integrations.markdown')";
              }
            ];
          };
        };

        easyescape = {
          enable = true;
          settings.chars = {
            j = 1;
            k = 1;
          };
        };

        markview = {
          enable = true;

          settings = {
            markdown = {
              headings.__raw = "require(\"markview.presets\").headings.marker";
              horizontal_rules.__raw = "require(\"markview.presets\").horizontal_rules.thin";
            };
            code_blocks.style = "simple";
          };
        };

        nvim-ufo = {
          enable = true;
          settings.provider_selector = ''
            function(bufnr, filetype, buftype)
                    return {'treesitter', 'indent'}
                end
          '';
          luaConfig.post = readFile ./plugin/ufo/config.lua;
        };

        which-key = {
          enable = true;

          settings = {
            preset = "modern";
            win.row = 50;
          };
        };
      };

      colorscheme = "catppuccin";

      colorschemes = {
        melange.enable = true;

        catppuccin = {
          enable = true;

          settings = {
            integrations = {
              cmp = true;
              treesitter = true;
              notify = true;
              which_key = true;
              lsp_trouble = true;
              noice = true;
              nvim_surround = true;
              dap = true;

              dropbar = {
                enabled = true;
                color_mode = true;
              };

            };

            background = {
              dark = "macchiato";
              light = "latte";
            };
          };
        };

        rose-pine = {
          enable = false;
          lazyLoad.enable = true;
          settings.dark_variant = "moon";
        };
      };

      performance.byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
  };
}
