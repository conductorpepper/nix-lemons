# middle mann is a tf2 hud
# https://github.com/Vexcenot/-Middle-Mann
# this package extracts the fonts
{
  stdenv,
  fetchFromGitHub,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "middle-mann-fonts";
  version = "23";

  src = fetchFromGitHub {
    owner = "Vexcenot";
    repo = "-Middle-Mann";
    rev = "v${version}";
    hash = "sha256-KJTatYMc11HamdYitPDM5jlRW0qHBQkAGu6kqyQ1Skk=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 $src/resource/fonts/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = {
    homepage = "https://github.com/Vexcenot/-Middle-Mann";
    description = "fonts for the best hud in tf2 (probably)";
    license = lib.licenses.unfree;
  };
}
