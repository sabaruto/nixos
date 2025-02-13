{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    postgresql

    # Golang packages
    go
    goose

    # Protobuf Generator
    buf
  ];
}
