{ inputs, lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  imports = [ ./options.nix ];

  config = mkIf cfg.emacs.enable {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs-unstable;
    };

    home.activation = {
      spacemacsActivation = hm.dag.entryAfter [ "writeBoundary" ] ''
        ln -sf ~/nixos/apps/emacs/.spacemacs ~/.spacemacs

        run ${pkgs.git}/bin/git clone https://github.com/syl20bnr/spacemacs /tmp/spacemacs || pushd /tmp/spacemacs; ${pkgs.git}/bin/git pull; popd
        run ${pkgs.rsync}/bin/rsync -ar /tmp/spacemacs/ ~/.emacs.d/
      '';
    };
  };
}
