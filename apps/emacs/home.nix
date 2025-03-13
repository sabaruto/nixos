{ lib, inputs, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.emacs.enable = mkEnableOption "emacs";

  config = mkIf cfg.emacs.enable {
    programs.emacs = {
        enable = true;
        package = pkgs.emacs-unstable;
    };
    
    home.file =
      {
        ".spacemacs".source = ./.spacemacs;
      };
  };
}
