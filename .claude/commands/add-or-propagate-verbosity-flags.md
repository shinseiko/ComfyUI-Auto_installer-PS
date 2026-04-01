---
name: add-or-propagate-verbosity-flags
description: Workflow command scaffold for add-or-propagate-verbosity-flags in ComfyUI-Auto_installer-PS.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /add-or-propagate-verbosity-flags

Use this workflow when working on **add-or-propagate-verbosity-flags** in `ComfyUI-Auto_installer-PS`.

## Goal

Adds or propagates -v/-vv verbosity flags across scripts, ensuring consistent logging and user experience.

## Common Files

- `scripts/Install-ComfyUI.ps1`
- `scripts/Install-ComfyUI-Phase1.ps1`
- `scripts/Install-ComfyUI-Phase2.ps1`
- `scripts/Update-ComfyUI.ps1`
- `scripts/Bootstrap-Downloader.ps1`
- `scripts/UmeAiRTUtils.psm1`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Add or update -v/-vv flags in scripts (Install, Update, Bootstrap, Download scripts).
- Update shared utility module (scripts/UmeAiRTUtils.psm1) to support new verbosity levels.
- Propagate flags through script call chains (e.g., Phase1 → Phase2).
- Update README.md to document new flags.
- Optionally update docs/codemaps/backend.md or architecture.md.

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.