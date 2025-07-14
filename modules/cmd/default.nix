{ lib, config, ... }:

with lib;
let
  cfg = config.localModules;

in
{

  imports = [
    ./git
    ./direnv
    ./tmux
    ./oh-my-posh
  ];
  config.localModules.cmd = mkIf cfg.development.enable {
    direnv.enable = true;
    git.enable = true;
    oh-my-posh.enable = true;
    tmux.enable = true;
  };
}
