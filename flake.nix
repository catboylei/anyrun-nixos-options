{
  description = "An anyrun plugin that lets you search NixOS options.";

  outputs = inputs @ {
    nixpkgs,
    ...
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forEachSystem = f: nixpkgs.lib.genAttrs systems f;
  in {
    packages = forEachSystem (sys: let
      pkgs = nixpkgs.legacyPackages.${sys};
      anyrun-nixos-options = pkgs.callPackage ./package.nix {};
    in {
      inherit anyrun-nixos-options;
      default = anyrun-nixos-options;
    });

    devShells = forEachSystem (sys: let
      pkgs = nixpkgs.legacyPackages.${sys};
    in {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cargo
          clippy
          rustc
          git
          rustfmt
          rust-analyzer
        ];
      };
    });
  };
}
