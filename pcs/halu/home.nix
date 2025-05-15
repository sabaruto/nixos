{ config, outputs, ... }: {
  imports = [ outputs.homeManagerModules.default ];

  localModules.home-manager = {
    enable = true;
    username = "t-aaronobelley";
    config = {
      apps = {
        neovim.enable = true;
        #TODO: Add git application
        git = {
          enable = true;
          user = "teya";
        };
      };
    };
  };
}
