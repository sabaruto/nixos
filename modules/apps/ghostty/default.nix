{ lib, config, pkgs, ... }:
with lib; {
  options.localModules.apps.ghostty.enable = mkEnableOption "Ghostty";

  config = mkIf config.localModules.apps.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      settings = {
        theme = "light:rose-pine-dawn,dark:rose-pine";
        window-decoration = "server";
      };
    };

    home.packages = with pkgs; [ gnome-tweaks gnome-menus ];
  };
}
