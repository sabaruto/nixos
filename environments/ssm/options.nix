{ lib, ... }:

{
  options.localModules.environments.ssm.enable =
    lib.mkEnableOption "streaming service manager";
}
