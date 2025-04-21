{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  # TODO: Switch to cmd
  cfg = config.localModules.apps;
in
{
  options.localModules.apps.git.enable = mkEnableOption "git";

  config = mkIf cfg.git.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userEmail = "theodoreaaronobelley@hotmail.co.uk";
      userName = "sabaruto";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
