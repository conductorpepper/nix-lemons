{
  description = "pepper's nix packages";

  outputs = {nixpkgs, ...}: let
    pkgsOf = system: (import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
  in {
    devShells.x86_64-linux.default = let
      pkgs = pkgsOf "x86_64-linux";
    in pkgs.mkShell {
      packages = with pkgs; [
        nil
        alejandra
      ];
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
}
