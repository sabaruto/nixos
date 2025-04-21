{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.localModules.cmd.direnv;
in
{
  options.localModules.cmd.direnv.enable = mkEnableOption "direnv";

  config = mkIf cfg.enable {
    programs = {
      zsh.enable = true;
      direnv = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };
}
