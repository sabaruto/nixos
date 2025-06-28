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
    };

    home.packages = with pkgs; [ gnome-tweaks gnome-menus ];
  };
}
