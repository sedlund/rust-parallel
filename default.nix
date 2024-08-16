{
  pkgs ? import <nixpkgs>,
}:
with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "rust-parallel";
  version = "1.18.1";

  src = fetchFromGitHub {
    owner = "aaronriekenberg";
    repo = "rust-parallel";
    rev = "v${version}";
    hash = "sha256-4f/JE8KWYDdLwx+bCSSbz0Cpfy/g3WIaRzqCvUix4t0=";
  };

  cargoHash = "sha256-bhwA2Acl10Rz5uRxJT+RagDZloeztM2eWJmkHV6Ib6c=";

  doCheck = false; # tests hard code /bin/bash

  meta = with lib; {
    description = "Fast command line app in rust/tokio to run commands in parallel. Similar interface to GNU parallel or xargs plus useful features.";
    homepage = "https://github.com/aaronriekenberg/rust-parallel";
    license = licenses.mit;
    mainProgram = "rust-parallel";
    maintainers = with maintainers; [ sedlund ];
    platforms = platforms.linux;
  };
}
