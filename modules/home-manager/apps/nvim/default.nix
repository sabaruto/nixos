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

      # lua language server
      lua
      lua-language-server

      # fuzzy search
      fzf
      fd

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

        # UI
        noice = {
          enable = true;

          settings = {
            lsp.override = {
              "cmp.entry.get_documentation" = true;
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.nixfmt-rfc-style" = true;
            };
            popupmenu.backend = "cmp";
          };
        };
        web-devicons.enable = true;
        lualine.enable = true;
        notify.enable = true;

        neoconf.enable = true;

        telescope = {
          enable = true;

          extensions = {
            fzf-native.enable = true;
            ui-select.enable = true;
          };
        };

        treesitter = {
          enable = true;
          settings = {
            auto_install = true;
            hightlight.enable = true;
          };
        };

        treesitter-context = {
          enable = true;
          settings = {
            line_numbers = true;
          };
        };

        which-key = {
          enable = true;
          autoLoad = true;
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
          };
        };

        lsp-format = {
          enable = true;

          settings = {
            go.sync = true;
            python.sync = true;
            nix.sync = true;
          };
        };

        lspsaga = {
          enable = true;

          beacon.enable = true;
          lightbulb.enable = true;
          implement.enable = true;
          symbolInWinbar.enable = true;

          outline = {
            layout = "float";
          };
        };
      };

      colorschemes = {
        catppuccin = {
          enable = true;
          settings.background = {
            dark = "macchiato";
            light = "latte";
          };
        };
      };

      extraFiles = {
        "plugin/keymaps/default.lua" = {
          enable = true;
          source = ./keymaps/default.lua;
        };

        "plugin/keymaps/telescope.lua" = {
          enable = true;
          source = ./keymaps/telescope.lua;
        };

        "plugin/keymaps/lspsaga.lua" = {
          enable = true;
          source = ./keymaps/lspsaga.lua;
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
