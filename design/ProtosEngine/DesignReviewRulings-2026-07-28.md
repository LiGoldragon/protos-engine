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
