# Vertical Overlays

Vertical overlays customize an Operator agent for a specific industry. Each vertical provides:

- **`SOUL.patch.md`** — Domain expertise, industry knowledge, and operational philosophy that gets merged into the agent's SOUL
- **`USER.template.md`** — A structured template for capturing client-specific context, metrics, and workflows

## Available Verticals

### `festivals/`
**Target persona:** Event organizers, festival producers, conference planners
**Domain:** Event planning, vendor management, marketing, day-of operations, post-event analysis
**Key skills:** event-timeline, vendor-management, event-marketing, budget-tracking, day-of-operations, post-event-debrief, sponsorship-management, attendee-communication

### `home-services/`
**Target persona:** Patrick (Radon1) — Home services business owners
**Domain:** HVAC, plumbing, electrical, radon, pest control, and other trade-based service businesses
**Key skills:** crm-pipeline, compliance-tracker, financial-overview, customer-pulse, sales-pipeline, social-media-management, marketing-seo-strategy, task-management, sop-generator
**Industry tools:** ServiceTitan, HouseCall Pro, Jobber, QuickBooks

### `real-estate/`
**Target persona:** Anne Reilly — Real estate agents and small brokerages
**Domain:** Residential real estate — lead nurture, listing management, transaction coordination, market analysis
**Key skills:** crm-pipeline, crm-manager, relationship-tracking, sales-outreach, marketing-email-marketing, marketing-content-marketing, social-media-management, marketing-seo-strategy, meeting-prep
**Industry tools:** Follow Up Boss, kvCORE, MLS, DocuSign, Zillow/Realtor.com

### `construction/`
**Target persona:** Jeremy (Onyx Construction) — General contractors and specialty contractors
**Domain:** Project bidding, job costing, subcontractor management, safety compliance, progress billing
**Key skills:** budget-tracking, financial-overview, compliance-tracker, task-management, risk-assessment, sop-generator, sales-pipeline, relationship-tracking
**Industry tools:** Procore, Buildertrend, QuickBooks, PlanGrid, Bluebeam

### `insurance/`
**Target persona:** Whit — Independent insurance agents and small agencies
**Domain:** Policy renewals, cross-selling, carrier relationships, claims support, compliance
**Key skills:** crm-pipeline, crm-manager, relationship-tracking, compliance-tracker, sales-outreach, marketing-email-marketing, customer-pulse, financial-overview, meeting-prep
**Industry tools:** Applied Epic, HawkSoft, EZLynx, carrier portals

### `saas/`
**Target persona:** Jesse Lane (Structur) — Early-stage SaaS founders
**Domain:** Product-market fit, user activation/retention, revenue metrics, engineering velocity, fundraising
**Key skills:** financial-overview, strategic-advisor, go-to-market, marketing-content-marketing, marketing-pricing-strategy, marketing-product-launch, sales-pipeline, founder-coach, meeting-prep
**Industry tools:** Stripe, Mixpanel/Amplitude, Linear/Jira, GitHub, Intercom

## How Verticals Work

During `setup.sh`, the selected vertical's `SOUL.patch.md` is appended to the base `SOUL.md`, giving the agent deep industry knowledge on top of its core operational capabilities. The `USER.template.md` is used to generate the initial `USER.md` with industry-specific sections pre-built.

## Adding a New Vertical

1. Create `template/verticals/<name>/SOUL.patch.md` with domain expertise sections
2. Create `template/verticals/<name>/USER.template.md` with industry-specific context fields
3. Add the vertical to this README
4. Ensure `managed.json` includes any skills the vertical depends on
