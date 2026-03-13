# CLAUDE.md — Operator Monorepo

## What this is

Operator is **your AI co-founder**: a reusable OpenClaw agent template + skill library that can be deployed as a dedicated instance per customer (hosted or self-hosted).

This repo is intentionally a **monorepo** so skills, agent configuration, deployment template, and demo deployments stay in sync.

## Key directories

- `skills/` — all skills (42)
- `agents/operator/` — default Operator agent config (SOUL/AGENTS/USER/etc.)
- `template/` — provisioning + tier profiles + vertical overlays
- `deployments/` — demo/client configs (no secrets)
- `docs/` — architecture + onboarding docs

## Branding

- Product name: **Operator** (working name)
- Tagline: "Your AI co-founder"

## Current focus

- Keep the monorepo clean and portable.
- Improve onboarding (archetype interview → Business OS generation).
- Defer Stripe wiring until GTM is ready.

