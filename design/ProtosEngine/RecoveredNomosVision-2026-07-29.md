# RecoveredNomosVision — 2026-07-29

Agent-compiled recovery document. On 2026-07-29 the psyche saw "where Nomos
lives" presented as an open decision and ruled the presentation wrong: his
design existed and had been lost. A recovery sweep of the kept quote archives
(`primary/reports/logos/`) and the session transcripts located it. This
document restores the recovered firsthand psyche quotes to the authoritative
design surface with provenance. The quotes control; the compiled commentary
here is agent interpretation. Recency governs across entries; the 2026-07-29
triple-language statement (PsycheVisionReacquisition entry 4) is the newest
anchor and none of the recovered material contradicts it.

## The recovered quote chain, chronological

2026-07-11, session 0fd2d07c line 402:

> actually, we should keep nomos, because it is its own language syntax.
> logos is a rust-equivalent, but our macros will not be rust macros

2026-07-11, design-v0.md line 267 (the honest starting point, superseded by
everything below):

> I don't know about NOMOS

2026-07-13, session 0fd2d07c line 572, recorded as design-v0.md rulings
25a-25e:

> since nomos is a macro language, it would utterly retarded to declare
> Macro everytime

> we should use a structural syntax, since this will be hard to tell from
> the rest of the syntax; it just looks the same as everything else, which
> is why macros conventions use `$` or `#` type prefix.

> We also need to be able to call more macros recursively.

2026-07-13, nomos-macro-model-v1.md lines 67-70:

> so if WireNewType only takes a name and inner type, then the input field
> would be `{ Name Type }`. Name and Type could be pretty standard things,
> perhaps nomos builtins, even a concept shared with schema somehow (it is a
> schema concept after all).

2026-07-17, session 29d00eb1 line 108 (the founding TextualForm/EncodedForm
vision):

> that means a major part of the vision was lost, or ignored. I had a great
> vision for a shared abstraction around textualform and encodedform (use to
> be called true/core) ... a nametree and a structuretree ... textualform
> trait writes and reads the name and structure trees ... this drives all
> textual en/decoding, including rust ... actually, the vision even allowed
> multiple textualforms per encodedform; logos -> logos or logos -> rust ...
> even nota can take this architecture; it would be the basic/most-universal
> example.

2026-07-17, textual-form-vision-design-v1.md lines 78-80 (ruling): Nomos gets
a structural table so plain raw NOTA decodes into macros first, with the
dollar-sigil / double-angle template spelling coming later as a second form
("we can do that"). Two TextualForms for Nomos over one EncodedForm: a
plain-NOTA base door and a richer `$`/`<<>>` sibling.

2026-07-17, textual-form-vision-design-v2.md lines 385-392 (the
proto-language, later named Protos in the same document):

> (NOTA is the base every language specializes) -- that wasnt the right way
> to say whan I mean; the basic syntax structure of nota (but actually more
> accurately; schema) - how delimiters are used, capitalization and the
> typed inner blocks approach to parsing; this is what I mean by the
> universal aspect, the proto-language behind all of them. it probably needs
> a name. it builds on clojure (syntax; use all the delimiters elegantly)
> and shen (kernel - encodedform (we add + nametree + structuretree = real
> computer language and atomic editing of code + type safety) and rust
> (strictness, type-safety enforced by the runtime).

2026-07-18, session 29d00eb1 line 735:

> I want the conversion to happen with the encoded form. So the schema
> encoded form is sent along with the name table to the Nomos encoded form,
> and that's what's used to convert using the macros into logos. So
> essentially it's a real type conversion. There's no string manipulation
> involved when the conversion happens.

2026-07-19, session 2b8a714b line 39:

> yea, one nametable for each component. nomos uses the schema nametable to
> populate the logos nametable (and uses its own to read/write from/to its
> own encodedform)

2026-07-20, recorded in protos-engine-psyche-handover-2026-07-21.md line 24:

> the nomos transformation happens after files are read into the
> encodedform, both in schema and nomos.

> There isnt really a logos source; logos is all generated from a nomos
> transform on schema (encodedform); we can get the logos textualform to
> inspect the result. or we might hand-write some logo to test stuff in
> logos.

2026-07-22 14:19 UTC, session bc636bdb line 444 (the most detailed load-path
statement, previously absent from the entire authoritative surface):

> I think I was first designing thinking the nomos logic would be applied to
> schema text, but then later realized that it would be pure-data
> transformation (the data for this machinery is *populated* (possibly, but
> not necessarily) by parsing nomos files (with a manifest for dependency
> resolution and an entry-point file) into nomos encodedform + nametree
> data - only after the nomos data is loaded in its daemon (with a slot,
> ostensibly; it should be able to run several versions - same
> short-addressale ID concept we use so much; agent-friendly <- we need that
> documented somewhere, maybe we need an 'umbrella repo' (if we dont have
> one already) to hold all the 'standard machinery' documentation like this)
> can the schema tranformation request use the slotted nomos transformer to
> send its encodedform + nametree (we need a standard generic type to
> contain them with universal methods for reusable code in the protos
> library) to generate logos encodedform + nametree, and probably then rust
> textualform

2026-07-22 20:10 UTC, session 496a4870 line 37:

> no, not at all; schema is the sugar, sweet syntax. creating a field for
> complex objects is *not* sweet

2026-07-22 20:12 UTC, session 496a4870 line 54 (the lost follow-up that
connects the sugar ruling to nomos):

> that's why schema uses nomos; to create the abstraction in a
> transformation that creates an adaptable syntax with nomos transformers

## The "make them the same thing" tension, dissolved

The 2026-07-28 compilation §10 records an "unreconciled contradiction"
between "schema is the sugar, sweet syntax" and "make them the same thing -
exceptions are symptoms of bad design". Recovery located the original
context (session bc636bdb line 360, 2026-07-22 12:31 UTC): the agent had
presented the grammar rule "bare name = any PascalCase atom except the
keywords", and the psyche replied:

> to me, this screams of "make them the same thing" - exceptions are
> symptoms of bad design

"Them" was bare names and keywords in the grammar: builtins are prior
definitions, not grammar-level keyword exceptions. The sugar ruling eight
hours later answered a different question (declaration heads vs the item
envelope). The two rulings address different layers and do not conflict.
The compilation's contradiction entry is dissolved by restored context, not
by inference.

## What this settles

Compiled reading (agent interpretation; the quotes above control):

- Nomos is its own language with its own syntax, its own files, its own
  EncodedForm, nametable, and structural table, loaded through the same
  protos TextualForm mechanism as ethos and logos.
- Nomos syntax is structural protos-family; escape/template positions are
  visually distinguished, with `$` or `#` prefix named as the convention
  precedent (2026-07-13). Ruled 2026-07-17: the plain-NOTA base textualform
  comes first; the sigil-rich template spelling is a later second
  textualform over the same EncodedForm. Multiple textualforms per
  encodedform is founding vision.
- Recursive macro invocation is required.
- Nomos loading uses a manifest for dependency resolution and an entry-point
  file; the "not necessarily" hedge preserves the operational-editing
  endgame where files are bypassed.
- The nomos daemon runs slotted, versioned transformers addressed by the
  short-addressable ID concept.
- Ethos (schema) and nomos have authored files; logos has no source in the
  ordinary case but may be hand-written for testing and inspection.
- The extension ".nomos" is agent convention, never psyche-ruled; the
  principle of own files is ruled, the extension is matter.

## Loss accounting

The 2026-07-28 compilation absorbed none of the above quotes; the
NomosAuthoredRulesDesign-2026-07-29 report's claim that "no partial
authored-Nomos design was found in the design surface" was false — prior
design existed in nomos-macro-model-v1.md, textual-form-vision-design-v1/v2,
and up-close-design-v1.md in the kept archive, and in the session
transcripts cited above. This document is the restoration; future
compilations must absorb it.
