{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.localModules.development;
in
{
  imports = [
    ./alacritty
    ./ghostty
    ./helix
    ./kitty
    ./neovim
    ./wezterm
    ./zed
    ./zen-browser
  ];

  options.localModules = {
    development = {
      enable = mkEnableOption "Development";
      installOnNixos = mkEnableOption "Install with Nix";
      languages = mkOption {
        type =
          with types;
          listOf (enum [
            "golang"
            "typescript"
            "sass"
            "nix"
            "java"
            "python"
            "lua"
          ]);
      };
    };

    gaming.enable = mkEnableOption "Gaming";
  };

  config = mkIf (cfg.enable && cfg.installOnNixos) {

    programs.java = mkIf (elem "java" cfg.languages) {
      enable = true;
      package = pkgs.javaPackages.compiler.temurin-bin.jdk-25;
    };

    home = mkMerge [
      {
        packages = with pkgs; [
          # creating packages from URLs
          nix-init

          # find hash of packages
          nix-prefetch

          # git help
          lazygit

          # nix formatter
          nixfmt
          nixd
          fd

          lua-language-server
        ];
      }

      (mkIf (elem "golang" cfg.languages) {
        packages = with pkgs; [
          go
          pkg-config
          gopls
          delve
          golangci-lint
          graphviz
        ];
      })

      (mkIf (elem "typescript" cfg.languages) {
        packages = with pkgs; [
          nodejs
          typescript-language-server
        ];
      })

      (mkIf (elem "python" cfg.languages) {
        packages = with pkgs; [
          python315
          python313Packages.debugpy
        ];
      })

      (mkIf (elem "java" cfg.languages) {
        packages = with pkgs; [
          spring-boot-cli
          libglibutil
          lombok

          libxml2
          lemminx

          # project builders
          maven
          gradle

          # LSP
          jdt-language-server
        ];
      })
      (mkIf (elem "sass" cfg.languages) {
        packages = with pkgs; [
          dart-sass
        ];
      })
    ];

    programs.nix-index = mkIf (elem "nix" cfg.languages) {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    localModules.apps = mkIf cfg.enable {
      kitty.enable = true;
      wezterm.enable = true;
      alacritty.enable = true;
    };
  };
}
