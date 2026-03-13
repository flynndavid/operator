# Relationship Tracking

## When to Use
When the client interacts with a key contact — client, vendor, partner, investor, or team member — and that interaction should be remembered. Also use during heartbeats to surface relationships that are going cold, upcoming follow-up needs, or important anniversaries. Use proactively when new people are introduced in conversation.

## What This Skill Does
Maintains a living contact database in markdown. Tracks last-contact dates, relationship health, interaction history, and follow-up reminders. Proactively surfaces relationships at risk of going cold, ensures the client stays on top of their most important connections, and captures meeting notes for future reference.

---

## Directory Structure

```
relationships/
  contacts/         ← one file per contact
  meeting-notes/    ← notes from specific meetings (referenced from contacts)
```

---

## Relationship Health Scoring

| Status | Label | Criteria |
|--------|-------|----------|
| 🔥 | **Hot** | Active engagement, recent contact (< 2 weeks), deal/project in motion |
| 🌤️ | **Warm** | Positive relationship, contacted in last 30–60 days, no active deal but on good terms |
| 🧊 | **Cold** | No contact in 60+ days, or relationship has stalled/drifted |
| ⚠️ | **At Risk** | Missed follow-up, unanswered emails, tension or uncertainty in the relationship |
| 💀 | **Inactive** | No meaningful contact in 90+ days; relationship is essentially dormant |

---

## Contact Categories

- **Client** — paying or potential customer
- **Vendor** — supplier, contractor, or service provider
- **Partner** — collaborator, referral partner, co-founder, co-creator
- **Investor** — current or prospective investor or advisor
- **Team** — employee, contractor, or core collaborator
- **Network** — valuable connection without a current active role

---

## Creating a New Contact

When a new relationship is identified or introduced:

1. Create a file in `relationships/contacts/` using the naming convention
2. Fill in everything known from context
3. Set initial health status and next follow-up date
4. Note how the relationship started (referral, cold outreach, event, etc.)

**File Naming:**
`relationships/contacts/[lastname-firstname].md`

Example: `relationships/contacts/johnson-marcus.md`

---

## Contact File Format

```markdown
# [Full Name]

**Category:** client | vendor | partner | investor | team | network
**Company:** [Company name]
**Title:** [Job title or role]
**Health:** 🔥 hot | 🌤️ warm | 🧊 cold | ⚠️ at-risk | 💀 inactive
**Last Contact:** YYYY-MM-DD
**Next Follow-Up:** YYYY-MM-DD
**Introduced Via:** [How you met or who referred]

---

## Contact Info
- **Email:** email@domain.com
- **Phone:** [if known]
- **LinkedIn:** [URL if known]
- **Other:** [Twitter, Slack, etc.]

## Background
[2-5 sentences on who this person is, what they do, and why they matter to the business.]

## Relationship History
[Narrative timeline of the relationship — how it started, key moments, current status.]

## Interaction Log
| Date | Type | Notes |
|------|------|-------|
| YYYY-MM-DD | Email | [Brief summary] |
| YYYY-MM-DD | Call | [Brief summary] |
| YYYY-MM-DD | Meeting | See: `meeting-notes/YYYY-MM-DD_[slug].md` |

## Open Items
- [ ] [Any outstanding promises, follow-ups, or pending items]

## Notes
[Anything worth remembering: preferences, sensitivities, context for next interaction, personal details they've shared.]
```

---

## Meeting Notes Format

When a meeting happens with a contact, capture notes in `relationships/meeting-notes/`:

**File Naming:**
`relationships/meeting-notes/YYYY-MM-DD_[contact-slug]_[topic-slug].md`

```markdown
# Meeting Notes: [Topic/Purpose]

**Date:** YYYY-MM-DD
**Attendees:** [Names]
**Duration:** [e.g., 45 minutes]
**Format:** in-person | video call | phone

---

## Agenda
1. [Item]
2. [Item]

## Notes
[What was discussed — key points, decisions, reactions.]

## Action Items
- [ ] [Who] — [What] — [Due date]
- [ ] [Who] — [What] — [Due date]

## Follow-Up
[What needs to happen next? Who's responsible for the next touchpoint?]

## Next Meeting
**Date:** [if scheduled]
**Agenda:** [if known]
```

---

## Updating a Relationship

After any meaningful interaction with a contact:
1. Update `Last Contact` date in their file
2. Recalculate and update `Health` status
3. Update `Next Follow-Up` date
4. Add a row to `Interaction Log`
5. Update or close any `Open Items`
6. If it was a meeting, create a meeting note file and link to it in the log

---

## Follow-Up Cadences (Suggested Defaults)

| Category | Recommended Cadence |
|----------|---------------------|
| Active client | Every 1–2 weeks |
| Warm prospect | Every 2–4 weeks |
| Strategic partner | Monthly |
| Investor/advisor | Every 4–6 weeks |
| Key network contact | Every 1–3 months |

---

## Heartbeat Integration

During heartbeats, scan `relationships/contacts/` and surface:

**Immediate flags:**
- Any contact marked ⚠️ at-risk — flag for immediate outreach
- Any follow-up date that has passed — "You were supposed to follow up with [Name] on [date]"

**Regular check-ins:**
- Contacts where `Last Contact` > 21 days and health = 🔥 hot (should be active but isn't)
- Contacts where `Last Contact` > 45 days and health = 🌤️ warm (approaching cold)
- Contacts where `Next Follow-Up` is within 2 days

**Weekly:**
- Summary of relationship health across all contacts
- Identify any active clients or key partners sliding toward cold

**Format for heartbeat surface:**
```
👥 Relationship Check:
⚠️ At Risk: [Name] — last contact [date], follow-up overdue
🧊 Going Cold: [Name] — no contact in [X] days
📅 Follow-Up Due: [Name] — was due [date]
```

---

## Best Practices

- **Update after every interaction.** A contact record with stale data is worse than no record — it creates false confidence.
- **Be specific in interaction logs.** "Called, discussed Q2 partnership" is useful. "Talked" is not.
- **Track what matters to them.** Note their priorities, what they've asked for, what they're working on. Use it next time.
- **Health is subjective — trust your gut.** If a relationship feels off, mark it at-risk and address it.
- **Don't over-engineer.** Not every acquaintance needs a contact file. Focus on relationships that have real business relevance.
- **Next Follow-Up is mandatory.** Every contact should always have a next follow-up date. If the relationship is truly inactive, set a quarterly check-in at minimum.
- **Personal details matter.** If someone mentions their kid's name, their hometown, their favorite team — note it. It makes the next conversation human.
