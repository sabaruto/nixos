{ lib, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = lib.readFile ./config/emacs/init.el;
  };

  home.file = {
    ".config/emacs/themes/catppuccin-theme.el".source = ./config/emacs/themes/catppuccin-theme.el;
    ".config/emacs/early-init.el".source = ./config/emacs/early-init.el;
  };
}
