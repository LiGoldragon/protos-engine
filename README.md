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
| content-identity | `f1f9c6efc828acaefd0f751550cd40389d312bf5` |
| name-table | `1f558eac44bd03034e51ad98e3a65ec16d8b8411` |
| signal-sema-translator | `8ff7d0db033c756a0cd7999e72e564ca1c32b4aa` |
| sema-translator | `bcfb339b069d3eba756779105894b396b7a8acc6` |
| protos | `1435c9aeb7f24e811aca670101e355ff26818ae2` |
| core-ethos | `b9db643a853b1f52f10a4100a791d5dbc8c7240d` |
| core-logos | `ffb9ccdeac94b4e3401fc4bffa593589f0321fe5` |
| textual-rust | `87a9d9c29403e5ff2e08f4d18d034b11cc30be1b` |
| core-nomos | `c185f6168474a7d94da970d95a15a149ec7b9220` |
| raw-discovery | `c27a9efabb1981c8b3d887c870fff82fc7daf49c` |
| structural-codec | `38c037d83ad4a1a275295442e2978a8130d0ae4c` |
| schema-language | `9c217610c4b8d3bdaa9f95542e28c04424a593e3` |
| schema-rust | `3721656b0a654d47d9abde31f14d89d01f9305cf` |
| signal-spirit | `1cf7c010029de46369b742687da4fa1ca6def9a9` |
| meta-signal-spirit | `0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3` |
| spirit | `1049b8a1a9e3c2be7ece3553b89c7e3815939d43` |

The three Spirit-family pins retain the existing `PublicTextSearch` process
witness until its successor feature revisions are independently audited and
published.

The identity/Capsule producers are ordinary flake inputs rather than source-only
inputs. This lets the assembly expose their published test derivations directly.
On `x86_64-linux`, the root check surface passes through the content-identity,
name-table, signal-sema-translator, sema-translator, protos, core-ethos,
core-logos, textual-rust, and core-nomos test derivations. It also exposes
sema-translator's dedicated real-process derivation and protos'
package-contents derivation as separate checks.

`scripts/check-pin-policy` has two explicit gates. Its pure gate parses the
committed `flake.lock`. Its live gate independently runs
`nix flake metadata --json --no-write-lock-file path:$repo`, compares the
actual evaluated `locks` with the committed lock, and proves neither the lock
nor repository status changed. Root inputs must be exactly the table above
plus the pinned Nixpkgs input; each root original and locked record must agree
on a full 40-hex revision and the locked record must carry a `narHash`. Root
branch, path, and extra inputs are rejected.

Transitive inputs belong to the immutable pinned producer flake closures. Their
locked originals may retain branch metadata from a producer only when the lock
also records an immutable full revision and `narHash`; the stricter branch-free
rule applies to this repository's root inputs.

`scripts/check-identity-capsule-coherence` compares the affected direct Cargo
edges with those exact root revisions. Its table includes the final integrity
producer, translator, generic Capsule, kind-fixed core, and mechanically
required textual-rust edges. It deliberately does not demand universal
transitive equality: the cores' direct legacy per-item identity/archive and
flat name-table dependencies remain on their established typed revisions.
The legacy 0.3 identity crate and dependency-renamed 0.4 Capsule identity crate
form a deliberate typed firewall. Rust reports `E0308` when values cross those
crate revisions accidentally; keeping every affected producer edge exact is
what prevents that mismatch without pretending the legacy graph has migrated.
The gate therefore proves a coherent published carrier foundation without
claiming encodedID-chain migration, whole Logos/Nomos content, content/hash
verification, complete-pin verification, or module-table/Capsule composition.

## Checks

Run the reproducible evaluation and check surface:

```sh
nix flake show --all-systems
nix run .#check-all
```

`check-all` is canonical because a Nix derivation cannot recursively ask the
Nix daemon for independent live flake metadata. It first runs the live
evaluated-metadata gate and its declaration mutations, then runs
`nix flake check --print-build-logs` for the pure lock, affected-edge
coherence, direction, shape, ShellCheck, producer tests, explicit process and
package checks, owner-suite, and exact-witness derivations.

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
