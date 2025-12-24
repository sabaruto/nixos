{
  lib,
  pkgs,
  home-manager-modules,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.bluetooth.enable = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  services.udev = {
    enable = true;
    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
      '';
  };

  environment.variables =
    let
      makePluginPath =
        format:
        (lib.makeSearchPath format [
          "$HOME/.nix-profile/lib"
          "/run/current-system/sw/lib"
          "/etc/profiles/per-user/$USER/lib"
        ])
        + ":$HOME/.${format}";
    in
    {
      DSSI_PATH = makePluginPath "dssi";
      LADSPA_PATH = makePluginPath "ladspa";
      LV2_PATH = makePluginPath "lv2";
      LXVST_PATH = makePluginPath "lxvst";
      VST_PATH = makePluginPath "vst";
      VST3_PATH = makePluginPath "vst3";
    };

  localModules = {
    name = "dosia";
    hostname = "zalu";
    stateVersion = "24.11";

    swapSize = 16 * 1024;
    gpu = "none";

    desktopEnvironment = "gnome";

    apps.steam.enable = false;
    peripherals.kanata.enable = true;

    home-manager = {
      enable = true;
      modules = home-manager-modules;

      packages = with pkgs; [
        kdePackages.k3b
        musescore
        wineWowPackages.full
        wgnord
        kicad
      ];
      config.localModules = {
        shells.zsh.enable = true;
        apps = {
          helix.enable = true;
          zed.enable = true;
        };
        
        development = {
          enable = true;
          installOnNixos = true;
          languages = [
            "nix"
            "lua"
            "java"
            "sass"
            "golang"
            "typescript"
          ];
        };

        cmd = {
          oh-my-posh.enable = true;
        };
      };
    };
  };
}
