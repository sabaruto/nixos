{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.localModules.environments;
in
{
  imports = [ ./options.nix ];

  config = {
    home.packages =
      with pkgs;
      lib.mkIf cfg.ssm.enable [
        # Golang packages
        goose
        buf
        gopls
      ];
  };
}
