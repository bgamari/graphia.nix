{
  description = "Graphia";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.graphia.url = "path:/opt/exp/nixpkgs/graphia";

  outputs = { self, nixpkgs, flake-utils, graphia }:
    flake-utils.lib.eachDefaultSystem (system: 
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages.graphia = pkgs.qt6Packages.callPackage ./default.nix { src = graphia; };

        packages.default = packages.graphia;

        apps.graphia = {
          type = "app";
          program = "${packages.graphia}/bin/Graphia";
        };
        apps.default = apps.graphia;
      }
    );
}
