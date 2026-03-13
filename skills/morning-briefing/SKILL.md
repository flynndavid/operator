# Morning Briefing

_Start every day knowing exactly what matters._

---

## When to Use

- Automatically every morning (triggered by heartbeat or daily cadence)
- When the founder asks "what's going on?" or "catch me up"
- After a period of absence (weekend, vacation, sick day)
- As part of a Monday planning session

**Trigger:** Daily, timed to the founder's preferred start-of-day (configured in USER.md). Default: 8:00 AM local time.

---

## Philosophy

A morning briefing is not a report. It's a co-founder walking you through what matters today before you open your inbox and get pulled in twelve directions.

Every item should lead to action. If it's not actionable, it doesn't belong in the briefing. "Revenue is $X" is a fact. "Revenue is $X, which is 15% below target — here's what I'd do about it" is a briefing.

**Keep it tight.** Under 3 minutes to read. The founder should be able to scan this on their phone with coffee and know exactly what their day looks like.

---

## Briefing Structure

### The Pulse — Financial Vitals

Check connected financial tools and business/Scoreboard.md.

- **Cash position:** Current bank balance or last-known balance. Flag if below safety threshold.
- **Revenue:** Trailing 30-day revenue vs. target. Trend direction (up, down, flat).
- **Outstanding receivables:** Total owed, anything overdue, longest-outstanding invoice.
- **Upcoming expenses:** Any large payments due this week.

**Format:**
```
💰 The Pulse
Cash: $XX,XXX | Revenue (30d): $XX,XXX (▲/▼ X% vs target)
Outstanding: $X,XXX across X invoices (X overdue)
[Flag anything urgent]
```

If financial tools aren't connected, pull from business/Scoreboard.md and note when it was last updated. Nudge the founder to update it if stale (>7 days).

---

### The Pipeline — Sales Status

Check CRM data and business/Pipeline.md.

- **Active deals:** Count and total value, by stage.
- **Follow-ups due today:** Specific leads/contacts that need outreach.
- **Stale leads:** Anyone who hasn't been contacted in too long (threshold varies by archetype).
- **New inbound:** Any new leads or inquiries since yesterday.

**Format:**
```
📊 The Pipeline
Active: X deals ($XX,XXX) | Closing this week: X ($X,XXX)
Follow up today: [Name] (last contact: X days ago), [Name]
New inbound: [X new leads/inquiries]
[Flag anything urgent]
```

---

### The People — Customer & Relationship Cadence

Check CRM data, email history, and relationship tracking data.

- **Customer interaction cadence:** Who's due for a check-in based on archetype-specific intervals.
- **Retention risks:** Customers showing disengagement signals (reduced activity, complaints, silence).
- **Team check-ins:** If the founder has team members, any people-management items due.
- **Key relationship touchpoints:** Partnerships, vendors, advisors who need attention.

**Format:**
```
👥 The People
Check-in due: [Customer] (last contact: Xd ago), [Customer]
⚠️ Retention risk: [Customer] — [reason]
Team: [Any people items]
```

---

### The Ops Queue — Tasks and Deadlines

Check tasks/active/ and business/Ops.md.

- **P1 tasks due today or overdue:** These come first, always.
- **P2 tasks due this week:** Surfaced but not alarmed.
- **Blocked tasks:** Anything stuck and why.
- **Compliance/regulatory deadlines:** Upcoming compliance items from compliance tracker.
- **Recurring ops:** Any regular operational tasks due today.

**Format:**
```
📋 The Ops Queue
🔴 Due today: [Task] (owner: [X])
🔴 Overdue: [Task] — X days late
🟠 This week: [Task], [Task]
⚠️ Blocked: [Task] — [blocker]
```

---

### The Build Progress — Strategic Context

Check business/README.md priorities and recent activity.

- **Current strategic phase:** What's the big thing being worked on right now?
- **Progress since last briefing:** What moved forward yesterday?
- **Next meaningful action:** The single most important strategic move for today.
- **Upcoming milestones:** Anything big in the next 7-14 days.

**Format:**
```
🏗️ The Build
Phase: [Current strategic focus]
Yesterday: [What moved]
Today's move: [Single most important action]
```

---

### The Wellbeing Check — How's the Founder?

Lightweight. Not preachy. Integrated naturally.

- **Pattern check:** Has the founder been working late, skipping breaks, grinding without recovery? Note it gently.
- **Weather/environment:** If weather data is available, note relevant conditions (beautiful day — take a walking meeting; rain all day — cozy focus day).
- **Energy prompt:** A single question, varied daily, to check in.
- **Suggestion:** One concrete micro-action. Not a lecture.

**Format:**
```
🧘 Wellbeing
[One observation or prompt]
[One concrete suggestion]
```

**Example variations:**
- "You were active until 11pm last night. How's your energy? Consider blocking the first hour for deep work instead of email."
- "It's 72° and sunny. If you have a call today, take it on a walk."
- "You've had back-to-back days this week. What can you move off Friday to give yourself some breathing room?"
- "Quick check — on a scale of 1-5, how's your energy today?"

---

## Delivery

### Channel
Deliver via the founder's preferred communication channel (Slack DM, Discord, or whatever's configured). If no preference, default to Slack DM.

### Formatting
- Use the section format above — scannable, emoji-marked sections.
- Bold the most important item in each section.
- Keep total length under 400 words. If there's more to say, end with "Want me to go deeper on any of these?"
- If a section has nothing to report, collapse it to one line: "📊 Pipeline: All quiet. No follow-ups due today."

### Actionable Endings
End every briefing with a clear call to action:

> "Your top 3 for today: [1], [2], [3]. Want to adjust?"

### Absence Catch-Up
If the founder has been away (weekend, vacation, sick):
- Extend the look-back window to cover the absence period
- Summarize what happened while they were out
- Prioritize more aggressively — they're coming back to a pile, so surface only what truly matters
- Lead with: "Welcome back. Here's what you need to know:"

---

## Data Sources (Priority Order)

1. Connected financial tools (Stripe, QuickBooks, bank feeds)
2. Connected CRM (HubSpot, Salesforce, or business/Pipeline.md)
3. Connected calendar
4. Connected email
5. tasks/active/ directory
6. business/ directory files
7. MEMORY.md and memory/ logs

If a data source is missing, use what's available and note gaps. Don't skip a section just because perfect data isn't available — approximate from what you have and flag uncertainty.
