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

      shellAliases = mkMerge [
        {
          n-switch = "nixos-rebuild switch --sudo";
          n-debug = "nixos-rebuild switch --sudo --show-trace --verbose";
          n-up = "nix flake update";
        }

        (mkIf (config.home.username == "t-aaronobelley") {
          # Installation environment
          mvn-install = "./mvnw install -Dskip.unitTests -Dskip.integrationTests=true -Djacoco.skip=true -Dcheckstyle.skip=true";
          mvn-clean-install = "./mvnw clean install -Dskip.unitTests -Dskip.integrationTests=true -Dcheckstyle.skip=true";
          mvn-full-install = "./mvnw clean install";

          # Payments Gateway Service
          pgs-mock-app = ''./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles=mock,local,secret -Dspring-boot.run.arguments="--spring.docker.compose.file=../docker-compose.yml"'';
          pgs-mock-bootstap = "./mvnw -pl :common-test-utils exec:java@Localbootstrap-mock";

          # Dev environment
          pgs-dev-app = ''./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles=proxy,local,secret -Dspring-boot.run.arguments="--spring.docker.compose.file=../docker-compose.yml"'';
          pgs-dev-bootstap = "./mvnw -pl :common-test-utils exec:java@Localbootstrap-dev";

          # ssh connecton
          ssh-add = "ssh-add.exe";
          ssh = "ssh.exe";
        })
      ];
    };
  };
}
