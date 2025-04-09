{
  fetchFromGitHub,
  stdenv,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "chicago95";
  version = "3.0.1";

  src = fetchFromGitHub {
    owner = "grassmunk";
    repo = "Chicago95";
    rev = "v${version}";
    hash = "sha256-EHcDIct2VeTsjbQWnKB2kwSFNb97dxuydAu+i/VquBA=";
  };

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
