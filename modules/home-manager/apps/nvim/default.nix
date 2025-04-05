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
    ./plugin/telescope
    ./plugin/obsidian
  ];

  options.localModules.apps.nvim.enable = mkEnableOption "nvim";

  config = mkIf cfg.nvim.enable {
    localModules.apps.nvim = {
      treesitter-textobjects.enable = true;
      telescope.enable = true;
      obsidian.enable = true;
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
            markdown.headings.__raw = "require(\"markview.presets\").headings.marker";
            horizontal_rules.__raw = "require(\"markview.presets\").horizontal_rules.thin";
            code_blocks.style = "simple";
          };
        };

        tmux-navigator = {
          enable = true;
          settings.no_mappings = 1;

          keymaps = [
            {
              action = "left";
              key = "<M-Left>";
            }
            {
              action = "right";
              key = "<M-Right>";
            }
            {
              action = "up";
              key = "<M-Up>";
            }
            {
              action = "down";
              key = "<M-Down>";
            }
            {
              action = "previous";
              key = "<M-\\>";
            }
          ];
        };

        noice = {
          enable = true;

          settings = {
            preset = {
              command_palette = true;
              inc_rename = true;
              lsp_doc_border = true;
            };

            lsp = {
              signature.view = "hover";

              override = {
                "cmp.entry.get_documentation" = true;
                "vim.lsp.util.convert_input_to_markdown_lines" = true;
                "vim.lsp.util.stylize_markdown" = true;
              };
            };
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

        treesitter = {
          enable = true;

          settings = {
            auto_install = true;
            indent.enable = true;

            ensure_installed = [
              "c"
              "lua"
              "vim"
              "bash"
              "regex"
              "vimdoc"
              "query"
              "markdown"
              "markdown_inline"

            ];

            hightlight = {
              enable = true;
              additional_vim_regex_highlighting = true;
            };

            incremental_selection = {
              enable = true;
            };
          };
        };

        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            preselect = "cmp.PreselectMode.None";

            mapping = {
              "<C-Down>" = "cmp.mapping.scroll_docs(-4)";
              "<C-Up>" = "cmp.mapping.scroll_docs(4)";

              "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";

              "<Esc>" = "cmp.mapping.abort()";
              "<Right>" = "cmp.mapping.confirm({ select = false })";
              "<CR>" = "cmp.mapping.confirm({ select = false })";

              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            };

            sources = [
              { name = "nvim_lsp"; }
              { name = "nvim_lsp_document_symbol"; }
              { name = "nvim_lsp_signature_help"; }
              { name = "orgmode"; }

              { name = "dictionary"; }

              { name = "path"; }
              { name = "buffer"; }
              { name = "git"; }
              { name = "vimwiki"; }
            ];
          };
        };

        lsp = {
          enable = true;

          servers = {
            # Typescript
            ts_ls.enable = true;

            # Nix
            nixd.enable = true;

            # python
            basedpyright.enable = true;

            # lua
            lua_ls.enable = true;

            # jsonls
            jsonls.enable = true;

            # golang
            gopls.enable = true;
          };
        };

        conform-nvim = {
          enable = true;

          settings = {
            formatters_by_ft = {
              lua = [ "stylua" ];

              go = [ "gofmt" ];

              python = [
                "isort"
                "black"
              ];
            };

            "*" = [ "codespell" ];

            format_on_save = {
              timeout_ms = 500;
              lsp_fallback = true;
            };

            default_format_opts = {
              lsp_format = "fallback";
            };
          };
        };

        dap = {
          enable = true;
        };

        dap-go.enable = true;
        dap-python.enable = true;

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
