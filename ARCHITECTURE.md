# Architecture

## Role

`protos-engine` owns cross-repository assembly and conformance. It is a
dependency sink, not a component producer and not a Rust engine crate.

The canonical implementation remains distributed across independently
published micro-repositories. This repository records exact revisions, checks
their joint direction and shape, and delegates behavioral proofs to the owning
published repositories.

## Invariants

1. There is no Cargo package, workspace, library, `build.rs`, or Rust
   implementation here.
2. No component source is copied, vendored, generated, or relocated here.
3. All repository inputs resolve from full published Git revisions and
   `flake.lock` records their content-addressed closure.
4. Nix-only assembly edges point from `protos-engine` to producers. No
   component has a Cargo, path, or Nix input edge back to `protos-engine`.
5. Stateful behavior stays owned by the producing repository. This repository
   invokes that published test surface rather than reproducing its daemon,
   protocol, fixtures, or test logic.
6. Process witnesses use isolated temporary sockets and data. Production state
   and production endpoints are outside the test surface.

## PublicTextSearch witness

The pinned Spirit repository contains
`public_text_search_returns_direct_ranked_records`. That active, non-ignored
owner test creates a `TempDir`, places the Unix socket and database beneath it,
launches the real Spirit daemon process, records temporary fixtures, queries
`PublicTextSearch`, and asserts the returned records.

Spirit currently exports the containing `test-nota-text` suite as a Nix check
but does not export the single named test. Consequently this repository
narrows the pinned published test derivation's check phase without copying or
reimplementing the test:

- `public-text-search-witness-contract` verifies executable test membership,
  assertions, and the temporary process boundary.
- `public-text-search-exact-test` selects the `process_boundary` target and
  exact function, requiring `1 passed; 0 failed` in the result.
- `public-text-search-owner-suite` retains the complete published owning Nix
  test derivation as a separate check.
- `public-text-search-witness` runs the exact narrowed check.

This is an integration limitation, not permission to add engine code here.

## Slice One behavior witness

The pinned `language-engine-witness` repository owns the complete Slice One
behavior proof for Nexus. Its source is the complete `Nexus.{1 0 0}`
header/imports/body form, not an unnamed positional carrier. The owner seals
that exact source as one authority-approved transaction, passes the verified
reader and transaction to bootstrap Nomos lowering, proves whole-Logos
identity and archive recovery, and exercises unit, unary, and product type
semantics. The current Rust projection round-trips structurally, refuses an
incomplete name projection without partial output, and compiles and runs in a
process-local scratch crate.

Sema evidence remains producer-owned. The pinned `sema-engine` source begins
with `Sema.{1 0 0}`, an imports section, and one body. Its owner test assembles
that exact source under authority, checks the generated projection is fresh,
then writes, reads, closes, and reopens the generated typed table through the
real engine. The sink validates those source and test surfaces; it does not
copy the Sema declaration or generated table.

The current native Nomos wire does not yet carry a successful archived
bootstrap population. The witness therefore proves the complete bootstrap
transaction in process and separately proves that arbitrary, unarchived wire
bytes are refused by the real Nomos daemon. It makes no persisted native-Nomos
restart claim. Authored Nomos continuity is instead proved at the authority
boundary: one plan is sealed, refused before its receipt is durably read,
materialized after that read, recovered across an authority-process restart,
and renamed without changing content identity. A separate manifest test sends
one authority request for the resolved file population and proves missing,
cyclic, external-`Invoke`, and source-root-escape graphs leave no receipt.
The Nomos engine is an exact process-only Nix input to the owner witness, while
the current bootstrap Cargo producers remain a distinct typed generation.

The pinned owner also checks the complete current Spirit domain as an
`Interface.{1 0 0}` header/imports/body transaction. Its canonical bytes must
equal the source published by `signal-domain`. The decoded Interface contains
41 top-level types, 38 enumerations, three newtypes, 369 variants, and 37
payload variants; authority-verified lowering preserves whole-Logos identity,
and the current Rust projection must be byte-identical to the producer's
checked projection. Scratch Cargo constructs all 369 enum variants. `ScopeOf`
and both `Vector<DomainScope>` declarations remain typed applications rather
than compatibility substitutes.

## Slice Three strict stream lifecycle

The strict stream path is an authored `Stream` initiation with a typed query
and event. Termination is implied in authored Ethos and rendered as a separate
generated operation over the same typed handle. `nomos-types` owns the pure
initiation and termination data, and Protos owns only `StreamIdentity`,
`Stream`, `StreamOpen`, and `StreamEvent`; a third close trait and runtime
state do not belong to that contract surface.

`check-slice-three-coherence` pins the complete producer chain through
nomos-types, Protos, Core Ethos, Core Logos, Core Nomos, Rust Logos, and the
language-engine witness. It verifies the strict dependency aliases against
the sink roots and checks the owner evidence for initiation-only syntax, the
resolved direct-success/termination contract, zero strict-stream deferral,
the emitted typed handle/refusals, and runtime behavior. The witness compiles
its runtime implementation directly beside the actual Rust Logos emission;
it does not replace the generated contract with handwritten duplicate types.
The behavior witness consumes every owning repository's published Nix test
surface. Runtime storage remains process-local to the owner test.

## Po2.5 structural equivalence

The po2.5 producer train remains pinned under explicit compatibility labels
beside the current po2.6 graph. The `template-core-logos`,
`template-rust-logos`, and `equivalent-core-nomos` labels identify exact
published revisions; component package and repository names remain canonical.

The owning core-nomos test exhaustively converts the five-definition legacy
wire fixture into the generic authored representation and compares kinds,
ordered signatures, complete identity ancestry, constructors, stable roles,
recursive sequences, literals, futures, splice semantics, fragment outputs,
revision, defaults, and the separate ordered generation selection. Mutation
witnesses reject semantic drift. Its retained legacy lowering run is a
structural-proof-implied sanity check over the same evaluator, not independent
behavioral evidence. `check-po-two-five-coherence` verifies the three direct
producer edges and the presence of those owner witnesses before accepting the
published owner test derivation.

## Lock policy

Root source inputs are a closed set proved by two independent surfaces. The
pure derivation parses the committed `flake.lock`. The live gate obtains real
metadata only by running
`nix flake metadata --json --no-write-lock-file path:$repo`, compares its
evaluated lock graph to the committed lock, and rejects any lock rewrite or
repository-status change. No lock-derived object is presented as metadata.

Every root original is a GitHub owner/repository/full-revision record; the
locked record must repeat that revision and provide its `narHash`. Root branch,
path, follows, and extra source inputs are invalid. Declaration mutation
witnesses keep a stale committed lock while changing an existing root input to
branch, path, and different owner/repository/revision forms; all must fail the
live gate without rewriting the lock.

A producer flake may retain branch metadata inside its transitive lock graph
only when the transitive locked node still has an immutable full revision and
`narHash`. Those transitive records are closure evidence from the exact pinned
producer; they do not weaken the branch-free root policy.

## Pin advancement

A producer revision advances only after it is published and independently
accepted. The sink then updates the full revision, refreshes `flake.lock`,
reruns structural and behavioral checks, and publishes the resulting sink
revision after its own independent audit.
