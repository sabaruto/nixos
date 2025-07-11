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
      (mkIf (elem "golang" cfg.languages) {
        packages = with pkgs; [
          gopls
          delve
          golangci-lint
        ];
      })
      (mkIf (elem "nix" cfg.languages) {
        packages = with pkgs; [
          # creating packages from URLs
          nix-init

          # find hash of packages
          nix-prefetch

          # nix formatter
          nixfmt-rfc-style
          nixd
        ];
      })
      (mkIf (elem "lua" cfg.languages) {
        packages = with pkgs; [ lua-language-server ];
      })

      (mkIf (elem "python" cfg.languages) {
        packages = with pkgs; [ python312Packages.debugpy ];
      })
    ];

    programs.nix-index = mkIf (elem "nix" cfg.languages) {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
