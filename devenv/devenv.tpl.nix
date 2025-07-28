{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  languages.java = {
    enable = true;
    maven.enable = true;
    jdk.package = pkgs.temurin-bin-24;
  };
  env = {
    MAVEN_OPTS = "-Dspring-boot.run.jvmArguments=-Djavax.net.ssl.trustStore=/home/t-aaronobelley/github.com/sabaruto/nixos/secrets/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit";
    XMLLINT_INDENT = "    ";
    JDTLS_HOME = "${pkgs.jdt-language-server}";

    GREET = "devenv";
  };

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git

    teleport
    checkstyle
    jdt-language-server

    postgresql
  ];
  scripts = {
    pgs-mock-app.exec = ''./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles=mock,local,secret -Dspring-boot.run.arguments="--spring.docker.compose.file=../docker-compose.yml"'';
    pgs-mock-bootstap.exec = "./mvnw -pl :common-test-utils exec:java@Localbootstrap-mock";

    # Dev environment
    pgs-dev-app.exec = ''./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles="local,secret,proxy" -Dspring-boot.run.arguments="--spring.docker.compose.file=../docker-compose.yml"'';
    pgs-dev-bootstap.exec = "./mvnw -pl :common-test-utils exec:java@Localbootstrap-dev";
  };

  enterShell = ''
    git --version
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
