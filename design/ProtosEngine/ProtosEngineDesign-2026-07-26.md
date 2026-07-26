# Protos Engine — Design Log — 2026-07-26

Source: psyche turns paired with the agent text each answered, drawn from
`claude_pairs2.txt`, `pi_pairs.txt`, `claude_ante.txt`, `pi_ante.txt`,
`x2/human.txt`, `x2/codex_clean.txt`. Quotes are verbatim. Contradictions are
resolved by recency — the later entry wins.

## Engine invariant

### Design is his words, nothing else

> **Agent:** Producers sit at current tips; five consumers sit at
> pre-extraction protos revs.
>
> **Psyche 07-26:** it seems you're unable to give me the design
>
> Do you really think that *I told you this*?
>
> Then it's *NOT* design!
>
> MY DESIGN MOTHERFUCKER!

### Identity is the number, never guessed

> **Agent:** old Entry number 7 with all the existing values, new Entry
> number 23 receiving all new writes. The machine has no idea they're "the
> same."
>
> **Psyche 07-17:** if it got re-ID'ed then its not the same, and if it's
> the same and got re-ID'ed, the system is implemented wrong

### Fields are positional, never named

> **Agent:** `<visibility-field>.Public`
>
> **Psyche 07-19:** THERE ARE NO FIELDS NAMES!
>
> ALL FIELDS ARE POSITIONAL!
>
> FIELD NAMES ARE ALMOST NEVER ALLOWED!
>
> WRITE IT SOMEWHERE YOU WONT FORGET!
>
> MAKE PROTOS SKILL CORRECT, AND MAKE IT A PART OF MANAGER!
>
> I NEVER WANT TO SEE THIS AGAIN!

> **Agent:** Spirit's stream declaration in the *legacy* dialect, where legs
> carry names.
>
> **Psyche 07-19:** the legacy dialect had the same field-name illegality.
> so you double fucked up
>
> ok im certain now; field names are now COMPLETLY ILLEGAL EVERYWHERE

### Text is a bridge, not the program

> **Agent:** text is one mouth of the program
>
> **Psyche 07-21:** I dont like this analogy. text is the current standard
> programming interface; it is what we *must* work with in order to get to
> the future interface

### EncodedForm has no concept of files

> **Agent:** TextualForm (filename -> text chunks)
>
> **Psyche 07-21:** to be clear; encodedform has no concept of files;
> decoding to "filename" must be a "beautification" algorithm, maximizing
> low-repetition and small-but-not-too-small filesizes. so not guaranteed to
> output the same separation or even filename. we don't need filename
> concepts in encodedform, its purely a file-management and cognition
> isolation interface. if im not mistaken

### No exceptions in the grammar

> **Agent:** bare name = any PascalCase atom except the keywords
>
> **Psyche 07-22:** to me, this screams of "make them the same thing" -
> exceptions are symptoms of bad design

### Redefining anything already defined is an error

> **Agent:** 1. **Reserve the built-ins.** `Integer`, `String`, `Vector`,
> etc. are not legal as declared type names. Overlap gone, prover wired
> into seal, ambiguous decode becomes impossible by proof — your original
> ruling made real.
> 2. **Sanction one fallback.** Prover enforces disjointness for
> everything, except the declared-name case is explicitly the last-tried
> catch-all. Ordering survives in exactly one blessed place.
> 3. **Order is the law.** Drop the disjointness proof; authored order
> decides all conflicts. Least machinery, no protection.
>
> Which one?
>
> **Psyche 07-22:** it should be an error, whenever anything tries to
> define something already defined, like builtins. does that solve the
> problem?

### An agent's misreading is not a psyche law

> **Agent:** forbidden list that includes not just free service functions
> and hidden globals but also "receiver-less associated operations" — which
> in Rust includes every ordinary new() constructor
>
> **Psyche 07-24:** I never meant to forbid this kind of thing. the agent
> misunderstood my instructions

## Structural parsing

### One shared decoding mechanism

> **Agent:** the structurally distinct spellings — bare name for the
> simple case, dotted block for the complex — are the accepted decode
> forms of its different constructors; and which variant you get is
> decided by which form the structure matches.
>
> **Psyche 07-23:** I want a shared mechanism (either a trait, type,
> whatever) for all of this structure-based decoding which is re-used by
> all the different parts of the machinery that do parsing (and deparsing
> would use a parallel shared machinery)

### Textualform is the family's own term

> **Agent:** textual-rust is the bypass
>
> **Psyche 07-23:** I dont agree with that choice of words. we call it
> textualform, so you're disagreeing with the terms USED IN THE CODE.
>
> You're VERY confusing and windy right now. I dont like it. I think I gave
> you too much context and its confusing you

### Textualform traits force structural data

> **Agent:** Rust has a TextualForm; today it is implemented with
> hand-written match arms, and your ruling is that it becomes per-type
> textual-form data run by the shared evaluator
>
> **Psyche 07-23:** the textualform traits should force the use of
> structural data

### Rejecting "reject" — the bypass is being replaced, not rejected

> **Agent:** textual-rust is the bypass — the one textual form with
> hand-written match arms and no structuretree, rejected in your own words;
>
> **Psyche 07-23:** Reject in my words? Wtf are you talking about? NO!

> **Agent:** replacing textual-rust's hand-written Rust reader/printer
> with a data-driven Rust structuretree
>
> **Psyche 07-23:** right, so how is that rejecting it? That's DEMANDING
> it, you moron
>
> WTF are you saying I rejected. I dont fucking trust you fucking monkeys

### Structural parsing finds outside boundaries first

> **Agent:** No question is needed if sealed forms can handle this while
> preserving fixed tokenization — for example through lawful glued
> punctuation structure, accepted decode forms, or canonical spacing. We
> stop and ask only if implementing actual Rust proves that
> expectation-sensitive token splitting is unavoidable.
>
> **Psyche 07-24:** structural parsing doesnt reacting blindly on
> characters; it has a state-machine to de/parse the type by finding the
> outside boundaries first, and passing through the inside of that block
> again and again, recursively and structurally.

## Syntax

### A close leg is real — the stream keeps four legs

> **Agent:** that line is the real, existing schema artifact — Spirit's
> stream declaration in the *legacy* dialect, where legs carry names. It's
> not invented syntax. But I showed it in a discussion about the new
> language without labeling it as legacy, which makes it read as candidate
> Protos — and the gate I had just installed is supposed to catch exactly
> that presentation failure. The rule needs to cover not just fabricated
> spellings but unlabeled foreign ones. That, plus your point about the
> vocabulary we use ("text" when I meant the authored schema surface,
> versus the daemons' binary runtime), is noted for a later skill pass —
> no agent sent for it, as you said:
>
> **Psyche 07-19:** and yes, we should have a stream close event

### Logos items: every kind takes the brace

> **Agent:** the logos payload-shape ratification (struct field pairs,
> enum variant lists)
>
> **Psyche 07-22:** youre confusing two things here; logos has a few types
> defined, and they will all need multiple typed structs to express
> everything that rust expresses. So there will be an
>
> Struct.X.{} just like there will be an Enum.X.{} (think of all the
> config/options/derives/whatever-theyre-called-features-in-rust that need
> to be specified!)

### rust-logos may have one hand-written evaluator object, as a first MVP

> **Agent:** One remaining question: may rust-logos contain one
> hand-written, Rust-specific evaluator object — with parsing and emission
> as methods on that real object — while every individual TextualForm
> remains sealed structural data?
>
> **Psyche 07-24:** sure, if you think that's a good first MVP

## Schema, Nomos, Logos, Rust — the pipeline

### One nametable per component

> **Agent:** **Name tables.** One per stage (schema's, plus the logos one
> Nomos produces with its new names), dropping the shared/overlay idea you
> backed away from?
>
> **Psyche 07-19:** yea, one nametable for each component. nomos uses the
> schema nametable to populate the logos nametable (and uses its own to
> read/write from/to its own encodedform)

### Working programs, not byte-exactness

> **Agent:** **The byte-exact goldens.** Lineage B currently proves itself
> byte-exact against the old generator's output, but you ruled "working
> programs, not byte-equivalence." Keep those goldens as temporary
> inner-loop scaffolding until self-host works, or retire them now? This
> is a real tension the worker surfaced rather than settled.
>
> **Psyche 07-19:** I dont care about byte-exactness. get rid of that.
> working programs is what we want.

## Capsule

### The name

> **Agent:** **Done.** keel is deleted from GitHub and disk — verified
> unresolvable. `LiGoldragon/documentation` is live: private, described
> "Standard machinery documentation for the sema ecosystem," cloned at
> `repos/documentation`, seeded with the minimal README and pushed to
> `main`. It waits empty, per your rule: populated once the code reflects
> the design.
>
> The one word still yours: the wrapper's name — **Slot** (my
> recommendation, your own old definition matured), Capsule, Hold, or one
> you mint.
>
> **Psyche 07-22:** Capsule

### The full vision, dictated in one breath

> **Agent:** (none — he opened this)
>
> **Psyche 07-23:** So if we have a capsule for every namespace, which
> essentially mirrors the concept of a file in a regular programming
> paradigm, then because the potential name conflicts are dealt with at
> each layer, and because local objects are non-conflicting outside that
> capsule, we get no naming conflicts. So what happens when the code
> actually gets emitted into a compilable form like Rust is that all of the
> object names are fully qualified. Like, they get their full name all the
> time, so you never ever ever get a naming problem in the compiler,
> because everything is fully named with its namespace. Because we treat
> Rust like an assembly language, we can use it like one. So we can create
> capsules everywhere. We can create a top-level capsule, which is
> essentially your... You could have even different kinds of capsules. We
> should. I mean, each... Yeah. You can have a top-level capsule that's
> basically your manifest. Yeah, like the equivalent in file of your
> manifest. And then this resolves all of the top-level namespaces,
> basically. And if we want different kinds of sub-objects, we can write it
> at that level. Maybe there are different types of programs. I don't know.
> But I don't think so. I think every capsule after that is either another
> namespace capsule, basically, which we're basically creating abstraction.
> Basically, it's a way of classifying, I guess, your program, and it could
> also mirror how things are compiled. So maybe the concept of the file can
> somewhat live on in creating domain classification, basically. It's also
> actionable data, in a sense. But no, actually, every one of those
> capsules can be homogenous because they can all have sub-namespaces. So
> your top-level capsule might be where you find the... It might be the
> only one that's different because it's where you find the... If this is
> an executable or a library, I guess. Actually, every one of them can
> decide to be an executable or a library, which is interesting. Or a
> module, which then just gets used. I don't know. I would need to know, or
> someone would have to match that against the compilation model of Rust
> and how it treats objects and sub-objects, like how fine-grained does it
> get. We could sort of mirror that in how we organize the capsules and
> then create fields to declare, is this an executable or a library? And
> then declare sub-namespaces. Are they public or private? Which would just
> limit access, I guess. But this is all more Rust mechanic-related. Logos
> doesn't have to follow Rust exactly. It's a more correct way of seeing
> programming, but it does need to kind of accommodate Rust so that we get
> the most out of it. So we have to balance those two variables.

### Compilation target and full qualification avoid name conflicts

> **Agent:** mutually-referencing capsules either share one crate or break
> their cycle.
>
> **Psyche 07-23:** but if we specify the compilation target (which
> capsule we want to emit as a compiled artifact), then would that problem
> be avoided?

> **Agent:** method-dot calls (fix exists — emit the UFCS form; the typed
> node is already in the model)
>
> **Psyche 07-23:** we still dont get name-conflicts, since a method call
> is on a FQO (full-qualified-object)

### Capsules are not made crates by fiat, but the correspondence is useful

> **Agent:** once capsules become crates
>
> **Psyche 07-23:** I didnt say capsules become crates. I said we can have
> a useful correspondance, which we can sometimes use. The impl could
> simply be always emmited with the type in the rust generation. It should
> be quite easy, since we can lookup all impls with a certain encodedID
> very easily. And we don't need to make the rust generation match the
> capsule separation in all cases; we can have other algorithms driven by
> the size of the generated code (it would be good to keep the generated
> artifacts as accessible as possible; very big code files are not easy to
> deal with)

### Capsule and short-identifier are protos traits, not their own repos

> **Agent:** One placement ruling is required: should Capsule and
> short-identifier each become its own canonical micro-repository —
> capsule.git and short-identifier.git?
>
> "Yes" establishes them as sibling producers. "No" requires you to name
> their alternative micro-repository homes.
>
> **Psyche 07-25:** no, those are protos concepts, so they become protos
> traits, with implementations in each schema, logos, nomos, and rust-logos

### ShortCode moves into content-identity

> **Agent:** content-identity may already be that library: 432 production
> lines, the dependency leaf, deps rkyv + blake3 only, holding ContentHash,
> HashDomain, domain separation and layout versioning. Adding ShortCode to
> it costs ~223 lines and gives one spelling for all four implementors.
>
> **Psyche 07-25:** yes, content-identity is that library — add ShortCode
> to it

### rust-logos does not get its own capsule

> **Agent:** (his own correction, no separate agent proposal quoted in
> source)
>
> **Psyche 07-25:** re: rust capsule; youre right, my bad; rust-logos
> doesnt get a capsule. which means we need an object that deals
> exclusively with the textualform transformation, but is associated with a
> capsule, like rust

> **Agent:** Is the association fixed or open?
>
> **Psyche 07-25:** fixed of course.
>
> it would allow for multiple syntaxes to be supported (like the older
> schema syntax which could be made to work, as well as the new one, but
> both would only support schema capsule)
>
> OR, rust has also a capsule, which uses the same logos encodedform, so
> the rust is a different syntax for logos?

## Identity

### Aliases, ruled out

> **Agent:** This confirms the distinction and recommendation above.
> Awaiting your explicit ruling on transparent Protos aliases: **reject**
> or **retain**.
>
> **Psyche 07-20:** no aliases

### Encoded identity is the only durable one

> **Agent:** I believe so — two reasons, one structural and one deeper:
> **The structural one:** it makes the envelope fixed-arity for every item
> kind. [...] **The deeper one:** `{ Private Integer }` *is the type's
> definition body* — the same kind of block a schema declaration carries.
> [...] Did I get the reason you had in mind, or is there a third one I'm
> missing?
>
> **Psyche 07-22:** yes — encoded identity is the only durable one; the
> skeleton hash moves freely when the spelling's structure changes.

## Repository topology

### keel is deleted; documentation is the repo

> **Agent:** 1. **Delete keel outright, create `documentation` fresh** —
> clean slate, historical content gone forever.
> 2. **Rename keel → `documentation`** — same end state (one repo named
> documentation, empty at HEAD), history retained in the attic.
>
> Say 1 or 2 and it runs, along with the standing sequence: code first
> (wrapper, mint, slots in protos), documentation repo populated once the
> code reflects the design.
>
> **Psyche 07-22:** that's so old you might as well use egyptian
> hieroglyphs to guide us

### Micro-repos, not a monorepo

> **Agent:** the family's identity and naming crates exist in two places
>
> **Psyche 07-24:** we dont use the monorepo style; destroy the
> duplication by keeping the micro-repo approach

> **Agent:** micro-repo ruling confirmed knowing it reverses the July-19
> consolidation?
>
> **Psyche 07-24:** Yes, the consolidation was never approved

### protos.git holds the common daemon traits

> **Agent:** protos.git's fate as the home of the common daemon traits
>
> **Psyche 07-24:** yes

### protos-engine is a new assembly repo, not an engine source repo

> **Agent:** One ownership question comes first: does the working engine
> live in a separate canonical micro-repository, while protos.git remains
> traits/contracts only, or does protos.git now own both contracts and the
> engine?
>
> **Psyche 07-25:** ahh, you mean a repo that assembles it all together?
>
> could be a protos-engine repo; mostly just nix code with launch scripts

> **Agent:** (none — he opened this, elaborating on his own prior answer)
>
> **Psyche 07-25:** yes, protos-engine also contains tests

> **Agent:** (none — he opened this, elaborating on his own prior answer)
>
> **Psyche 07-25:** protos-engine.git is a new ASSEMBLY repo, not an
> engine source repo

## Acceptance

### The near roadmap

> **Agent:** the cross-criome propagation design you ruled in early July —
> is implementing its receiving side near-roadmap?
>
> **Psyche 07-20:** near roadmap is getting everything running on the new
> protos engine and testing the hell ouf of it

### Working programs is the bar

> **Agent:** **The byte-exact goldens.** Lineage B currently proves itself
> byte-exact against the old generator's output, but you ruled "working
> programs, not byte-equivalence." Keep those goldens as temporary
> inner-loop scaffolding until self-host works, or retire them now?
>
> **Psyche 07-19:** I dont care about byte-exactness. get rid of that.
> working programs is what we want.

## Derived rulings — not psyche words

The following are agent-authored formulations that he confirmed, approved,
or relayed with a short assent. The law's substance carries his authority;
the wording is the agent's, not his own.

### Global longest-match lexical law

> **Agent:** I recommend one global longest-match law: at each cursor,
> consider every configured token, delimiter, carrier, trivia, and
> application trigger; choose the longest complete match; reject
> equal-length semantic ties when sealing the profile; never scan forward
> to an unrelated closing quote; start bare atoms only when no configured
> trigger starts there; stop them before the next trigger; and forbid empty
> carrier prefixes. Numeric families would use an explicit
> leading-character-class token kind.
>
> The alternative is authored precedence data, which permits
> language-specific ordering but makes token resolution depend on priority
> policy and weakens universal ambiguity proof.
>
> Should the recommended global longest-match law govern every sealed
> lexical profile?
>
> **Psyche 07-24:** (no explicit reply to this exact question was found in
> the read source; a later same-session message treats the law as already
> driving implementation — "The ruling is now driving Slice 1
> implementation in canonical raw-discovery.git and structural-codec.git."
> His assent is implicit in what follows, not a captured verbatim "yes.")

### Dependency-sink: nothing may pin protos-engine

His own words settle the shape of the repository — "protos-engine.git is a
new ASSEMBLY repo, not an engine source repo" (see Repository topology,
above). The mechanical enforcement law itself is agent-composed:

> **Agent:** PROTOS-ENGINE.GIT — new ASSEMBLY repo. Contains nix code,
> launch scripts, and cross-repo tests. It pins the micro-repos; it does
> not publish any library crate. It is not ENGINE source: nothing links
> against protos-engine. Hard boundary, mechanically checked: a dependency
> sink. Grep every Cargo.toml in the family for protos-engine as a
> dependency — the answer must always be zero. Its deps on the four
> micro-repos are published git revs, never path deps.
>
> **Psyche:** (this formalization was recorded in an agent-authored
> "PSYCHE RULINGS + VERIFIED STATE" session document, not confirmed by him
> word for word in the read source; his own ruling is the protos-engine
> repository-topology quotes above, from which this law is composed.)

## Contradictions

### Alias admission

Earlier the same day, a five-item slate that included alias admission was
reported back to him as accepted (the report's own words: "Alias
admission — mechanism-only approval of the transparency route you
accepted"). Later the same day, asked to rule explicitly:

> **Agent:** This confirms the distinction and recommendation above.
> Awaiting your explicit ruling on transparent Protos aliases: **reject**
> or **retain**.
>
> **Psyche 07-20:** no aliases

Recency is the rule: "no aliases" is the standing law. Transparent Protos
type aliases do not exist. (Referent aliases — the separate, unrelated
Spirit domain concept of alternate names for real-world subjects — are not
addressed by this ruling either way.)

## Open questions

Questions he was asked and did not answer in the read source, or that
remain unruled as of the last entry above.

1. **Capsule composed-nametree pin.** Whether a Capsule's single pinned
   "nametree identity" covers only its owned slice or the complete composed
   namespace (borrowed slices and all). Codex asked this directly, twice,
   on 07-23. No verbatim psyche reply was found in the read source. Later
   agent-authored documents treat the complete-composition answer as
   settled; that treatment is not psyche-sourced in what was read here.
2. **Capsule container: enum or struct.** "I think capsule should be a
   trait, and it could be contained by an enum or a struct - im not
   actually sure." (07-23)
3. **Micro-capsule: full pin or light pair.** Whether the private
   micro-capsule a complex object's fields may need (per the 07-23 "each
   complex object might need a field for its own private micro-capsule"
   remark) carries the full Capsule pin machinery or a lighter pairing.
   Not addressed further in the read source.
4. **Function parameters and let-bindings: do they keep names?** The field
   name ban is settled for struct fields and declaration bodies. Whether
   the same ban reaches function parameters and local let-bindings was not
   addressed in the read source.
5. **Manifest: typed value or file-index config.** The manifest's exact
   shape — a typed value in the engine, or boundary configuration mapping
   files to namespaces — was not settled in the read source.
6. **reify/reflect: eventually derived?** Not addressed in the read
   source.
