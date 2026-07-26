# Shape and Slice Rulings — firsthand session log, 2026-07-26

Provenance: live session between the psyche and the Claude management
session on 2026-07-26. Every psyche quote below is verbatim from that
session. The agent text is the exact question or statement he
answered. Entries are append-only; supersede by appending; conflicts
resolve by recency.

Relation to ProtosEngineDesign-2026-07-26.md: entries R1 through R5
there were logged secondhand from prompt files carried to Codex. This
file is the firsthand record of the same rulings plus two later ones.
Where wording differs, this file is exact; in particular the capsule
question in R1 there is a paraphrase — the exact wording is entry 1
here.

## 1. Capsule composed-nametree pin — ruled

**Agent (Claude):** The addendum from my previous session says you
ruled on 07-26 that a capsule pins the complete composition of its
nametree. The committed design log says the opposite: that "Yes." was
composed by an agent from your silence after you were asked twice and
moved past it, and it lists the question as still open. The published
capsule contract requires the complete composed pin today. Did you
actually rule "the complete composition"?

**Psyche 07-26:** yes

## 2. Rust structural rules are fully typed records

Context: shown Codex's rendering of the newtype grammar as
Product["struct", name, (...), ";"], the psyche had replied (to
Codex): "wtf is this garbage? Thats a vector of strings, not typed
data! it should be fully typed struct."

**Agent (Claude):** One question — which shape do the Rust structural
rules take? 1. Fully typed rule records: rust-logos defines a typed
vocabulary; each grammar rule is a typed record whose positions are
typed; disjointness is proven over typed positions. 2. Keep the
generic protos vocabulary and teach the prover positional comparison.

**Psyche 07-26:** 1

## 3. The typed-record ruling reaches the protos kernel

**Agent (Claude):** Q1 — does the typed-record ruling reach the
protos kernel itself? Fixing Product into typed positions (and the
related identity shapes) moves content hashes — sealed tables and
stored digests stop matching, requiring a layout bump. The cheapest
moment is now: zero production consumers depend on those digests,
spirit isn't repinned, and you already ruled byte-exactness out. My
recommendation is yes — bump now, before slice 1 gives the hashes
consumers.

**Psyche 07-26:** if you think it's a good idea, then yes.

Ruled yes: one deliberate layout bump, now.

## 4. Scope of the variant-wrapped-u16 ID ruling

**Agent (Claude):** Q2 — how far does your variant-wrapped-u16 ID
ruling reach? 1. Type-ids in the codec (ScopedEncodedTypeId,
EncodedConstructorId) — bare public u32, no language dimension. 2.
Wire contract IDs (ContractId is a NonZeroU32 in signal-frame). 3.
ShortCode (a plain u64, domain-erased). My recommendation: 1 yes, 2
no, 3 yes.

**Psyche 07-26:** ok

Ruled: type-ids become language-variant-wrapped u16; wire contract
IDs stay; short codes gain the kind dimension. Clause 3's stored-value
elaboration is superseded by entries 6 and 7 below.

## 5. Name projections — confirmation of the original design

**Agent (Claude):** Proposal: name projections — derived text becomes
a typed algebra over identifiers, evaluated only at textualform time.
(NameProjection with Exact / Cased / Composed / Disambiguated;
segments are identifiers; evaluation by per-language textualform
data; nomos constructs projections as pure typed data.)

**Psyche 07-26:** I thought that's what I had designed

Status: a confirmation that this is the standing design, not a new
ruling. The implementation had inverted it by evaluating derivations
early in nomos and storing the text.

## 6. Short identifiers are display projections — supersedes entry 4 clause 3

**Agent (Claude):** every capsule carries a short identifier — the
little base36 code ("0000" … "zzzzzzz").

**Psyche 07-26:** no, it's a full content-addressed hash. the short
identifiers is for common display operations, which will use a method
on the hash which solves for the 4 or more chars shortened version
that doesnt conflict in the db

Capsule identity is the full content hash plus the ruled nametree
pin. The short identifier is never stored: it is a method on the hash
solving for the shortest non-conflicting rendering, minimum 4
characters, against a database view. The stored ShortCode value
model, its mint, and its archive adapters are retired.

## 7. Short displays are kind-distinct types

**Agent (Claude):** A schema capsule's short code and a nomos
capsule's short code were the same Rust type.

**Psyche 07-26:** they should be a different type for sure

Composed with entry 6: the display projection's result type carries
the hash's domain tag — one generic definition, distinct types per
capsule kind by construction.
