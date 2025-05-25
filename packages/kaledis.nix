{
  rustPlatform,
  fetchFromGitHub,
  lib,
  perl,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "kaledis";
  version = "v1.3.4";

  src = fetchFromGitHub {
    owner = "orpos";
    repo = "kaledis";
    tag = finalAttrs.version;
    hash = "sha256-QWB6D+33j7hY7i74HRC7zKPsysYsZhGJ1+oSiRKwlcQ=";
  };

  cargoHash = "sha256-c/CE9XB+VUWx2CmH/0gqSucWHoCSlfcaqDHAD1Vr3co=";

  nativeBuildInputs = [
    perl
  ];

  meta = {
    description = "A new way to LÖVE";
    homepage = "https://github.com/orpos/kaledis";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
