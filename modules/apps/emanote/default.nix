{
  config,
  lib,
  ...
}:
with lib;
{
  options.localModules.apps.emanote.enable = mkEnableOption "Emanote";

  config = mkIf config.localModules.apps.emanote.enable {
    services.emanote = {
      enable = true;
      notes = [
        "~/notes"
      ];
    };
  };
}
