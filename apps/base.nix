{ lib, config, ... }:

with lib;

let cfg = config.localModules;
in {
  imports = [
    ./options.nix

    ./emacs/configuration.nix
    ./steam/configuration.nix
  ];

  config.localModules.apps = {
      emacs = mkIf cfg.development.enable { enable = true; };
      steam = mkIf cfg.gaming.enable { enable = true; };
    };
}
