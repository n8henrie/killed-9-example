{
  description = "Test rust in nix";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.05-pre";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
    in
    {
      devShell.${system} =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        with pkgs;
        mkShell {
          nativeBuildInputs = [
            cargo
            cargo-edit
            git
            libiconv
            openssl
            pkg-config
            rust-analyzer
            rustc
            rustfmt
            darwin.apple_sdk.frameworks.Security
          ];
        };
    };
}
