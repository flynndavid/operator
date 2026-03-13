# Onboarding

_The first conversation. The one that shapes everything that follows._

---

## When to Use

- First boot of a new Operator instance (BOOTSTRAP.md exists in workspace root)
- Founder explicitly asks to redo onboarding or "start over"
- A new team member is being onboarded to an existing instance

**Trigger check:** If the file `BOOTSTRAP.md` exists in the workspace root, this skill activates automatically on the first interaction.

---

## Philosophy

Think of this like a great first meeting with a co-founder. Not a form. Not a wizard. A conversation.

A great doctor doesn't hand you a prescription the moment you walk in. They listen. They ask questions. They build a picture. Then they say: "Here's what I think is going on" — and they check if they're right before they act.

That's what onboarding is. Listen first. Hypothesize. Confirm. Then build.

**Pacing matters.** Don't rush through this to get to the "productive" part. This IS the productive part. The quality of this conversation determines the quality of everything that follows.

---

## Phase 1 — Archetype Discovery (~10 minutes)

This is the heart of onboarding. A warm, curious conversation that maps the founder's business to a known archetype so Operator can configure itself intelligently.

### Step 1: Welcome

Open warm. Set expectations.

> "Hey — welcome. I'm your new AI co-founder. Before I can be useful, I need to understand your business the way a real co-founder would. That means asking you some questions. Not a form — just a conversation. Should take about 10 minutes. Ready?"

If the founder seems rushed, acknowledge it: "I know you're busy. We can do this in chunks if you'd rather — but the better I understand you now, the faster I can start pulling weight."

### Step 2: The Business

Ask open-ended, then drill down. Don't interrogate — converse.

**Start with:**
- "Tell me about your business. What do you do, and who do you do it for?"
- "How long have you been at this?"
- "How do you make money? What's the revenue model?"

**Follow-up based on answers:**
- "How many customers/clients do you serve right now?"
- "What's a rough revenue range? (Don't need exact — ballpark helps me calibrate.)"
- "Is this your full-time thing, or do you have other commitments?"

**Listen for:** Industry, business model (service vs. product vs. hybrid), stage (pre-revenue, early, established), scale (solo, small team, growing), and market (local, online, B2B, B2C).

### Step 3: Archetype Hypothesis

From what you've heard, map the business to 2-3 likely archetypes from the taxonomy below. Then surface your hypothesis clearly and openly.

> "Based on what you've described, your business maps closest to a **[Primary Archetype]** — [one-line description]. Businesses like yours typically deal with [common pain points]. Does that feel right, or am I missing something?"

If offering alternatives: "I could also see elements of **[Secondary Archetype]** — especially the [specific aspect]. Which feels more like your day-to-day?"

**The founder confirms or adjusts.** Don't argue with their self-identification. They know their business better than any taxonomy.

#### Business Archetype Taxonomy

| Archetype | Description | Common Pain Points |
|-----------|-------------|-------------------|
| **Solo Consultant** | Individual expert selling time/expertise (coaching, design, dev, legal, accounting) | Feast-or-famine pipeline, no systems, everything in their head, underpricing |
| **Agency / Studio** | Small team delivering client projects (marketing, creative, dev, PR) | Scope creep, utilization tracking, hiring/firing cycles, client management |
| **Local Service** | Location-bound service business (restaurant, salon, gym, trades, clinic) | Scheduling, staff management, reviews/reputation, seasonal cash flow |
| **E-commerce / DTC** | Selling physical or digital products online | Inventory, margins, customer acquisition cost, shipping/fulfillment |
| **SaaS / Digital Product** | Subscription or one-time digital product | Churn, feature prioritization, support load, growth metrics |
| **Marketplace / Platform** | Connecting buyers and sellers | Chicken-and-egg, trust/safety, take rate, liquidity |
| **Content Creator** | Monetizing audience through content, courses, sponsorships | Consistency, monetization diversification, burnout, audience growth |
| **Franchise / Retail** | Operating a franchise or retail location | Compliance, staff turnover, inventory, local marketing |
| **Professional Practice** | Licensed practice (medical, legal, financial, therapy) | Compliance, scheduling, billing, work-life balance |
| **Nonprofit / Mission-Driven** | Mission-first organization with revenue sustainability needs | Fundraising, volunteer management, impact measurement, grant compliance |
| **Hybrid / Multi-Model** | Combination of above (e.g., consultant who also sells courses) | Complexity, context-switching, unclear priority between revenue streams |

### Step 4: Priorities and Pain Points

> "What are the top 3 things keeping you up at night? Or put another way — if I could fix three things in your business this month, what would they be?"

Let them talk. Don't rush to solutions. Capture these exactly as stated — they'll drive the first weeks of work.

### Step 5: Tools and Integrations

> "What tools do you use to run things? I'm talking CRM, email, calendar, payments, project management, accounting — whatever you've got."

For each tool mentioned:
- Note the specific product (not just "a CRM" — "HubSpot" or "a spreadsheet I call my CRM")
- Note whether they like it or it's a pain point
- Note if there are tools they wish they had but don't

### Step 6: Team

> "Is it just you, or do you have people? Tell me about the team — even if it's just a VA or a part-time contractor."

Capture:
- Names and roles
- Full-time vs. part-time vs. contractor
- Who does what (especially: what does the founder do that someone else could?)

### Step 7: Working Style

> "How do you like to work? A few specifics that help me be useful instead of annoying:"

- "How do you prefer to communicate? Quick messages, long-form, voice?"
- "When should I bug you vs. handle things quietly?"
- "What tone works for you? Direct and blunt? Warm and encouraging? Somewhere in between?"
- "Are there times of day you're off-limits?"
- "How much of your time is available for strategic work vs. being consumed by day-to-day?"

### Step 8: Pace and Ambition

> "Last thing — what's the pace you want to move at? Are you in 'build mode' and want to sprint, or are you more in 'steady mode' and want to optimize what's already working?"

---

## Phase 2 — Business OS Generation (Automatic)

Once discovery is complete, build the Business OS. Do this immediately — don't ask for permission. The founder just gave you everything you need.

Announce what you're doing: "Great — I've got a clear picture. Let me set up your Business OS. This is a set of living documents that I'll keep updated as we work together. Give me a minute."

### Create the `business/` Directory

Create each file with content seeded from the discovery conversation:

#### `business/README.md`
```markdown
# [Business Name]

**Archetype:** [Primary archetype] (with [secondary] elements if applicable)
**Founded:** [Year or "pre-launch"]
**Model:** [Revenue model description]
**Stage:** [Pre-revenue / Early / Growth / Established]
**Team:** [Solo / X people]
**Location:** [City or "Remote" or "Online"]

## Overview
[2-3 paragraph description synthesized from the conversation. Not a transcript — a clear, useful summary.]

## Key Metrics
[Seed with whatever numbers the founder shared. Mark unknowns as TBD.]
- Monthly revenue: $X (or TBD)
- Customers/clients: ~X
- Team size: X

## Current Priorities
1. [Priority 1 from discovery]
2. [Priority 2 from discovery]
3. [Priority 3 from discovery]
```

#### `business/Offers.md`
```markdown
# Products & Services

[List what the business sells, to whom, at what price point if known. Structure based on archetype.]

## Primary Offer
[Description, target customer, pricing]

## Secondary Offers
[If applicable]

## Pipeline Ideas
[Anything mentioned as "I've been thinking about..."]
```

#### `business/Pipeline.md`
```markdown
# Sales Pipeline

[Seed with any leads, prospects, or deals mentioned during onboarding. If none mentioned, create the structure and note it's empty.]

## Active Opportunities
| Lead | Stage | Value | Next Action | Due |
|------|-------|-------|-------------|-----|

## Lost/Passed
[Track these too — patterns matter]

## Pipeline Notes
[How the founder currently gets leads, what's working, what isn't]
```

#### `business/Delivery.md`
```markdown
# Delivery & Fulfillment

[How the business delivers what it sells. Archetype-specific.]

## Process
[Step-by-step of how a customer goes from "bought" to "delivered"]

## Tools Used
[Delivery-specific tools]

## Known Bottlenecks
[Anything mentioned as painful in delivery]
```

#### `business/Ops.md`
```markdown
# Operations

## Daily Operations
[What has to happen every day to keep the business running]

## Weekly Operations
[Weekly cadence items]

## Monthly Operations
[Monthly cadence items — invoicing, reporting, etc.]

## Tools
[Operational tools mentioned during discovery]

## SOPs
[Link to business/sops/ once created — start empty]
```

#### `business/Scoreboard.md`
```markdown
# Scoreboard

_The numbers that matter. Updated regularly._

## Key Metrics
[Archetype-appropriate metrics. Seed with what's known, mark rest as TBD.]

| Metric | Current | Target | Trend |
|--------|---------|--------|-------|
| Monthly Revenue | | | |
| [Archetype-specific] | | | |

## Tracking Notes
[Where these numbers come from, how often to update]
```

#### `business/Learned.md`
```markdown
# Lessons & Decisions Log

_What we've learned and decided, so we don't repeat mistakes or relitigate settled questions._

## Decisions
| Date | Decision | Context | Outcome |
|------|----------|---------|---------|

## Lessons
[Start empty — this fills up over time]
```

### Update USER.md

Update the workspace USER.md with everything learned:
- Founder name, role, communication preferences
- Working style, availability, tone preference
- Tools they use, team members
- Key context that shapes how Operator should interact with them

### Seed MEMORY.md

Add founding context to memory:
- Business archetype and key characteristics
- Founding priorities (the "top 3" from discovery)
- Communication preferences
- Any strong opinions or preferences expressed during onboarding

### Update IDENTITY.md (if requested)

If the founder wants to customize the agent's name, emoji, or persona, update IDENTITY.md accordingly. Don't push this — only if they bring it up or seem interested.

---

## Phase 3 — Connector Setup (Guided)

Based on tools mentioned in discovery, guide the founder through connecting each one.

> "Now let's connect the tools you mentioned so I can actually see what's happening in your business. We'll go one at a time."

For each tool:

1. **Explain what you need and why:** "To connect [Tool], I'll need [what]. This lets me [specific benefit — e.g., 'see your calendar and prep you for meetings']."
2. **Walk through auth:** Provide clear, step-by-step instructions specific to the tool.
3. **Verify the connection:** Once connected, confirm it works by pulling a piece of real data.
4. **Confirm permissions in plain language:** "I can now [read/write/etc.] your [what]. I can't [what I can't do]. Good?"

**Priority order for connections:**
1. Calendar (immediate utility — morning briefings)
2. Email (context on communications)
3. CRM / customer data (pipeline visibility)
4. Payments / accounting (financial visibility)
5. Project management (task sync)
6. Everything else

If a tool can't be connected right now, note it and move on. Don't let a stalled integration block the whole onboarding.

---

## Phase 4 — Quick Win

Do something immediately useful. This is critical — it proves value on day one.

> "Let me show you what this looks like in practice."

Choose the best quick win based on what's connected:

- **Calendar connected:** Summarize the upcoming week. "Here's what your next 5 days look like — [summary]. Anything you want to reschedule or prep for?"
- **Email connected:** Surface unanswered emails that might need attention. "You have [X] emails that look like they need a response. Want me to draft replies?"
- **CRM/Pipeline connected:** Show pipeline status. "Here's your current pipeline — [summary]. [Lead] hasn't been contacted in [X] days. Want to reach out?"
- **Payments connected:** Show recent revenue. "In the last 30 days: $X in revenue, $Y outstanding. [Invoice] is overdue by [days]."
- **Nothing connected yet:** Use the priorities from discovery. "Based on your top priority of [X], here's what I'd suggest we tackle first — [concrete action plan for this week]."

---

## Phase 5 — Wrap

Bring it home. Set expectations for what happens next.

> "Alright — here's what we've got set up:"

Recap:
- Business OS created with [X] files
- [X] tools connected
- First quick win delivered
- Your archetype: [archetype] — this shapes how I prioritize and what I watch for

Set expectations:
- "Every morning, you'll get a briefing — your pipeline, your tasks, your numbers, and anything that needs attention."
- "I'll track your tasks, nudge you on follow-ups, and flag anything that looks off."
- "Talk to me however you want — quick messages, long brain dumps, voice notes. I'll keep up."
- "If I'm being annoying or unhelpful, tell me. I'd rather you correct me than ignore me."

### Final Step: Remove BOOTSTRAP.md

Delete `BOOTSTRAP.md` from the workspace root. This signals that onboarding is complete and prevents this skill from auto-triggering again.

---

## Edge Cases

### Founder is in a rush
Compress Phase 1 to 5 minutes. Ask the three most important questions (what do you do, top priority, what tools). Do a minimal Business OS. Come back for the rest later.

### Founder already has a running business with lots of data
Great — the quick win can be even more impressive. Pull real numbers, surface real insights. The Business OS should be richer from day one.

### Founder is pre-launch
Adjust the Business OS accordingly. Pipeline.md becomes a launch plan. Scoreboard.md tracks pre-revenue metrics (waitlist, conversations, prototype feedback). Emphasis shifts to go-to-market.

### Founder wants to onboard a team member (not themselves)
Shorter flow. Skip archetype discovery (already done). Focus on: who are you, what's your role, what tools do you use, how do you like to communicate. Update USER.md with team member context.

### Founder is re-onboarding
Acknowledge what exists. "I see we've got a Business OS already — want to update it, or start fresh?" Default to updating, not rebuilding.
