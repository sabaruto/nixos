{ lib, config, pkgs, ... }:

with lib;

let
	cfg = config.localModules;
in
{
  config = mkIf (cfg.desktopEnvironment == "kde") {
  	services = {
  	  xserver.enable = true;
  	  desktopManager = {
  	    plasma6.enable = true;
  	  };

  	  displayManager = {
  	    defaultSession = "plasma";

  	    sddm = {
  	      wayland.enable = true;
  	    };
  	  };
  	};
  };
}
