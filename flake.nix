{
  description = "ClojureScript Chrome Extension for GitHub";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-darwin"];

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem = {pkgs, ...}: let
        jdk = pkgs.jdk25;
        nodejs = pkgs.nodejs_26;
        clojure = pkgs.clojure.override {inherit jdk;};
      in {
        treefmt = {
          programs.alejandra.enable = true;
        };

        devShells.default = pkgs.mkShell {
          packages = [
            jdk
            clojure
            nodejs
            pkgs.pnpm
          ];
        };
      };
    };
}
