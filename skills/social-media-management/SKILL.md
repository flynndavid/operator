# Social Media Management

## When to Use
When the client needs to plan, draft, or manage social media content. When they ask about posting schedules, content ideas, engagement strategy, or platform-specific advice. Also use during heartbeats to remind about upcoming scheduled posts, content gaps, or engagement opportunities.

## What This Skill Does
Manages the client's social media presence through a content calendar, drafts platform-specific posts, tracks engagement patterns, and maintains a consistent posting cadence. All content is drafted for client review — never posted directly. Focuses on organic social strategy for SMBs (not paid media).

---

## Directory Structure

```
social/
  calendar.md            ← Monthly content calendar (master view)
  drafts/                ← Queued post drafts awaiting approval
  published/             ← Archive of published posts with performance
  content-bank/          ← Evergreen ideas, hooks, and repurposable content
  strategy.md            ← Platform strategy and brand voice guidelines
```

---

## Strategy Document

Create this first for any new client. Lives at `social/strategy.md`.

```markdown
# Social Media Strategy

**Last Updated:** YYYY-MM-DD

---

## Active Platforms
| Platform | Handle | Audience | Posting Frequency | Primary Goal |
|----------|--------|----------|-------------------|--------------|
| [e.g., LinkedIn] | [@handle] | [Who follows you here] | [X/week] | [Awareness/leads/community] |
| [e.g., Instagram] | [@handle] | [Who follows you here] | [X/week] | [Brand/engagement/sales] |

## Brand Voice
- **Tone:** [e.g., Confident but approachable, expert but not academic]
- **Personality:** [e.g., "Smart friend who works in your industry"]
- **Do:** [e.g., Use first person, share behind-the-scenes, ask questions]
- **Don't:** [e.g., Use corporate jargon, be negative about competitors, post without value]

## Content Pillars
1. **[Pillar 1]:** [e.g., "Industry insights" — share expertise and hot takes]
2. **[Pillar 2]:** [e.g., "Behind the scenes" — humanize the brand, show process]
3. **[Pillar 3]:** [e.g., "Client wins" — social proof, case studies, testimonials]
4. **[Pillar 4]:** [e.g., "Useful tips" — tactical advice their audience can act on]

## Hashtag Sets
- **Primary (always use):** #[tag1] #[tag2] #[tag3]
- **Industry:** #[tag] #[tag] #[tag]
- **Rotating/topical:** [Vary by post topic]

## Content Ratios
- 40% value/education
- 25% behind-the-scenes / personality
- 20% social proof / client wins
- 15% promotional / CTAs
```

---

## Content Calendar

**File:** `social/calendar.md` — regenerate weekly or when the schedule changes.

```markdown
# Content Calendar — [Month YYYY]

## Week of [MM/DD]
| Day | Platform | Pillar | Topic | Status | Draft |
|-----|----------|--------|-------|--------|-------|
| Mon | LinkedIn | Insight | [Topic] | drafted | [link] |
| Tue | Instagram | BTS | [Topic] | idea | — |
| Wed | LinkedIn | Tips | [Topic] | approved | [link] |
| Thu | Twitter | Insight | [Topic] | published | [link] |
| Fri | Instagram | Client Win | [Topic] | idea | — |

## Week of [MM/DD]
[Same format]

---

## Content Ideas Backlog
- [ ] [Idea 1 — from client conversation on MM/DD]
- [ ] [Idea 2 — inspired by industry trend]
- [ ] [Idea 3 — repurpose from blog/email]
```

---

## Post Draft Format

**File Naming:** `social/drafts/YYYY-MM-DD_[platform]_[topic-slug].md`

```markdown
# Post Draft

**Platform:** LinkedIn | Instagram | Twitter/X | Facebook | TikTok
**Pillar:** [Which content pillar]
**Scheduled For:** YYYY-MM-DD [time]
**Status:** idea | drafted | approved | published
**Approved By:** [Client name, date]

---

## Content

[The actual post copy goes here. Format for the specific platform.]

## Media
- [ ] Image: [Description of needed image/graphic]
- [ ] Video: [Description if applicable]
- [ ] Carousel: [Slide descriptions if applicable]

## Hashtags
[Platform-appropriate hashtags]

## Notes
[Context, inspiration, why this post, any special timing considerations]
```

---

## Platform-Specific Guidelines

### LinkedIn
- **Length:** 150–300 words performs best. Use line breaks generously.
- **Format:** Hook line → story/insight → takeaway → CTA. First line must stop the scroll.
- **Hook patterns that work:**
  - "I [did unexpected thing] and here's what happened"
  - "Most [role] get [topic] wrong. Here's why:"
  - "[Contrarian opinion] — unpopular but here's my case"
  - "3 things I wish I knew about [topic] before [experience]"
- **Posting time:** Tue–Thu, 8–10 AM local time
- **Hashtags:** 3–5 max, placed at the end
- **Engagement:** Reply to every comment within 24 hours. Comment on 5 posts from your network before/after posting.

### Instagram
- **Caption length:** Front-load the value in first 2 lines (before the "more" fold)
- **Formats ranked by reach:** Reels > Carousels > Single image > Stories
- **Carousel tips:** First slide = hook, last slide = CTA. 5–10 slides. Each slide should stand alone.
- **Hashtags:** 5–15 relevant ones. Mix popular (100K+ posts) with niche (1K–50K)
- **Stories:** Use for ephemeral/casual content, polls, Q&A, behind-the-scenes
- **Posting time:** Mon–Fri, 11 AM–1 PM or 7–9 PM local time

### Twitter/X
- **Length:** Punchy. Under 200 characters for maximum engagement. Threads for depth.
- **Thread format:** First tweet must be a standalone hook. Number your tweets (1/7). End with a summary + CTA.
- **Posting time:** Weekdays, 8–10 AM or 12–1 PM
- **Engagement:** Quote tweets > retweets. Reply to relevant conversations in your niche.

### Facebook
- **Best for:** Local businesses, community-oriented content, events
- **Length:** Short posts (< 80 chars) get 66% more engagement
- **Posting time:** Wed–Fri, 1–4 PM

---

## Content Repurposing Workflow

Turn one piece of content into 5+:

1. **Long-form content** (blog post, podcast, talk) → Source material
2. **LinkedIn post** → Key insight or story from the content
3. **Twitter thread** → Numbered breakdown of main points
4. **Instagram carousel** → Visual summary of key takeaways
5. **Instagram story** → Behind-the-scenes of creating the content
6. **Email newsletter** → Curated version with added context
7. **Short video/Reel** → 30–60 second take on the core idea

Store repurposing ideas in `social/content-bank/repurpose-queue.md`.

---

## Engagement Tracking

After publishing, update the draft file (move to `social/published/`) with performance:

```markdown
## Performance (updated YYYY-MM-DD)
- **Impressions:** [X]
- **Engagement:** [likes, comments, shares, saves]
- **Engagement Rate:** [X]%
- **Link Clicks:** [X] (if applicable)
- **Notable Comments:** [Any interesting responses worth noting]
- **Verdict:** hit | solid | miss — [Why?]
```

---

## Workflow

1. **Set strategy first** → Create `social/strategy.md` with platforms, voice, pillars, and cadence
2. **Plan the week** → Every Monday (or during weekly review), fill in the content calendar for the week ahead
3. **Batch draft** → Draft 3–5 posts at once for efficiency. Use content pillars to ensure variety.
4. **Client review** → Present drafts for approval. Never post without explicit sign-off.
5. **Schedule and publish** → Client posts approved content (or approves the agent to schedule via integration)
6. **Track performance** → After 48 hours, log engagement metrics on published posts
7. **Monthly review** → What content types performed best? Adjust pillar ratios and posting strategy.

---

## Heartbeat Integration

During heartbeats:

- **Upcoming posts** → "You have [X] posts scheduled this week. [Y] still need drafts."
- **Content gaps** → "No posts planned for [day] — want me to draft something?"
- **Stale calendar** → Calendar hasn't been updated in 7+ days
- **Performance check** → "Last week's posts averaged [X]% engagement. Your [topic] post outperformed — consider doing more of that."
- **Engagement reminder** → "Don't forget to engage with comments on yesterday's post."

---

## Best Practices

- **Consistency beats virality.** Posting 3x/week for 6 months beats one viral post. Build the habit.
- **The first line is everything.** On every platform, the hook determines whether anyone reads the rest. Spend 50% of your effort on the first line.
- **Don't post without value.** Every post should educate, entertain, or inspire. "Happy Monday!" is not content.
- **Engage more than you broadcast.** Spend 15 minutes engaging with others for every post you publish. Social media is social.
- **Repurpose ruthlessly.** Most of your audience didn't see it the first time. Repackage your best content for different platforms and formats.
- **Batch create, drip publish.** Draft a week of content in one sitting. Consistency is easier in batches.
- **Track what wins.** Review performance monthly. Do more of what works, cut what doesn't.
