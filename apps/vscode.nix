{ config, home, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      usernamehw.errorlens
      jnoortheen.nix-ide
    ];
  };
}
