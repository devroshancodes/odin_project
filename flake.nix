{
  description = "A flake for web design";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
		flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
		flake-utils.lib.eachDefaultSystem (system:
			let
				pkgs = import nixpkgs { inherit system; };
			in
			{
				devShells.default = pkgs.mkShell {
					buildInputs = with pkgs; [
						live-server
						direnv
						nix-direnv
					];

					shellHook = ''
						echo "Ready for Web Design in VS Code!"
						cd ./odin-recipes 
						live-server
						echo "Server started"
						'';
				};
			}
		);
}
