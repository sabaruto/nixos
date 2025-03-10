{ lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.nix.enable = mkEnableOption "nix";

  config = mkIf cfg.nix.enable {
    home.packages = with pkgs; [
      # creating packages from URLs
      nix-init

      # find hash of packages
      nix-prefetch

      # nix lsp language server
      nil

      # nix formatter
      nixfmt
    ];
  };
}
