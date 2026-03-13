# SOP Generator

_If you've done it twice, it should be written down._

---

## When to Use

- Founder describes a process they do repeatedly
- A team member asks "how do I do [X]?" and the answer doesn't exist anywhere
- During onboarding when delivery processes are discussed
- After a mistake caused by inconsistent process execution
- When the founder says "I need to document this" or "let me show you how I do this"
- Proactively when you observe a repeated workflow that isn't documented

---

## Philosophy

SOPs aren't bureaucracy. They're freedom. A documented process is a process the founder can hand off, delegate, or automate. An undocumented process lives in one person's head — and that's a single point of failure.

**Tone:** Practical, clear, no jargon. The SOP should be usable by someone who's never done the task before. Write for the new hire on day one.

**Key principle:** The best SOP is the shortest one that still works. Don't over-document. If a step is obvious, skip it. If a step is critical, bold it.

---

## Process

### Step 1: Interview

Don't generate an SOP from assumptions. Interview the person who actually does the work.

**Opening:**
> "Let's document this so anyone can do it. Walk me through exactly how you do [process] — step by step, including the parts you think are obvious."

**During the interview, listen for:**
- The exact sequence of steps
- Tools and logins required
- Decision points ("if X, then do Y; otherwise do Z")
- Common mistakes and how to avoid them
- How long each step takes
- Who's responsible for each step (if multi-person)
- What "done" looks like

**Probe for hidden knowledge:**
- "What's the thing someone always gets wrong the first time?"
- "Are there any steps where the order matters?"
- "What do you do when something goes wrong midway through?"
- "Is there a time-sensitive part — something that has to happen within a certain window?"

### Step 2: Draft

Generate the SOP using the standard format below. Store it in `business/sops/`.

**File naming:** `business/sops/[process-name].md`
Examples: `business/sops/client-onboarding.md`, `business/sops/invoice-processing.md`, `business/sops/content-publishing.md`

### Step 3: Review

Present the draft to the founder for review.

> "Here's the SOP for [process]. Read through it and tell me if I got anything wrong, missed a step, or over-complicated something."

Iterate until they confirm it's accurate.

### Step 4: Link

Add a reference to the new SOP in `business/Ops.md` under the relevant section (daily, weekly, monthly, or ad-hoc operations).

---

## SOP Template

```markdown
# SOP: [Process Name]

**Owner:** [Who's responsible for this process]
**Frequency:** [Daily / Weekly / Monthly / As-needed]
**Time required:** [Estimated duration]
**Last reviewed:** [Date]
**Review schedule:** [Quarterly / Semi-annually / After every X occurrences]

---

## Purpose

[One or two sentences: why this process exists and what it achieves.]

## When to Use

[Specific triggers that mean it's time to run this process.]

## Prerequisites

[What needs to be true before you start. Tools, access, information required.]

- [ ] [Prerequisite 1]
- [ ] [Prerequisite 2]

## Steps

### 1. [Step Name]
[Clear instruction. One action per step. Include the specific tool or system if relevant.]

> **Tip:** [Optional — helpful context for someone doing this the first time.]

### 2. [Step Name]
[Next step.]

**Decision point:** If [condition], go to Step 3a. Otherwise, continue to Step 3.

### 3. [Step Name]
[Continue until process is complete.]

## Definition of Done

[How do you know this process was completed correctly? What does the output look like?]

- [ ] [Completion check 1]
- [ ] [Completion check 2]

## Common Issues

| Issue | Cause | Fix |
|-------|-------|-----|
| [Problem] | [Why it happens] | [What to do] |

## Notes

[Anything else — links, reference material, historical context.]
```

---

## Archetype-Aware Defaults

When generating SOPs, draw on industry-standard procedures where applicable:

| Archetype | Common SOPs to Suggest |
|-----------|----------------------|
| **Solo Consultant** | Client onboarding, proposal writing, invoicing, project kickoff, project closeout |
| **Agency / Studio** | Client intake, creative brief, review/approval workflow, time tracking, project handoff |
| **Local Service** | Opening/closing procedures, new customer intake, appointment management, complaint handling |
| **E-commerce / DTC** | Order fulfillment, returns/exchanges, inventory restock, product listing, customer support escalation |
| **SaaS / Digital Product** | Bug triage, release process, customer support, onboarding flow, churn intervention |
| **Professional Practice** | Patient/client intake, billing, records management, referral process, compliance checks |
| **Content Creator** | Content production, publishing, sponsorship fulfillment, community moderation |

When you know the founder's archetype, proactively suggest SOPs they likely need but haven't thought to document.

---

## Maintenance

SOPs decay. A process that was accurate six months ago may not be accurate today.

- **Review schedule:** Every SOP has a review date. During weekly/monthly reviews, flag SOPs that are due for review.
- **Trigger-based updates:** If a process changes (new tool, new team member, new step), update the SOP immediately.
- **Retirement:** If a process no longer exists, archive the SOP rather than deleting it. Move to `business/sops/archived/`.
