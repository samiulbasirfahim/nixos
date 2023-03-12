{ ... }:

{
  imports =
    [ (import ./../modules/desktop) ] ++
    [ (import ./../modules/gtk) ] ++
    [ (import ./../modules/scripts) ] ++
    [ (import ./../modules/packages) ] ++
    [ (import ./../modules/wallpapers) ] ++
    [ (import ./../modules/programs) ];
    
  home.username = "fahim";
  home.homeDirectory = "/home/fahim";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.git.userName = "Samiul Basir Fahim";
  programs.git.userEmail = "samiulbasirfahim360@gmail.com";
}
