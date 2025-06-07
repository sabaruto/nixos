{ lib, config, pkgs, ... }:
with lib;
let cfg = config.localModules.secrets;
in {
  options.localModules.secrets.enable = mkEnableOption "Secrets";

  config = mkIf cfg.enable {
    programs.onepassword-secrets = {
      enable = true;
      secrets = [
        {
          path = ".ssl/certs/mini-pc-public-key.crt";
          reference =
            "op://System/mini-pc Certificate Key/mini-pc.tailbc9110.ts.net.crt";
        }
        {
          path = ".ssl/certs/leano-public-key.crt";
          reference =
            "op://System/Leano Certificate Key/leano.tailbc9110.ts.net.crt";
        }
      ];
    };
  };
}
