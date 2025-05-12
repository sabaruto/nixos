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

  programs.zsh.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  users.users."t.aaronobelley" = {
    name = "t.aaronobelley";
    home = "/Users/t.aaronobelley";
  };

  environment.systemPackages = [
    pkgs.neofetch
  ];
}
