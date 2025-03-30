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
  options.localModules.apps.nvim.enable = mkEnableOption "nvim";

  config = mkIf cfg.nvim.enable {
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

      # Obsidian
      obsidian

    ];

    fonts.fontconfig.enable = true;

    programs.nixvim = {
      enable = true;

      clipboard.providers.xclip.enable = true;
      plugins = {
        nix.enable = true;
        nvim-surround.enable = true;
        project-nvim.enable = true;
        web-devicons.enable = true;
        leap.enable = true;
        nui.enable = true;
        dashboard.enable = true;
        barbecue.enable = true;
        markview.enable = true;
        lualine.enable = true;
        lz-n.enable = true;

        noice = {
          enable = true;
          settings = {

            preset = {
              command_palette = true;
              inc_rename = true;
              lsp_doc_border = true;
            };

            lsp.override = {
              "cmp.entry.get_documentation" = true;
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
            };
          };
        };

        notify.enable = true;

        # UI
        telescope = {
          enable = true;

          extensions = {
            fzf-native.enable = true;
            ui-select.enable = true;
          };

          settings = {
            pickers = {
              find_files = {
                theme = "dropdown";
              };
              git_files = {
                theme = "dropdown";
              };
              grep_string = {
                theme = "dropdown";
              };
              live_grep = {
                theme = "dropdown";
              };
              registers = {
                theme = "dropdown";
              };
              buffers = {
                theme = "dropdown";
              };
              current_buffer_fuzzy_find = {
                theme = "dropdown";
              };
              projects = {
                theme = "dropdown";
              };
              lsp_definitions = {
                theme = "dropdown";
              };
              lsp_implementations = {
                theme = "dropdown";
              };
              lsp_references = {
                theme = "dropdown";
              };
              lsp_type_references = {
                theme = "dropdown";
              };
              lsp_document_symbols = {
                theme = "cursor";
              };
              lsp_workspace_symbols = {
                theme = "dropdown";
              };
            };
          };
        };

        treesitter = {
          enable = true;

          settings = {
            auto_install = true;
            indent.enable = true;

            hightlight = {
              enable = true;
              additional_vim_regex_highlighting = true;
            };
          };
        };

        treesitter-context = {
          enable = true;
          settings = {
            line_numbers = true;
          };
        };

        cmp = {
          enable = true;
          autoEnableSources = true;

          settings = {
            mapping = {
              "<C-Down>" = "cmp.mapping.scroll_docs(-4)";
              "<C-Up>" = "cmp.mapping.scroll_docs(4)";

              "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";

              "<Esc>" = "cmp.mapping.close()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";

              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            };

            sources = [
              { name = "nvim_lsp"; }
              { name = "nvim_lsp_document_symbol"; }
              { name = "nvim_lsp_signature_help"; }

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

        lsp-format.enable = true;

        which-key = {
          enable = true;

          settings = {
            preset = "modern";
            win.row = 50;
          };
        };
      };

      colorscheme = "rose-pine";

      colorschemes = {
        melange = {
          enable = true;
        };

        catppuccin = {
          enable = true;
          lazyLoad.enable = true;

          settings = {
            integrations = {
              cmp = true;
              treesitter = true;
              notify = true;
            };

            background = {
              dark = "macchiato";
              light = "latte";
            };
          };
        };

        rose-pine = {
          enable = true;
          lazyLoad.enable = true;
          settings.dark_variant = "moon";
        };
      };

      extraFiles = {
        "plugin/config.lua" = {
          enable = true;
          source = ./plugin/config.lua;
        };

        "plugin/keymaps.lua" = {
          enable = true;
          source = ./plugin/keymaps.lua;
        };

        "plugin/telescope/keymaps.lua" = {
          enable = true;
          source = ./plugin/telescope/keymaps.lua;
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
