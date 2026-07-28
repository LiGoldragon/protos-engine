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

## 5. The real problem is programmatic rename — step back and rethink encoded-form namespacing

**Agent (Claude):** restated the kinds model back (variant-fronted ID
naming which nametable; sharedness as the split criterion), then
asked the remaining case: two capsules each define a local type
spelled `Status` — are capsule-local names kept apart, or do all
user names share one nametable so the second definition is refused
at seal?

**Psyche 2026-07-28, verbatim in full:**
"Well, I can see a problem but you haven't actually found it. The
thing you're talking about is not actually the problem. The problem
is, and what I think you're trying to get at maybe you just haven't
put your finger on it, is that let's say those two statuses are
different things, but they don't necessarily clash in the way that
the language resolves things. The problem is if one of those later
wants a rename, a programmatic rename, which would change status for
everything. So we're talking about statuses that are not the same
status, but both use the name status, right? Which means we need to
understand... It's all about understanding. I know agents, and
especially new models, are getting dumber and dumber every day
because they're not trying to understand anything. And step back. We
have to step back and think, okay, let's forget everything we know,
which you can't do because you're a machine, but I can. And look at
it from the outside. What are we doing here? We're talking about a
status from a different domain. So do we introduce the concept of
domain in the name table? In which case we get a kind of a
recursive, a namespaced name table, if you will. And the domain
themselves also use the same mechanism of having their... So this
introduces a new concept also in the code, in the encoded form of
domains, of namespaces. So then a core ID becomes a complex thing.
It's more than one thing. But we already had a variant in front of
it. Now we have a variant. And then potentially, depending on the
variant, we have a domain. Like obviously the Rust built-ins don't
clash, right? So they don't need domains. Although maybe they do, I
don't know. Like is there two statuses in Rust's standard library
that mean different things? I don't know. But outside of that, in
our own authorship, we may run into the problem of a status in two
different domains. And it wouldn't be a problem if none of them
would ever want to do a rename or a programmatic rename, which
eventually all of the coding... When this actually starts running
well, you're not going to be editing text. You're going to be doing
operational editing. You're going to send operations, and it'll all
be atomically edited in the daemon. And that's when we'll have the
renaming operation. So we need to step way the fuck back now and
rethink the entire concept of how we namespace the encoded form. Or
look at what kind of concept overlaps the concept that I'm
describing here. And I don't know if you're able to do this, but I
would like you to override the model that you use for subagents to
be Opus 4.6."

Log note (log-authored, not psyche words): the cross-capsule
resolution case the agent posed is a non-problem — languages resolve
it. The real problem is the eventual programmatic rename: two
different things sharing one spelling make a shared-row rename touch
both. Renaming is an operation on one thing. The endgame is
operational editing — no text editing; operations sent to the
daemon, applied atomically; rename is one such operation. Whether
domains enter the nametable — a recursive, namespaced nametable,
domains named by the same mechanism, the concept also entering the
encoded form, the coreID becoming complex (variant, then possibly
domain depending on the variant) — is the question he ordered
stepped back on and rethought, or matched against an overlapping
existing concept. Rust builtins likely need no domains (his
uncertainty recorded). Nothing in this entry is a settled ruling on
the mechanism; it is the problem statement and the directive. The
closing subagent-model instruction is operational context, kept for
verbatim fidelity.

## 6. Renaming is recursive — the module renames like its members

**Agent (Claude):** presented the step-back analysis: the rename
operation defines what the ID must identify — the table row must be
keyed by the thing's ID with the spelling as its changeable value;
domains contain that answer one level down; the capsule may already
be the domain concept; the kinds-of-names variant may fall on the
boundary between names-of-things (renameable, thing-keyed rows) and
words-as-values (keywords, dynamic-enum words — the word is the
thing, fixed rows).

**Psyche 2026-07-28, verbatim:**
"And then the same concept of programmatic renaming becomes possible
for the domain too. And maybe the domain is not the right term,
namespace or module, so that we get the free renaming both on the
specific string in that module and the module name itself."

Log note (log-authored, not psyche words): renaming extends
recursively to the container level. The module/namespace is itself a
thing whose name is a thing-keyed row like any member's; one rename
operation serves both levels — the specific string in the module and
the module's own name. "Domain" may be the wrong term; his candidate
terms are namespace or module; the final term is matter, undesigned.
Consequence (agent-derived): a thing's full address is a chain of
IDs with every spelling an attribute along it, so rename at any
level never touches identity at any level.

## 7. Emitted Rust names things by their coreID

**Agent (Claude):** presented the emission-boundary asymmetry from
the concept survey: under thing-keyed naming, renaming the root
module is one field write internally but "rewrites the fully
qualified path of every item in the emitted Rust externally", so the
emission boundary would need its own deliberate mechanism.

**Psyche 2026-07-28, verbatim:**
"not if we use the coreID for the emitted rust (a textual version of
it - some kind of textual binary encoding which is friendly to
rustc)"

Log note (log-authored, not psyche words): emitted Rust identifies
our things by a textual encoding of the identity itself, not by
projected human names; renames then touch nothing in the emitted
artifact, and external captures of emitted names hold the identity —
rename-proof by construction. Rust's own vocabulary (keywords, std
names) keeps Rust's spellings. The encoding scheme is matter,
undesigned (rustc identifier rules: letter or underscore first, then
alphanumerics and underscores). Recorded tension, not resolved: his
07-23 "it would be good to keep the generated artifacts as
accessible as possible" — mitigation candidates such as regenerated
doc comments carrying projected names are matter. Agent observation:
rename-proof emission requires the emitted ID to be the thing's
durable spelling-independent identity — under word-keyed identity a
rename changes the ID and the emitted encoding with it, so this
ruling presupposes a yes on the standing crux question (does the
thing get its own durable identity distinct from word and hash).

## 8. The durable identity is the encodedID; only whole-capsule hashing was ever discussed

**Agent (Claude):** put the crux question: does a declaration — and
a module, identically — get its own durable identity, separate from
both its word's coreID and its content hash?

**Psyche 2026-07-28, verbatim in full:**
"I didnt think of the durable identity as separate from its coreID,
which I should have called encodedID (I dont know what the code
currently calles it, but since its encodedform, encodedID is
appropriate)

if we want to content hash everything, it'll take several passes to
first resolve the leaf nodes, with their encodedID, and then come
out recursively. it would be great, but we never discussed it, we
only discussed hashing the entire capsule after it is fully encoded"

Log note (log-authored, not psyche words): terminology — the concept
called coreID in this session's earlier entries should be
**encodedID**: it is the ID of the encodedform. The code currently
calls it `Identifier` (name-table's `Schema(u16)`-family). The
durable identity is not a third thing beside the encodedID; the
encodedID is the durable identity, matching 07-22's "encoded
identity is the only durable one". On content hashing: only hashing
the entire capsule after it is fully encoded was ever discussed;
recursive leaf-first per-thing hashing ("several passes… come out
recursively") is attractive to him but explicitly undiscussed and
unruled. Consequence: core-logos's per-item `content_identity()`
stands on implementation, not on ruling, and must be reconciled in
the identity-train proposal rather than assumed. The agent's
restatement of the resulting table model awaits his confirmation.

## 9. EncodedIDs are by module; the module has an encodedID

**Agent (Claude):** presented a flat table model — globally-keyed
rows written as invented identifiers (E41, E87, E17) with spellings
as values and module membership as an attribute — and asked whether
declarations always allocate while references only resolve.

**Psyche 2026-07-28, verbatim:**
"Where your question seems to imply that you've abandoned the
concept of module and then the names that this module contains. So
that name, I mean encoded IDs are by module which the module also
has an encoded ID. And I don't understand what you mean by E41,
E87, E17. So you've lost me there. We don't seem to be on the same
page anymore."

Log note (log-authored, not psyche words): the flat rendering is
rejected as off-model. EncodedIDs are allocated **by module**: a
module contains the names of its members, and the module itself has
an encodedID in its containing module — the recursive namespaced
nametable of entries 5 and 6, structural containment rather than a
membership attribute on flat rows. The agent's redrawn nested-table
restatement awaits his confirmation.

## 10. The nested-table model confirmed

**Agent (Claude):** redrew the model as nested module-owned tables —
a root table whose entries are modules and builtins, each module
owning the table of its own members, billing's Status as chain 1.1
and tasks' Status as chain 2.1 — and asked: is this the picture —
identity as the chain of module-allocated encodedIDs, one nametable
per module, rename as a one-entry edit in whichever table owns the
spelling?

**Psyche 2026-07-28, verbatim:** thats more like it

Log note (log-authored, not psyche words): confirmation of the
restated model — [confirmed] grade: the substance carries his
authority, the wording is the agent's. The confirmed clauses as
shown to him: one nametable per module; a module's members receive
their encodedIDs from their own module's table; the module itself is
an entry in its container's table, recursively; a thing's full
identity and every encodedform reference is the chain of encodedIDs;
emitted Rust encodes the chain; rename is a one-entry spelling edit
in the owning table, identical at member and module level;
allocation being by module means the homonym case never reaches a
conflict; redefinition-at-seal means the same spelling twice in one
module's table; per-table u16 capacity suffices because no table
holds all of language.

## 11. Per-module uniqueness is inherited from the interface, not intrinsic

**Agent turn:** none — psyche-initiated, elaborating entry 10's
confirmation.

**Psyche 2026-07-28, verbatim:**
"We're basically matching how the parser of a standard programming
language works, which is, it's not going to accept the same name for
two different things in one module, one file, basically. So we're
just matching that so that, because that's what we're going to and
from. So it's not because the model is constrained like that
necessarily, it's just because that's what we're constrained by, by
virtue of what we're trying to go to and from."

Log note (log-authored, not psyche words): the per-module
spelling-uniqueness rule exists to match the parsers of the standard
languages being bridged — it is inherited from the textual interface,
not intrinsic to the model. Consistent with 07-21's "text is the
current standard programming interface; it is what we *must* work
with in order to get to the future interface." Under the
operational-editing endgame the constraint is in principle
renegotiable; do not treat it as a deep invariant, and do not build
anything that depends on it being one.
