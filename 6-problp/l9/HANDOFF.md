# HANDOFF.md — 6-problp/l9

## Objective

A two-hour closing class for Intelligent Agents: a fast probability refresher,
the foundations of probabilistic knowledge and reasoning, the agent framing,
and five exercises in probabilistic logic programming drawn from Riguzzi.

## State

**2026-11-12**: `4-path.pl`'s recursive clause renamed `path(X, Z) :- path(X, Y), edge(Y, Z).`, as Andrea
wrote it in the deck (same meaning, same 0.624); `CLAUDE.md` quotes it so. Not run here (no cplint locally).
Same day: `:- use_rendering(graphviz).` added (guarded by `current_predicate(use_rendering/1)`), so cplint.eu draws
`bdd_dot_string/3`'s diagram instead of printing the DOT text, as Andrea saw in class preparation; the Pengines check
of 2026-11-02 returns text and could not show it.

**Committed and pushed**: `f683bd0`, the runs at `cplint.eu` in `4d2bb7c`. The part `6-problp` (first named `5-plp`) was created at Andrea's
word on 2026-11-02, the first one added since `4-jason`.

**README brought into the class shape, 2026-11-02 (late)**: `l9 –` title, *Running them*, the local
`pack_install` route dropped (browser only, as the part README already said: `CLAUDE.md`, *Not here*),
*the contrast case* cut from `7-jail.pl`'s row, cplint.eu's panes named as SWISH's.

Here:

- the seven programs, `1-sneezing.pl` to `7-jail.pl`
- `README.md` (barebone, students), `CLAUDE.md` (the traps and the
  provenance), `EXERCISES.md` (the deck's questions, with answers), this file
- `6-problp/README.md` one level up, and the row in the root `README.md` parts
  table

In `iag2627-slides`, in the same turn: `tex/l9-plp.tex`, nine acronyms and
eight names in `sty/names.sty`, ten entries in `bib/iag.bib`, the deck-table
row in `README.md`, and the `l9-plp` job in `.gitlab-ci.yml`.

**No CI job here.** The root `.gitlab-ci.yml` carries one job per class *that
has checks*, and this class has none to run: `cplint` is not installable in
CI, and the programs are checked by being run in a browser. `3-jade-l6` and
`4-jason-l7` remain the only two jobs.

## Validation

- the deck **builds in the repository**, `latexmk -pdf tex/l9-problp.tex` from
  the project root: 44 pages, exit 0, no errors, no undefined citations, no
  undefined control sequences — so `names.sty` is carrying every macro and
  acronym the deck asks for — and no overfull hboxes
- every probability in the file headers and in `EXERCISES.md` was **computed
  by exhaustive enumeration of the worlds** in exact rational arithmetic, and
  agrees with the book wherever the book states one
- every citation's authors, venue, volume, pages and DOI were **checked one
  record at a time**. Two near-misses worth keeping: `10.3233/IA-170105` is
  *not* the cplint-on-SWISH paper — it is Pozzato on description logics of
  typicality, and the right DOI is `10.3233/IA-170106` — and
  `deepproblog-neurips2018` was already in `pool.bib`, so it was **moved** into
  `iag.bib` rather than retyped
- **the programs were run at `cplint.eu` on 2026-11-02**, every answer as stated. See `CLAUDE.md`, *Provenance*

## Left for Andrea

1. ~~Run the seven programs at `cplint.eu`~~: done 2026-11-02 (Claude Code), every answer as stated.
2. ~~Commit~~: committed and pushed 2026-11-02 (`f683bd0`).
3. **`teach/6-problp/l9/README.md`**, if L9 is to get the `show-lab` treatment
   L6, L7 and L8 have. Seven files, each with its goals already at its foot.
