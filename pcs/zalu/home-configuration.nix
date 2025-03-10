{ lib, config, pkgs, ... }:

{
    localModules.development = {
        enable = true;
        languages = ["nix"];
    };
}
