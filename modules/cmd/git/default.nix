{
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.localModules.cmd;
in
{
  options.localModules.cmd.git = {
    enable = mkEnableOption "git";
    user = mkOption {
      type = types.enum [
        "sabaruto"
        "teya"
      ];
      default = "sabaruto";
    };
  };

  config = mkIf cfg.git.enable {
    programs = mkMerge [
      {
        git = {
          enable = true;
          lfs.enable = true;
        };
      }

      (mkIf (cfg.git.user == "sabaruto") {
        git = {
          userEmail = "theodoreaaronobelley@hotmail.co.uk";
          userName = "sabaruto";

          extraConfig = {
            init = {
              defaultBranch = "main";
            };
          };
        };
      })

      (mkIf (cfg.git.user == "teya") {
        git = {
          userName = "Theodosia Aaron-Obelley";
          userEmail = "t.aaronobelley@saltpay.co";

          extraConfig = {
            user = {
              signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJPmcouh67CsJLDvYpp9xG5KPINQwKWrTdE/DxxjEXLN";
            };
            gpg = {
              format = "ssh";
              ssh = {
                program = "/run/current-system/sw/bin/op-ssh-sign";
              };
            };

            commit = {
              gpgsign = true;
            };
          };
        };
      })
    ];
  };
}
