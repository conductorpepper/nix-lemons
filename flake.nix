{
  description = "pepper's nix packages";

  outputs = {nixpkgs, ...}: let
    pkgsOf = system: (import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });

    forAllSystems = func:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ] (system: func (pkgsOf system));
  in {
    packages = forAllSystems (pkgs:
      with pkgs; {
        betacraft-launcher-bin = callPackage ./packages/betacraft-launcher-bin.nix {};
        chicago95 = callPackage ./packages/chicago95.nix {};
        cursed_font = callPackage ./packages/cursed_font.nix {};
        laigter = qt6.callPackage ./packages/laigter.nix {};
        middle-mann-fonts = callPackage ./packages/middle-mann-fonts.nix {};
        uzura = callPackage ./packages/uzura.nix {};
      });

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          nil
          alejandra
        ];
      };
    });
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
}
