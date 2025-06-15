{ lib, pkgs, config, ... }:
with lib;

let cfg = config.localModules.home-manager;
in {
  options.localModules.home-manager = {
    enable = mkEnableOption "Home Manager";

    config = mkOption {
      type = types.attrs;
      default = { };
    };

    username = mkOption {
      type = types.str;
      default = "dosia";
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

      users."${config.localModules.home-manager.username}" = _: {
        imports = cfg.paths ++ cfg.modules;

        options.localModules.desktopEnvironment = mkOption {
          type = types.str;
          default = "${config.localModules.desktopEnvironment}";
        };

        config = mkMerge [
          cfg.config
          {

            programs.home-manager.enable = true;
            home = {
              packages = [

                # Music
                pkgs.spotify
                pkgs.tidal-hifi

                # Visualise directories
                pkgs.tree

                pkgs.neofetch

                # Certificates
                pkgs.openssl

                # Boot configuration
                pkgs.efibootmgr

              ] ++ cfg.packages;

              username = "${config.localModules.name}";
              homeDirectory = mkDefault "/home/${config.localModules.name}";
              sessionVariables = { EDITOR = "nvim"; };

              stateVersion = "24.11";
            };
          }
        ];
      };
    };
  };
}
