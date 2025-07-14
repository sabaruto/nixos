{ lib, config, ... }:

with lib;
let
  cfg = config.localModules.shells;
in
{
  options.localModules.shells.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "dotenv"
          "direnv"
          "mvn"
          "zsh-interactive-cd"
        ];

        theme = "robbyrussell";
      };

      initContent = mkMerge [
        ''
          export ZSH="$HOME/.oh-my-zsh"
          ZSH_THEME="robbyrussell"

          zstyle ':omz:update' mode auto      # update automatically without asking
          COMPLETION_WAITING_DOTS="true"

          HIST_STAMPS="dd/mm/yyyy"

          source $ZSH/oh-my-zsh.sh
          if [[ -n $SSH_CONNECTION ]]; then
            export EDITOR='vim'
          else
            export EDITOR='nvim'
          fi
        ''
        (mkIf (config.localModules.cmd.oh-my-posh.enable) ''
          eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.json)"
        '')
        (mkIf (config.localModules.cmd.direnv.enable) ''
          eval "$(direnv hook zsh)"
        '')
      ];
    };
  };
}
