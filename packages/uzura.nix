{
  stdenv,
  fetchzip,
  lib,
}:
stdenv.mkDerivation {
  pname = "uzura";
  version = "1.00";
  src = fetchzip {
    url = "https://azukifont.com/font/uzurafont100.zip";
    hash = "sha256-oicfYODG9q/te4Z135UBTO4C+SfCz5KcO31flbkuoSc=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 uzura.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = {
    homepage = "https://azukifont.com/font/uzura.html";
    license = lib.licenses.unfree;
  };
}
