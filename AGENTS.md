# Protos Engine Agent Contract

This repository is the dependency sink and cross-repository conformance surface
for the Protos micro-repository family.

- Do not add a Cargo manifest, Rust source, `build.rs`, library, package, or
  workspace.
- Do not copy, vendor, or relocate component implementation into this
  repository.
- Pin every repository input to a published full Git revision.
- Keep dependency direction one-way: this repository may assemble component
  repositories through Nix, but no component may depend on `protos-engine`.
- Run stateful witnesses only against process-local temporary data. Never point
  a check or script at production state.
- Keep substantial checks in `scripts/`; `flake.nix` remains their readable
  index.
- Use Jujutsu for history and publication.
