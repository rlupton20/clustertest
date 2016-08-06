{ pkgs ? import <nixpkgs> {} }:
with pkgs;
stdenv.mkDerivation rec {
  name = "Clusterfuck";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python27Packages.docker_compose
  ];
}
