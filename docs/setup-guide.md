# Setup Guide — Deploying a New Client Instance

## Prerequisites

- **OpenClaw** installed: `npm i -g openclaw`
- **Node.js** 20+
- **Git** access to this repo
- **Slack Bot Token** or **Telegram Bot Token** for the client channel
- **LLM API key** (OpenAI or Anthropic)

## Step 1: Provision the Instance

```bash
# Clone and set up a new client workspace
./deploy/provision.sh \
  --client "Sunrise Festival" \
  --contact "Jane Smith" \
  --timezone "America/New_York" \
  --agent-name "Maven" \
  --vertical festivals-events \
  --channel slack

# This creates: deployments/sunrise-festival/
```

The provisioning script:
1. Copies the template to a new deployment directory
2. Applies the vertical overlay (festivals-events)
3. Replaces all `{{PLACEHOLDERS}}` with provided values
4. Generates `openclaw.json` from the template
5. Creates the workspace directory structure

## Step 2: Configure the Client Profile

Edit `deployments/sunrise-festival/USER.md`:

```markdown
# USER.md — About Your Human

- **Name:** Jane Smith
- **Business:** Sunrise Festival
- **Role:** Festival Director
- **Timezone:** America/New_York
- **Communication preference:** Slack, direct and concise

## Business Context

- **Industry:** Festivals & Live Events
- **Business type:** Annual music festival
- **Size:** 5-person core team, 50+ contractors
- **Location:** Austin, TX

## What They Need From You

- Keep the event timeline on track
- Manage vendor contracts and follow-ups
- Draft marketing content for social and email
- Track the budget and flag overruns
- Coordinate day-of logistics

## Working Style

- Fast-paced, prefers bullet points over paragraphs
- Checks Slack mornings and evenings
- Hates being surprised — surface risks early
```

## Step 3: Set Up Communication Channel

### Slack

1. Create a Slack bot in the client's workspace (or use a shared app)
2. Get the Bot Token (`xoxb-...`)
3. Invite the bot to the appropriate channel or DM
4. Update `openclaw.json`:

```json
{
  "channels": {
    "slack": {
      "enabled": true,
      "provider": "slack",
      "token": "xoxb-...",
      "appToken": "xapp-...",
      "defaultChannel": "CHANNEL_ID"
    }
  }
}
```

### Telegram

1. Create a bot via @BotFather
2. Get the Bot Token
3. Update `openclaw.json`:

```json
{
  "channels": {
    "telegram": {
      "enabled": true,
      "provider": "telegram",
      "token": "BOT_TOKEN",
      "allowedChats": ["CHAT_ID"]
    }
  }
}
```

## Step 4: Configure LLM

Add the LLM API key to `openclaw.json`:

```json
{
  "ai": {
    "provider": "anthropic",
    "model": "claude-sonnet-4-20250514",
    "apiKey": "sk-ant-..."
  }
}
```

**Recommended models by use case:**
- **Primary:** Claude Sonnet 4 or GPT-4o (good balance of cost/quality)
- **Heartbeats:** Claude Haiku or GPT-4o-mini (cheaper for routine checks)
- **Complex planning:** Claude Opus or GPT-4 (when needed)

## Step 5: Set Up Heartbeats

Configure proactive monitoring in `openclaw.json`:

```json
{
  "heartbeat": {
    "enabled": true,
    "intervalMinutes": 30,
    "model": "anthropic/claude-haiku-4-5"
  }
}
```

The agent will check in every 30 minutes using the cheaper model, following the rules in `HEARTBEAT.md`.

## Step 6: Start the Agent

```bash
cd deployments/sunrise-festival/
openclaw gateway start
```

For production (auto-restart on failure):

```bash
# Create systemd service (Linux VPS)
sudo cp deploy/openclaw-client.service /etc/systemd/system/openclaw-sunrise-festival.service
# Edit the service file with correct paths
sudo systemctl enable openclaw-sunrise-festival
sudo systemctl start openclaw-sunrise-festival
```

## Step 7: Onboarding Conversation

The agent's first message to the client should be a warm introduction. It will:

1. Introduce itself by name
2. Explain what it can do
3. Ask about immediate priorities
4. Start building context

Example first message:
> Hey Jane! 👋 I'm Maven, your AI co-founder for Sunrise Festival. I'm here to help you stay on top of everything — timelines, vendors, marketing, budget, logistics. I learn your business over time, so the more we work together, the better I get.
>
> To get started, what's the most pressing thing on your plate right now?

## Verification Checklist

- [ ] `USER.md` filled with real client details
- [ ] Communication channel connected and agent responsive
- [ ] Heartbeat running (check logs for heartbeat acks)
- [ ] Agent introduces itself naturally
- [ ] Memory system working (agent remembers context across sessions)
- [ ] Client can reach the agent and get helpful responses

## Troubleshooting

### Agent not responding in Slack
- Check bot token is valid: `openclaw status`
- Verify bot is invited to the channel
- Check `openclaw.json` channel configuration
- Review gateway logs: `openclaw gateway logs`

### Heartbeats not firing
- Verify `heartbeat.enabled: true` in config
- Check `heartbeat.intervalMinutes` is set
- Review gateway logs for heartbeat scheduling

### Agent losing context
- Check that `MEMORY.md` and `memory/` directory exist and are writable
- Verify the workspace path in `openclaw.json` points to the right directory
- Check daily note files are being created
