{ lib, config, pkgs, ... }:
with lib;
let cfg = config.localModules.secrets;
in {
  options.localModules.secrets.enable = mkEnableOption "Secrets";

  config = mkIf cfg.enable {
    services.onepassword-secrets = {
      enable = true;
      users = [ "${config.localModules.name}" ]; # Users that need secret access
      tokenFile = "/etc/opnix-token"; # Default location
      configFile = ./secrets.json;
      outputDir = "/var/lib/opnix/secrets"; # Optional, this is the default
    };

    security.pki = {
      certificateFiles = [
        "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
        ../../../secrets/ssl/certs/mini-pc-public-key.crt
        ../../../secrets/ssl/certs/leano-public-key.crt
      ];
    };

    environment.systemPackages = with pkgs; [ opnix ];
  };
}
