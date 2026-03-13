# Meeting Prep

## When to Use
When a meeting is coming up and the client needs to be prepared. Use proactively when calendar events are detected within the next 24–48 hours. Also use after meetings to capture summaries and track follow-ups.

## What This Skill Does
Prepares briefing documents before meetings, helps draft and distribute agendas, researches attendees and topics, surfaces action items from prior meetings, and produces post-meeting summaries with tracked follow-ups. Integrates with calendar data to proactively alert on upcoming meetings.

---

## Meeting Lifecycle

```
Calendar Event Detected
        ↓
  Pre-Meeting Prep
  (24–48h before)
        ↓
  Briefing Doc Created
        ↓
  Meeting Happens
        ↓
  Post-Meeting Summary
        ↓
  Action Items Tracked → tasks/active/
```

---

## Directory Structure

```
meetings/
  upcoming/         ← briefing docs for scheduled meetings
  archive/          ← past meeting summaries
  recurring/        ← templates for regular recurring meetings
```

---

## Pre-Meeting: Briefing Doc

For every significant meeting, create a briefing doc at least 24 hours in advance. File it under `meetings/upcoming/`.

**File Naming:**
`meetings/upcoming/YYYY-MM-DD_[meeting-slug].md`

Example: `meetings/upcoming/2024-03-15_q1-review-darren.md`

### Briefing Doc Format

```markdown
# Meeting Brief: [Meeting Title]

**Date:** YYYY-MM-DD at HH:MM [timezone]
**Duration:** [e.g., 60 minutes]
**Format:** in-person | video call | phone
**Location/Link:** [Address or video URL]
**Organized By:** [Name]

---

## Attendees
| Name | Company | Role | Notes |
|------|---------|------|-------|
| [Name] | [Company] | [Title] | [e.g., decision-maker, new contact] |

## Context
[2-4 sentences on why this meeting is happening. What's the current state of the relationship or project? What led to this meeting?]

## Objective
**What does a successful meeting look like?**
[One clear sentence: "Leave with verbal agreement on proposal" / "Unblock the staging deployment" / "Align on Q2 scope."]

## Agenda
1. [Topic] — [time allocation, e.g., 10 min]
2. [Topic] — [time allocation]
3. [Topic] — [time allocation]
4. Q&A / Next Steps — [time allocation]

## Background on Attendees
[For each key attendee: who are they, what do they care about, any history or context worth knowing. Pull from relationship tracking files if available.]

## Open Items from Last Meeting
[Pull from prior meeting notes or action items. What was promised or left unresolved?]
- [ ] [Item owner] — [Item description]

## Key Points to Make
[2-5 bullet points the client should hit in this meeting.]

## Potential Concerns / Objections
[What might come up that the client should be prepared for? How to respond?]

## Materials to Bring
- [ ] [Proposal, deck, contract, etc.]
- [ ] [Any other prep needed]

## Notes
[Anything else the client should know going in.]
```

---

## Agenda Creation & Distribution

When creating an agenda to share with attendees:

1. Draft a clean, external-facing version from the briefing doc agenda section
2. Present to client for review
3. Client approves and sends (or client asks you to help distribute)

**External Agenda Format:**
```markdown
# [Meeting Title] — Agenda

**Date:** [Date and time]
**Duration:** [Length]
**Location/Link:** [Where]

---

1. [Topic] (X min)
2. [Topic] (X min)
3. [Topic] (X min)
4. Q&A and Next Steps (X min)

Looking forward to connecting. Please let me know if you'd like to add anything.

[Client name]
```

---

## Background Research

When preparing for a meeting with a new contact or company:

**For individuals:**
- Recent LinkedIn activity or posts (if public)
- Mutual connections or shared context
- Any prior interactions logged in `relationships/contacts/`
- News or announcements related to their company

**For companies:**
- Business model and recent news
- Known pain points relevant to the client's offering
- Current projects or initiatives that intersect with the meeting topic

**Research checklist:**
- [ ] Review contact file in `relationships/contacts/` if it exists
- [ ] Check for recent news on their company
- [ ] Identify any known concerns, priorities, or constraints
- [ ] Note any personal context (referral source, mutual connections)

---

## Post-Meeting: Summary

After the meeting, create a summary and move the file to `meetings/archive/`.

**File Naming (archive):**
`meetings/archive/YYYY-MM-DD_[meeting-slug].md`

### Summary Format

```markdown
# Meeting Summary: [Meeting Title]

**Date:** YYYY-MM-DD
**Attendees:** [Names]
**Duration:** [Actual duration]

---

## What Was Discussed
[Bullet points or narrative of what actually happened. Be concrete — not "we discussed the project" but what was decided, what was learned, what shifted.]

## Key Decisions
- [Decision 1]
- [Decision 2]

## Action Items
| Owner | Task | Due Date | Status |
|-------|------|----------|--------|
| [Name] | [Task] | YYYY-MM-DD | todo |
| [Name] | [Task] | YYYY-MM-DD | todo |

## What Went Well
[Optional: useful for recurring meetings to improve over time.]

## Follow-Up Needed
[Anything that requires a follow-up email, call, or document. Create corresponding tasks in tasks/active/.]

## Next Meeting
**Date:** [if scheduled]
**Agenda items to carry forward:** [if any]
```

---

## Recurring Meetings

For meetings that happen on a regular cadence (weekly standups, monthly reviews, etc.), store a template in `meetings/recurring/`. When the meeting comes up, copy the template and fill in the specifics.

**Template File Naming:**
`meetings/recurring/[meeting-slug]-template.md`

---

## Heartbeat Integration

During heartbeats, check for upcoming calendar events and meetings in `meetings/upcoming/`:

**24–48 hours before a meeting:**
- Alert the client: "You have [meeting name] with [attendee(s)] tomorrow at [time]. Brief is ready — want me to review it with you?"
- If no briefing doc exists yet, create one automatically and notify

**Morning of a meeting:**
- Surface key bullet points from the briefing doc: objective, top 2–3 points to make, any open action items from last time

**After expected meeting time:**
- Prompt for post-meeting summary: "Your [meeting name] should be wrapping up. Want to capture notes while it's fresh?"

**Weekly:**
- Check `meetings/archive/` for action items that haven't been transferred to `tasks/active/` yet
- Surface any recurring meetings coming up that don't have briefing docs

---

## Best Practices

- **Brief before every significant meeting.** Even 15 minutes of prep changes the quality of a meeting.
- **Objective over agenda.** The agenda is a plan; the objective is the goal. Always start with what success looks like.
- **Know your attendees.** The more you know about who's in the room, the better you can tailor the conversation.
- **Surface open items first.** Starting a meeting by honoring prior commitments builds trust fast.
- **Post-meeting summary within 24 hours.** Memories fade. Action items without a summary often never happen.
- **One owner per action item.** "We" don't do things — individuals do. Assign clearly.
- **Keep recurring meetings fresh.** If the same agenda runs every week with no changes, the meeting might not be necessary.
