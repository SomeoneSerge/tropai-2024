{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    some-pkgs.url = "github:SomeoneSerge/pkgs";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        {
          perSystem = { system, ... }: {
            _module.args.pkgsCuda = import inputs.nixpkgs { config.allowUnfree = true; config.cudaSupport = true; inherit system; };
          };
        }
      ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', pkgs, pkgsCuda, ... }: {
        devShells.default = pkgs.callPackage ./nix/mk-shell.nix { };
        devShells.cuda = pkgsCuda.callPackage ./nix/mk-shell.nix { };
      };
      flake = { };
    };
}
