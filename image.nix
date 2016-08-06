{ pkgs ? import <nixpkgs> {} , node }:

with pkgs;
dockerTools.buildImage {
  name = "clusterfuck-node";
  # Don't use another image a base, just build
  # what is necessary to run
  runAsRoot = ''
    #!${stdenv.shell}
    ${dockerTools.shadowSetup}
    mkdir /data
  '';

  contents = [ node ];

  config = {
    Cmd = [ "clusterfuck-exe" ];
    WorkingDir = "/data";
    };
}
