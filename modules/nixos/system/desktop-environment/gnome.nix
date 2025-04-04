{ lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules;
in {
  config = mkIf (cfg.desktopEnvironment == "gnome") {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    # gnome's low level configuration system
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs.gnomeExtensions;
      [
        tiling-shell
        coverflow-alt-tab
        blur-my-shell
        sound-output-device-chooser
        night-theme-switcher
      ] ++ (with pkgs; [ gnome-tweaks ]);
  };
}
