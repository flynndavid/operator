# Go-to-Market Strategy

## When to Use
When the client is launching a new product, service, or offering. When they're entering a new market, repositioning, changing pricing, or asking "how should I sell this?" Also use when the client is stuck on who their customer is, how to reach them, or what to charge.

## What This Skill Does
Guides the client through a structured GTM planning process — from defining the target customer through launch execution. Creates a living GTM plan document that evolves as the market responds. Focuses on practical, resource-constrained strategies suitable for SMBs and solopreneurs (not enterprise playbooks).

---

## Directory Structure

```
gtm/
  plans/                 ← One file per product/launch GTM plan
  research/              ← Market research notes, interview summaries
  positioning/           ← Positioning statements, messaging docs
  pricing/               ← Pricing analysis and models
```

---

## GTM Plan Template

**File Naming:** `gtm/plans/[product-or-initiative-slug].md`

```markdown
# GTM Plan: [Product/Service Name]

**Status:** draft | in-progress | launched | paused
**Created:** YYYY-MM-DD
**Target Launch:** YYYY-MM-DD
**Owner:** [Client name]

---

## 1. Target Customer

### Ideal Customer Profile (ICP)
- **Who:** [Job title, role, or persona]
- **Company type:** [Size, industry, stage]
- **Geography:** [Where they are]
- **Budget range:** [$X–$Y they'd pay for this]

### Pain Points (ranked by severity)
1. [Most acute pain — the thing keeping them up at night]
2. [Second pain — annoying but manageable]
3. [Third pain — nice-to-fix but not urgent]

### Where They Hang Out
- [Online communities, Slack groups, subreddits, forums]
- [Events, conferences, meetups]
- [Publications, podcasts, newsletters they follow]
- [Social platforms they're active on]

### How They Buy
- [Do they search Google? Ask peers? Hire consultants?]
- [What's their buying process — solo decision or committee?]
- [What triggers a purchase? Event, season, funding, pain threshold?]

---

## 2. Positioning

### One-Liner
[For [target customer] who [pain point], [product] is a [category] that [key benefit]. Unlike [alternative], we [differentiator].]

### Messaging Pillars (top 3 reasons to buy)
1. **[Pillar 1]:** [Supporting proof point]
2. **[Pillar 2]:** [Supporting proof point]
3. **[Pillar 3]:** [Supporting proof point]

### What We're NOT
[Explicitly state what you don't do — this sharpens positioning as much as what you do.]

---

## 3. Pricing

**Model:** one-time | subscription | usage-based | retainer | per-project
**Price Point:** $[X]
**Anchor:** [What are they comparing this to? What's the reference price in their head?]
**Justification:** [Why this price — value delivered, competitor benchmarks, cost-plus?]

### Pricing Tiers (if applicable)
| Tier | Price | What's Included | Who It's For |
|------|-------|-----------------|--------------|
| [Basic] | $[X] | [Features] | [Persona] |
| [Pro] | $[X] | [Features] | [Persona] |
| [Custom] | $[X] | [Features] | [Persona] |

---

## 4. Channels

Rank channels by expected ROI for this specific launch:

| Channel | Effort | Cost | Expected Impact | Priority |
|---------|--------|------|-----------------|----------|
| [e.g., LinkedIn outreach] | [Low/Med/High] | [$X] | [Low/Med/High] | [1-5] |
| [e.g., Email to existing list] | | | | |
| [e.g., Partner referrals] | | | | |
| [e.g., Content/SEO] | | | | |
| [e.g., Paid ads] | | | | |
| [e.g., Cold outreach] | | | | |
| [e.g., Community engagement] | | | | |

### Primary Channel (pick ONE to start)
[Which single channel will you go deep on first? Why?]

### Channel Sequencing
1. **Week 1–2:** [First channel — usually warmest/cheapest]
2. **Week 3–4:** [Add second channel]
3. **Month 2:** [Layer in third channel if first two are working]

---

## 5. Launch Plan

### Pre-Launch (2-4 weeks before)
- [ ] Finalize positioning and messaging
- [ ] Build landing page / sales page
- [ ] Prepare 3-5 pieces of launch content
- [ ] Seed conversations in target communities
- [ ] Line up 2-3 early customers / beta users for social proof
- [ ] Prep outreach list (warm contacts first)
- [ ] Set up tracking (how will you know what's working?)

### Launch Week
- [ ] Announce to existing audience (email list, social, Slack)
- [ ] Personal outreach to top 20 warm contacts
- [ ] Post in relevant communities
- [ ] Share launch content on primary channel
- [ ] Follow up on every inbound inquiry within 4 hours

### Post-Launch (weeks 2-8)
- [ ] Collect and publish testimonials / case studies
- [ ] Iterate on messaging based on what resonates
- [ ] Double down on working channels, cut what isn't working
- [ ] Build referral loop (ask happy customers to introduce others)
- [ ] Review metrics weekly — adjust strategy every 2 weeks

---

## 6. Success Metrics

| Metric | Target | Tracking Method |
|--------|--------|-----------------|
| Leads generated | [X] in first month | CRM pipeline count |
| Conversion rate | [X]% | Leads → Customers |
| Revenue | $[X] in first 90 days | Invoice tracking |
| CAC | < $[X] per customer | Spend / customers |
| Time to first sale | < [X] days | CRM dates |

---

## 7. Risks & Assumptions

| Assumption | If Wrong, Then... |
|------------|-------------------|
| [e.g., "Our ICP hangs out on LinkedIn"] | [Pivot to email outreach or events] |
| [e.g., "Price point is right"] | [Test lower tier or offer pilot pricing] |
| [e.g., "Problem is painful enough to pay for"] | [Validate with 5 more customer interviews] |

---

## Log
| Date | Update |
|------|--------|
| YYYY-MM-DD | [What changed and why] |
```

---

## Workflow

1. **Start with the customer** → Help the client articulate who they're selling to. Most GTM failures are targeting failures. Push for specifics — "small businesses" is not an ICP.
2. **Nail positioning before channels** → Don't let the client jump to "should I do TikTok?" before the one-liner is locked. Positioning first, distribution second.
3. **Price with anchors** → Help the client understand the reference price in the buyer's head. Price relative to alternatives, not relative to cost.
4. **Pick ONE primary channel** → SMBs that try 5 channels at once do none well. Help them pick the single highest-leverage channel and go deep.
5. **Launch is not a day, it's a sequence** → Structure the launch as pre/during/post phases with specific actions.
6. **Review and adapt** → Set explicit review dates. The first GTM plan is always wrong — the value is in iterating fast.

---

## Quick Frameworks

### Positioning Statement (April Dunford-inspired)
> For [target customer] who are dissatisfied with [current alternative], [product] is a [market category] that provides [key benefit]. Unlike [competitive alternative], [product] [primary differentiator].

### Pricing Sanity Check
- What is the customer paying now (in money, time, or pain) to solve this problem?
- What would they pay to make the problem disappear entirely?
- Where between those two numbers is your price point?
- Is there a natural anchor (competitor price, industry standard, psychological threshold like $99 or $499)?

### Channel Selection (ICE Score)
For each potential channel, score 1–10:
- **Impact:** If this works, how big is the upside?
- **Confidence:** How sure are you it'll work for your ICP?
- **Ease:** How fast/cheap can you test it?

Multiply I × C × E. Start with the highest score.

---

## Heartbeat Integration

During heartbeats, if active GTM plans exist in `gtm/plans/`:

- **Pre-launch plans** → Check if launch date is approaching. Surface incomplete checklist items.
- **Active launches** → Ask about early results: "How's the [Product] launch going? Any inbound? What's the response been like?"
- **Post-launch** → Prompt for metric updates: "It's been [X] weeks since launch — time to update your success metrics and decide what to double down on."

---

## Best Practices

- **Talk to 5 customers before writing the plan.** Desk research is not a substitute for hearing someone describe their problem in their own words.
- **Positioning is a living document.** Update it every time you learn something new about how customers describe the problem.
- **Don't compete on price unless you have structural cost advantages.** For SMBs, compete on speed, specialization, or relationship.
- **The best channel is where your customers already trust someone.** Referrals and partnerships beat cold outreach every time.
- **Launch small, learn fast.** A soft launch to 50 people teaches you more than a big launch to 5,000 with no feedback loop.
