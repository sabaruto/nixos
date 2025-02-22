{ config, pkgs, ... }:
{
  imports = [
    ../../apps/postgres.nix
  ];
  
  environment.systemPackages = with pkgs; [
    go
    grpcurl
  ];
}
