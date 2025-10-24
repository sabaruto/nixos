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
        "t-aaronobelley"
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
        git.settings = {
          user = {
            email = "theodoreaaronobelley@hotmail.co.uk";
            name = "sabaruto";
          };

          settings = {
            init = {
              defaultBranch = "main";
            };
          };
        };
      })

      (mkIf (cfg.git.user == "t-aaronobelley") {
        git = {
          ignores = [
            ".cmd"
          ];

          settings = {
            user = {
              email = "t.aaronobelley@saltpay.co";
              name = "Theodosia Aaron-Obelley";
              signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJPmcouh67CsJLDvYpp9xG5KPINQwKWrTdE/DxxjEXLN";
            };
            gpg = {
              format = "ssh";
              ssh = {
                program = "/mnt/c/Program Files/1Password/app/8/op-ssh-sign-wsl";
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
