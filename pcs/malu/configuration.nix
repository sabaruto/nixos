{
  pkgs,
  outputs,
  ...
}:

{
  imports = [
    outputs.nixDarwinModules.default
  ];

  localModules = {
    shells.zsh.enable = true;
  };

  environment.shells = [
    pkgs.zsh
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  users.users."t.aaronobelley" = {
    name = "t.aaronobelley";
    home = "/Users/t.aaronobelley";
  };
}
