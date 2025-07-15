{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.localModules.apps;
in
{
  options.localModules.apps.kitty.enable = mkEnableOption "kitty";

  config = mkIf cfg.kitty.enable {
    programs.kitty = lib.mkForce {
      enable = true;
      # enableGitIntegration = true;

      # font = {
      #   name = "Lilex";
      #   package = pkgs.nerd-fonts.lilex;
      #   size = 14;
      # };

      # shellIntegration = {
      #   enableZshIntegration = true;
      # };
    };
  };
}
