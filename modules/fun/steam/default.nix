{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.localModules.apps;
in
{
  options.localModules.apps.steam.enable = mkEnableOption "steam";

  config = mkIf cfg.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      protontricks.enable = true;
    };

    environment.systemPackages = with pkgs; [
      gamescope
      avahi
      wine
      # wivrn
      android-tools
    ];

    services = {
      avahi = {
        enable = true;
        openFirewall = true;
        publish = {
          enable = true;
          userServices = true;
        };
      };

      wivrn = {
        enable = false;
        openFirewall = true;
      };
    };
  };

}
