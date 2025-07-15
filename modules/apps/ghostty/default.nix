{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
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
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/ghostty";
        target = ".config/ghostty";
      }
    ];

    home.packages = with pkgs; [
      gnome-tweaks
      gnome-menus
    ];
  };
}
