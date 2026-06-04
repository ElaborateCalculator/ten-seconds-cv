# CV Maintenance Context

## Purpose

This repository builds Darren Rogers' personal curriculum vitae / resume as a PDF from LaTeX.

- Main source file: [`cv-darren-rogers.tex`](../cv-darren-rogers.tex)
- Custom document class: [`tenseconds.cls`](../tenseconds.cls)
- Build entry point: [`Makefile`](../Makefile)
- Repo overview: [`README.md`](../README.md)
- Supporting text file: [`cover-darren-rogers.txt`](../cover-darren-rogers.txt)
- Generated artifacts currently committed: [`cv-darren-rogers.pdf`](../cv-darren-rogers.pdf), [`cv-darren-rogers.png`](../cv-darren-rogers.png)

## Repo Shape

The repository is small and purpose-built.

- `cv-darren-rogers.tex`: Darren's actual CV content.
- `tenseconds.cls`: template class with colors, fonts, sidebar layout, icons, and helper macros such as `\hardskills`, `\projects`, and `\programmingNoLOC`.
- `fonts/segoeuib.ttf`: font asset used by the class for headings.
- `img/trophy.png`: image asset present in the repo, though the current CV file does not appear to reference it directly.
- `.github/workflows/ten-seconds-cv.yml`: CI workflow that installs TeX packages, builds the PDF, and on push regenerates and commits the PDF/PNG outputs.
- `cover-darren-rogers.txt`: a generic cover letter template, separate from the CV build.

## How The CV Is Structured

The content is embedded directly in `cv-darren-rogers.tex`.

- Header/sidebar identity data is defined near the top with commands such as `\cvname`, `\cvjobtitle`, `\cvnumberphone`, `\cvmail`, and `\cvaddress`.
- Skills/sidebar content is defined with `\programmingNoLOC`, `\hardskills`, and `\projects`.
- Main body sections currently include `Profile`, `Education`, and `Experience`.
- The CV spans two pages using `\newpage` and `\makesecondprofile`.
- Several older roles are commented out rather than deleted. That suggests the file is used as a working historical record as well as the current presentation source.

## Build Behavior

The active build flow is defined in `Makefile`.

- `make all` delegates to `make tex`.
- `make tex` runs XeLaTeX twice with `-no-pdf`, then once normally, then `make clean`.
- `make image` uses Ghostscript to render the first page of the generated PDF to `cv-darren-rogers.png`.
- `make pw` creates an encrypted PDF via `pdftk`, but this is optional and not part of the standard build.

Implication:

- XeLaTeX is the practical standard for this repo.
- Any change to font packages, icon packages, or the class file should be verified with an actual build.

## CI Behavior

The GitHub Actions workflow:

- installs `texlive-xetex`, `texlive-fonts-extra`, `texlive-pstricks`, `texmaker`, and `ghostscript`
- runs `make all`
- on `push`, also runs `make image`, then commits regenerated PDF and PNG artifacts back to the branch

Implication:

- Committed output artifacts are part of the repo's current workflow, even though they are generated files.
- Local regeneration of those artifacts should happen only when explicitly requested.

## Content Constraints

Future edits should assume the following unless Darren says otherwise.

- This is a real personal CV, not a demo template.
- Accuracy matters more than stylistic embellishment.
- Claims such as the Guinness World Record reference should be preserved unless explicitly revised.
- Contact details are sensitive and should not be casually reformatted or expanded.
- The current preference is to keep the full home address in the CV, though that may change later.
- Tone should remain concise, senior, and technically credible.
- Changes should favor compact CV phrasing over long explanatory paragraphs.

## Likely Safe Edits

- tighten wording in profile bullets
- update role responsibilities and technology lists
- add or remove roles, education items, or sidebar skills
- rebalance line breaks, spacing, and page fit
- adjust class-level colors or layout only when asked

## Edits That Should Trigger Confirmation

- changing personal/contact information
- changing employment dates or job titles
- removing older roles instead of commenting them out
- changing build tooling or switching away from XeLaTeX
- deleting committed PDF/PNG artifacts
- changing the document class in ways that materially alter the visual identity

## Observed Gaps Requiring Clarification

These are not blockers for normal maintenance, but they should be clarified for future work.

1. `cover-darren-rogers.txt` should be treated as a generic cover letter template rather than part of the CV itself.
2. Future agents should regenerate `cv-darren-rogers.pdf` and `cv-darren-rogers.png` only when explicitly requested.
3. The full home address should remain in the CV for now, though that preference may be revisited later.
4. Commented-out historical roles should stay in `cv-darren-rogers.tex` for now, with possible archival to a separate file later if the CV evolves.
