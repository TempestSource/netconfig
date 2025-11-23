{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix/db5637d10f797bb251b94ef9040b237f4702cde3";

    mysecrets = {
      url = "git+ssh://git@github.com/TempestSource/nix-secrets.git?shallow=1";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      disko,
      ...
    }:
    {
      nixosConfigurations.aleport = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          disko.nixosModules.disko
          ./aleport/hardware-configuration.nix
          ./aleport/configuration.nix
          ./secrets/default.nix
        ];
      };
    };
}
