# Operator

**Your AI co-founder.**

Operator is a productized OpenClaw agent template + skill library for running a business with an "always-on" operator that actually remembers context and drives progress.

This repo is the **monorepo**: skills, agent configuration, deployment template, and demo deployments live together so changes ship as one coherent unit.

## Repo layout

- `skills/` — the full skill library (42 skills)
- `agents/operator/` — the default Operator agent personality/config (SOUL, AGENTS, etc.)
- `template/` — deployment blueprint
  - `template/base/openclaw.json` — base OpenClaw config
  - `template/profiles/` — tier manifests (`starter`, `pro`, `managed`)
  - `template/verticals/` — optional overlays (e.g. festivals)
  - `template/setup.sh` — provisioning script (copied from legacy `provision.sh`)
- `deployments/` — known demo/client deployment configs (no secrets)
- `docs/` — architecture + product docs
- `manifest.json` — index of all skills + categories + tier mapping

## Notes

- Landing page lives separately: https://operator-landing-alpha.vercel.app/
- Stripe/checkout wiring is intentionally deferred.

