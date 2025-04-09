{
  stdenv,
  fetchFromGitHub,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "cursed_font";
  version = "32920c20b8f378a2322de44c80d170dd03d6f352";

  src = fetchFromGitHub {
    owner = "kiedtl";
    repo = "cursed";
    rev = version;
    hash = "sha256-W59Z3G9+1+oA4upo4Sk2cjO098ll40sW0AQgmW8eHxg=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 $src/font.bdf -t $out/share/fonts
    runHook postInstall
  '';

  meta = {
    homepage = "https://tilde.team/~kiedtl/projects/cursed/";
    description = "Your worst nightmare";
    license = with lib.licenses; [
      cc-by-40 # font and non-code content
      unlicense # everything else is covered under the Unlicense
    ];
  };
}
