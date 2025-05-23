{ lib, config, pkgs, ... }:
with lib;

let cfg = config.localModules.home-manager;
in {
  options.localModules.home-manager = {
    enable = mkEnableOption "Home Manager";

    username = mkOption {
      type = types.str;
      default = "dosia";
      description = "Name of the current user";
    };

    system = mkOption {
      type = types.str;
      default = "x86_64-linux";
      description = "Current system";
    };

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
  };

  config = {
    home-manager = mkIf cfg.enable {
      useGlobalPkgs = true;
      useUserPackages = true;

      users."${cfg.username}" = { ... }: {
        imports = cfg.paths;

        programs.home-manager.enable = true;

        home = {
          packages = cfg.packages;

          username = "${cfg.username}";
          stateVersion = "24.11";

          homeDirectory = mkDefault (mkMerge [
            (mkIf (cfg.system == "x86_64-linux") "/home/${cfg.username}")
            (mkIf (cfg.system == "aarch64-darwin") "/Users/${cfg.username}")
          ]);

        };

        localModules = cfg.config;
      };
    };
  };
}
