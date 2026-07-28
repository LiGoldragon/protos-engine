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
