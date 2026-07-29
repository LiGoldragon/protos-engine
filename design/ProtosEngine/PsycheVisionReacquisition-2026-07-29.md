# PsycheVisionReacquisition — 2026-07-29

Design log for the 2026-07-29 psyche-vision reacquisition session. Append-only:
supersede an entry by appending a later one; never edit; recency governs.

## Entry 1 — the schema→ethos rename extends into quotes, via bracket convention

Agent text answered: the poison-treatment agent flagged one passage it
deliberately left untouched — sema-engine documentation carrying the
direction-language "the schema component holds the compiled binary runtime
schema", attributed to a Spirit record — because rewording quoted material
risked misrepresenting it. The flag was relayed to the psyche in chat with that
line quoted.

Psyche:

> this is because schema didnt have a daemon before. we should rename the new
> stack schema -> ethos (even in the quotes, we could do [ethos] to imply the
> rename after the fact, while the statement still applies, just with a
> different name)

Reading (agent interpretation, not psyche wording): the stale "schema" in that
statement is era-naming from before the stack had a daemon; the statement
itself still applies. The new-stack rename schema→ethos therefore extends into
quoted statements: edit the quote using the bracket convention — "[ethos]" in
place of "schema" — to signal an after-the-fact rename while preserving that
the statement holds under the new name. This applies to quotes about the new
stack that predate the 2026-07-27 rename (the sema-engine passage first). It
does not rename the frozen donors' own historical self-descriptions
(schema-language, schema-rust die under their old names), and the firsthand
rulings logs in this design tree remain append-only and unedited.

## Entry 2 — the rename covers all protos-engine documents, not only quotes

Agent text answered: the manager applied entry 1 as a quotes-only convention
and reported "It came down to exactly one edit — the flagged passage itself",
with the sweep having skipped live prose such as "schema-derived components"
and "schema contracts" as out of scope.

Psyche:

> I was talking about all the documents related to protos engine; schema was
> renamed ethos, was it not?

Reading (agent interpretation, not psyche wording): entry 1's quotes-only
scope was the manager's narrowing, not the psyche's. The schema→ethos rename
(ruled 2026-07-27, SliceOneRulings entry 7) applies across all documents
related to the protos engine: ordinary prose renames plainly; quoted or
attributed material uses the "[ethos]" bracket to signal the after-the-fact
rename. Unchanged boundaries: frozen donors keep their historical names (they
die under their old names); literal code identifiers, package names, and file
paths that still exist under old names stay accurate as literals; the
firsthand rulings logs remain append-only and unedited.

## Entry 3 — the textual style is named protos

Agent text answered: the manager's chat distillation of the TextualNomos
design described the proposed syntax as written "in the NOTA family's
existing boundary style".

Psyche:

> Protos - the style is called protos - That could go in a few places.

Reading (agent interpretation, not psyche wording): the boundary/document
textual style shared by the language family is named protos — consistent with
the protos library's ruled role as the sole driver of all decoding and
encoding between text and data. Documents describing that style should name
it protos rather than "NOTA family style" or similar circumlocutions, and the
naming belongs in the several doc surfaces that describe the style. Where
"NOTA" names the concrete record notation itself, that name stands; it is the
style of the family's textual documents that is named protos.

## Entry 4 — the triple-language vision: why the engine is three languages

Agent text answered: the manager reported the NomosExtended machinery
findings (a one-character glyph allowance, no escape syntax designed) and
held corrections to the TextualNomos design pending recovery of the psyche's
original authoring vision. The psyche responded with the following dictated
vision statement, recorded verbatim and in full.

Psyche:

> We have three languages, ethos, nomos, and logos. And all three use the
> same mechanism to load to and from textual form into encoded form. They
> have their own syntax. Well, they look very similar. They're all protos
> family languages, like NOTA is actually, you could say, the fourth language
> in the foundation. The foundation concept that led to the triple, to the
> separation in three of the engine so that we could get a proper
> representation at each level. The separation in three was necessary. Nomos
> is there to create the sugar syntax, the beautiful syntax of ethos, and
> logos is there to give us a true representation of essentially our assembly
> language, if you will. Kind of like Shen's kernel lambda. So, you know,
> from this high level perspective, it's a fairly simple idea. And while some
> logos may be written as in not generated through the nomos transformer from
> ethos, most logos will be generated, if not all of it, from ethos through a
> nomos transformation. But the entire reason why we have nomos is so that we
> can modify the transformation using the nomos language. So if the nomos
> language was never implemented, then the entire engine is currently a
> failure because the whole point of creating nomos was to be able to modify.
> It's essentially, we were writing so many Rust macros. And Rust has
> essentially become the new assembly language. And there's a big problem
> with how the flow has developed for writing, especially complex projects
> with AI, which is that we can't really go straight into the code because
> the concept is too complex. And if we start with the code, then agents sort
> of lose track of the entire thing, or it's too difficult to develop because
> something gets implemented without taking the whole into consideration, as
> we can witness now, right? Because for some reason, I thought that you guys
> understood this when Codex started his slices a few days ago. And yet you
> didn't. So it's very easy for agents to, especially because we don't have a
> proper, I would call it the meta-harness, which is a way to concretely
> guide and structurally manage AI agent sessions so that they actually make
> sense based on an ontological framework. So we have to sort of juggle them
> by hand. And it's very easy for things to fall through the cracks. So
> there's several reasons why we do things the way we do, one of which is to
> create separate components, which forces agents to not write too much slop
> because the components have to be able to interact with each other and also
> avoids a problem whereby they write, they short circuit the logic
> somewhere. If we write a big monolithic engine, it would be easy for agents
> to like bypass code. And then other agents would read the code that gets
> bypassed and think that, oh, it's implemented properly, not knowing that
> the whole thing is never used in practice or that it's bypassed sometimes,
> which is also a failure. So the reason I'm approaching this triple layer is
> manifold, one of which is to keep agents honest and the other is to create
> a stable ethos syntax while allowing us to deeply change the behavior of
> what that syntax actually does in practice by changing nomos while also
> allowing us to extend, maintain, improve, debug, or support of the Rust
> syntax and the Rust functionality, the Rust compiler, basically, with the
> logos layer, which also gives us an incredible debugging interface. So
> hopefully this helps you. You can continue the archeological work with
> this, but there you have it. And let's talk about this further.

Reading (agent interpretation, not psyche wording): this settles, at the
vision level, that nomos is a language with its own syntax and textualform,
loaded through the same protos mechanism as ethos and logos — three similar
protos-family syntaxes over one load mechanism, with NOTA as the foundational
fourth. Direct logos authoring is permitted though most or all logos is
generated. The nomos language being modifiable-as-language is the engine's
reason to exist; its absence is, by the psyche's stated criterion, an engine
failure to be corrected as the priority. The rationale (agent honesty through
component separation, stable ethos over changeable nomos, logos as the
assembly-truth and debugging layer) orients all downstream implementation
choices.
