# CLAUDE.md – 1-prolog/l2

Guidance for Claude Code working in this class directory. The repository-wide rules are
in the root `CLAUDE.md` and are not repeated here; `HANDOFF.md` beside this file is the
turn record. `README.md` stays barebone: the files, and how to run them. Everything I
learn about them belongs here instead.

## The class

Twenty files, from `iag2627-slides/tex/l2-lp.tex` (`\decklabel{L2}`), numbered in the
order the deck uses them. The deck's *Lab Repo* frame lists all twenty, and every
program is `\labcode`-linked from the frame that shows it—four of them from two or
three frames, being shown more than once. **Both ends move together**: renaming or adding
a file here means editing that frame and those links.

**The prefix is two digits, `01-` to `20-`, and that is not cosmetic.** GitLab orders a
directory listing byte by byte, so `10-` came before `2-` and students saw the files out
of the class's order; the Finder does not, which is why it went unnoticed. Padding costs
one character on files 1 to 9, and the longest link, `1-prolog/l2/09-existential-queries.pl`,
is **37—exactly `\labcode`'s budget**, verified on one line with `pdftotext -layout` on
the built deck. Nothing longer can be added here. This is not a rule of its own: the root
`CLAUDE.md` makes padding a clause of the numbering rule, one that applies to a class only
once it reaches ten files. The other classes have five each and stay unpadded.

**This class is Viroli's and Andrea's**, unlike `l1` and `2-clp/l4` which are Andrea's
alone. The file headers credit both, in the deck's own order—Viroli first. Do not drop
either name.

## Environments

- **The Prolog runs in a browser**, 2P-Kt web IDE or SWISH. That rule governs the Prolog
  and nothing else here.
- **`01-NextPerm.java` runs under jshell**, and `java 01-NextPerm.java` works too: the
  single-file launcher does not require the file name to match the public class, which is
  why the `01-` prefix costs nothing. `/open` loads without running, so `a` has to be
  declared in the session and `nextperm` needs the `NextPerm.` prefix—the class name is
  not the file name.
- **`03-permutation.scala` runs under `scala repl 03-permutation.scala`**, which preloads
  the file. It has no `main`, so `scala run` answers *No main class found*.
- **Verification has only ever happened in local SWI-Prolog 10.0.2**, never in SWISH or
  2P-Kt: the Chrome extension has never connected on this machine. Say which one was used
  when reporting a result.

## What will come up

- **`04-resolution-trees.pl` is meant to misbehave.** `?- b.` answers twice and then
  raises *Unknown procedure: z/0*, `?- c.` has infinitely many solutions, `?- d.` does not
  terminate. Andrea put those there to show exactly that in class. Do not "fix" the
  program, and do not write the README as if the deck were wrong.
- **No singleton-variable warnings**: on 2026-10-02 Andrea had every unused variable turned
  into `_`, in the deck and here alike—`06-`, `13-`, `14-`, `15-`, `18-`, `20-`.
  `12-wildcard.pl` is the slide about precisely that.
- **`18-range.pl` repeats `greater/2`**, which its slide calls without listing, so the
  file runs on its own—marked in the source, as `swap` is in the Java.
- **`02-permutation.pl` clashes with nothing in 2P-Kt**: its built-in `member` is arity 2
  and it has no `permutation/2`. The arity-2 clash is `l1`'s problem, not this one.
- **`plus/3` and `succ/2` are SWI library predicates**, and `8-`, `9-`, `10-` and
  `15-peano.pl` define them anyway. SWI takes the file's definition silently, with no
  warning and no permission error. Checked, because it looked like a trap and is not.

## What was extracted, and what was not

Every Prolog listing of the deck is a file. **Not extracted, deliberately**: the resolvent
traces (`C1: ... --> C2: ...`), the term, substitution and MGU fragments of *Terms and
Unification*, and the tree pictures. They are notation, not programs.

Goals come from the deck, with its own printed answers beside them. Where the deck asks
none – `05-inference-rules.pl`, `06-terms.pl`, and the factorial of `15-peano.pl` – the file
says so in the comment before the goal. Keep that distinction: an invented goal presented
as the deck's is the kind of thing students are graded against.
