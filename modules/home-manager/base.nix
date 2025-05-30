{ lib, config, ... }:
with lib;

let cfg = config.localModules.home-manager;
in {
  options.localModules.home-manager = {
    enable = mkEnableOption "Home Manager";

    config = mkOption {
      type = types.attrs;
      default = { };
    };

    packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };

    paths = mkOption {
      type = types.listOf types.path;
      default = [ ];
    };

    modules = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
    };

  };

  config = {
    home-manager = mkIf cfg.enable {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";

      users."${config.localModules.name}" = _: {
        imports = cfg.paths ++ cfg.modules;

        options.localModules.desktopEnvironment = mkOption {
          type = types.str;
          default = "${config.localModules.desktopEnvironment}";
        };

        config = {

          programs.home-manager.enable = true;
          localModules = cfg.config;

          home = {
            inherit (cfg) packages;

            username = "${config.localModules.name}";
            homeDirectory = mkDefault "/home/${config.localModules.name}";
            stateVersion = "24.11";
          };
        };
      };
    };
  };
}
