{ pkgs ? import <nixpkgs> {} , node }:
let
  minimalDocker = {
    imports = [ <nixpkgs/nixos/modules/profiles/minimal.nix> ];
    boot.isContainer = true;
    environment.etc.machine-id.text = "node";
  };

  eval = import <nixpkgs/nixos/lib/eval-config.nix> {
    modules = [
      minimalDocker
    ];
  };

  system = eval.config.system;
   
in

with pkgs;
dockerTools.buildImage {
  name = "clustertest-node";

  contents = 
    symlinkJoin {
      name = "node-contents";
      paths = [ node system.build.etc system.path ];
  };
  
  config = {
    Cmd = [ "clustertest-exe" "slave" "0.0.0.0" "5000" ];
    };
}
