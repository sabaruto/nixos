{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
in
{
  options.localModules.apps.nvim.trouble.enable = mkEnableOption "trouble";

  config.programs.nixvim.plugins.trouble = mkIf cfg.telescope.enable {
    enable = true;

    settings = {
      modes = {
        diagnostics_buffer = {
          mode = "diagnostics";
          filter = {
            buf = 0;
          };

          win = {
            type = "split";
            position = "top";
            relative = "win";

            size = {
              height = 0.2;
            };
          };

          auto_open = true;
          auto_jump = true;

        };
      };

    };

    luaConfig.post = readFile ./config.lua;
  };
}
