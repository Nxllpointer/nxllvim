{
  description = "Nxllpointer's nixvim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    { nixpkgs
    , nixvim
    , ...
    } @ inputs:
    let
      inherit (nixpkgs) lib;

      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forSupportedSystems = f:
        lib.genAttrs supportedSystems (system: (f {
          inherit system;
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ (import ./build-speed-overlay.nix) ];
          };
        }));
    in
    {
      packages = forSupportedSystems (
        { system, pkgs }: rec {
          nxllvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = {
              imports = [
                ./config
              ];
            };
            extraSpecialArgs = { };
          };

          print-config = nxllvim.config.printInitPackage;

          default = nxllvim;
        }
      );

      formatter = forSupportedSystems ({ pkgs, ... }: pkgs.nixpkgs-fmt);
    };
}
