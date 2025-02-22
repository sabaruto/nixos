{ config, pkgs, ... }:
{
  imports = [
    ../../apps/vscode-extensions/golang.nix
  ];

  home.packages = with pkgs; [
    # Golang packages
    goose
    buf
  ];
}
