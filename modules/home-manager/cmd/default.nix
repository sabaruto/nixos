{ lib, config, ... }:

with lib;
let
  cfg = config.localModules;
in

{

  imports = [
    ./git
    ./kitty
    ./tmux
  ];
  config.localModules.apps = mkIf cfg.development.enable {
    kitty.enable = true;
    tmux.enable = true;
  };
}
