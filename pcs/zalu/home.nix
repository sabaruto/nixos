{ pkgs, outputs, ... }:

{
  imports = [ outputs.homeManagerModules.default ];

  localModules.home-manager = {
    enable = true;
    username = "dosia";

    packages = with pkgs; [
      # browsers
      firefox

      # Vivaldi with forceful qt app wrapping
      (vivaldi.overrideAttrs (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs
          ++ [ kdePackages.wrapQtAppsHook ];
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

    config = {
      cmd = { direnv.enable = true; };

      apps = {
        git.enable = true;
        neovim.enable = true;
        ghostty.enable = true;
      };

      development = {
        enable = true;
        installOnNixos = true;
        languages = [ "nix" "lua" "java" "golang" "typescript" ];
      };
    };
  };
}
