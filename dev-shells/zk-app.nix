{ nixpkgs, system }:
let
  pkgs = import nixpkgs {
    inherit system;

    config = {
      android_sdk.accept_license = true;
      allowUnfree = true;
    };
  };

  buildToolsVersion = "36.0.0";
  ndkVersion = "28.1.13356709";

  androidComposition = pkgs.androidenv.composeAndroidPackages {

    platformVersions = [
      "latest"
    ];
    systemImageTypes = [ "google_apis_playstore" ];
    includeEmulator = true;
    includeSystemImages = true;

    includeNDK = true;
    includeExtras = [
      "extras;google;auto"
    ];
    buildToolsVersions = [ buildToolsVersion ];
    ndkVersions = [ ndkVersion ];

    extraLicenses = [
      "android-sdk-license"
      "android-googletv-license"
      "android-sdk-arm-dbt-license"
      "android-sdk-preview-license"
      "google-gdk-license"
      "mips-android-sysimage-license"
    ];
  };
  androidSdk = androidComposition.androidsdk;

in
with pkgs;
mkShell rec {
  ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
  ANDROID_NDK_ROOT = "${ANDROID_HOME}/ndk-bundle";
  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_HOME}/build-tools/${buildToolsVersion}/aapt2";

  CHROME_EXECUTABLE = "${google-chrome}/bin/google-chrome-stable";

  buildInputs = [
    androidSdk
    flutter
    jdk24
    google-chrome
    virtualglLib

    (androidenv.emulateApp {
      name = "emulate-MyAndroidApp";
      platformVersion = "28";
      abiVersion = "x86"; # armeabi-v7a, mips, x86_64
      systemImageType = "google_apis_playstore";
    })
  ];
}
