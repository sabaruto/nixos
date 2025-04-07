{ lib, ... }:

with lib;

{
  imports = [
    ./zen
    ./nvim
  ];

  options.localModules = {
    development = {
      enable = mkEnableOption "Development";
      languages = mkOption {
        type =
          with types;
          listOf (enum [
            "golang"
            "typescript"
            "nix"
          ]);
      };
    };

    gaming.enable = mkEnableOption "Gaming";
  };
}
