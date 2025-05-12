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
  options.localModules.apps.git = {
    enable = mkEnableOption "git";
    user = mkOption {
      type = types.enum [
        "sabaruto"
        "teya"
      ];
    };
  };

  config = mkIf cfg.git.enable {
    programs = mkMerge [
      {
        git = {
          enable = true;

          userEmail = "theodoreaaronobelley@hotmail.co.uk";
          userName = "sabaruto";
          extraConfig = {
            init = {
              defaultBranch = "main";
            };
          };
        };
      }

      (mkIf (cfg.git.user == "teya") {
        git = {
          userName = "Theodosia Aaron-Obelley";
          userEmail = "t.aaronobelley@saltpay.co";

          extraConfig = {
            user = {
              signingkey = "";
            };
          };
        };
      })
    ];
  };
}
