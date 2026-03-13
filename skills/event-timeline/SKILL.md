# Event Timeline Management

## When to Use
When the client needs to plan, track, or update an event timeline. Also when checking on upcoming deadlines or milestones.

## What This Skill Does
Manages the event timeline from planning through post-event wrap. Creates milestone-based timelines, tracks progress, alerts on upcoming deadlines, and adjusts when things shift.

## How to Use

### Create a New Event Timeline
When a client says they're planning a new event:

1. Ask for: event name, date, type, expected scale
2. Generate a milestone-based timeline working backward from event date
3. Save to `tasks/active/event-{slug}-timeline.md`
4. Set up deadline tracking in HEARTBEAT checks

### Standard Event Timeline Template

**6+ Months Out:**
- [ ] Venue confirmed and deposit paid
- [ ] Initial budget created
- [ ] Core team roles assigned
- [ ] Date announced publicly

**4-6 Months Out:**
- [ ] Headliner/main attraction booked
- [ ] Vendor shortlist created
- [ ] Sponsorship outreach started
- [ ] Early bird tickets on sale
- [ ] Marketing plan drafted

**2-4 Months Out:**
- [ ] All major vendors contracted
- [ ] Marketing campaigns live (social, email, partnerships)
- [ ] Volunteer recruitment started
- [ ] Permits and insurance confirmed
- [ ] General admission tickets on sale

**1-2 Months Out:**
- [ ] Run-of-show draft complete
- [ ] All vendor contracts signed
- [ ] Staff/volunteer schedules set
- [ ] Final marketing push (countdown content)
- [ ] Contingency plans documented

**2 Weeks Out:**
- [ ] Final vendor confirmations
- [ ] Run-of-show finalized
- [ ] Day-of contact sheet distributed
- [ ] Load-in schedule confirmed
- [ ] Weather backup plan confirmed

**Week Of:**
- [ ] Final walkthrough
- [ ] Vendor load-in coordination
- [ ] Staff briefing
- [ ] Signage and wayfinding placed
- [ ] Emergency procedures reviewed

**Day Of:**
- [ ] Morning check-in with all leads
- [ ] Vendor arrival confirmations
- [ ] Issue log started
- [ ] Real-time coordination active

**Post-Event (within 1 week):**
- [ ] Vendor thank-you notes sent
- [ ] Financial reconciliation started
- [ ] Team debrief scheduled
- [ ] Attendee feedback collected
- [ ] Learnings captured in MEMORY.md

### Adjusting Timelines
When deadlines shift:
1. Update the timeline file
2. Cascade impacts to dependent tasks
3. Flag any risks from the shift
4. Notify the client of changes and recommendations

## File Format

```markdown
# Event Timeline: [Event Name]

**Event Date:** YYYY-MM-DD
**Venue:** [Location]
**Expected Attendance:** [Number]
**Budget:** $[Amount]

## Milestones

### [Phase Name] — Due: YYYY-MM-DD
- [ ] Task 1
- [ ] Task 2
- [x] Completed task

### [Next Phase] — Due: YYYY-MM-DD
...

## Changes Log
| Date | Change | Reason | Impact |
|------|--------|--------|--------|
```
