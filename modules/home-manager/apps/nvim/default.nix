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

      extraConfigLua = (readFile ./plugin/config.lua) + (readFile ./plugin/keymaps.lua);

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
        notify.enable = true;

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

        # UI
        telescope = {
          enable = true;

          extensions = {
            fzf-native.enable = true;
            ui-select.enable = true;
          };

          settings.pickers =
            genAttrs
              [
                "find_files"
                "git_files"
                "grep_string"
                "live_grep"
                "registers"
                "buffers"
                "current_buffer_fuzzy_find"
                "projects"
                "lsp_definitions"
                "lsp_implementations"
                "lsp_references"
                "lsp_type_references"
                "lsp_document_symbols"
                "lsp_workspace_symbols"
              ]
              (name: {
                theme = "dropdown";
              });

          luaConfig.post = readFile ./plugin/telescope/keymaps.lua;
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

            incremental_selection = {
              enable = true;
            };
          };
        };

        treesitter-context = {
          enable = true;

          settings = {
            line_numbers = true;
          };
        };

        treesitter-textobjects = {
          enable = true;

          select = {
            enable = true;

            keymaps = {
              "af" = "@function.outer";
              "if" = "@function.inner";
              "ac" = "@class.outer";
              "ic" = "@class.inner";
              "as" = "@local.scope";
            };
          };

          swap = {
            enable = true;

            swapNext."<leader>a" = "@parameter.inner";
            swapPrevious."<leader>A" = "@parameter.inner";
          };

          move = {
            enable = true;

            gotoNext."]d" = "@conditional.outer";
            gotoPrevious."[d" = "@conditional.outer";

            gotoNextStart = {
              "]m" = "@function.outer";
              "]]" = "@class.outer";
              "]o" = "@loop.*";

              "]s" = {
                query = "@local.scope";
                queryGroup = "locals";
                desc = "Next scope";
              };

              "]z" = {
                query = "@fold";
                queryGroup = "folds";
                desc = "Next fold";
              };
            };

            gotoNextEnd = {
              "]M" = "@function.outer";
              "][" = "@function.outer";
            };

            gotoPreviousStart = {
              "[m" = "@function.outer";
              "[[" = "@class.outer";
            };
          };

          lspInterop = {
            enable = true;

            peekDefinitionCode = {
              "<leader>df" = "@function.outer";
              "<leader>dF" = "@class.outer";
            };
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
        melange.enable = true;

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
