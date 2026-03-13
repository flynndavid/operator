# Task Management

## When to Use
When the client needs to create, track, or review tasks. Also use during heartbeats to surface overdue items, upcoming deadlines, and weekly cleanup. Use proactively whenever work is discussed — turn action items into tracked tasks immediately.

## What This Skill Does
Creates and manages tasks in markdown files under `tasks/active/`. Tracks priority, due dates, owners, and status. Sends proactive deadline reminders during heartbeats. Runs weekly cleanup to archive completed work and keep the active list lean.

---

## Directory Structure

```
tasks/
  active/          ← all in-progress tasks live here
  completed/       ← moved here when done
  templates/       ← reusable task templates for recurring work
```

---

## Priority Levels

| Priority | Label | When to Use |
|----------|-------|-------------|
| 🔴 | **P1 — Critical** | Blocks revenue, has a hard deadline today/tomorrow, or has serious consequences if missed |
| 🟠 | **P2 — High** | Important, due this week, affects a key relationship or deliverable |
| 🟡 | **P3 — Medium** | Should happen soon but won't break anything if it slips a day or two |
| ⚪ | **P4 — Low** | Nice-to-have, no hard deadline, background work |

---

## Creating a New Task

When a new task is identified (from conversation, email, meeting, heartbeat):

1. Determine: what's the task, who owns it, when is it due, what's the priority?
2. Create a file in `tasks/active/` following the naming convention
3. Fill in the task template below
4. If it's a subtask of a larger project, link to the parent task

**File Naming:**
`tasks/active/YYYY-MM-DD_[priority]_[short-slug].md`

Example: `tasks/active/2024-03-15_p1_send-contract-to-darren.md`

---

## Task File Format

```markdown
# Task: [Task Title]

**Priority:** P1 | P2 | P3 | P4
**Status:** todo | in-progress | blocked | done
**Due:** YYYY-MM-DD
**Owner:** [Client name or team member]
**Project:** [Project name if applicable]
**Created:** YYYY-MM-DD
**Updated:** YYYY-MM-DD

---

## Description
[Clear description of what needs to be done and why.]

## Checklist
- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

## Blockers
[What's blocking this task, if anything. Leave blank if unblocked.]

## Notes
[Any relevant context, links, decisions, or background.]

## Related
- [Link to related task or file if applicable]
```

---

## Recurring Task Templates

For work that repeats on a schedule, store templates in `tasks/templates/`. When the recurring task comes up, copy the template and fill in the current date/context.

**Template File Format:**
```markdown
# Task Template: [Template Name]

**Recurrence:** weekly | monthly | quarterly | ad-hoc
**Default Priority:** P1 | P2 | P3 | P4
**Estimated Time:** [e.g., 30 minutes]

---

## Description
[What this recurring task involves.]

## Standard Checklist
- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

## Notes for Next Run
[Space to capture notes when completing this task that inform the next run.]
```

**Common templates to set up:**
- `weekly-review.md` — weekly task triage
- `monthly-invoicing.md` — send invoices and follow up on payments
- `client-check-in.md` — regular client status touchpoint
- `content-publish.md` — content creation and scheduling workflow

---

## Completing a Task

When a task is done:
1. Update `Status: done` and `Updated: YYYY-MM-DD` in the file
2. Check all checklist items
3. Move the file from `tasks/active/` to `tasks/completed/`
4. If the task generated any important output (decisions, deliverables), note them in the file before archiving

---

## Weekly Task Review

Every week (typically Monday morning or Friday afternoon):

1. Scan all files in `tasks/active/`
2. Check for:
   - Overdue tasks (due date has passed, status ≠ done)
   - Stale tasks (no update in 7+ days)
   - Tasks that can be closed out
   - Priority shifts based on current business context
3. Archive any completed tasks to `tasks/completed/`
4. Surface the top 3 priorities to the client for the week
5. Create any new tasks that came up in the review

---

## Heartbeat Integration

During every heartbeat, check `tasks/active/` and surface:

**Immediate flags:**
- P1 tasks due today or tomorrow
- Any task marked `blocked` (surface the blocker to the client)

**Regular check-ins:**
- P2 tasks due within 3 days
- Tasks that haven't been updated in 5+ days (stale check)
- Count of open tasks by priority — flag if P1/P2 pile is growing

**Weekly (Monday heartbeat):**
- Full weekly review (see above)
- Summarize: "You have X tasks this week — [P1s], [P2s], [P3s]. Top priorities: [list top 3]."

**Format for heartbeat surface:**
```
📋 Task Update:
🔴 P1 (due today/tomorrow): [task name] — due [date]
🟠 P2 (due this week): [task name], [task name]
⚠️ Blocked: [task name] — [blocker]
```

---

## Best Practices

- **Capture tasks immediately** — when an action item comes up in conversation, create the file right away. Don't rely on memory.
- **One task per file** — avoids tangled checklists and makes archiving clean.
- **Keep descriptions concrete** — "Send revised contract to Darren" beats "Contract stuff."
- **Assign ownership** — if it's unclear who owns a task, it won't get done.
- **Don't let P1 pile up** — if there are more than 3 P1 tasks at once, something is wrong. Triage with the client.
- **Archive ruthlessly** — a lean active list is more useful than a complete one. If it won't happen, close it or explicitly deprioritize it.
- **Review beats create** — spending 10 minutes reviewing existing tasks is usually more valuable than adding more.
