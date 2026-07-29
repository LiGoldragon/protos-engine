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
behavior proof. Its owner tests decode a complete six-slot Ethos document with
translator-issued declaration and reference chains into an application-backed
newtype and an enumeration with unit and positional tuple variants, archive
and restore the Whole Ethos carrier, lower through the direct typed Nomos
transformation, verify Whole Logos identity and archive recovery, structurally
emit and decode Rust, refuse incomplete projections without partial output,
and compile and exhaustively run the generated forms in a process-local
scratch Cargo crate.

The same published owner suite retains its isolated process continuity test:
it terminates and restarts the delivered engine processes against the same
temporary database, verifies archived state recovery, and proves a second
document progresses durably after restart. `protos-engine` does not copy those
tests. Its existing Slice One coherence script validates the witness's exact
producer aliases and executable evidence, including mutation refusals for
identity and restart drift. The root behavior derivation depends on pin,
direction, and coherence results before accepting the published owner result.

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
