{ config, lib, pkgs }: 
rec {	
	
	# user
	username = "fahim";


	applicationMenu ="/home/fahim/.config/rofi/launchers/type-1/launcher.sh";
	normalFont = "Operator Mono Lig";

	colors = {
		fg  = "ffffff"; # text main
		bg  = "000000";	# background main
		acc = "bf616a"; # blue=00b3f4  orange=ff6600
		warn = "f00";
	};

	cornerRadius = 0;
	borderSize = 2;
}