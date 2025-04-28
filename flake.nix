{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs = { nixpkgs, stylix, ... } @ inputs:
  {
  	#TODO: Modularize and create seperate configs for seperate devices
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		specialArgs={ inherit inputs; };
		modules = [
			./configuration.nix
			{nixpkgs.overlays = [inputs.hyprpanel.overlay];}
			stylix.nixosModules.stylix
		];
	};
  };
}
