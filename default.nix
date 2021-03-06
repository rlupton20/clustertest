{ pkgs ? import <nixpkgs> {} , unstable ? import (builtins.fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {} }:
with pkgs;
stdenv.mkDerivation rec {
  name = "Clustertest";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python27Packages.docker_compose
    bridge-utils
    stack
    ghc
  ];
}
