# CRM Pipeline

## When to Use
When the client mentions a lead, prospect, deal, opportunity, or sales conversation. When they say things like "I talked to someone interested," "we got an inquiry," "they want a quote," or "where are we with [prospect]?" Also use during heartbeats to flag stale deals, overdue follow-ups, and pipeline health.

## What This Skill Does
Maintains a lightweight CRM entirely in markdown. Tracks leads from first contact through closed-won or closed-lost. Manages pipeline stages, deal scoring, follow-up reminders, and conversion metrics. The agent IS the CRM — no external tool needed.

---

## Directory Structure

```
crm/
  pipeline.md            ← Master pipeline view (auto-generated summary)
  leads/                 ← One file per lead/deal
  archive/               ← Closed-won and closed-lost deals
  templates/             ← Reusable proposal/quote templates
```

---

## Pipeline Stages

| Stage | Code | Description |
|-------|------|-------------|
| **New Lead** | `new` | Just identified — no meaningful conversation yet |
| **Contacted** | `contacted` | First outreach sent or initial conversation happened |
| **Qualified** | `qualified` | Confirmed they have budget, need, and timeline |
| **Proposal Sent** | `proposal` | Formal proposal, quote, or SOW delivered |
| **Negotiation** | `negotiation` | Active back-and-forth on terms, scope, or price |
| **Closed Won** | `won` | Deal signed, payment received or committed |
| **Closed Lost** | `lost` | Deal dead — capture why for learning |

---

## Deal Scoring

Score each deal 1–5 on three dimensions. Total score (out of 15) determines priority.

| Dimension | 1 (Low) | 3 (Medium) | 5 (High) |
|-----------|---------|------------|----------|
| **Fit** | Poor match for what we offer | Decent overlap | Perfect fit for our strengths |
| **Budget** | Unknown or unlikely to pay | Has budget but price-sensitive | Budget confirmed, willing to invest |
| **Urgency** | "Someday" / exploring | Has a timeline (next quarter) | Needs it now, has a deadline |

**Priority tiers:**
- 12–15: 🔴 **Hot** — work this deal daily
- 8–11: 🟡 **Warm** — check in weekly
- 4–7: 🟢 **Nurture** — monthly touchpoint
- 1–3: ⚪ **Long shot** — low effort, keep on radar

---

## Lead File Format

**File Naming:** `crm/leads/[company-or-name-slug].md`

```markdown
# [Lead Name / Company]

**Contact:** [Name] — [Title]
**Email:** [email]
**Phone:** [if known]
**Source:** referral | inbound | cold-outreach | event | social | other
**Referred By:** [name, if applicable]

---

## Deal Info
**Stage:** new | contacted | qualified | proposal | negotiation
**Value:** $[estimated deal size]
**Score:** Fit: [1-5] · Budget: [1-5] · Urgency: [1-5] → Total: [X/15]
**Priority:** 🔴 hot | 🟡 warm | 🟢 nurture | ⚪ long-shot
**Created:** YYYY-MM-DD
**Last Activity:** YYYY-MM-DD
**Next Action:** [What + When]
**Expected Close:** YYYY-MM-DD [best estimate]

---

## What They Need
[2-5 sentences on their problem, what they're looking for, and how we can help.]

## Why Us (or Why Not)
[Why we're a good fit — or what concerns/blockers exist.]

## Activity Log
| Date | Action | Notes |
|------|--------|-------|
| YYYY-MM-DD | [Type] | [Brief summary] |

## Proposal / Quote
[Link to proposal file if sent, or key terms discussed.]

## Notes
[Background, competitive intel, personal notes, anything useful for the next touchpoint.]
```

---

## Pipeline Summary (pipeline.md)

Regenerate this file whenever deals change. This is the at-a-glance view.

```markdown
# Sales Pipeline

**Last Updated:** YYYY-MM-DD
**Total Active Deals:** [count]
**Total Pipeline Value:** $[sum]
**Weighted Value:** $[sum × stage probability]

---

## 🔴 Hot Deals (Score 12+)
| Deal | Stage | Value | Next Action | Due |
|------|-------|-------|-------------|-----|

## 🟡 Warm Deals (Score 8-11)
| Deal | Stage | Value | Next Action | Due |
|------|-------|-------|-------------|-----|

## 🟢 Nurture (Score 4-7)
| Deal | Stage | Value | Next Action | Due |
|------|-------|-------|-------------|-----|

## Recently Closed
| Deal | Result | Value | Close Date | Win/Loss Reason |
|------|--------|-------|------------|-----------------|

---

## Conversion Metrics
- Leads → Qualified: [X]%
- Qualified → Proposal: [X]%
- Proposal → Won: [X]%
- Average deal cycle: [X] days
- Average deal size: $[X]
```

---

## Stage Probability (for Weighted Pipeline)

| Stage | Probability |
|-------|-------------|
| New Lead | 5% |
| Contacted | 10% |
| Qualified | 25% |
| Proposal Sent | 50% |
| Negotiation | 75% |
| Closed Won | 100% |
| Closed Lost | 0% |

---

## Workflow

1. **New lead arrives** → Create lead file in `crm/leads/`, fill in what's known, set initial score
2. **After each interaction** → Update activity log, adjust stage/score, set next action with date
3. **Stage advancement** → When moving stages, update the stage field and add an activity log entry explaining why
4. **Proposal sent** → Log proposal terms, save proposal draft in `crm/templates/` if reusable
5. **Deal closes** → Move file to `crm/archive/`, record win/loss reason, update pipeline.md
6. **Regenerate pipeline.md** → After any deal changes, rebuild the summary view

---

## Qualification Framework (BANT-lite)

Before moving a lead to `qualified`, confirm at least 3 of 4:

- **Budget** — Can they afford what we offer? Have they discussed price ranges?
- **Authority** — Is this person the decision-maker, or do they need approval?
- **Need** — Is the problem real and painful enough to pay for a solution?
- **Timeline** — Do they have a deadline or trigger event driving urgency?

If you can only confirm 2, keep at `contacted` and note which gaps remain.

---

## Heartbeat Integration

During heartbeats, scan `crm/leads/` and surface:

**Immediate flags:**
- Any deal where `Next Action` date has passed — "Overdue: You were supposed to [action] for [Lead] on [date]"
- Any `🔴 hot` deal with no activity in 5+ days — "Your hottest deal [Name] has gone quiet — time to check in?"

**Weekly pipeline review:**
- Total pipeline value and deal count
- Deals that advanced or stalled this week
- Proposals outstanding for 7+ days with no response
- Leads sitting in `new` for 10+ days without being contacted

**Monthly:**
- Conversion rate trends
- Average time in each stage
- Win/loss analysis for closed deals

**Format for heartbeat surface:**
```
📊 Pipeline Check:
🔴 Overdue: [Lead] — [action] was due [date]
⏳ Stale: [Lead] at [stage] for [X] days, no activity
💰 Pipeline: [X] active deals worth $[Y] ($[Z] weighted)
```

---

## Closing a Deal

### Won
1. Update stage to `won`, set `Last Activity` to close date
2. Move file to `crm/archive/won/[filename].md`
3. Add a closing note: what clinched it, how long the cycle was, lessons
4. If this is a recurring client, create/update their contact in `relationships/contacts/`
5. Trigger any onboarding workflow if applicable

### Lost
1. Update stage to `lost`, set `Last Activity` to close date
2. Move file to `crm/archive/lost/[filename].md`
3. **Always capture the loss reason** — this is the most valuable data in the CRM:
   - Price too high
   - Chose a competitor (which one?)
   - Timing wasn't right
   - Went with internal solution
   - Ghosted / no response
   - Scope mismatch
4. Consider: should this lead be revisited in 3–6 months? If so, set a future follow-up

---

## Best Practices

- **Update after every touchpoint.** A CRM that's 3 days stale is already lying to you.
- **Score honestly.** Don't inflate scores because you want a deal to be hot. Score what you know, not what you hope.
- **Next Action is mandatory.** Every active deal must have a next action with a date. No exceptions. A deal without a next step is a deal you're losing.
- **Keep notes useful.** "Good call" tells you nothing in 3 weeks. "They're comparing us to [Competitor], decision by March 15, worried about integration" is gold.
- **Review losses.** The lost deals teach you more than the wins. Look for patterns monthly.
- **Don't hoard leads.** If a lead is clearly not a fit, close it as lost immediately. A clean pipeline is an honest pipeline.
