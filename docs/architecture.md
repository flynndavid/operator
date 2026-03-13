# Architecture — AI Co-founder as a Service

## Overview

The product is a **replicable AI co-founder agent** that runs on OpenClaw. Each client gets their own isolated instance. A shared template ensures consistency and enables the "network brain" — every deployment improves the template for everyone.

## System Design

```
┌──────────────────────────────────────────────────────────────┐
│                    TEMPLATE REPO (this)                       │
│                                                              │
│  ┌─────────┐  ┌──────────┐  ┌────────┐  ┌───────────────┐  │
│  │ SOUL.md │  │AGENTS.md │  │Skills  │  │ Deploy Tools  │  │
│  │ (who)   │  │ (how)    │  │(what)  │  │ (provision.sh)│  │
│  └─────────┘  └──────────┘  └────────┘  └───────────────┘  │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │              Vertical Overlays                        │   │
│  │  festivals-events/ │ home-services/ │ agencies/ │ ... │   │
│  └──────────────────────────────────────────────────────┘   │
└──────────────────────┬───────────────────────────────────────┘
                       │
            provision.sh (clone + customize)
                       │
         ┌─────────────┼─────────────┐
         ▼             ▼             ▼
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│  CLIENT A    │ │  CLIENT B    │ │  CLIENT C    │
│              │ │              │ │              │
│ ┌──────────┐ │ │ ┌──────────┐ │ │ ┌──────────┐ │
│ │OpenClaw  │ │ │ │OpenClaw  │ │ │ │OpenClaw  │ │
│ │Instance  │ │ │ │Instance  │ │ │ │Instance  │ │
│ └────┬─────┘ │ │ └────┬─────┘ │ │ └────┬─────┘ │
│      │       │ │      │       │ │      │       │
│ ┌────┴─────┐ │ │ ┌────┴─────┐ │ │ ┌────┴─────┐ │
│ │Workspace │ │ │ │Workspace │ │ │ │Workspace │ │
│ │ memory/  │ │ │ │ memory/  │ │ │ │ memory/  │ │
│ │ secrets/ │ │ │ │ secrets/ │ │ │ │ secrets/ │ │
│ └──────────┘ │ │ └──────────┘ │ │ └──────────┘ │
│              │ │              │ │              │
│ Channel:     │ │ Channel:     │ │ Channel:     │
│ Slack DM     │ │ Telegram     │ │ Slack        │
└──────────────┘ └──────────────┘ └──────────────┘
         │             │             │
         └─────────────┼─────────────┘
                       ▼
              ┌─────────────────┐
              │  NETWORK BRAIN  │
              │                 │
              │ Anonymized      │
              │ patterns &      │
              │ skills flow     │
              │ back to         │
              │ template        │
              └─────────────────┘
```

## Data Isolation Model

**Hard rule: Client data NEVER leaves their instance.**

Each client instance has:
- Its own filesystem workspace (`~/.openclaw/workspace/`)
- Its own memory files (`memory/`, `MEMORY.md`)
- Its own secrets (`secrets/`)
- Its own OpenClaw configuration (`openclaw.json`)
- Its own LLM API key (or a shared key with usage tracking)
- Its own communication channel (Slack workspace, Telegram group, etc.)

The only thing shared between instances is the **template** — the base configuration and skills that define how the agent operates. This flows one direction: from template → instances (via updates). Client data never flows back.

## Network Brain

The "network brain" is not a live data pipeline. It's a human-reviewed process:

1. **Observe:** Operators review client instances for patterns, useful workflows, and effective approaches
2. **Generalize:** Extract the pattern without any client-specific data
3. **Codify:** Turn it into a shared skill or template improvement
4. **Distribute:** Update the template repo → instances pull updates

### Example Flow

```
Client A's agent discovers that sending vendor follow-ups
on Tuesday mornings gets 2x response rate
        │
        ▼
Operator notices this pattern across 3+ clients
        │
        ▼
Creates shared skill: "vendor-followup-timing"
with best-practice scheduling logic
        │
        ▼
Skill added to template/skills/
All new deployments include it
Existing deployments get it on next update
```

### What Flows Back (Network → Template)
- ✅ Generalized skills and workflows
- ✅ Improved prompts and playbooks
- ✅ Best-practice configurations
- ✅ New integration patterns

### What NEVER Flows Back
- ❌ Client names, contacts, or business details
- ❌ Financial data or budgets
- ❌ Conversations or messages
- ❌ Vendor/partner information
- ❌ Any personally identifiable information

## Deployment Architecture

### Phase 1: MVP (1-5 clients)

Run all instances on a single VPS (or David's Mac Mini for demo):

```
┌─────────────────────────────────┐
│         Single VPS              │
│  (DigitalOcean / Hetzner)       │
│                                 │
│  ┌─────────┐  ┌─────────┐      │
│  │Client A │  │Client B │ ...  │
│  │(openclaw│  │(openclaw│      │
│  │instance)│  │instance)│      │
│  └─────────┘  └─────────┘      │
│                                 │
│  Managed via systemd services   │
└─────────────────────────────────┘
```

- Each client is a separate OpenClaw process with its own workspace
- Systemd service per client for auto-restart
- Nginx reverse proxy if web UI needed
- Cost: ~$20-40/mo for the VPS + LLM API costs per client

### Phase 2: Containerized (5-20 clients)

Docker containers with shared infrastructure:

```
┌─────────────────────────────────┐
│      Docker Host (VPS)          │
│                                 │
│  ┌───────────────────────────┐  │
│  │ docker-compose per client │  │
│  │                           │  │
│  │ ┌─────┐ ┌─────┐ ┌─────┐ │  │
│  │ │ A   │ │ B   │ │ C   │ │  │
│  │ └─────┘ └─────┘ └─────┘ │  │
│  └───────────────────────────┘  │
│                                 │
│  Shared: logging, monitoring    │
│  Isolated: workspace, secrets   │
└─────────────────────────────────┘
```

### Phase 3: Scale (20+ clients)

Container orchestration (Kubernetes or similar) with:
- One-click provisioning via API
- Auto-scaling
- Centralized monitoring and alerting
- Billing integration (Stripe)
- Client self-service dashboard

## Cost Model

Per client instance:

| Component | Monthly Cost | Notes |
|-----------|-------------|-------|
| LLM API (GPT-4 / Claude) | $50-150 | Depends on usage, heartbeat frequency |
| VPS share | $5-10 | Amortized across clients |
| Communication channel | $0 | Slack/Telegram free tier |
| Monitoring | $0-5 | Amortized |
| **Total COGS** | **~$55-165** | |
| **Revenue** | **$699** | |
| **Gross margin** | **~76-92%** | |

## Security Considerations

- Each instance runs under its own OS user (Phase 2+)
- Secrets are stored in the instance workspace, never in the template
- LLM API keys are per-client or usage-tracked
- Communication channels require client to authorize the bot
- No shared database or storage between instances
- Network brain is manual/semi-automated — no automated data extraction

## Connectors & Integration Model

**Core principle:** Every customer gets a hosted OpenClaw instance — full connector flexibility. The agent doesn't just advise — it **sees your Stripe, reads your inbox, and drafts the invoice.** This is the key differentiator.

### Connection Methods

1. **Native OpenClaw integrations** — Slack, Telegram, Discord, email (built-in channels)
2. **Connector skills** — Self-guided setup skills that walk founders through auth (see below)
3. **Custom scripts** — Client-specific automations in `scripts/`
4. **MCP servers** — For advanced tool integrations (Phase 2+)

Integrations are configured per-instance in `openclaw.json` and `TOOLS.md`.

### Starter Connector Pack (Ship With Launch)

| Connector | Category | Why |
|---|---|---|
| Google Workspace | Email, Calendar, Drive | Universal — every business has this |
| Stripe / Square | Payments, Invoices | Founders need to see their money |
| Notion / Google Sheets | Structured Data, CRM | Lightweight tracker every SMB uses |
| Slack / Discord | Comms | Where the agent talks to the founder |

### Phase 2+ Connectors (Add Based on Demand)

- **CRM:** HubSpot, Pipedrive
- **Project Mgmt:** Trello, Asana, Linear
- **Marketing:** Mailchimp, X, LinkedIn, Meta Ads
- **E-commerce:** Shopify, WooCommerce
- **Industry-specific:** HouseCall Pro, ServiceTitan (home services), Eventbrite (events)

### Connector Setup Skills

Each connector gets a **setup skill** that handles the full auth flow conversationally:

1. **Detection** — Business OS interview identifies what tools the founder uses
2. **Auth walkthrough** — Skill guides the founder step-by-step: OAuth link ("Click here to authorize Google") or API key ("Go to Settings → API Keys → paste here")
3. **Verification** — Agent tests the connection live: *"I can see your calendar. You have 3 events this week. ✅"*
4. **Permissions scoping** — Agent explains what it can/can't do: *"I'll read your email but won't send unless you ask."*
5. **TOOLS.md update** — Skill writes connection details to the instance's TOOLS.md for future reference

Skill template location: `template/skills/connector-setup/` (TODO: build)

### Security & Permissions

- Each connector defines a **permissions scope** (read-only vs. read-write)
- Founder grants explicit permission for write actions during setup
- All credentials stored per-instance in `secrets/`, isolated from other customers
- Agent confirms scope in plain language — no jargon, no hidden access
- Connectors can be revoked anytime by removing the relevant secrets

### Auth Flow Phases

| Phase | How Auth Works | When |
|---|---|---|
| **Phase 1** (Launch) | Connector setup skills — conversational, human-assisted | First 20-30 customers |
| **Phase 2** (Scale) | Self-serve web UI — "Connect Google" button, OAuth handles the rest | When manual setup becomes a bottleneck |
| **Phase 3** (Platform) | One-click marketplace — install connector from catalog | 100+ customers |

## Onboarding Flow

```
1. Sales closes deal
   │
2. Provisioning script runs
   │ → Clones template
   │ → Applies vertical overlay
   │ → Generates openclaw.json
   │ → Creates workspace structure
   │
3. Operator customizes
   │ → Fills USER.md with client details
   │ → Configures integrations
   │ → Sets up communication channel
   │
4. Agent goes live
   │ → First session: reads SOUL, USER, orients
   │ → Introduces itself to client
   │ → Begins onboarding conversation
   │
5. Ongoing
   │ → Agent learns business over time
   │ → Heartbeats keep it proactive
   │ → Operator monitors health
```
