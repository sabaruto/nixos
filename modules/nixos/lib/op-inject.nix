{ config, lib, ... }:
with lib;
let cfg = config.localModules.lib;
in {
  options.localModules.lib.op-inject = mkOption {
    type = with types;
      listOf (submodule {
        options = {
          templatePath = mkOption { type = path; };

          outputPath = mkOption { type = path; };
        };
      });

    default = [ ];
  };

  config = {
    system.userActivationScripts = mkMerge (forEach cfg.op-inject (op-inject: {
      "${op-inject.templatePath}" = {
        text =
          "$DRY_RUN_CMD op inject -i  ${op-inject.templatePath} -o ${op-inject.outputPath}";
        deps = [ ];
      };
    }));
  };
}
