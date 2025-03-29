{
  stdenv,
  fetchFromGitHub,
  qt6,
  gnumake,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "laigter";
  version = "1.12.1";

  nativeBuildInputs = [
    qt6.wrapQtAppsHook
    gnumake
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtwayland
  ];

  src = fetchFromGitHub {
    owner = "azagaya";
    repo = pname;
    rev = version;
    hash = "sha256-1QSvUTOKKKx4LVHezYzXs8Z7IAYLSTzuEt0RA37T6UU=";
  };

  # ...egregious
  # https://github.com/NixOS/nixpkgs/issues/214765
  installPhase = ''
    runHook preInstall

    substituteInPlace ./laigter.pro \
      --replace "qtPrepareTool(LRELEASE, lrelease)" "qtPrepareTool(LRELEASE, lrelease, , , ${lib.getDev qt6.qttools}/bin)"
    qmake
    make -j 12

    mkdir -p $out/bin
    cp laigter $out/bin

    mkdir -p $out/share/applications
    cp dist/laigter.desktop $out/share/applications

    mkdir -p $out/share/icons/hicolor/256x256/apps
    cp dist/laigter.png $out/share/icons/hicolor/256x256/apps

    mkdir -p $out/share/metainfo
    cp dist/laigter.appdata.xml $out/share/metainfo

    mkdir -p $out/share/mime/packages
    cp dist/x-laigter-project.xml $out/share/mime/packages

    runHook postInstall
  '';

  meta = {
    description = "Laigter: automatic normal map generator for sprites!";
    homepage = "https://github.com/azagaya/laigter/";
    license = lib.licenses.gpl3;
    maintainers = [];
  };
}
