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
`public_text_search_returns_direct_ranked_records`. That owner test creates a
`TempDir`, places the Unix socket and database beneath it, launches the real
Spirit daemon process, records temporary fixtures, and queries
`PublicTextSearch`.

Spirit currently exports the containing `test-nota-text` suite as a Nix check
but does not export the single named test. Consequently:

- `public-text-search-witness-contract` verifies the named owner witness and
  its temporary process boundary remain present at the pinned revision.
- `public-text-search-owner-suite` re-exports the published owning Nix test
  derivation.
- `public-text-search-witness` is a generic runner for that same published
  owner suite.

This is an integration limitation, not permission to add engine code here.

## Pin advancement

A producer revision advances only after it is published and independently
accepted. The sink then updates the full revision, refreshes `flake.lock`,
reruns structural and behavioral checks, and publishes the resulting sink
revision after its own independent audit.
