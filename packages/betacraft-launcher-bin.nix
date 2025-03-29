# v1
# this is bin because the gradle uses deprecated features
# and as a result, cannot be built (probably)
{
  stdenv,
  fetchurl,
  lib,
}:
stdenv.mkDerivation {
  pname = "betacraft-launcher-bin";
  version = "1.07_17";

  src = fetchurl {
    url = "https://github.com/betacraftuk/betacraft-launcher/releases/download/1.09_17/launcher-1.09_17.jar";
    hash = lib.fakeHash;
  };
}
