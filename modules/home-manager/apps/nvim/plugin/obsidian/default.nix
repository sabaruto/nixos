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
  options.localModules.apps.nvim.obsidian = {
    enable = mkEnableOption "obsidian";

    workspaces = mkOption {
      description = "The list of workspaces";
      default = [ ];

      type = types.listOf (
        types.submodule (
          { ... }:
          {
            options = {
              path = mkOption {
                description = "Path to the workspace";
                type = types.str;
              };

              name = mkOption {
                description = "Name of the workspace";
                type = types.str;
              };
            };
          }
        )
      );
    };
  };

  config.programs.nixvim.plugins.obsidian = mkIf cfg.obsidian.enable {
    enable = true;

    settings = {
      ui.enable = false;
      picker.name = "telescope.nvim";
      notes_subdir = "notes";
      new_notes_location = "notes_subdir";
      daily_notes.folder = "notes/dailies";

      workspaces = cfg.obsidian.workspaces;

      completion = {
        nvim_cmp = true;
      };
    };
  };
}
