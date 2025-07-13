{ pkgs }:
let npkgs = pkgs;
in with npkgs;
mkShell {
  ANDROID_SDK_ROOT = "${android-tools}/libexec/android-sdk";
  NIXPKGS_ALLOW_UNFREE = 1;
  buildInputs = [
    flutter
    jdk24
    androidenv.test-suite
    androidenv.androidPkgs.tools
    androidenv.androidPkgs.platform-tools
    androidenv.androidPkgs.emulator
    androidenv.androidPkgs.ndk-bundle
  ];
}
