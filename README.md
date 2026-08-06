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
allowlist source-free. `NON_IDEAL_AGENTS.md` is a required regular file in that
surface, and the shape self-test proves its removal is rejected.

## Pinned family

Every repository input uses a full, published Git revision:
| Root input | Revision |
| --- | --- |
| capsule-content-identity | `896b21e17f31b66d0802bff899b4b60acea9c0f1` |
| content-identity | `fdf2db1d5a9e8ea52d24d39a03833c3e6885c355` |
| core-ethos | `249ed6ac5b8a3a84fee5884bcb35b929f07e9166` |
| core-logos | `abee4036fbeb58c767ef7dc3489804e2afd5c6e1` |
| core-nomos | `a5e9aeeed90445a7df57ee1c4fda8e4be761b985` |
| equivalent-core-nomos | `e1b2febf9f143ab1c84d042d2e9bdd0685303ddc` |
| language-engine-witness | `de82d144f62adb48eb148de922af4483f2bad251` |
| legacy-protos | `1343d0c405cdb6929552ea6b12c48739e73f35ab` |
| meta-signal-spirit | `0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3` |
| name-table | `a22f48d8040ab9235f3552ad8654ff8e27b8157d` |
| nixpkgs | `91cc1fdf6831e29b6c98768e721a72241f3d0797` |
| nomos-engine | `c9a424d67e753e53b51b677e4b22182021fb823e` |
| nomos-protos | `1263f9d1f73b57885d695ac033bdd6faa1334ddf` |
| protos | `65e7c6d4692a40e1c49deffb3fb4a9a2c3555c5b` |
| raw-discovery | `2d4e2e00f2821c4e2893fa96028cef0ac76e9644` |
| rust-logos | `250e728fa9e5a02e3c9a6d4f0cfee0683863df83` |
| schema-language | `9c217610c4b8d3bdaa9f95542e28c04424a593e3` |
| schema-rust | `9bd0767a387774ea70f8cf4b9b5e3d3617cf7671` |
| sealed-core-nomos | `ba7abc0b471a0385012b1d8a03cf4942e9da617e` |
| sema-engine | `6dd09d9308fcd3b30e9aadb2a5e51b95a5d6b99e` |
| sema-translator | `bc8410dfe4d449cc0e820a2c5b4d44496ad92acd` |
| signal-domain | `fc07af4e0c8c70a8a0d083d400bf7ba0df9dae76` |
| signal-frame | `0786fbe8caf27552afcdd5deb85bc82ec6088337` |
| signal-nomos | `bdcf54021e880f75ab693d00e3707478ca7de487` |
| signal-sema-translator | `3a26cb43f8ce7f9fe85da64d19aa55aa662943ce` |
| signal-spirit | `1cf7c010029de46369b742687da4fa1ca6def9a9` |
| spirit | `1049b8a1a9e3c2be7ece3553b89c7e3815939d43` |
| stream-core-ethos | `29237c33798db908bbfe10ef0cffe2c6a28be508` |
| stream-core-logos | `a960aacff8ed13dc14b0ae0094208189d6609434` |
| stream-core-nomos | `6ef64cc38a104836b2b236ba4838ffd8e75dced1` |
| stream-language-engine-witness | `efe8ed3d5ea53f280b93cc1f2f131d92ef781832` |
| stream-nomos-types | `a7b831e0540a8ad263cd07ed44ec4c95c56771fb` |
| stream-protos | `95aeb1470c549a404518faf1ab0280a36583a2b3` |
| stream-rust-logos | `f92a8eccd851ebb1f8140ec42e00b04ba73758d0` |
| structural-codec | `413e3744569ca237e837a1fd57d9ba6ad6adc3de` |
| template-core-logos | `141abe23273273d2e4470ce15b42ccf9bc5c8764` |
| template-rust-logos | `96eda934a8f3203295f0a08869199441f109c369` |

The three roots changed by the bootstrap-generation removal deliberately name
their tested code revisions. Their later documentation-only heads are
`core-ethos` `fe18d80198332c765354b7e565d8154f5c4c5eb9`, `core-nomos`
`f5af9f5998a2c49c1a62dc62187d6169934b6a04`, and `nomos-engine`
`7012236738dfc806bdc52d4f4131baa2b84a2dd8`. Keeping the code revisions in the
table preserves one exact Cargo closure while recording the prose revisions
without creating a second dependency world.

The three Spirit-family pins retain the existing `PublicTextSearch` process
witness until its successor feature revisions are independently audited and
published.

`schema-language` remains a frozen donor only for the pinned Spirit-family
closure. `schema-rust` is also a current bootstrap projection producer: its
published owner checks compile the generated code, and `sema-engine` consumes
that checked projection for the current Sema table runtime. The current Rust
projection is a replaceable stage, not a permanent definition of any file
kind.

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
nor repository status changed. Root inputs must be exactly the table above;
each root original and locked record must agree
on a full 40-hex revision and the locked record must carry a `narHash`. Root
branch, path, and extra inputs are rejected.

Transitive inputs belong to the immutable pinned producer flake closures. Their
locked originals may retain branch metadata from a producer only when the lock
also records an immutable full revision and `narHash`; the stricter branch-free
rule applies to this repository's root inputs.

`scripts/check-identity-capsule-coherence` compares the affected direct Cargo
edges with those exact root revisions. Its table includes the final integrity
producer, translator, generic Capsule, the legacy carrier edge retained by
core-logos, and the content-only protos, current core-nomos, signal-nomos, and
sealed-core-nomos edges. The current core-ethos and nomos-engine closures no
longer participate in the Capsule gate; their complete direct code edges are
checked by `scripts/check-slice-one-coherence`. The identity gate deliberately
does not demand universal transitive equality: retained direct legacy per-item
identity/archive and flat name-table dependencies remain on their established
typed revisions.
The legacy 0.3 identity crate and dependency-renamed 0.4 Capsule identity crate
form a deliberate typed firewall. Rust reports `E0308` when values cross those
crate revisions accidentally; keeping every affected producer edge exact is
what prevents that mismatch without pretending the legacy graph has migrated.
The gate therefore proves a coherent published carrier foundation without
claiming universal migration of the retained compatibility graph.

`scripts/check-slice-one-coherence` validates every direct producer edge in the
current bootstrap language path against the exact root revisions. It covers
the canonical cores, rust-logos, the neutral Protos frame dependency, the
translator/projection/domain/engine chain, and each live
language-engine-witness Cargo edge and alias. It also proves that the witness
has only its two explicit integration tests and that `nomos-engine` exposes the
authority-sealed bootstrap library witness: exact Logos archive recovery,
explicit Sema storage evidence, and refusal of storage evidence for other
kinds. Production-source scans enumerate every regular `nomos-engine`
`src/**/*.rs` file and refuse retired evaluator and central-storage vocabulary.
Mutations reject producer, repository, package-alias, Interface/Nexus/Sema
framing, transaction, authority boundary, live-test inventory, and refusal
drift.

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
and Slice One coherence derivations succeed. The Nexus owner source has the
complete `Nexus.{1 0 0}` header, imports, and body. One authority-approved
transaction lowers through bootstrap Nomos to identified Whole Logos,
survives archive recovery, carries unit, unary, and product semantics through
the current structural Rust projection, refuses incomplete projections, and
compiles and runs the result in scratch Cargo.

The root also consumes `sema-engine`'s producer-owned Sema proof. Its
`Sema.{1 0 0}` header/imports/body source is authority-assembled into a checked
projection whose typed table is written, read, closed, and reopened through
the engine. No Sema source or generated table is copied into this sink or the
language witness.

The Nomos owner proof is now a library boundary. An authority-sealed Nexus
transaction lowers to identified Whole Logos and restores the exact archive;
Sema lowering consumes caller-supplied storage provenance, while non-Sema
kinds reject that provenance. The sink also proves the deleted daemon/process
suite cannot re-enter through automatic test discovery, Cargo dependencies, or
Nix inputs. Persistence, sockets, receipts, and restart behavior are therefore
not claims of this bootstrap closure.

The Spirit-domain owner source is the complete `Interface.{1 0 0}`
header/imports/body transaction and must equal the source published by
`signal-domain`. It carries 41 top-level types and 369 variants through the
same authority-verified lowering, whole-Logos identity and archive recovery,
and a current Rust projection byte-identical to the producer's checked output;
scratch Cargo constructs all 369 variants. `ScopeOf` and both
`Vector<DomainScope>` declarations remain typed applications. Producer-pin
changes therefore rebuild the relevant source, coherence, and behavior
closures.

Run the same owning published suite explicitly with:

```sh
nix run .#public-text-search-witness
```

The witness uses only temporary test data. Nothing in this repository operates
on live production state.
