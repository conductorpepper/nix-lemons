{
  description = "pepper's nix packages";

  outputs = {nixpkgs, ...}: let
    pkgsOf = system: (import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
  in {
    packages.x86_64-linux = let
      pkgs = pkgsOf "x86_64-linux";
    in
      with pkgs; {
        betacraft-launcher-bin = callPackage ./packages/betacraft-launcher-bin.nix {};
        chicago95 = callPackage ./packages/chicago95.nix {};
        cursed_font = callPackage ./packages/cursed_font.nix {};
        laigter = qt6.callPackage ./packages/laigter.nix {};
        middle-mann-fonts = callPackage ./packages/middle-mann-fonts.nix {};
        uzura = callPackage ./packages/uzura.nix {};
      };

    devShells.x86_64-linux.default = let
      pkgs = pkgsOf "x86_64-linux";
    in
      pkgs.mkShell {
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
