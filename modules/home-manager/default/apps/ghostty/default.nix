{ lib, config, ... }:
with lib; {
  options.localModules.apps.ghostty.enable = mkEnableOption "Ghostty";

  config = mkIf config.localModules.apps.ghostty.enable {
    programs.ghostty = { enable = true; };
  };
}
