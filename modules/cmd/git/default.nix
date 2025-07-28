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

      (mkIf (cfg.git.user == "t-aaronobelley") {
        git = {
          userName = "Theodosia Aaron-Obelley";
          userEmail = "t.aaronobelley@saltpay.co";

          # ignores = [
          #   # Devenv
          #   ".devenv*"
          #   "devenv.local.nix "
          #
          #   # direnv
          #   ".direnv"
          #
          #   "devenv.yaml"
          #   "devenv.nix"
          #
          #   # pre-commit
          #   ".pre-commit-config.yaml"
          # ];

          extraConfig = {
            user = {
              signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJPmcouh67CsJLDvYpp9xG5KPINQwKWrTdE/DxxjEXLN";
            };
            gpg = {
              format = "ssh";
              ssh = {
                program = "/mnt/c/Users/TheodosiaAaron-Obell/AppData/Local/1Password/app/8/op-ssh-sign-wsl";
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
