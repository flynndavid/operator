# Day-of Operations

## When to Use
When the event day has arrived and the client needs real-time coordination support. Also use when building the run-of-show in the final days before the event, or when an incident needs to be logged and escalated.

## What This Skill Does
Manages real-time event execution from load-in through teardown. Tracks vendor check-ins, logs issues and incidents, coordinates staff and volunteers, monitors the run-of-show, and activates contingency plans when needed.

## How to Use

### Pre-Event: Build the Run-of-Show (ROS)
1-2 days before the event, create `tasks/active/event-{slug}-ros.md` using the template below.
Include every time block with owner, location, and dependencies.

### Day-of Activation
On event day:
1. Open the ROS and set the current time marker
2. Create `tasks/active/event-{slug}-issue-log.md` for incident tracking
3. Confirm all vendor check-ins as they arrive
4. Flag any no-shows or delays within 15 minutes of expected arrival
5. Post status updates in the client's ops channel every 1-2 hours

### Vendor Check-In Protocol
For each vendor category, track:
- **Expected arrival:** Time from load-in schedule
- **Actual arrival:** Log when they check in
- **Status:** On Time / Delayed / No-Show
- **Notes:** Any issues, substitutions, or changes

If a vendor is 30+ minutes late with no contact:
1. Call primary contact
2. Call backup contact
3. Activate backup vendor if available
4. Notify client immediately

### Issue/Incident Logging
Log every issue — small or large. Format:

```
[HH:MM] ISSUE: [Brief description]
Category: Vendor / Logistics / Safety / Weather / Technical / Attendee
Severity: Low / Medium / High / Critical
Owner: [Staff member assigned]
Status: Open / In Progress / Resolved
Resolution: [What was done]
```

Severity guide:
- **Low:** Minor inconvenience, no attendee impact
- **Medium:** Operational disruption, limited attendee impact
- **High:** Significant disruption or safety risk
- **Critical:** Imminent safety threat, event halt consideration

### Escalation Protocol
- **Low:** Track and monitor, inform client at next update
- **Medium:** Notify client within 30 minutes, propose solution
- **High:** Notify client immediately, get decision within 15 minutes
- **Critical:** Call client directly, loop in venue, activate emergency procedures if needed

### Weather Contingency Activation
If weather is a threat:
1. Monitor forecasts starting 72 hours out
2. Define the activation threshold (e.g., "rain above 0.5 in/hr OR lightning within 10 miles")
3. At threshold: notify client with Go/Hold/Cancel recommendation
4. If activating rain plan: notify all vendors, update attendee communication, adjust ROS
5. If activating evacuation: follow venue emergency protocol, use attendee alert system

### Staff/Volunteer Coordination
Maintain a day-of contacts sheet at `tasks/active/event-{slug}-contacts.md`:

```markdown
# Day-of Contacts: [Event Name]

## Command Team
- **Event Director:** [Name] — [Phone]
- **Operations Lead:** [Name] — [Phone]
- **Volunteer Coordinator:** [Name] — [Phone]

## Venue
- **Site Manager:** [Name] — [Phone]
- **Security Lead:** [Name] — [Phone]
- **Medical/First Aid:** [Name] — [Phone]

## Staff Assignments
| Role | Name | Location | Radio Channel | Phone |
|------|------|----------|---------------|-------|

## Volunteer Teams
| Team | Lead | Members | Post |
|------|------|---------|------|
```

### Real-Time Timeline Adjustments
When the schedule slips:
1. Note the delay and cause in the issue log
2. Calculate downstream impact (what has hard stops vs. flexible windows)
3. Propose adjustment options to the client (compress, cut, or cascade)
4. Update the ROS in real time — never let it get stale
5. Notify stage/area managers of any changes

## File Format — Run-of-Show Template

```markdown
# Run-of-Show: [Event Name] — [Date]

**Event Director:** [Name]
**Venue:** [Location]
**Weather Backup:** [Location/Plan]
**Emergency Line:** [Number]

## Load-In (Before Doors)
| Time | Task | Owner | Location | Status |
|------|------|-------|----------|--------|
| 07:00 | AV load-in begins | AV Vendor | Main Stage | ⬜ |
| 08:00 | Catering setup | Caterer | Food Court | ⬜ |
| 10:00 | Security briefing | Security Lead | Gate A | ⬜ |
| 11:00 | Volunteer check-in | Vol. Coord. | Tent B | ⬜ |
| 11:30 | Final walkthrough | Event Director | All Areas | ⬜ |

## Doors Open — [Time]
| Time | Task | Owner | Location | Status |
|------|------|-------|----------|--------|

## Programming
| Time | Act/Activity | Stage/Area | Duration | Notes | Status |
|------|-------------|------------|----------|-------|--------|

## Teardown
| Time | Task | Owner | Status |
|------|------|-------|--------|

## Issue Log (Live)
| Time | Issue | Severity | Owner | Resolution |
|------|-------|----------|-------|------------|
```

## Best Practices (from the network)
- The ROS should never be more than 5 minutes out of date during the event — assign one person to own it
- Brief all team leads together 1 hour before doors open — get everyone on the same page before chaos starts
- Radio silence discipline matters: use a secondary channel for non-urgent chatter so the main channel stays clear for real issues
- Walk the entire venue at T-minus 30 minutes — you'll catch things no one else reported
- Feed your team — people make better decisions when they're not hungry; build in a meal break per shift
- Document no-shows and underperformers during the event, not after — memory fades fast
- Have one person dedicated solely to attendee experience (wayfinding, lines, complaints) — ops leads are too heads-down to catch these
- Print the ROS and contacts — phones die, signal drops, and apps crash at the worst moments
