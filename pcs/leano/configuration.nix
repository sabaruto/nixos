{ ... }:

{
  localModules = {
    swapSize = 32 * 1024;
    desktopEnvironment = "kde";

    gpu = "nvidia";

    development = {
      enable = true;
    };
  };
}