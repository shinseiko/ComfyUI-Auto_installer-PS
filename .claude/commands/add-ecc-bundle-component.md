---
name: add-ecc-bundle-component
description: Workflow command scaffold for add-ecc-bundle-component in ComfyUI-Auto_installer-PS.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /add-ecc-bundle-component

Use this workflow when working on **add-ecc-bundle-component** in `ComfyUI-Auto_installer-PS`.

## Goal

Adds a new ECC bundle component for a skill or agent, involving creation of configuration, documentation, and agent/skill definition files.

## Common Files

- `.claude/ecc-tools.json`
- `.claude/skills/*/SKILL.md`
- `.agents/skills/*/SKILL.md`
- `.agents/skills/*/agents/*.yaml`
- `.claude/identity.json`
- `.codex/config.toml`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Create or update .claude/ecc-tools.json to register the tool
- Add SKILL.md in .claude/skills/<SkillName>/ and/or .agents/skills/<SkillName>/
- Add agent configuration (e.g., openai.yaml) in .agents/skills/<SkillName>/agents/
- Add or update .claude/identity.json
- Create or update .codex/config.toml and .codex/AGENTS.md

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.