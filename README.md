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

`scripts/check-dependency-direction` scans the pinned family manifests and
flake inputs for that forbidden reverse edge. `scripts/check-repository-shape`
keeps this repository source-free.

## Pinned family

Every repository input uses a full, published Git revision:

| Repository | Revision |
| --- | --- |
| content-identity | `ac0075842799b3ece8909ad0eb4b8a92b596b188` |
| name-table | `a1705ef512efec28925ae3ffc9faa5a2aa4dc4a8` |
| raw-discovery | `c27a9efabb1981c8b3d887c870fff82fc7daf49c` |
| structural-codec | `e5fa1b3bbdde13f3dac205920b16a2e73f3d4487` |
| protos | `c6fa54c066a1210bbba026d9d761bb3ef5b8af5f` |
| schema-language | `9c217610c4b8d3bdaa9f95542e28c04424a593e3` |
| schema-rust | `3721656b0a654d47d9abde31f14d89d01f9305cf` |
| signal-spirit | `1cf7c010029de46369b742687da4fa1ca6def9a9` |
| meta-signal-spirit | `0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3` |
| spirit | `1049b8a1a9e3c2be7ece3553b89c7e3815939d43` |

The three Spirit-family pins retain the existing `PublicTextSearch` process
witness until its successor feature revisions are independently audited and
published.

## Checks

Run the reproducible evaluation and check surface:

```sh
nix flake show
nix flake check --print-build-logs
```

The current Spirit flake does not export its exact
`public_text_search_returns_direct_ranked_records` test as a standalone output.
The `public-text-search-owner-suite` check therefore delegates to Spirit's
published `test-nota-text` owner suite, which includes that test. A separate
structural check proves the pinned suite still launches the real daemon with
socket and database paths beneath a `TempDir`.

Run the same owning published suite explicitly with:

```sh
nix run .#public-text-search-witness
```

The witness uses only temporary test data. Nothing in this repository operates
on live production state.
