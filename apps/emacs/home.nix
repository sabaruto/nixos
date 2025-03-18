{ lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  imports = [ ./options.nix ];

  config = mkIf cfg.emacs.enable {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs-unstable;
    };
    home.file = { ".spacemacs".source = ./.spacemacs; };

    spacemacsActivation = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      run ln -s $VERBOSE_ARG ${toPath ./.spacemacs} $HOME
    '';
  };
}
