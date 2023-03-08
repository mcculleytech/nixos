# My NixOS Flake Config

This repo serves as a landing spot for my NixOS configuration. 

## A Brief Walkthrough My (limited) Understanding

I'm by no means a Nix expert. I just think it's a really cool distro with great ideas. I hope that this config can help someone do something on their NixOS install.

The `flake.nix` file is where everything starts. It then points to each of the hosts `configuration.nix` file in addition to passing through other flakes such as home-manager and hardware configs. That config file is unique to each host so if I needed to I could install certain packages on a host basis. That config then points to another part of the nixos configuration that includes common packages and settings between all hosts. 

Each hosts `configuration.nix` includes a unique user file that adds on the `home-manager` stuff and all modules associated with it. Here I could specify user packages and modules on a per host basis. 

I'll add more detail in later as time allows. I would like to note that the bulk of the structure for this repo comes from another nixos-config repo located [here](https://github.com/Zaechus/nixos-config).


