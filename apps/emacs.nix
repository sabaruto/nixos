{ lib, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = lib.readFile ./config/emacs/init.el;
  };
}
