{ lib, config, ... }:

with lib;

let cfg = config.localModules.shells;
in {
  options.localModules.shells.fish.enable = mkEnableOption "zsh";

  config = mkIf cfg.fish.enable {
    programs.fish = {
      enable = true;
      useBabelfish = true;

      shellInit = ''
        direnv hook fish | source
        oh-my-posh init fish --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/quick-term.omp.json | source
      '';
    };
  };
}
