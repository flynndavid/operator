# Sales Outreach

## When to Use
When the client needs to reach out to prospects — cold email, warm introductions, LinkedIn messages, follow-up sequences, or re-engagement campaigns. When they say "I need more customers" or "how do I reach [target audience]?" Also use when building outreach lists or designing multi-touch cadences.

## What This Skill Does
Designs and executes personalized outreach sequences. Drafts messages tailored to each prospect based on available research. Manages multi-touch cadences with timing and escalation logic. Tracks response rates and optimizes messaging over time. Works alongside the CRM pipeline skill — outreach creates leads, the CRM tracks them.

---

## Directory Structure

```
outreach/
  campaigns/             ← One file per outreach campaign
  sequences/             ← Reusable multi-touch sequence templates
  prospect-lists/        ← Target lists with research notes
  swipe-file/            ← Proven messages that got responses (save winners here)
```

---

## Campaign File Format

**File Naming:** `outreach/campaigns/YYYY-MM-[campaign-slug].md`

```markdown
# Outreach Campaign: [Name]

**Goal:** [e.g., Book 10 discovery calls with event organizers in Texas]
**Status:** planning | active | paused | completed
**Created:** YYYY-MM-DD
**Sequence:** [link to sequence template]
**Prospect List:** [link to prospect list]

---

## Target
- **ICP:** [Who exactly are you targeting?]
- **List Size:** [X] prospects
- **Source:** [How you found them — LinkedIn, event attendee list, referral, etc.]

## Results
| Metric | Count | Rate |
|--------|-------|------|
| Prospects contacted | [X] | — |
| Opened (if trackable) | [X] | [X]% |
| Replied | [X] | [X]% |
| Positive reply | [X] | [X]% |
| Meeting booked | [X] | [X]% |
| Converted to deal | [X] | [X]% |

## Activity Log
| Date | Action | Notes |
|------|--------|-------|
| YYYY-MM-DD | [Sent batch 1, 15 prospects] | [Notes] |

## Learnings
[What worked? What didn't? What would you change for the next campaign?]
```

---

## Multi-Touch Sequence Templates

### Sequence: Cold Email (5-Touch)

**Best for:** Prospects with no prior relationship. Email-based outreach.

| Touch | Day | Channel | Purpose | Subject Line Pattern |
|-------|-----|---------|---------|---------------------|
| 1 | Day 0 | Email | Value-first intro | `[Specific hook about them]` |
| 2 | Day 3 | Email | Follow-up + social proof | `Re: [original]` — add case study or result |
| 3 | Day 7 | LinkedIn | Connect + brief note | Reference the email |
| 4 | Day 12 | Email | New angle / different value prop | New subject line, different pain point |
| 5 | Day 20 | Email | Breakup email | `Should I close your file?` |

#### Touch 1 — Value-First Intro
```
Subject: [Personalized hook — reference their work, company, or a shared connection]

Hi [First Name],

[One sentence showing you've done your homework — mention something specific about their business, a recent achievement, or a challenge in their industry.]

I help [ICP description] with [specific outcome] — [one concrete result or proof point].

[Specific, low-commitment CTA: "Would it be worth a 15-minute call to see if this applies to you?" or "Mind if I send over a quick case study?"]

[Sign-off]
```

#### Touch 2 — Follow-Up + Proof
```
Subject: Re: [original subject]

Hi [First Name],

Following up on my note from [day]. Wanted to share a quick example:

[1-2 sentence case study: "We helped [similar company] achieve [specific result] in [timeframe]."]

[Restate CTA slightly differently: "Happy to share how — worth a quick chat?"]

[Sign-off]
```

#### Touch 3 — LinkedIn Connect
```
Hi [First Name] — I sent you a note about [topic] earlier this week. Thought I'd connect here too. [One sentence about a shared interest or their recent post.] Would love to chat if [value prop] is on your radar.
```

#### Touch 4 — New Angle
```
Subject: [Different hook — approach from a different pain point]

Hi [First Name],

Different angle from my last note — I noticed [observation about their business or industry trend].

[Frame the value prop differently: if Touch 1 was about saving time, Touch 4 is about making money. Or vice versa.]

[New CTA — offer something tangible: a teardown, audit, or specific recommendation.]

[Sign-off]
```

#### Touch 5 — Breakup
```
Subject: Should I close your file?

Hi [First Name],

I've reached out a few times and haven't heard back — totally understand if the timing isn't right.

I'll assume this isn't a priority right now and won't follow up again. But if [problem] comes up in the future, my door's open.

[Sign-off]

P.S. [Optional: one-line value reminder or link to a resource]
```

---

### Sequence: Warm Outreach (3-Touch)

**Best for:** Referrals, mutual connections, past contacts, event follow-ups.

| Touch | Day | Channel | Purpose |
|-------|-----|---------|---------|
| 1 | Day 0 | Email | Warm intro referencing connection |
| 2 | Day 5 | Email | Gentle follow-up |
| 3 | Day 12 | Email or call | Direct ask or close the loop |

#### Touch 1 — Warm Intro
```
Subject: [Mutual connection] suggested I reach out

Hi [First Name],

[Mutual connection / shared context] mentioned you might be interested in [topic/solution].

[1-2 sentences on what you do and why it's relevant to them specifically.]

Would you be open to a quick call this week? Happy to work around your schedule.

[Sign-off]
```

---

### Sequence: Re-Engagement (3-Touch)

**Best for:** Past clients, cold leads, people who ghosted.

| Touch | Day | Channel | Purpose |
|-------|-----|---------|---------|
| 1 | Day 0 | Email | Check-in + new value |
| 2 | Day 7 | Email | Share something useful |
| 3 | Day 14 | Email | Direct ask |

#### Touch 1 — Check-In
```
Subject: How's [their project/initiative] going?

Hi [First Name],

It's been a while since we connected — wanted to check in and see how [specific thing you discussed last] is going.

On our end, [brief update on something new, relevant capability, or result you've achieved].

Would love to catch up if you have 15 minutes this week.

[Sign-off]
```

---

## Prospect Research Checklist

Before sending any outreach, gather:

- [ ] **Name, title, company** — basic info
- [ ] **What their company does** — in one sentence
- [ ] **Recent news** — funding, launch, hire, event, press mention
- [ ] **Their content** — recent LinkedIn posts, blog articles, podcast appearances
- [ ] **Mutual connections** — anyone who can make a warm intro
- [ ] **Pain signals** — job postings (they're scaling), tech stack (they need integration), complaints (they're frustrated with current solution)
- [ ] **Personalization hook** — the one thing you'll reference in line 1 of your email

Save research in `outreach/prospect-lists/[campaign-slug].md`:

```markdown
# Prospect List: [Campaign Name]

| Name | Company | Title | Hook | Status | Notes |
|------|---------|-------|------|--------|-------|
| [Name] | [Co] | [Title] | [Personalization angle] | not-contacted | [Notes] |
```

---

## Workflow

1. **Define the campaign** → Who are you reaching, why, and what's the goal? Create campaign file.
2. **Build the prospect list** → Research each prospect. Quality over quantity — 20 well-researched prospects beat 200 generic ones.
3. **Choose or customize a sequence** → Pick the right sequence template (cold, warm, re-engagement). Customize for this audience.
4. **Draft personalized messages** → Use templates as starting points. Every first touch MUST have a personalized opening line. Batch draft but review individually.
5. **Execute and track** → Log sends in the campaign activity log. Track replies.
6. **Positive replies → CRM** → When someone engages, create a lead in `crm/leads/` and track from there.
7. **Save winners** → Any message that gets an above-average reply rate goes in `outreach/swipe-file/`.
8. **Post-campaign review** → What worked? Update learnings. Adjust for next campaign.

---

## Timing Best Practices

- **Best days for cold email:** Tuesday, Wednesday, Thursday
- **Best times:** 8–10 AM in the prospect's timezone
- **Avoid:** Monday mornings (inbox overload), Friday afternoons (checked out)
- **Follow-up spacing:** 3–5 days between touches (not daily — that's spam)
- **Breakup email:** Day 18–21. After that, stop. Respect the silence.
- **Re-engagement:** Wait at least 60 days before re-engaging a cold lead

---

## Heartbeat Integration

During heartbeats, if active campaigns exist in `outreach/campaigns/`:

- **Sequence timing** → "Campaign [Name]: Touch 2 for [prospects] is due today/tomorrow"
- **Stale campaigns** → Campaign marked `active` but no activity log entry in 7+ days
- **Results check** → After 2+ weeks: "Campaign [Name] has been running for [X] days — how are reply rates? Time to review what's working?"
- **CRM handoff** → "You had [X] positive replies from [Campaign] — have these been added to the CRM pipeline?"

---

## Best Practices

- **Personalization is not optional.** "Hi [First Name], I help businesses grow" will get deleted. "Hi Sarah, I saw your talk at SXSW on community-led festivals — really resonated with our work on..." will get read.
- **One CTA per message.** Don't ask them to read a case study AND book a call AND check your website. Pick one.
- **Subject lines: specific > clever.** "[Their company] + [your company]" outperforms "Quick question" every time.
- **The breakup email works.** It consistently gets the highest reply rate in any sequence. People respond to loss aversion.
- **Volume is not a strategy.** 20 personalized emails will outperform 200 templates. Especially for SMBs where every relationship matters.
- **Track everything.** You can't improve what you don't measure. Log results religiously.
- **Never misrepresent.** Don't claim a fake mutual connection. Don't pretend to have met them. Authenticity scales better than tricks.
