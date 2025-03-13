{ lib, inputs, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  imports = [ ./options.nix ];

  config = mkIf cfg.emacs.enable {
    nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
    environment.systemPackages = with pkgs; [
      libtool
      cmake
      gnumake
      gcc
      automake
    ];
  };
}
