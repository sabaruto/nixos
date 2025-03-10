{ lib, config, ... }:

with lib;

let cfg = config.localModules;
in {
  imports = [
    ./options.nix

    ./emacs/configuration.nix
    ./steam/configuration.nix
  ];

  config.localModules.apps = mkMerge [
      (mkIf cfg.development.enable { emacs.enable = true; })
      (mkIf cfg.gaming.enable { steam.enable = true; })
    ];
}
