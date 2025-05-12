{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix = {
    settings.experimental-features = "nix-command flakes";
  };

  system = {
    stateVersion = 6;
  };
  security.pam.services.sudo_local.touchIdAuth = true;

  homebrew = {
    enable = true;
    casks = [ "karabiner-elements" ];
  };

}
