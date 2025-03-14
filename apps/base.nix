{ lib, config, ... }:

with lib;

let cfg = config.localModules;
in {
  imports = [
    ./options.nix

    ./emacs/configuration.nix
    ./tmux/configuration.nix
    ./steam/configuration.nix
    ./zsh/configuration.nix
  ];

  config.localModules.apps = mkMerge [
    (mkIf cfg.development.enable {
      emacs.enable = true;
      tmux.enable = true;
      zsh.enable = true;
    })
    (mkIf cfg.gaming.enable { steam.enable = true; })
  ];
}
