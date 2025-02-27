{ lib, config, pkgs, ... }:
let
  xo = import ../../apps/go/xo.nix { inherit pkgs; };
in
{
  imports = [
    ../../apps/postgres.nix
  ];
  
  environment.systemPackages = with pkgs; [
    go
    grpcurl
    gnumake
    xo
  ];
}
