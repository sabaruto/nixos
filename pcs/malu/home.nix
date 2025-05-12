{ outputs, ... }:

{
  imports = [ outputs.homeManagerModules.default ];

  localModules = {
    home-manager = {
      enable = true;
      username = "t.aaronobelley";
      system = "aarch64-darwin";

      config = {
        apps = {
          neovim.enable = true;
        };

        development = {
          enable = true;
          languages = [ "nix" ];
        };
      };
    };
  };
}
