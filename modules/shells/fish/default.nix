{ lib, config, ... }:

with lib;

let
  cfg = config.localModules.shells;
in
{
  options.localModules.shells.fish.enable = mkEnableOption "fish";

  config = mkIf cfg.fish.enable {
    programs.fish = {
      enable = true;

      shellInit = ''
        direnv hook fish | source
        oh-my-posh init fish --config ~/.config/oh-my-posh/theme.omp.json | source
      '';
    };
  };
}
