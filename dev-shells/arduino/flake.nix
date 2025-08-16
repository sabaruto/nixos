{
  description = "Dev shells flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    arduino-nix.url = "github:bouk/arduino-nix";
    arduino-index = {
      url = "github:bouk/arduino-indexes";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      arduino-nix,
      arduino-index,
      ...
    }:
    let
      overlays = [
        (arduino-nix.overlay)
        (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_index.json"))
        (arduino-nix.mkArduinoPackageOverlay (arduino-index + "/index/package_rp2040_index.json"))
        (arduino-nix.mkArduinoLibraryOverlay (arduino-index + "/index/library_index.json"))
      ];
    in
    flake-utils.lib.eachDefaultSystemPassThrough (system: {

      devShells."${system}" = {
        default =
          let
            pkgs = (import nixpkgs) {
              inherit system overlays;
            };
            arduino-cli = pkgs.wrapArduinoCLI {
              libraries = with pkgs.arduinoLibraries; [
                (arduino-nix.latestVersion ADS1X15)
                (arduino-nix.latestVersion Ethernet_Generic)
                (arduino-nix.latestVersion SCL3300)
                (arduino-nix.latestVersion TMCStepper)
                (arduino-nix.latestVersion pkgs.arduinoLibraries."Adafruit PWM Servo Driver Library")
              ];

              packages = with pkgs.arduinoPackages; [
                platforms.arduino.avr."1.8.6"
              ];
            };
          in
          with pkgs;
          mkShell {
            packages = [
              arduino-ide
              arduino-cli
            ];
          };
      };
    });
}
