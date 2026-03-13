# Operator

**Your AI co-founder** — built on [OpenClaw](https://openclaw.ai).

Operator is a productized agent template that turns a fresh OpenClaw instance into an always-on business partner. It comes with 49 skills spanning CRM, strategy, marketing, operations, and more — organized into tiers (Starter, Pro, Managed) so you deploy exactly what the client needs.

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/flynndavid/operator.git
cd operator

# 2. Install OpenClaw (if not already installed)
npm i -g openclaw

# 3. Provision a new instance
./template/setup.sh \
  --client "Acme Co" \
  --contact "Jane Smith" \
  --profile starter

# 4. Add your API key
#    Edit deployments/acme-co/openclaw.json → set ai.apiKey

# 5. Start the agent
cd deployments/acme-co
openclaw gateway start
# → The agent boots, detects BOOTSTRAP.md, and runs the onboarding interview.
```

Use `--dry-run` to preview what setup will do without making changes.

## Repo Layout

```
operator/
├── skills/                  # 49 skills (the full library)
├── agents/operator/         # Base agent personality (SOUL, AGENTS, USER, etc.)
│   └── BOOTSTRAP.md         # Triggers onboarding on first boot
├── template/
│   ├── base/openclaw.json   # OpenClaw config template
│   ├── profiles/            # Tier definitions (starter, pro, managed)
│   ├── verticals/           # Industry overlays (e.g. festivals)
│   └── setup.sh             # Provisioning script
├── deployments/             # Generated client workspaces (not in git)
├── manifest.json            # Index of all skills + categories + tiers
└── docs/                    # Detailed guides
```

## Tiers

| Tier | Skills | For |
|------|--------|-----|
| **Starter** | 12 | Solo founders — CRM, tasks, email, finances, coaching |
| **Pro** | 27 | Growing teams — adds sales pipeline, marketing, SOPs, compliance |
| **Managed** | 49 | Full-service — everything, including vertical-specific skills |

## Adding a New Skill

1. Create a directory under `skills/<skill-name>/`
2. Add a `skill.md` file with the skill prompt and trigger keywords
3. Add an entry to `manifest.json` with slug, name, description, category, and tier
4. Add the slug to the appropriate profile(s) in `template/profiles/`

## Adding a New Vertical

1. Create a directory under `template/verticals/<vertical-name>/`
2. Add `SOUL.patch.md` (appended to SOUL.md) and/or `USER.template.md` (replaces USER.md)
3. Use `--vertical <name>` when running setup.sh

## Setup Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--client` | Business name (required) | — |
| `--contact` | Contact name (required) | — |
| `--agent-name` | Agent's name | Operator |
| `--profile` | starter / pro / managed | managed |
| `--channel` | slack / discord / telegram | discord |
| `--timezone` | IANA timezone | America/Chicago |
| `--vertical` | Industry overlay | none |
| `--skills-repo` | Git URL or local path for skills | local repo |
| `--output-dir` | Custom output directory | deployments/<slug> |
| `--dry-run` | Preview without changes | — |
| `--force` | Overwrite existing deployment | — |
| `--demo` | Label as demo deployment | — |

## Docs

- [Setup Guide](docs/setup-guide.md) — Full step-by-step deployment walkthrough
- [Architecture](docs/architecture.md) — How Operator is structured
- [Onboarding Flow](docs/onboarding.md) — What happens on first boot
