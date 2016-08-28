{ pkgs ? import <nixpkgs> {} , node }:
let
  minimalDocker = {
    imports = [ <nixpkgs/nixos/modules/profiles/minimal.nix> ];
    boot.isContainer = true;
    environment.etc.machine-id.text = "node";
  };

  eval = import <nixos/lib/eval-config.nix> {
    modules = [
      minimalDocker
    ];
  };

  system = eval.config.system;
   
in

with pkgs;
dockerTools.buildImage {
  name = "clusterfuck-node";

  contents = 
    symlinkJoin "node-contents" [ node system.build.etc system.path ];
  
  config = {
    Cmd = [ "clusterfuck-exe" "slave" "0.0.0.0" "5000" ];
    };
}
