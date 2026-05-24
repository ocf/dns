{
  description = "ocf dns";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    ocflib.url = "github:ocf/ocflib";
  };
  outputs =
    {
      self,
      nixpkgs,
      systems,
      ocflib,
    }:
    let
      overlays = [ ocflib.overlays.default ];

      pkgsFor = system: import nixpkgs { inherit overlays system; };
      forAllSystems = fn: nixpkgs.lib.genAttrs (import systems) (system: fn (pkgsFor system));
    in
    {
      formatter = forAllSystems (pkgs: pkgs.nixfmt-tree);

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            bind
            python312Packages.ocflib
            python312Packages.ldap3
          ];
          shellHook = "python build-zones && bash check-zones";
        };
        deploy = pkgs.mkShell {
          packages = with pkgs; [
            bind
          ];
        };
      });
    };
}
