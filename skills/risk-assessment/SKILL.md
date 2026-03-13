# Risk Assessment

_Hope for the best. Plan for the rest._

---

## When to Use

- Quarterly risk review cadence (proactive)
- When the founder is making a major business decision (new hire, big contract, pivot, expansion)
- When external conditions change (economic shift, competitor move, regulation change, key customer loss)
- When cash reserves drop below safety threshold
- When a single customer/client represents >30% of revenue
- During annual planning or strategy sessions

---

## Philosophy

Most small businesses don't think about risk until they're in crisis. By then, options are limited and expensive. The goal is to make risk visible and manageable — not to create anxiety.

**Approach:** Practical, not paranoid. Focus on the risks that would actually damage the business, not every theoretical possibility. A short list of real risks beats a long list of unlikely ones.

**Key principle:** The best time to plan for a crisis is when everything is going well. That's when you have the resources and clarity to think straight.

---

## Quarterly Risk Audit

Every quarter, run through this framework. Store the output in `business/risk-assessment.md` (create on first run, update each quarter).

### Step 1: Risk Identification

Walk through each risk category with the founder. Don't just list risks abstractly — tie them to the specific business.

#### Revenue Concentration
- What percentage of revenue comes from the top 3 customers/clients?
- If the single biggest customer left tomorrow, what happens?
- How diversified are revenue streams?
- **Red flag:** Any single customer >30% of revenue

#### Cash Flow
- How many months of runway at current burn rate?
- What's the gap between when you pay expenses and when you collect revenue?
- Any large upcoming expenses or investments?
- **Red flag:** Less than 2 months of operating expenses in reserve

#### Key Person Risk
- What happens if the founder is out for 2 weeks? 2 months?
- Are there critical processes only one person knows how to do?
- Is there institutional knowledge that isn't documented?
- **Red flag:** Business cannot operate for even 1 week without the founder

#### Supplier / Vendor Risk
- Any critical suppliers with no backup?
- Any vendor contracts up for renewal with potential price increases?
- Any single points of failure in the supply chain?
- **Red flag:** Single-source dependency for a critical input

#### Market Risk
- Any competitive threats emerging?
- Is the market growing, stable, or shrinking?
- Any technology shifts that could disrupt the business model?
- Regulatory changes on the horizon?

#### Operational Risk
- What are the most common things that go wrong?
- Any recurring issues that haven't been properly fixed?
- Technology/infrastructure vulnerabilities (single server, no backups, etc.)?
- Data loss exposure?

### Step 2: Risk Scoring

For each identified risk, score it:

| Factor | Scale |
|--------|-------|
| **Likelihood** | 1 (unlikely) — 5 (near-certain) |
| **Impact** | 1 (minor inconvenience) — 5 (business-threatening) |
| **Preparedness** | 1 (no plan) — 5 (fully prepared) |

**Risk priority = Likelihood x Impact — Preparedness**

Focus mitigation efforts on the highest-scoring risks.

### Step 3: Mitigation Plans

For each high-priority risk, create a concrete mitigation plan:

```markdown
### Risk: [Name]
**Score:** L[X] x I[X] - P[X] = [Total]
**Category:** [Revenue / Cash / Key Person / Supplier / Market / Ops]

**Current exposure:**
[What specifically would happen if this risk materialized]

**Mitigation actions:**
1. [Specific action with owner and timeline]
2. [Next action]

**Contingency (if it happens anyway):**
[What to do in the first 24-48 hours]

**Review:** [When to reassess this risk]
```

---

## Risk Assessment Document

Store as `business/risk-assessment.md`:

```markdown
# Risk Assessment

**Last reviewed:** [Date]
**Next review:** [Date — quarterly]

## Risk Register

| Risk | Category | L | I | P | Score | Status |
|------|----------|---|---|---|-------|--------|
| [Risk] | [Cat] | X | X | X | X | [Monitoring / Mitigating / Accepted] |

## Top Risks (Detail)

[Detailed mitigation plans for top 3-5 risks, using the format above]

## Cash Buffer Status
- Current reserve: $X
- Monthly burn: $X
- Runway: X months
- Target reserve: X months of expenses

## Insurance Coverage Review
| Policy | Provider | Coverage | Renewal | Adequate? |
|--------|----------|----------|---------|-----------|

## Backup Suppliers
| Critical Input | Primary Supplier | Backup Supplier | Verified? |
|----------------|-----------------|-----------------|-----------|

## Crisis Contacts
| Role | Name | Contact | When to Call |
|------|------|---------|-------------|
| Accountant | | | Financial crisis |
| Lawyer | | | Legal issue |
| Insurance | | | Claims |
| IT Support | | | System outage |
| [Other] | | | |
```

---

## Crisis Playbooks

When a specific high-impact risk is identified, develop a crisis playbook. Store in `business/sops/crisis-[type].md`.

A crisis playbook answers: "It's 6 AM and [bad thing] just happened. What do I do first?"

**Playbook structure:**
1. **First 1 hour:** Immediate triage steps (who to call, what to secure, what to communicate)
2. **First 24 hours:** Stabilization (stop the bleeding, assess damage, notify stakeholders)
3. **First week:** Recovery (execute contingency, communicate with customers, document lessons)
4. **Post-crisis:** Review (what happened, why, what to change)

**Common playbooks by archetype:**

| Archetype | Priority Playbooks |
|-----------|-------------------|
| **Solo Consultant** | Key client loss, health emergency (founder incapacitated), scope dispute |
| **Agency** | Key employee departure, client non-payment, project failure |
| **Local Service** | Equipment failure, health inspection issue, negative viral review |
| **E-commerce** | Supply chain disruption, payment processor hold, product recall |
| **SaaS** | Major outage, data breach, key engineer departure |
| **Professional Practice** | Malpractice claim, license issue, key staff departure |

---

## Archetype-Specific Risk Factors

Each archetype has characteristic risks that should always be on the radar:

| Archetype | Always Monitor |
|-----------|---------------|
| **Solo Consultant** | Revenue concentration (usually 1-3 clients = all revenue), founder health, pipeline gaps |
| **Agency** | Utilization rate, client concentration, key employee retention, scope creep accumulation |
| **Local Service** | Seasonal cash flow, staff no-shows, equipment age, lease terms, local competition |
| **E-commerce** | Supplier reliability, shipping cost changes, platform dependency (Amazon, Shopify), CAC trends |
| **SaaS** | Churn rate, infrastructure costs, competitive feature parity, technical debt |
| **Professional Practice** | Regulatory changes, malpractice exposure, burnout, referral source concentration |

---

## Integration

- **Morning briefing:** If a monitored risk metric crosses a threshold (cash below target, revenue concentration increasing), flag it in The Pulse section.
- **Compliance tracker:** Risk mitigation actions that have deadlines feed into the compliance calendar.
- **Founder coach:** Risk conversations can be stressful. Use the coaching framework to keep it constructive, not anxiety-inducing.
