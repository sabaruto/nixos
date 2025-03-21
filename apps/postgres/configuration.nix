{ lib, config, pkgs, ... }:
let cfg = config.localModules.apps;
in with lib; {
  options.localModules.apps.postgres.enable = mkEnableOption "Postgres";

  config.services.postgresql = mkIf cfg.postgres.enable {
    enable = true;
    enableTCPIP = true;
    settings.ssl = true;

    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  origin-address auth-method
      local all       all     trust
      host  all       all     127.0.0.1/32   scram-sha-256
      host  all       all     ::1/128        scram-sha-256
    '';

    identMap = ''
      # ArbitraryMapName  systemUser  DBUser
      superuser_map       root        /^(.*)$
      superuser_map       postgres    postgres
      superuser_map      /^(.*)$      \1
    '';
  };
}
