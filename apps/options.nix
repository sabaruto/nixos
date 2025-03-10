{ lib, ... }:

with lib;

{
  options.localModules = {
    development = {
      enable = mkEnableOption "Development";
      languages = mkOption {
        type = with types; listOf (enum [ "golang" "typescript" "nix" ]);
      };
    };

    gaming.enable = mkEnableOption "Gaming";
  };
}
