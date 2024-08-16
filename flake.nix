{
  description = "Fast command line app in rust/tokio to run commands in parallel. Similar interface to GNU parallel or xargs plus useful features";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = system: nixpkgs.legacyPackages.${system};
    in
    {
      # Nix package
      packages = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = import ./default.nix { inherit pkgs; };
        }
      );

      # Development shell
      devShells = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              cargo
              gcc
              nixfmt-rfc-style
            ];
          };
        }
      );

      # # Run:
      # # nix build .#checks.x86_64-linux.integrationTest
      # # To run interactively:
      # # nix build .#checks.x86_64-linux.integrationTest.driverInteractive
      # # See: https://nixos.org/manual/nixos/stable/index.html#sec-running-nixos-tests-interactively
      # checks.x86_64-linux = let
      #   pkgs = nixpkgs.legacyPackages.x86_64-linux;
      # in {
      #   # This test is meant to be run by nixos-test/test.sh.
      #   # https://nixos.org/manual/nixos/stable/index.html#sec-nixos-tests
      #   # https://nix.dev/tutorials/nixos/integration-testing-using-virtual-machines
      #   integrationTest = pkgs.nixosTest (import ./nixos-test/test.nix);
      # };
    };
}
