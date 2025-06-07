{ config, lib, pkgs, ... }:

with lib;

let cfg = config.localModules.system;
in {
  options.localModules.system.kernel = {
    enable = mkEnableOption "kernel";

    version = mkOption {
      type = types.str;
      default = "";
      description = "kernel version";
    };

    altVersion = mkOption {
      type = types.str;
      default = "";
      description = "kernel version name";
    };

    url = mkOption {
      type = types.str;
      default =
        "https://github.com/torvalds/linux/archive/refs/heads/master.zip";
      description = "URL to linux version";
    };

    hash = mkOption {
      type = types.str;
      default = "";
      description = "Hash of the kernel archive";
    };

    patches = mkOption {
      type = types.listOf types.raw;
      default = [ ];
      description = "List of kernel patches";
    };
  };

  config = mkIf cfg.kernel.enable {
    boot.kernelPackages = let
      linux_sgx_pkg = { fetchurl, buildLinux, ... }@args:

        buildLinux (args // rec {
          inherit (cfg.kernel) version;
          modDirVersion = version;
          src = fetchurl { inherit (cfg.kernel) url hash; };
          kernelPatches = [ ];

          extraMeta.branch = cfg.kernel.altVersion;
        } // (args.argsOverride or { }));
      linux_sgx = pkgs.callPackage linux_sgx_pkg { };
    in pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_sgx);
  };
}
