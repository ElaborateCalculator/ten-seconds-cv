# Agent Instructions

This repository is a personal LaTeX curriculum vitae / resume for Darren Rogers. It is a fork of `bitroniq/ten-seconds-cv`, but this fork's active document is [`cv-darren-rogers.tex`](./cv-darren-rogers.tex).

Read [`docs/cv-maintenance-context.md`](./docs/cv-maintenance-context.md) before making substantial changes.

## Working Rules

- Treat `cv-darren-rogers.tex` as the canonical source for the CV content.
- Treat `tenseconds.cls` as the canonical source for layout, typography, colors, and reusable LaTeX commands.
- Treat `cover-darren-rogers.txt` as a generic cover letter template and supporting application material, not part of the PDF build.
- Treat `cv-darren-rogers.pdf` and `cv-darren-rogers.png` as generated artifacts unless the user explicitly asks to edit, replace, or regenerate them.
- Prefer preserving the existing CV style and layout unless the user asks for a redesign.
- Preserve factual accuracy for employment dates, role titles, companies, certifications, contact details, and award claims. Ask before changing any of these if the source is unclear.
- Be careful with privacy-sensitive content such as phone number, home address, and personal email. The current preference is to keep the full address unless Darren asks to reduce it.

## Build And Verify

- Primary local build: `make all`
- PDF-only build path: `xelatex -no-pdf cv-darren-rogers.tex` twice, then `xelatex cv-darren-rogers.tex`
- Preview image: `make image`
- Cleanup: `make clean`
- The document is intended to compile with XeLaTeX. The README also mentions LuaLaTeX for `fontawesome`, but the actual Makefile and workflow use XeLaTeX.

## Editing Guidance

- When changing wording, optimize for concise, credible CV language rather than narrative prose.
- When changing structure, check whether content spans both pages and whether spacing or line breaks need rebalancing.
- Avoid introducing dependencies on new fonts or packages unless necessary.
- Keep generated files out of manual edits unless the task is specifically about build outputs.

## Current Preferences

- `cover-darren-rogers.txt` is a generic cover letter, not CV source.
- Regenerate `cv-darren-rogers.pdf` and `cv-darren-rogers.png` only when explicitly requested.
- Keep the full home address in the CV for now.
- Leave commented-out historical roles in `cv-darren-rogers.tex` for now; archiving them later is acceptable if the CV evolves.
