# Compliance Tracker

_The stuff that doesn't feel urgent until it's a crisis._

---

## When to Use

- During onboarding (seed initial compliance calendar based on archetype)
- During morning briefings (surface upcoming compliance deadlines)
- When the founder mentions anything regulatory, legal, HR, or tax-related
- Monthly and quarterly compliance review cadence
- When a new team member is hired or a contractor is engaged
- When business structure or operations change

---

## Philosophy

Small business founders don't think about compliance until something goes wrong — and by then it's expensive. The goal isn't to turn them into compliance officers. It's to make sure nothing falls through the cracks.

**Approach:** Quiet, persistent, calendar-driven. Surface items at the right time with enough lead time to act. Don't overwhelm — drip compliance tasks in at the natural cadence they're due.

**Key principle:** Compliance isn't a project. It's a rhythm. Build the rhythm once, maintain it forever.

---

## Directory Structure

```
business/compliance/
  calendar.md       ← master compliance calendar
  payroll.md        ← payroll schedule and history
  licenses.md       ← licenses, permits, registrations
  insurance.md      ← insurance policies and renewal dates
  contracts.md      ← contract review schedule
  team.md           ← HR compliance (if team exists)
```

Create files as needed — don't generate empty files for categories that don't apply.

---

## Setup (During Onboarding or First Use)

### Step 1: Discovery

Ask archetype-aware questions:

> "Let's make sure nothing important falls through the cracks. I'll ask a few questions about your compliance situation — taxes, licenses, insurance, that kind of thing."

**For all archetypes:**
- "What state/country is your business registered in?"
- "What's your business structure? (LLC, S-Corp, sole prop, etc.)"
- "Do you have an accountant or tax preparer?"
- "Do you carry any business insurance?"

**If they have employees:**
- "How many employees? W-2 or 1099 contractors or both?"
- "Who handles payroll? What tool?"
- "Do you offer benefits?"
- "When did you last do performance reviews?"

**If regulated industry:**
- "What licenses or permits does your business require?"
- "Any industry-specific certifications or continuing education requirements?"
- "Any data privacy obligations? (HIPAA, SOC2, GDPR, etc.)"

### Step 2: Build the Calendar

Create `business/compliance/calendar.md` with all identified items:

```markdown
# Compliance Calendar

_Auto-surfaced in morning briefings when items are coming due._

## Recurring Items

| Item | Frequency | Next Due | Lead Time | Owner | Notes |
|------|-----------|----------|-----------|-------|-------|
| Quarterly estimated taxes | Quarterly | YYYY-MM-DD | 14 days | Founder | Federal + state |
| Annual tax filing | Annual | YYYY-MM-DD | 30 days | Accountant | |
| Business license renewal | Annual | YYYY-MM-DD | 30 days | Founder | |
| Insurance policy renewal | Annual | YYYY-MM-DD | 45 days | Founder | Shop rates |
| [Item] | [Freq] | [Date] | [Lead] | [Owner] | [Notes] |

## One-Time Items

| Item | Due | Lead Time | Owner | Notes |
|------|-----|-----------|-------|-------|
```

### Step 3: Create Category Files

For each relevant category, create a tracking file with current status and details.

---

## Archetype-Specific Compliance

| Archetype | Key Compliance Areas |
|-----------|---------------------|
| **Solo Consultant** | Quarterly taxes, business license, professional liability insurance, contractor agreements (if subcontracting) |
| **Agency / Studio** | Payroll, contractor agreements (1099 vs W-2), client contracts, professional liability, workers comp |
| **Local Service** | Health/safety permits, occupational licenses, local business license, food handling (if applicable), ADA compliance, fire safety |
| **E-commerce / DTC** | Sales tax nexus, product liability, shipping regulations, consumer protection, data privacy (CCPA/GDPR) |
| **SaaS / Digital Product** | Data privacy (GDPR, CCPA, SOC2), terms of service, DMCA, accessibility (WCAG), data retention policies |
| **Professional Practice** | Professional license CE, malpractice insurance, records retention, HIPAA/confidentiality, mandatory reporting |
| **Nonprofit** | 990 filing, state registration, donor acknowledgment letters, grant reporting deadlines, board meeting minutes |

---

## Ongoing Operation

### Morning Briefing Integration

During each morning briefing, check `business/compliance/calendar.md`:
- Items due within their lead time window get surfaced
- Overdue items get flagged urgently
- Format: "📋 Compliance: [Item] due in [X] days. [Action needed]."

### Monthly Review

Once per month, review all compliance files:
- Are all dates still accurate?
- Any new items to add? (new hire, new tool, new state, etc.)
- Any items that can be removed? (cancelled policy, completed one-time item)
- Update `calendar.md` with any changes

### Quarterly Review

Deeper review once per quarter:
- Verify insurance coverage is adequate for current business size
- Review contractor agreements for any that need renewal
- Check for regulatory changes in the founder's industry/location
- Review tax situation with any changes in revenue or structure

---

## Team/HR Compliance (When Applicable)

If the founder has employees, track in `business/compliance/team.md`:

```markdown
# Team Compliance

## Payroll
- **Schedule:** [Biweekly / Semi-monthly / Monthly]
- **Provider:** [Tool/Service]
- **Next run:** [Date]

## Team Members
| Name | Type | Start Date | Last Review | Benefits Enrolled | Notes |
|------|------|------------|-------------|-------------------|-------|

## Upcoming
- [ ] [Name] annual review due [Date]
- [ ] Benefits enrollment window: [Date range]
- [ ] [Name] contractor agreement renewal: [Date]

## Completed
[Archive of completed HR compliance items]
```

### HR Cadence Items
- **Performance reviews:** Annual or semi-annual, with 30-day advance notice to prep
- **Benefits enrollment:** Track open enrollment windows, remind 14 days before
- **Contractor agreement review:** Annual review of all 1099 relationships
- **Handbook updates:** Annual review if employee handbook exists
- **Workers comp audit:** Annual if applicable

---

## Alerts

| Urgency | Timing | Action |
|---------|--------|--------|
| **Heads-up** | Item enters lead time window | Mention in morning briefing |
| **Reminder** | 7 days before due | Dedicated message with action steps |
| **Urgent** | 2 days before due | Flag as P1, specific instructions |
| **Overdue** | Past due | Immediate alert, consequences explained, remediation steps |
