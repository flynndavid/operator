# Sponsorship Management

## When to Use
When a client needs to find sponsors, design sponsorship packages, track deals in progress, manage sponsor deliverables, report ROI to sponsors, or build the renewal pipeline for next year.

## What This Skill Does
Manages the full sponsorship lifecycle — from prospecting and package design to contract tracking, deliverable fulfillment, ROI reporting, and renewal. Keeps the pipeline moving and ensures sponsors get the value they paid for.

## How to Use

### Sponsorship Package Design
Before prospecting, build the package menu. Ask the client:
1. What assets do we have to offer? (logo placements, stage mentions, booths, email reach, social posts, VIP access, etc.)
2. What are our attendance numbers and demographics?
3. What did we charge last year, and was that met with resistance or eagerness?
4. Are there any exclusive or category-exclusive packages available?

**Standard Tier Framework:**

```markdown
# Sponsorship Packages: [Event Name] [Year]

## Title Sponsor — $[Amount] (1 available)
- Event named after sponsor or "presented by" credit
- [X] logo placements (stage backdrop, entrance, website hero)
- MC mentions throughout the event
- [X] social posts across all channels
- Logo on all print/digital marketing
- [X] VIP tickets + hospitality area
- Booth space: [size]
- Email newsletter feature (pre-event + post-event)
- Year-over-year right of first refusal

## Gold Sponsor — $[Amount] ([X] available)
- Logo on stage and signage
- [X] social posts
- [X] VIP tickets
- Booth space: [size]
- Email newsletter mention

## Silver Sponsor — $[Amount] ([X] available)
- Logo on select signage and website
- [X] standard tickets
- Booth space: [size]

## Community Sponsor — $[Amount] ([X] available)
- Logo on website and event map
- [X] standard tickets
- Table in sponsor village

## À La Carte Options
- Stage naming rights: $[Amount]
- WiFi sponsor: $[Amount]
- Lanyard/badge sponsor: $[Amount]
- Mobile app sponsor: $[Amount]
- Water station sponsor: $[Amount]
```

### Sponsor Prospecting
Identify targets using these categories:
1. **Past sponsors** — warmest leads; reach out first
2. **Competitor event sponsors** — already sponsor-minded, know the value
3. **Category fit** — businesses whose customers match your attendee demographics
4. **Local anchor businesses** — high goodwill value, often easier close
5. **National brands with local activation budgets** — larger checks, more hoops

Track all prospects in `tasks/active/event-{slug}-sponsors.md`.

### Outreach Sequence
For cold prospects:
- **Day 1:** Initial email with deck attachment
- **Day 5:** Follow-up if no response — one line, keep it simple
- **Day 12:** Final follow-up — include urgency (limited tiers)
- **Day 20:** Mark inactive, note for next cycle

For warm/past sponsors:
- **Day 1:** Personal outreach (phone or email) before sending the deck
- Reference something specific from last year's event
- Offer early access to new packages or a rate lock

### Sponsor Pipeline Tracker

Maintain in `tasks/active/event-{slug}-sponsors.md`:

```markdown
# Sponsor Pipeline: [Event Name]

## Active Deals
| Company | Contact | Tier | Value | Stage | Next Step | Due |
|---------|---------|------|-------|-------|-----------|-----|
| Acme Co | Jane Smith | Gold | $5,000 | Proposal sent | Follow up | MM/DD |

## Stages
- **Prospecting** — identified, not yet contacted
- **Outreach** — first contact made
- **Deck sent** — proposal in their inbox
- **In negotiation** — active conversation on terms
- **Contract sent** — waiting on signature
- **Signed** — confirmed, deposit due
- **Active** — deposit paid, delivering
- **Complete** — event over, invoice paid
- **Declined** — not this year, note reason
- **Renewal** — flagged for next year outreach

## Closed / Confirmed Sponsors
| Company | Tier | Value | Contract | Payment Status | Deliverables |
|---------|------|-------|----------|----------------|--------------|

## Pipeline Value
- Confirmed: $[Total]
- In Negotiation: $[Total]
- Prospecting: $[Total]
- Goal: $[Total]
```

### Contract & Deliverable Tracking
Once a sponsor is signed, create a deliverables checklist:

```markdown
## Sponsor Deliverables: [Company Name] — [Tier]

**Contract Value:** $[Amount]
**Payment Terms:** [e.g., 50% on signing, 50% 30 days before event]
**Payment Status:** [ ] Deposit received [ ] Final payment received

### Deliverables Owed to Sponsor
- [ ] Logo on website — Due: [date]
- [ ] Logo on print materials — Due: [date]
- [ ] Social post 1 — Due: [date]
- [ ] Social post 2 — Due: [date]
- [ ] Email mention — Due: [date]
- [ ] Booth space confirmed — Due: [date]
- [ ] VIP tickets sent — Due: [date]
- [ ] Post-event ROI report — Due: [date]

### Assets Needed from Sponsor
- [ ] High-res logo — Requested: [date] | Received: [date]
- [ ] Approved copy/tagline — Requested: [date] | Received: [date]
- [ ] On-site contact for event day — Requested: [date] | Received: [date]
```

During heartbeats, flag:
- Deliverables overdue by more than 3 days
- Sponsor assets not received within 2 weeks of deadline
- Payments not received within 5 days of due date

### Sponsor ROI Report
Within 2 weeks post-event, send each sponsor a personalized recap:

```markdown
# Sponsorship Recap: [Event Name] — [Year]
*Prepared for: [Sponsor Company]*

## Event at a Glance
- Total Attendance: [Number]
- Attendee Demographics: [Age range, key stats]
- Social Reach: [Impressions across all channels]

## Your Sponsorship Impact
- Logo impressions (on-site signage): ~[estimate]
- Website logo impressions: [GA data]
- Email reach: [subscribers] — [open rate]
- Social post performance: [impressions / engagements]
- Stage mentions: [number] times to live audience of [number]

## Media Coverage
- [Link to any press coverage, photo galleries, etc.]

## Highlights
[2-3 sentences about what made the event special — same tone as your marketing]

## Thank You
[Personal note from the event director]

## Next Year
We'd love to continue the partnership. [Details about renewal or first right of refusal.]
```

### Renewal Pipeline
After each event, flag renewals in the tracker and schedule outreach for 60-90 days post-event (when sponsors still remember the goodwill):
1. Mark sponsors as "Renewal" status immediately after event
2. Set a heartbeat reminder for 60 days out
3. Outreach with personalized recap + early-bird offer for next year
4. Goal: lock in 50%+ of sponsors before general outreach begins

## Best Practices (from the network)
- Sponsors buy audiences, not events — lead with demographics and reach, not just the event vibe
- Category exclusivity is one of your highest-value offerings; never give it away at lower tiers
- The fastest path to new sponsors is a warm referral from a current one — always ask
- Response rates on cold outreach drop 60% after the 3rd follow-up; don't burn goodwill by overcontacting
- Get logos and assets from sponsors at contract signing, not later — chasing assets kills production timelines
- The ROI report isn't a formality; it's the primary tool for renewal conversion — make it specific and visual
- Sponsors want recognition, not just logo placement — a brief stage shoutout is often worth more to them than a banner
- Start renewal conversations while the event glow is still fresh — don't wait until you're building next year's deck
