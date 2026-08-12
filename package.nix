{ rustPlatform }:
rustPlatform.buildRustPackage {
  pname = "anyrun-nixos-options";
  version = "0.1.0";

  src = ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes."anyrun-interface-25.12.0" = "sha256-zcKI1OUg+Ukst0nasodrhKgBi61XT8vbvdK6/nuuApk=";
    outputHashes."anyrun-macros-26.6.1" = "sha256-+Fx+JfSboBk8KKVgmaMKDKvMe9c3WC+7RKYjnpvMVpg=";
  };
}
