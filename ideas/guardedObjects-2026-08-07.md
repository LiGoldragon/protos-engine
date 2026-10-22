# Idea: Guarded Objects (Engine Reference Admission)

Status: deferred by the psyche, 2026-08-07 — "It's a cool idea. We
don't have to do that now." Recorded here because the psyche wants a
place in the engine's meta repository for ideas of this kind.

## The idea

Extend Ethos/the engine with something Rust cannot express: a guarded
object. The engine stores, for any object, a guardian set — the set of
objects (or a trait, or a capsule) permitted to hold references to it.
Because every reference is a stored fact in the dependency DAG and the
sealed operation interface is the only way a reference comes into
existence, admission is checkable at the moment of authorship: an
operation that would create a reference to a guarded object from
outside its guardian set refuses with a typed error, exactly as the DAG
law refuses cycles. The illegal dependency is unwritable rather than
detectable.

## Why it is stronger than module-tree privacy

1. Per-object granularity: the boundary is the object and its exact
   trusted callers, not whatever shares a module/file.
2. Enforced at authorship, not at build time: no window where a
   violation exists and later fails.
3. Queryable both directions: "who may touch this" is the stored
   guardian set; "who does touch this" is a DAG query. The audit region
   for an invariant is enumerable.
4. No unguarded write paths: with source living in the engine, there is
   no linker/transmute-shaped side door (cf. the 2026 Coldcard
   rng_get() symbol-shadowing theft — a name bound by an unguarded
   resolver).

## Context

Motivated by the 2026-08-07 visibility research: shadowing is
structurally impossible under absolute EncodedName references, and the
psyche ruled invariant protection the only surviving purpose of
visibility (design/ProtosEngine/visibilityAndGuardedObjects-2026-08-07.md
in primary). The sealed Memory consumer trait approved for Core Ethos
(bead primary-hqu.26) is the bootstrap-Rust shadow of this rule: what
the sealed trait approximates inside Rust's crate system, the guardian
set would state natively in the engine.
