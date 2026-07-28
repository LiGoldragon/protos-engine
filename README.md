# protos-engine

`protos-engine` is the pinned integration and conformance sink for the Protos
micro-repository family. It assembles published repositories without absorbing
their source or becoming a package that components can import.

This repository is deliberately not a monorepo. It has no Cargo manifest,
workspace, library, `build.rs`, Rust implementation, vendored component, or
component source copy. The component repositories are canonical.

## Dependency direction

Nix inputs flow into this integration repository:

```text
published component repositories -> protos-engine checks
```

No Cargo or path edge may flow back:

```text
component repository -X-> protos-engine
```

`scripts/check-dependency-direction` derives its source map from the validated
root lock input set, then scans every pinned family `Cargo.toml` and
`flake.nix` for that forbidden reverse edge. The match is case-insensitive.
`scripts/check-repository-shape` keeps the recursively exact repository
allowlist source-free.

## Pinned family

Every repository input uses a full, published Git revision:

| Repository | Revision |
| --- | --- |
| content-identity | `ac0075842799b3ece8909ad0eb4b8a92b596b188` |
| name-table | `a1705ef512efec28925ae3ffc9faa5a2aa4dc4a8` |
| raw-discovery | `c27a9efabb1981c8b3d887c870fff82fc7daf49c` |
| structural-codec | `38c037d83ad4a1a275295442e2978a8130d0ae4c` |
| protos | `c6fa54c066a1210bbba026d9d761bb3ef5b8af5f` |
| schema-language | `9c217610c4b8d3bdaa9f95542e28c04424a593e3` |
| schema-rust | `3721656b0a654d47d9abde31f14d89d01f9305cf` |
| signal-spirit | `1cf7c010029de46369b742687da4fa1ca6def9a9` |
| meta-signal-spirit | `0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3` |
| spirit | `1049b8a1a9e3c2be7ece3553b89c7e3815939d43` |

The three Spirit-family pins retain the existing `PublicTextSearch` process
witness until its successor feature revisions are independently audited and
published.

`scripts/check-pin-policy` has two explicit gates. Its pure gate parses the
committed `flake.lock`. Its live gate independently runs
`nix flake metadata --json --no-write-lock-file path:$repo`, compares the
actual evaluated `locks` with the committed lock, and proves neither the lock
nor repository status changed. Root inputs must be exactly the table above
plus the pinned Nixpkgs input; each root original and locked record must agree
on a full 40-hex revision and the locked record must carry a `narHash`. Root
branch, path, and extra inputs are rejected.

Transitive inputs belong to the immutable pinned Spirit flake closure. Their
locked originals may retain branch metadata from the producer only when the
lock also records an immutable full revision and `narHash`; the stricter
branch-free rule applies to this repository's root inputs.

## Checks

Run the reproducible evaluation and check surface:

```sh
nix flake show
nix run .#check-all
```

`check-all` is canonical because a Nix derivation cannot recursively ask the
Nix daemon for independent live flake metadata. It first runs the live
evaluated-metadata gate and its declaration mutations, then runs
`nix flake check --print-build-logs` for the pure lock, direction, shape,
ShellCheck, owner-suite, and exact-witness derivations.

The current Spirit flake does not export its exact
`public_text_search_returns_direct_ranked_records` test as a standalone output.
`public-text-search-exact-test` therefore narrows Spirit's pinned published
test derivation to the `process_boundary` target and that exact test name. The
check requires both the named success line and the Cargo result
`1 passed; 0 failed`, so ignored, filtered-out, or non-member tests cannot
satisfy it. The test implementation stays in Spirit.

`public-text-search-witness-contract` also proves the pinned function is an
active `#[test]`, is not ignored, and retains executable TempDir, daemon,
query, and assertion statements. `public-text-search-owner-suite` preserves
the producer's broader published suite as a separate closure check.

Run the same owning published suite explicitly with:

```sh
nix run .#public-text-search-witness
```

The witness uses only temporary test data. Nothing in this repository operates
on live production state.
