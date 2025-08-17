{ lib, config, ... }:

with lib;

let
  cfg = config.localModules.shells;
in
{
  options.localModules.shells.fish.enable = mkEnableOption "zsh";

  config = mkIf cfg.fish.enable {
    programs.fish = {
      enable = true;

      shellInit = ''
        direnv hook fish | source
        oh-my-posh init fish --config ~/.config/theme.omp.yaml | source
      '';
    };
  };
}
