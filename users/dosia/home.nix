{
  lib,
  pkgs,
  outputs,
  ...
}:

{
  imports = [
    outputs.homeManagerModules.default
  ];
  home = {
    username = "dosia";
    homeDirectory = lib.mkDefault "/home/dosia";
    stateVersion = "24.11";

    packages = with pkgs; [
      # browsers
      firefox
      # Vivaldi with forceful qt app wrapping
      (vivaldi.overrideAttrs (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ kdePackages.wrapQtAppsHook ];
      }))

      # zoom
      zoom-us

      # cursors
      google-cursor

      # boot configuration
      efibootmgr

      # miracast
      gnome-network-displays
      openh264
      x264
      faac
      dnsmasq

      syncthing
    ];
  };
  localModules = {
    apps = {
      git.enable = true;
      zen.enable = true;
      neovim.enable = true;
    };

    cmd = {
      direnv.enable = true;
    };

    development = {
      enable = true;
      installOnNixos = true;
      languages = [
        "nix"
        "lua"
        "java"
        "golang"
        "typescript"
      ];
    };
  };
}
