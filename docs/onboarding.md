# Client Onboarding Process

## Overview

Onboarding a new client takes ~2 hours of operator time and 1-2 days of bake time before the agent is fully oriented.

## Pre-Onboarding (Sales → Handoff)

Before provisioning, gather from the client:

### Required
- [ ] Business name and primary contact
- [ ] Contact timezone and working hours
- [ ] Preferred communication channel (Slack or Telegram)
- [ ] What they need help with (top 3 priorities)
- [ ] Current tools they use (CRM, project mgmt, email, etc.)

### Nice to Have
- [ ] Team roster (names, roles)
- [ ] Upcoming deadlines or events
- [ ] Budget or financial context
- [ ] Past pain points with similar tools
- [ ] Communication style preferences

## Provisioning (Operator — 30 min)

1. Run `provision.sh` with client details
2. Fill out `USER.md` with gathered information
3. Configure communication channel
4. Set up LLM and heartbeat config
5. Start the agent

See [setup-guide.md](setup-guide.md) for detailed steps.

## Day 1: Introduction, Orientation & Connector Setup

The agent handles this autonomously:

1. **Introduce itself** — Warm, natural first message
2. **Ask about priorities** — What's most pressing right now?
3. **Learn the business** — Ask smart questions, take notes
4. **Connect their tools** — Based on what the founder uses, trigger **connector setup skills** to walk them through authenticating their business tools (Google Workspace, Stripe, etc.). Each skill guides step-by-step in plain language — no jargon, no config files. Agent verifies each connection live: *"I can see your calendar. ✅"*
5. **Quick win** — Do something useful immediately using the newly connected data (e.g., summarize their upcoming week from Google Calendar, show recent Stripe revenue)

### Operator Monitoring
- Watch the first few exchanges to ensure quality
- Intervene if the agent misunderstands something important
- Adjust `SOUL.md` or `USER.md` if the vibe is off

## Days 2-7: Building Context

The agent should be:
- Asking follow-up questions to deepen understanding
- Organizing information it learns into `MEMORY.md`
- Taking on small tasks to prove value
- Learning the client's communication style and preferences
- Setting up any additional integrations

### Key Milestones (Day 7)
- [ ] Agent knows the business model and key people
- [ ] **Core connectors authenticated** (at minimum: email + calendar + payments)
- [ ] Agent has handled at least 3 real tasks
- [ ] Client is comfortable communicating naturally
- [ ] `MEMORY.md` has meaningful entries
- [ ] Heartbeats are firing and useful (not just noise)

## Week 2+: Full Operation

By now the agent should be:
- Proactively surfacing relevant information
- Managing timelines and follow-ups independently
- Drafting communications for client review
- Learning patterns and improving responses
- Feeling like a real team member, not a chatbot

## Operator Health Checks

Weekly for the first month, then bi-weekly:

| Check | What to Look For |
|-------|-----------------|
| Memory quality | Is MEMORY.md growing with useful entries? |
| Response quality | Are answers helpful, accurate, on-brand? |
| Proactivity | Is the agent surfacing things unprompted? |
| Client satisfaction | Any complaints or confusion? |
| Cost | LLM spend within expected range? |
| Errors | Any repeated failures or hallucinations? |

## Offboarding

If a client cancels:

1. Export their data (workspace snapshot) and provide to them
2. Stop the OpenClaw instance
3. Archive the deployment directory
4. Remove any client-specific integrations
5. Document any learnings for the network brain

**Data retention:** Keep archived deployment for 30 days, then delete. Never retain client data beyond the retention period.
