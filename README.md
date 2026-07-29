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
| content-identity | `fdf2db1d5a9e8ea52d24d39a03833c3e6885c355` |
| name-table | `50cb4bb53ae2dc4f2516f6912be328ef98ae49f8` |
| signal-sema-translator | `8c504ba7aa8dbdc5edf7daadbb862bbdaa5613be` |
| sema-translator | `2e152787f9fd191a3f5f4d391bd832d12e1c341a` |
| protos | `1343d0c405cdb6929552ea6b12c48739e73f35ab` |
| core-ethos | `a79aeb9a0b2bb304d69d7392147639e13a3d58bc` |
| core-logos | `3e4ae814f684b44c0aa45d5887c09a7d61d75db6` |
| rust-logos | `c1a62852569457af423acc633c4ab392aca7e498` |
| core-nomos | `59d7364139f040601102051c8b8aa65fab1e53c4` |
| language-engine-witness | `2286f543c0c8d2cae2979ad0d1e93eaa109e6714` |
| raw-discovery | `7290f65bbb5e7825ab2ca58340631d154d69d110` |
| structural-codec | `5c11e1fb7f58444cd860207803d8f705e7415d71` |
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
core-logos, rust-logos, and core-nomos test derivations. It also exposes
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

`scripts/check-slice-one-coherence` separately validates every chain-based
Slice One producer edge against the exact root revisions. It covers
structural-codec's raw-discovery and name-table producers; core-ethos's
chain-based raw/structural aliases; core-nomos's chain-based Ethos/Logos
aliases; rust-logos's complete direct producer set; and the published
language-engine-witness's eight Slice One aliases. Its mutation suite rejects
revision drift, repository drift, alias package drift, duplicate direct
declarations, durable-chain drift, and removal of restart coverage. The older
flat API dependencies remain isolated from these checked aliases and are not
represented as a migrated type universe.

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

`slice-one-behavior-witness` realizes the pinned
language-engine-witness owner suite only after exact-pin, dependency-direction,
and Slice One coherence derivations succeed. The owner suite decodes a
six-slot Ethos application-backed newtype and enumeration with unit and
positional tuple variants using translator-issued chains, archives and
restores Whole Ethos, lowers through direct typed Nomos to identified Whole
Logos, archives and restores Whole Logos, structurally emits and decodes Rust,
refuses incomplete projections without returning partial source, then
compiles and exhaustively runs the generated forms in a temporary Cargo crate. Its
separate process witness terminates and restarts the pinned engine processes
against isolated temporary state and proves durable recovery and resumed
progression. The wrapper dependencies ensure a producer-pin change cannot
reuse a behavior result without rebuilding the relevant coherence closure.

Run the same owning published suite explicitly with:

```sh
nix run .#public-text-search-witness
```

The witness uses only temporary test data. Nothing in this repository operates
on live production state.
