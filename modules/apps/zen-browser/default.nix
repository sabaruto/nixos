{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.localModules.apps.zen-browser.enable = mkEnableOption "Zen Browser";

  config = mkIf config.localModules.apps.zen-browser.enable {
    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [
        pkgs.firefoxpwa
      ];
    };
  };
}
