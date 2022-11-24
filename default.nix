{ stdenv, lib, src, cmake,
, wrapQtAppsHook, qtbase, qtwebengine, qtdeclarative
}:

stdenv.mkDerivation rec {
  pname = "graphia";
  version = "3.2";

  inherit src;

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
  ];
  buildInputs = [
    qtbase
    qtwebengine
    qtdeclarative
  ];

  meta = with lib; {
    # never built on Hydra https://hydra.nixos.org/job/nixpkgs/trunk/graphia.x86_64-darwin
    broken = (stdenv.isLinux && stdenv.isAarch64) || stdenv.isDarwin;
    description = "A visualisation tool for the creation and analysis of graphs.";
    homepage = "https://graphia.app";
    license = licenses.gpl3Only;
    maintainers = [ maintainers.bgamari ];
    platforms = platforms.all;
  };
}

