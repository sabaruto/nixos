{ lib, config, pkgs, ... }:

with lib;

let
  # TODO: Switch to cmd
  cfg = config.localModules.apps;
  homeDirectory = config.home.homeDirectory;
  path = "${homeDirectory}/nixos/modules/home-manager/default/cmd/git";
in {
  options.localModules.apps.git = {
    enable = mkEnableOption "git";
    user = mkOption {
      type = types.enum [ "sabaruto" "teya" ];
      default = "sabaruto";
    };
  };

  config = mkIf cfg.git.enable {
    programs = mkMerge [
      { git.enable = true; }

      (mkIf (cfg.git.user == "sabaruto") {
        git = {
          userEmail = "theodoreaaronobelley@hotmail.co.uk";
          userName = "sabaruto";

          extraConfig = { init = { defaultBranch = "main"; }; };
        };
      })

      (mkIf (cfg.git.user == "teya") {
        git = {
          userName = "Theodosia Aaron-Obelley";
          userEmail = "t.aaronobelley@saltpay.co";
        };
      })
    ];

    localModules.lib.links = mkMerge [
      (mkIf (cfg.git.user == "teya") [
        {
          sourcePath = "${path}/teya-gitconfig";
          symbolicLink = "${homeDirectory}/.gitconfig";
        }
        {
          sourcePath = "${path}/teya-gitignore";
          symbolicLink = "${homeDirectory}/.gitignore";
        }
      ])
    ];
  };
}
