{ lib, config, ... }:

with lib;
let cfg = config.localModules.shells;
in {
  options.localModules.shells.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "dotenv" "direnv" ];

        theme = "robbyrussell";
      };

      initContent = ''
        source ~/.aliases
        eval "$(direnv hook zsh)"
        eval "$(oh-my-posh init zsh --config ~/.config/theme.omp.json)"
      '';

      shellAliases = mkIf (config.home.username == "t-aaronobelley") {
        # Installation environment
        mvn-install =
          "./mvnw install -Dskip.unitTests -Dskip.integrationTests=true -Djacoco.skip=true -Dcheckstyle.skip=true";
        mvn-clean-install =
          "./mvnw clean install -Dskip.unitTests -Dskip.integrationTests=true -Dcheckstyle.skip=true";
        mvn-full-install = "./mvnw clean install";

        pgs-mock-app = ''
          ./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles=mock,local,secret -Dspring-boot.run.arguments="--spring.docker.compose.file=../docker-compose.yml"'';
        pgs-mock-bootstap =
          "./mvnw -pl :common-test-utils exec:java@Localbootstrap-mock";

        # Dev environment
        pgs-dev-app = ''
          ./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles=proxy,local,secret -Dspring-boot.run.arguments="--spring.docker.compose.file=../docker-compose.yml"'';
        pgs-dev-bootstap =
          "./mvnw -pl :common-test-utils exec:java@Localbootstrap-dev";

      };
    };
  };
}
