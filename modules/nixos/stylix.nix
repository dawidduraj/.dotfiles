{inputs, pkgs,  ...}:
{
		stylix = {
				enable = true;
				polarity = "dark";
				image = ../../assets/wp.png;
				# TODO: font+cursor setup
				opacity = {
						terminal = 0.8;
				};
		};
}
