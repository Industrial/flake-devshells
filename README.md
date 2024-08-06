# flake-checks

A reusable Nix flake for adding devshells to a flake in a standardized way.

## Usage

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    for-all-systems.url = "github:Industrial/for-all-systems";
    for-all-systems.inputs.nixpkgs.follows = "nixpkgs";
    flake-devshells.url = "github:Industrial/flake-devshells";
    flake-devshells.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {self, for-all-systems, flake-github-actions, ...}: let
    forAllSystems = for-all-systems.forAllSystems {inherit nixpkgs;};
  in {
    devShells = forAllSystems ({
      system,
      pkgs,
    }:
      flake-devshells.devshells {packages = with pkgs; [direnv pre-commit];} {inherit self system pkgs;});
  };
}
