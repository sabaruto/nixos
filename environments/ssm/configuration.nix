{ lib, config, pkgs, ... }:
let xo = import ../../apps/go/xo.nix { inherit pkgs; };
in {

  imports = [ ./options.nix ];

  config = lib.mkIf config.localModules.environments.ssm.enable {
    localModules.apps.postgres.enable = true;
    environment.systemPackages = with pkgs; [ go grpcurl gnumake xo ];
  };
}
