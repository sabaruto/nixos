{ outputs, pkgs, ... }:
{
  imports = [
    outputs.nixosModules.default
    ./hardware-configuration.nix
  ];

  localModules = {
    name = "dosia";
    hostname = "zalu";
    stateVersion = "24.11";

    swapSize = 16 * 1024;
    gpu = "none";

    system.kernel = {
      enable = true;
      version = "6.14.0";
      altVersion = "6.14";
      url = "https://github.com/torvalds/linux/archive/refs/tags/v6.14.tar.gz";
      hash = "sha256-fXlg1s4nd0Ppbb2NlPzpPxN5mmm9mj6YQe6//eSr5sI=";
    };

    desktopEnvironment = "gnome";

    apps = {
      steam.enable = true;
    };
  };
}
