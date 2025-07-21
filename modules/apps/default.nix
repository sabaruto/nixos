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
    ./neovim
    ./ghostty
    ./wezterm
    ./kitty
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
    home = mkMerge [
      {
        packages = with pkgs; [
          # creating packages from URLs
          nix-init

          # find hash of packages
          nix-prefetch

          # nix formatter
          nixfmt-rfc-style
          nixd

          lua-language-server
        ];
      }

      (mkIf (elem "golang" cfg.languages) {
        packages = with pkgs; [
          gopls
          delve
          golangci-lint
        ];
      })

      (mkIf (elem "python" cfg.languages) {
        packages = with pkgs; [
          python3Full
          python312Packages.debugpy
        ];
      })

      (mkIf (elem "java" cfg.languages) {
        packages = with pkgs; [
          # We only install java from dev environments
          # temurin-bin-24

          spring-boot-cli
          libglibutil

          # project builders
          maven
          gradle

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
      neovim.enable = true;
      wezterm.enable = true;
      alacritty.enable = true;
    };
  };
}
