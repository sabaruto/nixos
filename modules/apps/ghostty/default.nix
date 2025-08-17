{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  dotfilesDirectory = "${config.home.homeDirectory}/github.com/sabaruto/nixos/modules/dotfiles";
in
{
  options.localModules.apps.ghostty.enable = mkEnableOption "Ghostty";

  config = mkIf config.localModules.apps.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      installVimSyntax = true;
    };

    localModules.lib.home-files = [
      {
        name = "ghostty";
        recursive = true;
        source = "${dotfilesDirectory}/ghostty";
        target = ".config/ghostty";
      }
    ];

    home.packages = with pkgs; [
      gnome-tweaks
      gnome-menus
    ];
  };
}
