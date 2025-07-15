{ lib, config, ... }:
with lib;
let
  cfg = config.localModules.lib;
in
{
  options.localModules.lib = {
    home-files = mkOption {
      type =
        with types;
        listOf (submodule {
          options = {
            name = mkOption {
              type = str;
            };
            recursive = mkOption {
              type = bool;
            };
            source = mkOption {
              type = path;
            };
            target = mkOption {
              type = str;
            };
          };
        });
      default = [ ];
    };
  };

  config.home.file = mkIf (lists.length cfg.home-files > 0) (
    listToAttrs (
      lists.forEach cfg.home-files (home-file: {
        name = home-file.name;
        value = {
          enable = true;
          recursive = home-file.recursive;
          source = config.lib.file.mkOutOfStoreSymlink home-file.source;
          target = home-file.target;
        };
      })

    )
  );
}
