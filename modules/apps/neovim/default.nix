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
    # localModules.lib.home-files = [
    #   {
    #     name = "nvim";
    #     recursive = true;
    #     source = "${dotfilesDir}/nvim";
    #     target = ".config/nvim";
    #   }
    # ];

    vim = {
      utility = {
        snacks-nvim = {
          enable = true;

          setupOpts = {
			bigfile = { enabled = true; };
			dashboard = {
				enabled = true;
			};
			explorer = { enabled = false },
			indent = { enabled = false },
			input = { enabled = true },

			notifier = {
				enabled = true,
				timeout = 3000,
			},

			picker = {enabled = true,},
			quickfile = { enabled = true },
			scope = { enabled = true },
			image = { enabled = true },
			scroll = {
				enabled = true,
				animate = {
					easing = "inSine",
				},

				animate_repeat = {
					easing = "inSine",
				},
			},

			statuscolumn = {
				enabled = true,
				left = { "mark", "sign" },
				right = { "fold", "git" }, -- priority of signs on the right (high to low)
				folds = {
					open = true, -- show open fold icons
					git_hl = false, -- use Git Signs hl for fold icons
				},
				git = {
					-- patterns to match Git signs
					patterns = { "GitSign", "MiniDiffSign" },
				},
				refresh = 50, -- refresh at most every 50ms
			},

			words = { enabled = true },
			styles = {
				notification = {
					wo = { wrap = true } -- Wrap notifications
				},
				terminal = {
					wo = { winbar = vim.v.count1 .. ": %{get(b:, 'term_title', '')}" },
				},
			},
			terminal = { enabled = false, },
		};
        };
      };
    };

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
        nerd-fonts.lilex

        lua51Packages.lua

        # git improvement
        lazygit

        # nodejs_24
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

        # Builders
        bash-language-server
        cargo
        lua-language-server
        markdown-oxide
        mermaid-cli
        python313Packages.pip
        python313Packages.python
        spectral-language-server
        yaml-language-server
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

  };
}
