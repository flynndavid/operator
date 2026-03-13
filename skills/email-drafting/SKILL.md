# Email Drafting

## When to Use
When the client needs to write a professional email — introductions, proposals, follow-ups, thank-yous, cold outreach, or any other business communication. Also use when tracking the status of outgoing drafts that haven't been sent yet.

## What This Skill Does
Drafts polished, context-aware emails for the client's review and approval. Handles multiple tones and scenarios, applies subject line best practices, and tracks the status of all pending drafts. **Never sends email directly — always prepares for client review first.**

---

## Tones

| Tone | When to Use |
|------|-------------|
| **Formal** | Legal, finance, first-contact enterprise, sensitive topics |
| **Friendly** | Warm intros, partners, established relationships |
| **Urgent** | Time-sensitive requests, overdue payments, expiring opportunities |
| **Follow-up** | Nudging on no-reply, checking in after a meeting |

---

## Common Scenarios & Templates

### Introduction Email
Use when meeting someone new or making a warm intro.

```
Subject: Quick intro — [Your Name] / [Context]

Hi [Name],

[1-line context on how you're connected or why you're reaching out.]

[2-3 sentences on who the client is and what they do — keep it relevant to the recipient.]

[Clear, low-friction ask: 15-minute call, coffee, quick question, etc.]

[Sign-off],
[Client Name]
```

### Proposal / Pitch Email
Use when presenting a project, partnership, or service offer.

```
Subject: Proposal: [Outcome/Project Name] for [Their Company]

Hi [Name],

[1 sentence on why you're reaching out to them specifically.]

[The problem you're solving or opportunity you've identified — 2-3 sentences.]

[What you're proposing + the outcome. Keep it concrete.]

[Social proof or brief track record if relevant.]

I've put together a short proposal. Happy to walk through it — [proposed next step].

[Sign-off],
[Client Name]
```

### Follow-Up Email
Use when following up on an unanswered email, meeting, or outstanding item.

```
Subject: Re: [Original Subject] — Following up

Hi [Name],

Just circling back on [topic] from [timeframe/date].

[One-liner recap of what was discussed or requested.]

[Specific ask or next step.]

Let me know if you need anything else from my end.

[Sign-off],
[Client Name]
```

### Thank-You Email
Use after meetings, referrals, completed projects, or positive interactions.

```
Subject: Thank you — [Context]

Hi [Name],

Wanted to take a moment to say thank you for [specific thing].

[1-2 sentences on what it meant or how it helped.]

[Optional: forward-looking note — next steps, staying in touch, etc.]

[Sign-off],
[Client Name]
```

### Cold Outreach Email
Use when reaching out to someone with no prior relationship.

```
Subject: [Specific hook — avoid generic openers]

Hi [Name],

[Hyper-personalized opener: reference something specific about them, their company, or their work.]

[1-sentence bridge to what you do and why it's relevant to them.]

[Clear, specific value prop — what problem do you solve for someone like them.]

[Single, low-commitment CTA — a question, a 10-minute call, a resource.]

[Sign-off],
[Client Name]
```

---

## Subject Line Best Practices

- **Keep it under 50 characters** when possible — avoids mobile truncation
- **Be specific, not clever** — "Proposal for Q3 activation" beats "Exciting opportunity!"
- **Lead with the value or topic** — the recipient should know what this is in 2 seconds
- **Avoid spam triggers**: "FREE", "LIMITED TIME", excessive exclamation points
- **Follow-ups**: reply in the same thread (Re: [original subject]) to maintain context
- **Cold outreach**: personalized hook > generic — reference their name, company, or recent news

---

## Workflow

1. **Gather context** — who are they emailing, what's the goal, what tone, any prior history?
2. **Draft the email** — use the appropriate template as a starting point, personalize heavily
3. **Check the subject line** — apply best practices above
4. **Save as a pending draft** — log it in `emails/drafts/`
5. **Present to client for review** — never send without explicit approval
6. **Update draft status** after client approves/sends/declines

---

## Draft Tracking

Save all drafts to `emails/drafts/` using the format below. Move sent/declined items to `emails/archive/`.

### File Naming
`emails/drafts/YYYY-MM-DD_[recipient-slug]_[subject-slug].md`

### Draft File Format

```markdown
# Email Draft: [Subject Line]

**Status:** draft | approved | sent | declined
**Created:** YYYY-MM-DD
**To:** [Recipient Name] <email@domain.com>
**CC:** [if any]
**Tone:** formal | friendly | urgent | follow-up
**Scenario:** intro | proposal | follow-up | thank-you | cold-outreach | other
**Approved By:** [Client name, date — leave blank until approved]
**Sent At:** [timestamp — leave blank until sent]

---

## Subject
[Subject line here]

## Body
[Full email body here]

---

## Notes
[Any context on why this email was drafted, relationship background, etc.]
```

---

## Heartbeat Integration

During heartbeats, check `emails/drafts/` for:
- **Stale drafts** (status = `draft`, created > 3 days ago) — surface to client: "You have a pending draft to [Name] from [date] — ready to send?"
- **Approved but unsent** (status = `approved`) — flag immediately: "This email is approved and ready to send — confirm and I'll prep it."
- **Follow-up candidates** — if a sent email is logged and no reply has been tracked after 3–5 business days, surface as a follow-up opportunity

---

## Best Practices

- **Never send without approval.** Even if the client says "just send it" in passing, confirm explicitly before treating anything as authorized.
- **Personalize every draft.** Templates are a starting point — fill in specific details before presenting.
- **Less is more.** Shorter emails get read. Cut anything that doesn't serve the ask.
- **One ask per email.** Multiple CTAs dilute response rates. Pick the most important one.
- **Match the recipient's energy.** If their prior emails are casual, don't reply with corporate stiffness.
- **Log context in Notes.** What you know about the relationship helps future drafts.
