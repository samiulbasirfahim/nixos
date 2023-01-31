{ pkgs ? import <nixpkgs> {} }:


let
  pythonEnv = pkgs.python39.withPackages (ps: with ps;
    [
        pyautogui
    ]);

in
with pkgs;
mkShell{nativeBuildInputs = with pkgs;[pythonEnv];}
