{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation rec {
  pname = "adi1090x-plymouth";
  version = "0.0.1";

  src = builtins.fetchGit {
    url = "https://github.com/adi1090x/plymouth-themes";
    rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
  };

  buildInputs = [ pkgs.git ];

  configurePhase = ''
    mkdir -p $out/share/plymouth/themes/
  '';

  buildPhase = "";

  installPhase = ''
    mkdir $out/share/plymouth/themes -p
    chmod +w -R $out/share/plymouth
    for f in $src/pack_*/*; do
      cp -r $f $out/share/plymouth/themes/
    done
    chmod +w $out -R
    find $out -type f | while read file; do
      sed -i 's;/usr/share/plymouth;/etc/plymouth;g' "$file"
    done
  '';
}
