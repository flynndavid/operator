# Post-Event Debrief

## When to Use
Within 1-2 weeks after an event concludes. Also use when a client wants to collect attendee feedback, reconcile event finances, review vendor performance, or begin planning next year's event.

## What This Skill Does
Facilitates a structured post-event debrief process — from collecting stakeholder and attendee feedback to financial reconciliation, vendor reviews, and capturing institutional knowledge in a "Start File" for next year.

## How to Use

### Debrief Sequence
Follow this order within 7 days of the event:

1. **Day 1-2:** Internal team debrief (while memories are fresh)
2. **Day 2-3:** Send attendee feedback survey
3. **Day 3-5:** Vendor performance reviews
4. **Day 5-7:** Financial reconciliation
5. **Day 7:** Learnings capture + Start File creation
6. **Day 14:** Final summary report to client

### Internal Team Debrief
Schedule a 60-90 minute meeting with all department leads. Use this agenda:

**Agenda Template:**
1. What went well? (10 min) — round robin, everyone contributes
2. What didn't go as planned? (20 min) — specific, not personal
3. What surprised us? (10 min) — expected vs. actual
4. What would we do differently? (20 min) — actionable, not general
5. What do we want to do better next time? (15 min) — forward-looking
6. Shoutouts (5 min) — name staff/vendors who went above and beyond

Capture all responses in `tasks/completed/event-{slug}-debrief.md`.

### Attendee Feedback Collection
Send a survey within 48 hours while experience is fresh.

**Survey structure (keep to 5-7 questions max):**
1. Overall experience rating (1-5 stars)
2. What was the highlight of the event?
3. What would you improve?
4. How likely are you to attend next year? (NPS: 0-10)
5. How did you hear about us? (attribution)
6. [Optional] Would you like to volunteer or get involved?

**Analysis: what to look for**
- NPS score (Net Promoter Score) — benchmark for next year
- Top themes in "what would you improve" (cluster by category: logistics, programming, value, etc.)
- Highlight quotes for marketing and sponsor reports
- Attribution data for marketing budget decisions

### Vendor Performance Reviews
Review each vendor within 5 days of the event. Use the same people who worked directly with them.

```markdown
## Vendor Review: [Vendor Name]

**Category:** [AV / Catering / Security / etc.]
**Contract Value:** $[Amount]
**Rating:** ⭐⭐⭐⭐⭐ (1-5)

**What they did well:**

**Where they fell short:**

**Issues during event:** (reference issue log)

**Would you book again?** Yes / No / Maybe
**Recommended for other events?** Yes / No

**Notes for next year:**
```

Update vendor ratings in the vendor database (`tasks/active/vendors.md`) after each event.

### Financial Reconciliation
Pull all actuals against the budget. Create `tasks/completed/event-{slug}-financials.md`.

**P&L Summary Template:**

```markdown
# Event P&L: [Event Name]

## Revenue
| Source | Budgeted | Actual | Variance |
|--------|----------|--------|----------|
| Ticket Sales | $X | $X | $X |
| Sponsorships | $X | $X | $X |
| Vendor Fees/Booth Rent | $X | $X | $X |
| Merchandise | $X | $X | $X |
| Food & Bev % | $X | $X | $X |
| **Total Revenue** | **$X** | **$X** | **$X** |

## Expenses
| Category | Budgeted | Actual | Variance |
|----------|----------|--------|----------|
| Venue | $X | $X | $X |
| Talent/Entertainment | $X | $X | $X |
| AV/Production | $X | $X | $X |
| Catering | $X | $X | $X |
| Staffing | $X | $X | $X |
| Marketing | $X | $X | $X |
| Permits/Insurance | $X | $X | $X |
| Misc/Contingency | $X | $X | $X |
| **Total Expenses** | **$X** | **$X** | **$X** |

## Net
| | Budgeted | Actual | Variance |
|-|----------|--------|----------|
| **Net Profit/Loss** | **$X** | **$X** | **$X** |
| **Profit Margin** | **X%** | **X%** | — |

## Flags
- [Any line items that deviated >15% from budget — explain why]
```

### Learnings Capture
Distill the debrief into a concise, actionable learnings doc. Focus on changes that would move the needle.

Format:
```markdown
## Learnings: [Event Name] — [Year]

### Keep Doing
- [Specific thing that worked and should be repeated]

### Stop Doing
- [Specific thing that didn't work and should be cut]

### Start Doing Next Year
- [New idea or fix worth implementing]

### Open Questions for Next Year
- [Unresolved decisions or things to research]
```

### Start File — Next Year's Head Start
Create `tasks/active/event-{slug}-{next-year}-start-file.md` with everything future-you will wish you had:

```markdown
# Start File: [Event Name] [Next Year]
*Created: [Date] — based on [Year] learnings*

## Dates to Hold
- Proposed event date: [Date]
- Venue hold deadline: [Date — typically 6-8 months out]

## Vendor Early Calls
*Book these first — they fill up fast*
- [ ] [Vendor/category] — contact [Name] at [email/phone]
- [ ] [Vendor/category] — contact [Name] at [email/phone]

## Budget Starting Point
- Total budget target: $[Amount]
- Key adjustments from this year: [brief notes]

## Things to Do Differently
[Paste top 3-5 from learnings doc]

## Marketing Head Start
- What worked best this year: [channel/tactic]
- New things to try: [ideas]
- Sponsorship renewals to lock in early: [list]

## What Attendees Asked For
[Top requests from feedback survey]

## Contacts to Keep
[Names and roles of vendors, venue contacts, etc. worth maintaining off-season]
```

## Best Practices (from the network)
- Do the internal debrief within 48 hours if possible — after a week, the specific details everyone needs to improve are already fuzzy
- Separate "what happened" from "why it happened" and "what we'll do about it" — conflating them creates defensive conversations
- NPS below 50 for a festival is a red flag; above 70 is healthy; track it year over year
- The most valuable feedback usually comes from people who almost didn't come back — dig into the low-NPS responses
- Financial reconciliation reveals the real story; marketing budgets and talent fees are usually the biggest surprises
- The Start File is the most underused tool in events — teams that build one are dramatically better prepared the next year
- Send a "what you told us, here's what we're changing" follow-up to your attendee list — it builds loyalty and shows you listen
- Vendor performance reviews aren't just for weeding out bad vendors; they're for locking in good ones before competitors do
