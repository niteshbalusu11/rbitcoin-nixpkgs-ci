# Build package.nix the way nixpkgs would: callPackage against the nixpkgs on
# NIX_PATH. The maintainer entry lands in nixpkgs in the same PR as the
# package, so it does not exist upstream yet; blank it here.
let
  pkgs = import <nixpkgs> { };
  rbitcoin = pkgs.callPackage ./package.nix { };
in
rbitcoin.overrideAttrs (old: {
  meta = old.meta // {
    maintainers = [ ];
  };
})
