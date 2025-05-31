{ config, lib, ... }:
with lib;
let cfg = config.localModules.lib;
in {
  options.localModules.lib.links = mkOption {
    type = with types;
      listOf (submodule {
        options = {
          sourcePath = mkOption { type = path; };

          symbolicLink = mkOption { type = path; };
        };
      });

    default = [ ];
  };

  config = {
    system.userActivationScripts = mkMerge (forEach cfg.links (link: {
      "${link.sourcePath}" = {
        text = "$DRY_RUN_CMD ln -sfvn  ${link.sourcePath} ${link.symbolicLink}";
        deps = [ ];
      };
    }));
  };
}
