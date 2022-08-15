let
  mozilla-overlay =
    import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);

  pkgs = import <nixpkgs> {
    overlays = [ mozilla-overlay ];
  };

  rust-channel = pkgs.rustChannelOf {
    channel = "stable";
  };

in
  pkgs.mkShell {
    name = "rust-dev";
    buildInputs = with pkgs; [
      (rust-channel.rust.override {
    extensions = [ "rust-src" "llvm-tools-preview" ];
      })
      rust-channel.cargo
      rustfmt
      rust-analyzer
      openssl
      pkg-config
      protobuf
      cargo-tarpaulin
    ];
  }
