{ lib, config, ... }:

with lib;
let cfg = config.localModules;

in {

  imports = [ ./git ./kitty ./direnv ./tmux ./oh-my-posh ];
  config.localModules.apps = mkIf cfg.development.enable {
    kitty.enable = true;
    tmux.enable = true;
  };
}
