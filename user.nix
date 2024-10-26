with import <nixpkgs> {}; [
	# other software
	gns3-server gns3-gui

	# essentials
	janet jq direnv nix-direnv cachix

	# security
	cloudflare-warp
	bettercap 
	openvpn openvpn3 
	#networkmanager-openvpn
	wireshark

	# office
	#libreoffice-fresh
	
	# accounting
	gnucash

	# development
	android-studio
	gradle # Dependency for android-studio
]
