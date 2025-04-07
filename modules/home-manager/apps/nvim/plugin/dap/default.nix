{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
in
{
  options.localModules.apps.nvim.dap.enable = mkEnableOption "dap";

  config.programs.nixvim.plugins = mkIf cfg.dap.enable {
    dap = {
      enable = true;
      luaConfig.post = readFile ./config.lua;
    };

    dap-ui = {
      enable = true;
    };

    dap-go.enable = true;
    dap-python.enable = true;
  };
}
