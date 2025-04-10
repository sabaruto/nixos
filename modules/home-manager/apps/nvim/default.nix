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
    ./plugin/treesitter-refactor
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
      treesitter-refactor.enable = true;
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
      # language servers
      vscode-langservers-extracted

      # fuzzy search
      fzf
      fd

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
        lz-n.enable = true;
        notify.enable = true;
        rainbow-delimiters.enable = true;
        image.enable = true;
        friendly-snippets.enable = true;
        scope.enable = true;

        lualine = {
          enable = true;

          settings = {
            sections = {
              lualine_a = null;
              lualine_b = null;
              lualine_c = null;
              lualine_x = null;
              lualine_y = null;
              lualine_z = null;
            };

            inactive_winbar = {
              lualine_c = [ "filename" ];
              lualine_x = [ "location" ];
            };

            winbar = {
              lualine_a = [ "mode" ];
              lualine_b = [
                "branch"
                "diff"
                "diagnostics"
              ];
              lualine_c = [ "filename" ];
              lualine_x = [
                "encoding"
                "fileformat"
                "filetype"
              ];
              lualine_y = [ "progress" ];
              lualine_z = [ "location" ];
            };
          };
        };

        bufferline = {
          enable = true;

          settings.options = {
            mode = "tabs";
            separator_style = "slant";
            always_show_bufferline = true;
            diagnostics = "nvim_lsp";

          };
        };

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
              { __raw = ''require('diagram.integrations.markdown')''; }
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
