{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.localModules.secrets;
  user = config.localModules.name;
  home-directory = "/home/${user}";
in {
  options.localModules.secrets.enable = mkEnableOption "Secrets";

  config = mkIf cfg.enable {
    services.onepassword-secrets = {
      enable = true;
      users = [ "${config.localModules.name}" ]; # Users that need secret access
      tokenFile = "/etc/opnix-token"; # Default location
      configFile = ./secrets.json;
    };

    security.pki = {
      certificateFiles = [ "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt" ];

      certificates = [
        (mkIf (pathExists "${home-directory}/.ssl/certs/mini-pc-public-key.crt")
          (readFile "${home-directory}/.ssl/certs/mini-pc-public-key.crt"))
        (mkIf (pathExists "${home-directory}/.ssl/certs/leano-public-key.crt")
          (readFile "${home-directory}/.ssl/certs/leano-public-key.crt"))
      ];
    };

    environment.systemPackages = with pkgs; [ opnix ];
  };
}
