# Slice One Rulings — firsthand session log, 2026-07-27

Provenance: live session between the psyche and the Claude management
session on 2026-07-27. Every psyche quote below is verbatim from that
session. The agent text is the exact question or statement he
answered. Entries are append-only; supersede by appending; conflicts
resolve by recency.

Relation to ShapeAndSliceRulings-2026-07-26.md: entry 8 there (the
confirmation of five previously unsourced rulings) belongs to this
same 2026-07-27 session and precedes entry 1 here.

## 1. Capsule container — generic struct

**Agent (Claude):** presented Codex's slice-1 decision 1 — capsule
container, struct or enum — against his earlier "im not actually
sure": an enum with a variant per kind versus a generic struct with
kind as a type parameter, kind-distinct types by construction.

**Psyche 2026-07-27:** Generic struct

## 2. Daemons are stateful; sema is each daemon's database

**Agent (Claude):** reported the implementation as it stands — one
central sema-storage daemon as sole durable write authority, with the
schema/nomos/logos engines as stateless socket clients — citing its
ARCHITECTURE.md claim of the settled 2026-07-17 ruling "seat it
centrally in sema".

**Psyche 2026-07-27:** sema is the database of each daemon. either you
are mistaken, or the implementation is. each daemon is stateful

**Psyche 2026-07-27,** of the 2026-07-17 central-in-sema ruling: which
was later overruled

**Psyche 2026-07-27:** We could have a shared component just for the
nametable, while the rest of the data lives in each daemon

## 3. No sema-storage daemon; the nametable authority is its own small daemon

**Agent (Claude):** asked whether the shared nametable component is
(a) its own small daemon the three daemons consult for name→ID
binding, or (b) a shared library over one shared durable store.

**Psyche 2026-07-27:** sema is the storage engine for all our daemons,
so this repo will confuse everyone with its misleading name. which
means that  'seat it centrally in sema' means a separate daemon, and
wasnt correctly voiced. I shouldnt have said "in sema", since all
daemon state lives in *its* sema db. There can be no sema-storage
daemon, as it would overload the term sema.

**Psyche 2026-07-27:** a,  its own small daemon

Log note (log-authored, not psyche words): the durable never-re-mint /
never-rebind identity-authority laws move into this daemon; the
sema-storage repo cannot keep its name and its stateless-client
architecture is superseded; its ARCHITECTURE.md "settled" claim is
dead law.

## 4. Unified namespace; no SchemaStandard variant

**Agent (Claude):** presented Codex's slice-1 decision 3 — adding
SchemaStandard as a new namespace variant holding the seven builtins
as typed prior members.

**Psyche 2026-07-27:** I dont see any problem with all components
sharing a unified namespace; it's just an integer to string
correspondance, including the "standard" or "builtin" terms. am I
wrong?

Log note (log-authored): the agent confirmed he is not wrong;
SchemaStandard is not needed — builtins are ordinary prior entries in
the unified table; redefinition remains an error at seal. Supersedes
"one nametable for each component" (2026-07-19). The per-component
variant survives as slice structure of one global namespace (see entry
5: enum at the root).

## 5. The sema vision — psyche-initiated dictation

**Agent turn:** none — Psyche initiated.

**Psyche 2026-07-27, verbatim in full:**
"There's an interesting twist here, ironically, with the agent having
decided on its own to call the current name component SEMA or SEMA
storage. It might actually be more appropriate than I first thought,
since the idea of SEMA originally was for this perfectly typed,
perfectly specified schema-based language. And by schema here, I'm not
talking about our language, which might need a different name just
because it's confusing. Maybe something that goes along with Nomos and
Logos. But it could become a universal name storage component that
would allow all demons to store anything that, not all strings,
obviously, because some of the fields are actually long blocks of
strings for holding long strings like records that agents need to
write and read as strings, obviously. And obviously, I also intend to
change that eventually, but that's a very, very long-term thing. But
at least all of the other, or maybe anything that is a single word,
maybe we have a type for that, which allows us to have a kind of
dynamically assigned enum of sorts with variant names that are not
strictly enums and variants in the runtime as Rust sees them, but that
have limits on how they can be spelled and are stored as integers
using this SEMA naming component, which would allow us to start
specifying SEMA as I see it, which is bigger than just, it's not that
it's bigger than a database, but it means more than just a database.
It's a new way of thinking about data, which doesn't contain strings
eventually. So this could be the first step. We would need a component
that can translate these identifiers, which would be integers, and
this name table concept that we've fleshed out in this engine. That
component could then extend to do more. And so I'm leaning on a side
of maybe not SEMA storage is not the right name. Maybe SEMA translator
to use the noun approach that I've been trying to migrate towards. And
we could put that also, some of this in standards, also how we name
components by nouns as an aside. But obviously 16-bit integer is not
going to fit all of language, all of the words and all the languages,
all of the spoken human or all of human languages. So it has to be
broken up. It can't be one flat table for all languages. That would be
absurd. But anyway, this is all stuff that we can change later. I
would start with an enum at the root, which we always prefer or almost
enforce actually in daemon interfaces so that we can split the domain.
So maybe we should be using already done, already specified schemas. I
think schema.org or something like that has an ontology already pretty
specified. And maybe they have something on language. It's not a big
deal, but let's just talk about this. See if you can explain it back
to me quickly or on the face of it anyway."

Agent restated; Psyche confirmed with three refinements:

**Psyche 2026-07-27, on dynamic enums:** which could later be
re-compiled into proper enums, while keeping their place in the
translator table

**Psyche 2026-07-27, on the no-strings end-state as intent:** almost,
if it is extracted into a universal. the ultimate computer language
cannot use strings, since they are an extremely inefficient way of
representing a set (which language is)

**Psyche 2026-07-27, on the names, root variant set, and ontology
borrowing being matter:** something to distill into standards; which I
want to lean on more, and use more now

Log note (log-authored): "sema-translator" is a leaning, not a fixed
name; the root variant set and any schema.org borrowing are matter.

## 6. Newtype wrapped-field visibility — Private

**Agent (Claude):** presented Codex's slice-1 decision 4 — schema has
no datum for WrappedField.Visibility; should nomos emit Private for
slice 1, per his own 07-22 example "Newtype.CommitSequence.{ Public
[<attrs>] { Private Integer } }".

**Psyche 2026-07-27:** yes, Private

## 7. The language is Ethos; repos renamed; NOTA keeps its name

**Agent (Claude):** offered rename candidates over several rounds
after his request "any idea for a schema rename?".

**Psyche 2026-07-27, rejecting rounds:** nothing pull me. nota is fine.
we arent tied to greek. eidos isnt very evocative for english speakers

**Psyche 2026-07-27:** no, not english

**Psyche 2026-07-27:** no, nothing pulls me

**Psyche 2026-07-27, on Ethos:** yes, ethos

**Psyche 2026-07-27, on the repo:** can we rename the repo and point
the old repo name to the new one? If so I want that done

**Psyche 2026-07-27, on the living family (schema-engine, core-schema,
signal-schema, tree-sitter-schema):** yes, we'll have all those renamed
as well.

Log note (log-authored): executed 2026-07-27 — core-schema →
core-ethos, schema-engine → ethos-engine, signal-schema →
signal-ethos, tree-sitter-schema → tree-sitter-ethos; GitHub redirects
live; local mirrors moved. Legacy schema, schema-language, schema-rust
die under their old names. Crate, type, and pin renames ride the
correction train. NOTA is not renamed.

## 8. Identity is Variant.ContentAddressedHash — variant-only

**Agent (Claude):** presented Codex's slice-1 decision 5 (a distinct
content-hash domain for whole-logos EncodedLogos) and explained the
current scheme's kind tag inside the hash computation.

**Psyche 2026-07-27:** I think it's better if it's
Variant.ContentAddressedHash

**Agent (Claude):** asked whether the variant is the sole carrier of
kind (inner hash over pure content bytes) or the kind also remains in
the hashed bytes.

**Psyche 2026-07-27:** Variant-only

Log note (log-authored): kind lives solely in the outer variant,
protos-style like Schema.Id16; the hash pre-image is pure content;
content-identity's domain-tag-in-preimage scheme is superseded and
existing digests move — fold into the one bump train with fresh locks.
Whole-logos becomes its own variant kind; decision 5's "preserving
existing individual-item identities" holds at the identity level while
their digest bytes move with the scheme change.

## 9. Confirmation of the strict-invariant sentence

**Agent (Claude):** a full provenance sweep (design logs, all of
reports/, every repo under the ghq root) found no source for the
sentence that heads every summary of this system: "nametree and
structural tree from the protos library drive all the decoding and
encoding to/from text with DATA - strict invariant. nothing else will
do." The substance is corroborated by his verified words ("this drives
all textual en/decoding, including rust"), but the sentence itself was
unlocated. Asked whether those are his words.

**Psyche 2026-07-27, verbatim:** yes. those are my words

Provenance note (log-authored, not psyche words): the original turn
remains unlocated in the read sources; the sentence is quoted as it
circulated; this entry establishes it as a psyche-confirmed ruling by
his 2026-07-27 confirmation, not as a firsthand transcript.

## 10. How questions are brought — conduct rulings

Appended 2026-07-28 from a re-mining of the same 2026-07-27 session
transcript (session 49d0a8e0). These turns precede entry 2
chronologically; they are appended here because the log had carried
their consequence only as derived text in the handover ("every
question put to the psyche must be explained in practice"). The
firsthand words follow.

**Agent (Claude):** presented Codex's slice-1 decision 2 as "decoding
receives an explicit assignment map (e.g. CommitSequence ->
Schema(u16))", recommending yes.

**Psyche 2026-07-27** (excerpt; an operational line about worker tiers
omitted): am I supposed to understand this? Do you? Like *actually
understand* what that means in practice?

**Agent (Claude):** re-explained decision 2 in plain terms —
parse-order numbering versus a durable assignment map — and asked
"Yes to the map?"

**Psyche 2026-07-27:** that still doesnt explain anything about this
"stored tabe" - where is it stored? how is it shared between the 3
daemons? How are stale entries dealt with? probably more questions I
havent thought of

**Agent (Claude):** in the same message answered by entry 7's "yes,
ethos", asked for a ruling on Codex's decision 5 (whole-logos
content-hash domain). The third line of that psyche message, omitted
from entry 7, was:

**Psyche 2026-07-27:** 5. explain

Log note (log-authored, not psyche words): the ruling on decision 5
came only after the mechanism was made concrete, and came as a
reshaping (entry 8), not as the yes/no that was posed. Together these
turns ground the standing conduct law firsthand: a question is
explained in practice — where a thing is stored, how it is shared,
what happens on failure paths — before a ruling is asked; a yes/no
wrapped around an undesigned mechanism gets sent back.

## 11. Naming-exercise constraints

Appended 2026-07-28 from the same re-mining. This turn opens the
naming exercise recorded in entry 7 and precedes its quoted
rejections.

**Agent (Claude):** proposed "Eidos" for the schema language,
completing a Greek -os triad (Eidos, Nomos, Logos), with three
alternatives, all Greek.

**Psyche 2026-07-27:** look for more candidate, the -os isnt a
constraint, and a new name for NOTA as well

Log note (log-authored, not psyche words): the -os suffix is not a
constraint on family names. The request for a NOTA rename was
reversed within the same exercise by entry 7's "nota is fine";
recency gives the reversal the floor.
