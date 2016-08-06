{  pkgs ? import <nixpkgs> {} }:
with pkgs; with pkgs.haskellPackages;
mkDerivation {
  pname = "clusterfuck";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ cabal-install stack ];
  libraryHaskellDepends = [ haskellPackages.base ];
  executableHaskellDepends = [ haskellPackages.base ];
  testHaskellDepends = [ haskellPackages.base ];
  description = "A basic compute node.";
  license = stdenv.lib.licenses.bsd3.shortName;
}
