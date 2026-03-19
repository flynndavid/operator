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

## Session Log

### 2026-03-18 — Install Script Audit & Fixes

#### PRs Merged

1. **operator PR #6** — `fix: security + bug fixes in install scripts`
   - Replaced `eval` with `printf -v` in install.sh `ask()` to prevent shell injection
   - Fixed timezone detection: Python fallback returns IANA string instead of tzinfo object
   - Removed dead code: workspace detection had identical if/else branches
   - Fixed tier override bug: plan prompt no longer shown when license key sets tier
   - Removed duplicate BOOTSTRAP.md copy in setup.sh
   - Updated all URLs from alpha domain to operatorosagent.com
   - Added rollback trap in setup.sh for partial deployment cleanup

2. **operator PR #7** — `fix: read from /dev/tty so curl|bash prompts work`
   - Changed all `read` calls to use `</dev/tty` for curl|bash compatibility

3. **operator PR #8** — `fix: robust interactive input for curl|bash and containers`
   - Opens fd 3 from `/dev/tty` with fallback to stdin for no-tty containers
   - All `read` calls use `<&3`
   - Updated usage docs to recommend `bash <(curl ...)` pattern

4. **AutomaticOS PR #1** — `docs: install script audit plan and improvement roadmap`
   - Added Install-Script-Plan.md with full audit findings and phased roadmap

#### Install Command (tested working)

```bash
bash <(curl -sL https://raw.githubusercontent.com/flynndavid/operator/main/install.sh)
```

#### Known State

- GitHub PAT configured for `flynndavid` account (saved in gh CLI)
- Git proxy at 127.0.0.1:34159 handles push/pull for all 3 repos
- Repos: operator, AutomaticOS, operator-platform (all under flynndavid/)
- Branch pattern: `claude/review-operator-install-script-u5uxg`
