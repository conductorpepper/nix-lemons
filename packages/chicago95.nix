{
  fetchFromGitHub,
  stdenv,
  lib,
}: let
  owner = "grassmunk";
  repo = "Chicago95";
  rev = "v3.0.1";
  hash = "sha256-EHcDIct2VeTsjbQWnKB2kwSFNb97dxuydAu+i/VquBA=";

  src = fetchFromGitHub {
    inherit owner repo rev hash;
  };
in
  stdenv.mkDerivation {
    inherit src;
    pname = repo;
    version = rev;

    installPhase = ''
      runHook preInstall

      ls --recursive

      mkdir -p $out/share/themes
      cp -r ./Theme/Chicago95 $out/share/themes/

      mkdir -p $out/share/icons
      cp -r ./Icons/* $out/share/icons/
      cp -r ./Cursors/* $out/share/icons/

      runHook postInstall
    '';

    meta = {
      homepage = "https://github.com/grassmunk/Chicago95";
      description = "A rendition of everyone's favorite 1995 Microsoft operating system for Linux.";
      license = lib.licenses.unfree;
    };
  }
