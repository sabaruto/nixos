{ config, lib, ... }:
with lib;
let
  cfg = config.localModules.lib;
in
{
  options.localModules.lib.links = mkOption {
    type =
      with types;
      listOf (submodule {
        options = {
          sourcePath = mkOption {
            type = path;
          };

          symbolicLink = mkOption {
            type = path;
          };
        };
      });
  };

  config = {
    home.activation.directlink = hm.dag.entryAfter [ "writeBoundary" ] (
      concatStrings (forEach cfg.links (x: "$DRY_RUN_CMD ln -sfvn  ${x.sourcePath} ${x.symbolicLink}\n"))
    );
  };
}
