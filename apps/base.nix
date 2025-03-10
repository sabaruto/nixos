{ lib, config, ... }:

with lib;

let cfg = config.localModules;
in {
  imports = [
    ./options.nix

    ./emacs/configuration.nix
  ];

  config.localModules.apps =
    mkIf cfg.development.enable { emacs.enable = true; };
}
