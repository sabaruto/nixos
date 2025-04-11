{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim.lualine;
in
{
  options.localModules.apps.nvim.lualine.enable = mkEnableOption "lualine";

  config.programs.nixvim.plugins.lualine = mkIf cfg.enable {
    enable = true;
    luaConfig.post = readFile ./config.lua;
  };
}
