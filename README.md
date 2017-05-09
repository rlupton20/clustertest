clustertest - a cluster computing test rig
==========================================


### Requirements
* Docker
* nix (preferably using a stable branch of nixpkgs)

### To use
At the moment, the code which is run on each node is a small Haskell program (`node/app/Main.hs`). To run a cluster containing 10 nodes and a master node, run
```
./provision-cluster.nix 10
```
and this will compile the Haskell code in `node/`, build a docker container around it, launch 10 slave nodes, and then a master node.

