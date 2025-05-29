{ lib, ... }:

with lib;

{
  imports = [ ./gnome.nix ./kde.nix ./hyprland.nix ];

  options.localModules = {
    desktopEnvironment = mkOption {
      type = with types; nullOr (enum [ "none" "gnome" "kde" "hyprland" ]);
      default = null;
    };
  };
}
