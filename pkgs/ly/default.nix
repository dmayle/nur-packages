{ stdenv, lib, fetchFromGitHub, linux-pam }:

stdenv.mkDerivation rec {
  pname = "ly-${version}";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "nullgemm";
    repo = "ly";
    rev = version;
    sha256 = "7fd849d81e2249f3ad6868333502f504b3402d7d";
    fetchSubmodules = true;
  };

  buildInputs = [ linux-pam ];
  makeFlags = [ "FLAGS=-Wno-error" ];

  installPhase = ''
    mkdir -p $out/bin
    cp bin/ly $out/bin
  '';

  meta = with lib; {
    description = "TUI display manager";
    license = licenses.wtfpl;
    homepage = "https://github.com/nullgemm/ly";
    maintainers = [ maintainers.spacekookie ];
  };
}
