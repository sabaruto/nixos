{
  fetchFromGitHub,
  jre,
  makeWrapper,
  maven,
}:

maven.buildMavenPackage rec {
  pname = "java-debug";
  version = "0.53.1";

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "java-debug";
    tag = "${version}";
    hash = "sha256-7h2U0l8OE8VrXymggfQ3XSXacvfBbQKCJmQVSo8J4M0=";
  };

  mvnHash = "sha256-kudlKOaHke0FxJZQ04Pc1aXbQ4Esu0jiCGnir4hDUog=";

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/java
    ls ./
    install -Dm644 com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-${version}.jar $out/share/java/java-debug.jar

    makeWrapper ${jre}/bin/java $out/bin/java-debug \
      --add-flags "-jar $out/share/java/java-debug.jar"

    runHook postInstall
  '';

  meta = {
    description = "The Java Debug Server is an implementation of Visual Studio Code (VSCode) Debug Protocol. It can be used in Visual Studio Code to debug Java programs.";
    homepage = "https://github.com/microsoft/java-debug";
  };
}
