{
  rustPlatform,
  fetchFromGitHub,
  lib,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "kaledis";
  version = "1.3.4";

  src = fetchFromGitHub {
    owner = "orpos";
    repo = "kaledis";
    tag = finalAttrs.version;
    hash = lib.fakeHash;
  };

  cargoHash = lib.fakeHash;

  meta = {
    description = "A new way to LÖVE";
    homepage = "https://github.com/orpos/kaledis";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
