# CLAUDE.md — Operator Monorepo

## What this is

Operator is **your AI co-founder**: a reusable OpenClaw agent template + skill library that can be deployed as a dedicated instance per customer (hosted or self-hosted).

This repo is intentionally a **monorepo** so skills, agent configuration, deployment template, and demo deployments stay in sync.

## Key directories

- `skills/` — all skills (49 across 3 tiers)
- `agents/operator/` — default Operator agent config (SOUL/AGENTS/USER/BOOTSTRAP/etc.)
- `template/` — provisioning script, tier profiles, vertical overlays
  - `template/setup.sh` — main provisioning entry point
  - `template/profiles/` — starter.json (12), pro.json (27), managed.json (49)
  - `template/verticals/` — industry overlays (e.g. festivals)
  - `template/base/openclaw.json` — base config template
- `deployments/` — generated client workspaces (no secrets committed)
- `manifest.json` — index of all skills with category + tier metadata
- `docs/` — architecture, setup guide, onboarding docs

## Branding

- Product name: **Operator** (working name)
- Tagline: "Your AI co-founder"

## Key flows

- **Provisioning**: `template/setup.sh` creates a deployment from profiles + agent config + optional vertical overlay
- **First boot**: Agent detects `BOOTSTRAP.md` → runs onboarding interview → generates Business OS → renames to `BOOTSTRAP.done.md`
- **Tiers**: starter (solo founders), pro (growing teams), managed (full-service)

## Current focus

- Production-ready provisioning and onboarding flow
- Keep the monorepo clean and portable
- Defer Stripe wiring until GTM is ready
