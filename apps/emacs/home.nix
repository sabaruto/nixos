{ lib, inputs, config, pkgs, ... }:

with lib;

let cfg = config.localModules.apps;
in {
  options.localModules.apps.emacs.enable = mkEnableOption "emacs";

  config = mkIf cfg.emacs.enable {
    home.file =
      {
        ".emacs.d" = {
          # don't make the directory read only so that impure melpa can still happen
          # for now
          recursive = true;
          source = pkgs.fetchFromGitHub {
            owner = "syl20bnr";
            repo = "spacemacs";
            rev = "26b8fe0c317915b622825877eb5e5bdae88fb2b2";
            sha256 = "00cfm6caaz85rwlrbs8rm2878wgnph6342i9688w4dji3dgyz3rz";
          };
        };
        ".spacemacs".source = ./.spacemacs;
      };
  };
}
