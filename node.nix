{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = {
    node = callPackage ./node { };
    image = callPackage ./image.nix {};
  };
in
self
