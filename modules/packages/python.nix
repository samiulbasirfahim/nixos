{pkgs, ...}:

let
  my-python-packages = p: with p; [
    pandas
    numpy
    # other python packages
  ];
in
{
  environment.systemPackages = [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
