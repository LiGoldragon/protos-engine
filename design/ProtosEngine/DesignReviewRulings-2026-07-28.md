# Design Review Rulings — firsthand session log, 2026-07-28

Provenance: live session between the psyche and the Claude management
session on 2026-07-28, reviewing the most load-bearing components of
the engine design. Every psyche quote below is verbatim from that
session. The agent text is the exact question or statement he
answered. Entries are append-only; supersede by appending; conflicts
resolve by recency.

## 1. Token-level longest-match is law

**Agent (Claude):** during review of the text→EncodedForm component,
asked whether token-level longest-match may be recorded as ruled law:
a token is the longest run its character class accepts (`Id16`, never
`Id1` then `6`); the refusal law continues to govern rule-level
ambiguity above the token level. Context given: the compiled log had
carried the global longest-match law only as implicit assent, listed
as open question 8 with the instruction to neither assert nor ban it.

**Psyche 2026-07-28:** yes, longest-match is law

Log note (log-authored, not psyche words): closes open question 8.
The law is lexical — it decides where a single token ends. Typed
disjointness proof and conservative refusal continue to govern
everything above the token level.

## 2. The name table is a pure lexicon — one global exact table

**Agent (Claude):** analyzing Codex's translator-daemon proposal,
asked whether a spelling's uniqueness is scoped per root — (root,
spelling) keying, the same word allowed under different roots as
distinct identities — or global, any cross-root reuse refused. The
worked example keyed the table by kinds: `Builtin.3 <-> "Integer"`,
`Visibility.2 <-> "Public"`.

**Psyche 2026-07-28, verbatim in full:**
"Your question doesn't make sense to me. So, the name table is just
the whole string. So, I don't understand why it's built-in three.
Like, it's just integer. When Rust is compiled, there's no more
integer, right? That string is gone because it's a variant or
something like that. So, we need a way to represent that reality
where these strings don't exist in the real program. In Logos, we
need to be able to represent that in a state, which is a state before
compilation. So, when Rust doesn't have any more strings, it's
already compiled, which means the source code is gone now. I want to
create the state in which it's still source code, Logos, but there
are no more strings. So, your question doesn't actually make sense. I
don't understand why there's a variant there. Like, you still need a
string for built-in and ethos and visibility. I mean, I don't
understand why visibility. Isn't it just public? The thing. Or are
you trying to make a name table per kind? Which is not really what I
had in mind. Unless you think there's an advantage to that that I'm
not seeing. For me, it's just a translation between something that
makes no sense, which is just a number, and something we can read.
That's all. That's all all this was ever about. To have a true,
non-string-containing format. That's it. So if we all share the same
table, then the word public will always have the same ID. And because
all IDs go to the same table, there will never be any conflict."

**Agent (Claude):** restated the model — the table is one global
lexicon, the only place strings exist, exact string ↔ integer with no
kinds, ownership, or domains; using a word defines nothing, so
word-level conflict cannot exist and word minting is idempotent;
declaration redefinition remains the ruled seal-time error in the
declaration layer; the NameTree becomes integer → integer; the root
enum splits only the table's address space, owning no meaning; the
per-kind table has no remaining advantage; name-table's compose-time
cross-namespace collision failure is a bug under this model. The
restatement's example line was `17 <-> "public"`. Asked: "Have I got
it right — the nametree as integer→integer, and the root enum as
nothing but table-splitting?"

**Psyche 2026-07-28, verbatim:**
"> 17 <-> \"public\"

18 <-> \"Public\""

Log note (log-authored, not psyche words): the table is exact and
case-sensitive — distinct spellings, including case variants, are
distinct entries with distinct integers; the table never interprets,
cases, or normalizes; all casing and derivation logic lives outside
it, in the projection layer. The cross-root homonym question the
agent brought dissolves — there is nothing to conflict at the word
level. His reply amended only the case example and raised no
objection to the rest of the restatement; the restatement's other
clauses stand as agent text he was shown, not as his words. Seal-time
declaration redefinition remains ruled law, untouched.

## 3. Nothing declares the coreID — the translator allocates it

**Agent (Claude):** explaining the declaration-layer conflict, wrote:
"A declaration creates a **thing**: typed data with its own durable
ID."

**Psyche 2026-07-28:** no, nothing declares the coreID, the coreID is
allocated by the translator on receiving an unallocated word

Log note (log-authored, not psyche words): no minting act exists
anywhere in the system. The translator allocates a coreID when it
receives a word it has not seen; a known word returns its existing
coreID; that is the only way an ID comes into being. The agent's
follow-up restatement — a definition creates no identity but attaches
typed structure to the coreID its word resolves to, and "define
something already defined" means a second definition arriving for a
coreID that already carries one, refused at seal — was the text shown
to him; his reply (entry 4) raised no objection to it and moved to
the vocabulary distinction. That restatement stands as agent text,
not his words.

## 4. Kinds of names — a variant in front of the ID; nametables cannot conflict

**Agent (Claude):** posed the cross-capsule case: two different
capsules each define a local type wearing the word `Status`; same
word gives both the same coreID, so seal sees two definitions of one
ID — against the capsule dictation's "the potential name conflicts
are dealt with at each layer". Asked whether what the translator
receives carries the capsule, or the word is truly global and the
second definition is refused.

**Psyche 2026-07-28, verbatim in full:**
"Although there is a distinction to be made because some of the
vocabulary is not shared between the languages. So translator-based
renaming, which is something we'll do eventually, could only be done
on universally shared vocabulary, which means we might have more...
It might not be just a single flat nametable. It might be kinds of
names. Like if it's a... Oh, maybe this is what you meant by the
conflict, but it's not a conflict if you have a variant in front of
the ID, because they're not the same nametable. Do you understand
what I mean?"

Log note (log-authored, not psyche words): the full ID is
variant-fronted — the variant names which nametable the integer
belongs to; the same spelling under two different variants is two
entries in two nametables and cannot conflict. The stated criterion
for the kinds split is vocabulary sharedness between the languages:
translator-based renaming — an eventual feature, not current work —
can only operate on universally shared vocabulary. The variant set
itself (which kinds of names exist) remains undesigned matter; his
turn is partly exploratory ("might", "Do you understand what I
mean?"). This entry supersedes entry 2's flat-table reading: one
correspondence mechanism, but not one flat table.
