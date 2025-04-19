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
    ./zsh
  ];
  config.localModules.apps = mkIf cfg.development.enable {
    kitty.enable = true;
    tmux.enable = true;
  };
}
