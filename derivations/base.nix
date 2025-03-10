{ config, lib, pkgs, ... }: 

with lib;

{
	imports = [
		./kernel.nix
	];
}
