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
    # home.file = { ".spacemacs".source = ./.spacemacs; };

    home.activation = {
      spacemacsActivation = hm.dag.entryAfter [ "writeBoundary" ] ''
        run ln -fs $VERBOSE_ARG ${builtins.toPath ./.spacemacs} $HOME
        run ln -fs $VERBOSE_ARG ${builtins.toPath ./spacemacs/.} $HOME/.emacs.d/

      '';
    };
  };
}
