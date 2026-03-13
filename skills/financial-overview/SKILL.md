# Financial Overview

## When to Use
When the client needs a summary of their financial health — revenue, expenses, invoices, or cash flow. Use proactively during heartbeats to flag overdue payments, unusual spending, or approaching cash flow concerns. Use when any financial event is mentioned in conversation (new invoice, payment received, unexpected expense).

## What This Skill Does
Tracks high-level financials for SMBs in markdown files. Maintains monthly revenue/expense summaries, tracks invoices and their payment status, compares actuals to budget, and surfaces proactive cash flow alerts. Not a replacement for accounting software — a real-time awareness layer that keeps the client informed between bookkeeping sessions.

---

## Directory Structure

```
finances/
  monthly/          ← monthly P&L summaries (one file per month)
  invoices/
    pending/        ← invoices not yet paid
    paid/           ← paid invoices (archived)
    overdue/        ← invoices past due date
  budget/           ← annual/quarterly budget files
  expenses/         ← logged expenses (if tracking manually)
```

---

## Monthly Summary

Create a new monthly summary at the start of each month. Update it as revenue and expenses are logged throughout the month.

**File Naming:**
`finances/monthly/YYYY-MM.md`

Example: `finances/monthly/2024-03.md`

### Monthly Summary Format

```markdown
# Financial Summary: [Month YYYY]

**Period:** YYYY-MM-01 to YYYY-MM-[last day]
**Last Updated:** YYYY-MM-DD
**Status:** in-progress | closed

---

## Revenue

| Source | Amount | Notes |
|--------|--------|-------|
| [Client / Product] | $[amount] | [e.g., retainer, project, one-time] |
| [Client / Product] | $[amount] | |
| **Total Revenue** | **$[total]** | |

## Expenses

| Category | Amount | Notes |
|----------|--------|-------|
| Software / Tools | $[amount] | |
| Contractors | $[amount] | |
| Marketing | $[amount] | |
| Office / Ops | $[amount] | |
| Other | $[amount] | |
| **Total Expenses** | **$[total]** | |

---

## Net

| Metric | Amount |
|--------|--------|
| Total Revenue | $[amount] |
| Total Expenses | $[amount] |
| **Net Income** | **$[amount]** |
| Margin | [X]% |

---

## vs. Budget

| Category | Budget | Actual | Variance |
|----------|--------|--------|----------|
| Revenue | $[budget] | $[actual] | $[+/-] |
| Expenses | $[budget] | $[actual] | $[+/-] |
| Net | $[budget] | $[actual] | $[+/-] |

---

## Pending / Outstanding

- Invoices awaiting payment: [count] — $[total value]
- Overdue invoices: [count] — $[total value]
- Expected payments this month: $[amount]

## Notes
[Any one-off items, anomalies, or context that explains this month's numbers.]
```

---

## Invoice Tracking

Every invoice should have a corresponding file. New invoices go in `finances/invoices/pending/`. Move to `paid/` when confirmed received, or to `overdue/` when past the due date.

**File Naming:**
`finances/invoices/[status]/INV-[number]_[client-slug]_YYYY-MM-DD.md`

Example: `finances/invoices/pending/INV-0042_gameplan_2024-03-01.md`

### Invoice File Format

```markdown
# Invoice INV-[number]

**Status:** draft | sent | pending | paid | overdue | disputed
**Client:** [Client name]
**Invoice Date:** YYYY-MM-DD
**Due Date:** YYYY-MM-DD
**Paid Date:** [leave blank until paid]
**Amount:** $[amount]
**Payment Method:** [e.g., ACH, credit card, check, wire]

---

## Line Items

| Description | Qty | Rate | Amount |
|-------------|-----|------|--------|
| [Service/product] | [qty] | $[rate] | $[total] |
| | | **Total** | **$[total]** |

## Notes
[Any context: what this invoice covers, any special terms, payment instructions.]

## Communication Log
| Date | Action | Notes |
|------|--------|-------|
| YYYY-MM-DD | Invoice sent | [how it was sent] |
| YYYY-MM-DD | Follow-up sent | [X days overdue] |
| YYYY-MM-DD | Payment received | [confirmation/reference] |
```

---

## Budget Tracking

Maintain an annual or quarterly budget in `finances/budget/`. Compare against monthly actuals.

**File Naming:**
`finances/budget/YYYY-annual.md` or `finances/budget/YYYY-Q[n].md`

### Budget Format

```markdown
# Budget: [Period]

**Created:** YYYY-MM-DD
**Last Updated:** YYYY-MM-DD

---

## Revenue Targets

| Source | Monthly Target | Annual Target | Notes |
|--------|---------------|---------------|-------|
| [Retainers] | $[amount] | $[amount] | |
| [Projects] | $[amount] | $[amount] | |
| [Products] | $[amount] | $[amount] | |
| **Total** | **$[amount]** | **$[amount]** | |

## Expense Budget

| Category | Monthly Budget | Annual Budget | Notes |
|----------|---------------|---------------|-------|
| Software / Tools | $[amount] | $[amount] | |
| Contractors | $[amount] | $[amount] | |
| Marketing | $[amount] | $[amount] | |
| Office / Ops | $[amount] | $[amount] | |
| **Total** | **$[amount]** | **$[amount]** | |

## Key Targets
- **MRR Goal:** $[amount]
- **Break-Even:** $[amount]/month
- **Profit Margin Target:** [X]%
```

---

## Cash Flow Awareness

Cash flow = money in vs. money out over time. Even profitable businesses can fail from poor cash flow timing.

**When to flag cash flow risk:**
- Outstanding invoices total > 30 days of expenses
- Multiple large expenses due before next payment is expected
- Revenue is behind budget by 20%+ mid-month

**Cash flow quick calc:**
```
Cash on Hand
+ Expected Payments (next 30 days)
- Expected Expenses (next 30 days)
= Projected Cash Position
```

If projected cash position < 1 month of expenses → flag as a risk.

---

## Heartbeat Integration

During heartbeats, scan `finances/invoices/` and `finances/monthly/` for:

**Immediate flags (surface every heartbeat):**
- Invoices in `overdue/` — "You have [N] overdue invoices totaling $[amount]. Oldest: [client], [X] days past due."
- Any invoice in `pending/` that crosses its due date — move to `overdue/` and flag immediately

**Regular check-ins (2–3x per week):**
- Invoices in `pending/` due within 7 days — "Invoice INV-[X] to [client] for $[amount] is due [date]."
- Monthly revenue tracking if mid-month — "You're at $[X] of your $[Y] monthly revenue target ([Z]% to goal)."

**Monthly (first heartbeat of the month):**
- Close prior month's summary file (update status to `closed`)
- Create new month's summary file
- Review budget vs. actual for prior month
- Alert on any category that ran over budget by 10%+

**Format for heartbeat surface:**
```
💰 Financial Check:
🔴 Overdue: INV-0041 — [Client] — $[amount] — [X] days past due
📅 Due Soon: INV-0042 — [Client] — $[amount] — due [date]
📊 Month-to-date: $[revenue] revenue / $[expense] expenses / $[net] net
```

---

## Payment Reminder Workflow

When an invoice goes past due:

1. **Day 1 past due:** Move file to `finances/invoices/overdue/`, update status, log in communication log
2. **Day 3 past due:** Draft a friendly reminder email (use email-drafting skill with "follow-up" tone)
3. **Day 7 past due:** Draft a firmer follow-up, escalate in heartbeat flag
4. **Day 14 past due:** Flag to client for direct conversation — something may be wrong
5. **Day 30+ past due:** Flag as potential dispute or write-off risk

---

## Best Practices

- **Track invoices the moment they're created,** not after they're paid. The pending log is where the real risk lives.
- **Separate revenue recognition from cash received.** A signed contract is not revenue until the invoice is paid.
- **Review monthly summaries before they're needed.** Looking at March financials in April is too late to act.
- **Budget is a hypothesis.** Treat variances as data — not failures — and update your assumptions accordingly.
- **Small expenses add up.** Track recurring software/tools costs — SaaS sprawl is a real drain on SMB margins.
- **Always know your break-even.** If the client doesn't know what number covers their costs each month, find out and track against it.
- **This is an awareness layer, not accounting.** For tax purposes, payroll, and compliance — use proper accounting software and/or a bookkeeper. This skill is for operational clarity between those touchpoints.
