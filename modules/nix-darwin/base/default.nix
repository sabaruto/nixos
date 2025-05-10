{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix = {
    settings.experimental-features = "nix-command flakes";
  };

  system = {
    stateVersion = 6;
  };
}
