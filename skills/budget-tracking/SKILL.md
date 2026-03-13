# Budget Tracking

## When to Use
When creating, monitoring, or reporting on event budgets. Also during heartbeats for spend monitoring.

## What This Skill Does
Manages event budgets with category-level tracking, spend alerts, revenue monitoring, and post-event P&L.

## Budget File Format

Maintain in `tasks/active/budget-{event-slug}.md`:

```markdown
# Budget: [Event Name]

**Total Budget:** $XX,XXX
**Spent to Date:** $X,XXX (XX%)
**Remaining:** $XX,XXX
**Alert Threshold:** 80%

## Revenue

| Source | Projected | Actual | Notes |
|--------|-----------|--------|-------|
| Ticket Sales | $X,XXX | $X,XXX | Early bird + GA |
| Sponsorships | $X,XXX | $X,XXX | |
| Merch | $X,XXX | | |
| Food/Bev % | $X,XXX | | |
| **Total Revenue** | **$XX,XXX** | **$X,XXX** | |

## Expenses by Category

### Venue ($X,XXX / $X,XXX budget)
| Item | Budgeted | Actual | Vendor | Status |
|------|----------|--------|--------|--------|
| Rental | $X,XXX | $X,XXX | [Name] | Paid |
| Insurance | $XXX | | | Pending |

### Talent / Attractions ($X,XXX / $X,XXX budget)
...

### Production / AV ($X,XXX / $X,XXX budget)
...

### Marketing ($X,XXX / $X,XXX budget)
...

### Food & Beverage ($X,XXX / $X,XXX budget)
...

### Staffing ($X,XXX / $X,XXX budget)
...

### Permits & Fees ($X,XXX / $X,XXX budget)
...

### Contingency ($X,XXX — 10% of total)
...

## Change Log
| Date | Category | Change | Amount | Reason |
|------|----------|--------|--------|--------|
```

## Heartbeat Checks

During heartbeats, check the active budget file for:

1. **Overall spend > 80%** → Alert client immediately
2. **Any category > 90%** → Flag the specific category
3. **Revenue tracking behind projections** → Surface the gap
4. **Payments due in < 2 weeks** → Remind
5. **Contingency being consumed** → Escalate if > 50% used

## Alert Templates

**Category overspend:**
> 🚨 Heads up — [Category] is at [X]% of budget ($X,XXX of $X,XXX). [Brief context]. Want to discuss reallocation?

**Overall threshold:**
> 💰 Budget alert: we've hit [X]% of total budget with [Y weeks] until the event. Biggest remaining items: [list]. Recommend we review priorities.

**Revenue shortfall:**
> 📊 Revenue check: we're at $X,XXX actual vs $X,XXX projected ([X]% of target). Ticket sales are [ahead/behind] pace. [Recommendation].

## Best Practices (from the network)
- Always include a 10-15% contingency line — it WILL be used
- Track deposits vs full payments separately for cash flow planning
- Review budget weekly during active planning phase
- Compare to past event actuals when available (calibrates projections)
- Biggest surprise costs: weather contingencies, last-minute staffing, permit fees
- Negotiate payment terms — 50% upfront / 50% post-event preserves cash flow
