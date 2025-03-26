{ outputs, ... }:

{
  imports = [ 
    outputs.nixosModules
    ./hardware-configuration.nix
  ];
  localModules = {
    name = "dosia";
    hostname = "leano";
    stateVersion = "24.11";
    
    swapSize = 32 * 1024;
    gpu = "nvidia";

    desktopEnvironment = "gnome";

    apps = {
      steam.enable = true;
    };
  };
}
