{
  description = "A reusable Nix flake for adding devshells to a flake in a standardized way.";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };
  outputs = inputs @ {self, ...}: {
    devshells = import ./lib/devshells.nix;
  };
}
