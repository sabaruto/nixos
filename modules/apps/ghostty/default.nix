{ lib, config, pkgs, ... }:
with lib; {
  options.localModules.apps.ghostty.enable = mkEnableOption "Ghostty";

  config = mkIf config.localModules.apps.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;

      installVimSyntax = true;

      settings = {
        theme = "light:rose-pine-dawn,dark:rose-pine";
        window-decoration = "server";

        keybind = [
          "ctrl+shift+left=goto_split:left"
          "ctrl+shift+right=goto_split:right"
          "ctrl+shift+up=goto_split:up"
          "ctrl+shift+down=goto_split:down"
        ];
      };
    };

    home.packages = with pkgs; [ gnome-tweaks gnome-menus ];
  };
}
