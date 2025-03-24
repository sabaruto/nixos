{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.localModules.apps;
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options.localModules.apps.nix.enable = mkEnableOption "nix";

  config = mkIf cfg.nix.enable {
    home.packages = with pkgs; [
      # creating packages from URLs
      nix-init

      # find hash of packages
      nix-prefetch

      # nix formatter
      nixfmt-rfc-style
      nixd

      # fuzzy search
      fzf
      fd

      # grep improvement
      ripgrep
    ];

    programs.nixvim = {
      enable = true;

      clipboard.register="unnamedplus";
      
      plugins = {
        lualine.enable = true;
        nix.enable = true;
        web-devicons.enable = true;
        mini.enable = true;
        nvim-surround.enable = true;
        precognition.enable = true;
        noice.enable = true;
        barbecue.enable = true;
        project-nvim.enable = true;

        snacks = { 
          enable = true;
          
          settings = {
            words.enabled = true;
            notifier.enabled = true;
          };
        };

        telescope = { 
          enable = true;
          extensions = {
            project.enable = true;
          };
        };

        treesitter = { 
          enable = true;
          settings = {
            auto_install = true;
            hightlight.enable = true;
          };
        };

        which-key = {
          enable = true;
          autoLoad = true;
        };

        cmp = {
          autoEnableSources = true;
          settings.sources = [
            { name = "nvim_lsp"; }
            { name = "nvim_lsp_document_symbol"; }
            { name = "nvim_lsp_signature_help"; }

            { name = "dictionary"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "git"; }
            { name = "treesitter"; }
          ];
        };

        lsp = {
          enable = true;
          inlayHints = true;

          servers = {
            # Typescript 
            ts_ls.enable = true;

            # Nix 
            nixd.enable = true;
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
    };
  };
}
