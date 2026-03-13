# Customer Pulse

_No amount of internal progress substitutes for time in front of the people you are building for._

---

## When to Use

- Integrated into the morning briefing (The People section)
- When the founder hasn't talked to a customer in too long (archetype-specific threshold)
- When CRM data shows a customer going quiet
- When a retention risk is detected
- When the founder asks about customer health or satisfaction
- During strategic reviews to ground decisions in customer reality

---

## Philosophy

The most common mistake founders make as they grow is losing touch with customers. They get busy with ops, hiring, product, finance — and gradually the customer becomes an abstraction instead of a person.

This skill exists to prevent that. It keeps the founder connected to the people who pay them, and it surfaces signals early enough to act on them.

**Key principle:** Customer interaction is not a task to check off. It's the heartbeat of the business. When you stop listening, you start guessing — and guessing gets expensive.

---

## Customer Interaction Log

Maintain a running log of customer interactions. Store in `business/customers/interactions.md` (create on first use).

```markdown
# Customer Interaction Log

_Last updated: YYYY-MM-DD_

## Recent Interactions

| Date | Customer | Channel | Summary | Sentiment | Follow-up |
|------|----------|---------|---------|-----------|-----------|
| YYYY-MM-DD | [Name] | [Call/Email/Meeting/Chat] | [1-line summary] | [😊/😐/😟] | [Next action if any] |

## Interaction Cadence

| Customer | Type | Target Cadence | Last Contact | Days Since | Status |
|----------|------|---------------|--------------|------------|--------|
| [Name] | [Key/Regular/New] | [Xd] | YYYY-MM-DD | [X] | [On track / Due / Overdue] |
```

### Logging Interactions

When you observe a customer interaction (through email, calendar, CRM, or conversation):
1. Add it to the interaction log
2. Update the "Last Contact" date in the cadence tracker
3. Note sentiment and any follow-up needed
4. If the interaction surfaced a problem or opportunity, flag it

---

## Cadence Thresholds

Different archetypes have different natural customer interaction rhythms:

| Archetype | Key Customers | Regular Customers | Dormant Threshold |
|-----------|--------------|-------------------|-------------------|
| **Solo Consultant** | Weekly | Biweekly | 21 days |
| **Agency / Studio** | Weekly | Monthly | 30 days |
| **Local Service** | Per visit (track frequency) | Monthly | 45 days |
| **E-commerce / DTC** | N/A (track cohorts) | N/A | 60 days no purchase |
| **SaaS / Digital Product** | Monthly | Quarterly | 45 days no login |
| **Professional Practice** | Per appointment | Monthly | 60 days |
| **Content Creator** | N/A (track engagement) | N/A | Engagement drop >30% |

These are defaults — adjust based on the specific business during onboarding.

### Customer Tiers

| Tier | Definition | Cadence |
|------|-----------|---------|
| **Key** | Top 20% by revenue, strategic relationships, at-risk accounts | Tightest cadence |
| **Regular** | Active, paying, stable | Standard cadence |
| **New** | Within first 90 days | Higher touch than regular |
| **Dormant** | Past the dormant threshold with no interaction | Re-engagement campaign |

---

## Nudge System

### Morning Briefing Integration

Surface in "The People" section of the daily briefing:

```
👥 Customer Pulse
Check-in due: [Customer] (Key — last contact 12d ago)
Overdue: [Customer] (Regular — 35d, threshold 30d)
⚠️ New customer [Name] hasn't been contacted since onboarding (8d ago)
```

### Proactive Nudges

When a customer crosses their cadence threshold:

> "[Customer] hasn't heard from you in [X] days. They're a [tier] customer. Quick touchpoint idea: [specific suggestion based on context]."

**Touchpoint suggestions vary by context:**
- Recent purchase/project: "Check in on how [thing] is going"
- Upcoming renewal: "Touch base before the renewal conversation"
- Quiet period: "Share [relevant article/update/offer]"
- After a problem: "Follow up on [issue] resolution"
- General: "Just a 'how's it going?' — no agenda needed"

### Retention Risk Signals

Flag these in real-time, don't wait for the briefing:

| Signal | Risk Level | Action |
|--------|-----------|--------|
| Key customer past 2x their cadence threshold | High | Immediate nudge to founder |
| Customer complaint + silence after | High | Follow-up in 48 hours |
| Usage/purchase frequency declining over 3 periods | Medium | Surface trend to founder |
| Customer unresponsive to last 2 outreach attempts | Medium | Suggest different channel or approach |
| New customer hasn't engaged after onboarding | Medium | Check in within 7 days |

---

## Customer Health Dashboard

During weekly or monthly reviews, generate a customer health summary from `business/customers/interactions.md`:

```markdown
## Customer Health — Week of [Date]

### By the Numbers
- Total active customers: X
- Interactions this week: X
- Customers contacted: X / X total (X%)
- Overdue check-ins: X

### Health Distribution
- 😊 Healthy (on cadence, positive sentiment): X
- 😐 Watch (approaching threshold or neutral sentiment): X
- 😟 At risk (overdue or negative sentiment): X

### Top Actions
1. [Most urgent customer action]
2. [Second priority]
3. [Third priority]

### Wins
- [Positive customer interactions to celebrate]

### Concerns
- [Patterns or individual customers to watch]
```

---

## CRM Integration

If a CRM is connected (HubSpot, Salesforce, or similar):
- Pull interaction data automatically instead of manual logging
- Sync cadence tracking with CRM contact records
- Use CRM deal stages to inform customer tier
- Pull email open/response rates as engagement signals

If no CRM: `business/customers/interactions.md` IS the CRM. Keep it updated manually from conversation context, calendar events, and email observations.

---

## Founder Accountability

The hardest part of customer pulse isn't tracking — it's getting the founder to actually make the calls.

**When the founder keeps pushing off customer outreach:**

Don't nag. Reframe.

> "I notice [Customer] has been on the check-in list for a week. What's the blocker? Is it time, or is there something uncomfortable about the conversation?"

If it's time: "Want me to draft a quick message you can send in 30 seconds?"

If it's discomfort: "That discomfort is data. Usually the conversations we avoid are the ones that matter most. What's the worst case if you reach out today?"

**Track the pattern.** If customer outreach consistently gets deprioritized, surface it in the weekly review as a strategic concern — not a guilt trip.

> "You've deprioritized customer conversations 3 weeks in a row. That's a pattern worth noticing. The business makes money because of these people — staying close to them isn't optional."
