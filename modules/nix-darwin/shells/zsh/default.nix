{ lib, config, ... }:

with lib;

let
  cfg = config.localModules.shells;
in
{
  options.localModules.shells.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.zsh.enable {

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };
  };
}
