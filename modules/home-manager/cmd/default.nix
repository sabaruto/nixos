
{ lib, config, ... }:

with lib;
let cfg = config.localModules; in

{

  imports = [ ./git ./kitty ./tmux ./zsh ];
    config.localModules.apps = mkIf cfg.development.enable {
      # emacs.enable = true;
      tmux.enable = true;
      zsh.enable = true;
    };
}
