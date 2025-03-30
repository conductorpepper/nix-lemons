# v1
# this is bin because the gradle uses deprecated features
# and as a result, cannot be built (probably)
{
  stdenv,
  fetchurl,
  lib,
  makeWrapper,
  bash,
  jdk8, # kinda arbitrary
  xorg,
  libGL,
  openal,
  extraArguments ? [],
}:
stdenv.mkDerivation rec {
  pname = "betacraft-launcher-bin";
  version = "1.09_17";

  nativeBuildInputs = [
    makeWrapper
  ];

  buildInputs = [
    libGL
    openal

    # one of these make things work
    # but this package is taking an entire afternoon
    xorg.libXxf86vm
    xorg.libXxf86dga
    xorg.libXxf86misc
  ];

  src = fetchurl {
    url = "https://github.com/betacraftuk/betacraft-launcher/releases/download/${version}/launcher-${version}.jar";
    hash = "sha256-CMemX7mrCa5d9kQJN1/ryeBnJ/s6yz3aHq9ym4WWWOM=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    echo "#!${bash}/bin/bash" > $out/bin/betacraft-launcher
    echo "${jdk8}/bin/java ${builtins.concatStringsSep " " extraArguments} -jar $src" >> $out/bin/betacraft-launcher
    chmod +x $out/bin/betacraft-launcher

    runHook postInstall
  '';

  fixupPhase = ''
    runHook preFixup

    wrapProgram $out/bin/betacraft-launcher \
      --prefix PATH : ${lib.makeBinPath [jdk8]} \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath buildInputs}

    runHook postFixup
  '';

  meta = {
    homepage = "https://betacraft.uk/";
    description = "A launcher for Minecraft focused on legacy versions of the game";
    licenses = lib.licenses.gpl3;
    mainProgram = "betacraft-launcher";
  };
}
