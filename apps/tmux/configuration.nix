{ lib, config, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  imports = [ ./options.nix ];

  config = mkIf cfg.tmux.enable { };
}
