{ lib, ... }:

with lib;

{
  imports = [ ./nvidia.nix ];

  options.localModules.gpu = mkOption {
    type = with types; nullOr (enum [ "none" "nvidia" ]);
    default = "none";
  };
}
