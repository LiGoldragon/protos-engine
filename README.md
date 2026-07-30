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
| content-identity (legacy per-item graph) | `fdf2db1d5a9e8ea52d24d39a03833c3e6885c355` |
| capsule-content-identity (content-only) | `896b21e17f31b66d0802bff899b4b60acea9c0f1` |
| name-table | `50cb4bb53ae2dc4f2516f6912be328ef98ae49f8` |
| signal-sema-translator | `51c02c4a7b6f67d9dad095f11986085d7d65785b` |
| sema-translator | `6df830ab1ec9f315a5b50e40ffc393b48ea3d412` |
| signal-frame | `0786fbe8caf27552afcdd5deb85bc82ec6088337` |
| sema-engine | `7bed5017a6f20ff2c109f693c2dedaaddf52e64d` |
| protos (neutral po2.6 carrier) | `c85cec6117bfd4c423d952fd54e0c0bb11562f89` |
| legacy-protos (unchanged Ethos/Logos consumers) | `1343d0c405cdb6929552ea6b12c48739e73f35ab` |
| nomos-protos (content-only identity consumer) | `1263f9d1f73b57885d695ac033bdd6faa1334ddf` |
| core-ethos | `736460fdafbd65d6500fe15e6ae8844b42a39e7c` |
| core-logos | `9a61e2ac1bf8a8c1163794d695902115a05a4007` |
| rust-logos | `f46167cbb35d25d86ddbc197653c6560ded8e077` |
| core-nomos | `58fd8036bffcb3cff6e27af4db25690764ecc768` |
| signal-nomos | `1af71a9d0625a6404f81cd6fe8b6393ac0c9040f` |
| nomos-engine | `e4230f62b55fcf8543477a26d272862a63aa1fc3` |
| sealed-core-nomos (content-only identity consumer) | `ba7abc0b471a0385012b1d8a03cf4942e9da617e` |
| template-core-logos (po2.5 graph) | `141abe23273273d2e4470ce15b42ccf9bc5c8764` |
| template-rust-logos (po2.5 graph) | `96eda934a8f3203295f0a08869199441f109c369` |
| equivalent-core-nomos (po2.5 graph) | `e1b2febf9f143ab1c84d042d2e9bdd0685303ddc` |
| language-engine-witness | `ce51afb64e0664c0e4950d8a38197803f5b65c03` |
| raw-discovery | `7290f65bbb5e7825ab2ca58340631d154d69d110` |
| structural-codec | `f47fac132722916912b7071556f69cbbf4026f7f` |
| schema-language | `9c217610c4b8d3bdaa9f95542e28c04424a593e3` |
| schema-rust | `3721656b0a654d47d9abde31f14d89d01f9305cf` |
| signal-spirit | `1cf7c010029de46369b742687da4fa1ca6def9a9` |
| meta-signal-spirit | `0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3` |
| spirit | `1049b8a1a9e3c2be7ece3553b89c7e3815939d43` |

The three Spirit-family pins retain the existing `PublicTextSearch` process
witness until its successor feature revisions are independently audited and
published.

The schema-language and schema-rust pins are frozen donors: the language they
implement was ruled dead under its old name 2026-07-27 (S1R entry 7) and is
now Ethos, and neither repository gains new consumers. Both pins remain here
only because the pinned Spirit-family flake closure still builds through
their wired-legacy schema/schema-rust toolchain; Spirit's port onto
Ethos-based generation has not landed (blocked at bead
`protos-engine-po1.10.11`).

The identity/Capsule producers are ordinary flake inputs rather than source-only
inputs. This lets the assembly expose their published test derivations directly.
On `x86_64-linux`, the root check surface passes through the content-identity,
name-table, signal-frame, signal-sema-translator, sema-engine, sema-translator,
protos, core-ethos, core-logos, rust-logos, core-nomos, signal-nomos, and
nomos-engine test derivations. It also exposes sema-translator's dedicated
real-process derivation and protos' package-contents derivation as separate
checks.

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
producer, translator, generic Capsule, the legacy carrier edges retained by
core-ethos/core-logos, and the content-only protos/core-nomos/signal-nomos/
nomos-engine edges. Chain-based and runtime edges are checked separately by
`scripts/check-slice-one-coherence`. The identity gate deliberately does not
demand universal transitive equality: the cores' direct legacy per-item
identity/archive and flat name-table dependencies remain on their established
typed revisions.
The legacy 0.3 identity crate and dependency-renamed 0.4 Capsule identity crate
form a deliberate typed firewall. Rust reports `E0308` when values cross those
crate revisions accidentally; keeping every affected producer edge exact is
what prevents that mismatch without pretending the legacy graph has migrated.
The gate therefore proves a coherent published carrier foundation without
claiming universal migration of the retained compatibility graph.

`scripts/check-slice-one-coherence` validates every chain-based language edge
and the native authored Nomos runtime edges against the exact root revisions.
It covers the canonical cores, rust-logos, neutral protos frame dependency,
signal-nomos, nomos-engine, and every language-engine-witness alias. Its
mutation suite rejects revision, repository, package-alias, protocol framing,
projection-advance, stale-refusal, and restart drift. Production-source scans
also enumerate every regular `nomos-engine` `src/**/*.rs` file and refuse the
retired evaluator and central storage vocabulary.

`scripts/check-po-two-five-coherence` retains the exact po2.5 integration labels
beside the current graph. It verifies that rust-logos and the po2.5 core-nomos
revision consume the struct-capable core-logos revision, that core-nomos uses
rust-logos through the `textual-rust` dependency label, and that the owner
retains the exhaustive five-transformer structural-equivalence and mutation
witnesses.

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
separate process witness terminates and restarts the pinned native Nomos engine
against isolated temporary state and proves durable recovery and resumed
progression. The current process path authority-seals authored Nomos, deploys
it through the native daemon, transforms nonempty Ethos, advances its
authenticated NameTree projection, restarts on the same `nomos.sema`, resumes
at projection 1, rejects stale projection artifacts, and preserves the
current-deployment no-op before stale CAS ordering. The wrapper also realizes
nomos-engine's 15-test owner gate and signal-nomos's typed protocol suite.
Daemon readiness and every process socket read/write are bounded to ten
seconds, and coherence mutations reject removal of those deadlines.
It additionally realizes the owner's exact read-only Spirit-domain source
inventory comparison, carries all 41 items and 369 variants through durable
typed Ethos and Logos plus structural Rust emit/decode, and constructs all 369
authored enum variants in scratch Cargo. `ScopeOf` and the two Vector newtypes
that depend on its output remain typed structural data without a fabricated
runtime. The wrapper dependencies ensure a producer-pin change cannot
reuse a behavior result without rebuilding the relevant coherence closure.

Run the same owning published suite explicitly with:

```sh
nix run .#public-text-search-witness
```

The witness uses only temporary test data. Nothing in this repository operates
on live production state.
