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
  options.localModules.apps.nvim.treesitter-refactor.enable = mkEnableOption "treesitter-refactor";

  config.programs.nixvim.plugins.treesitter-refactor = mkIf cfg.treesitter-refactor.enable {
    enable = true;
    highlightCurrentScope.enable = true;
    highlightDefinitions.enable = true;
    smartRename.enable = true;
  };
}
