# Setup Guide — Deploying Operator on a New OpenClaw Instance

This guide walks you through deploying Operator from zero to a running agent.

## Prerequisites

- **Node.js** 20+ installed
- **OpenClaw** installed: `npm i -g openclaw`
- **Git**, **jq**, **python3** available on PATH
- **LLM API key** — Anthropic (recommended) or OpenAI
- **Communication channel** configured — Slack bot token, Discord bot, or Telegram bot

## Step 1: Clone the Repo

```bash
git clone https://github.com/flynndavid/operator.git
cd operator
```

If you already have the repo cloned, make sure you're on the latest:

```bash
git pull origin main
```

## Step 2: Preview the Deployment (Optional)

```bash
./template/setup.sh \
  --client "Acme Co" \
  --contact "Jane Smith" \
  --profile starter \
  --dry-run
```

This shows exactly what directories, files, and placeholders will be created — without making any changes.

## Step 3: Provision the Instance

```bash
./template/setup.sh \
  --client "Acme Co" \
  --contact "Jane Smith" \
  --timezone "America/New_York" \
  --agent-name "Scout" \
  --channel slack \
  --profile starter
```

This creates `deployments/acme-co/` with:
- Agent personality files (SOUL.md, AGENTS.md, USER.md, etc.)
- BOOTSTRAP.md (triggers onboarding on first boot)
- Selected skills based on the tier profile
- openclaw.json from the template
- Empty directories for business context, memory, tasks, and secrets

### Using a vertical overlay

```bash
./template/setup.sh \
  --client "Sunrise Festival" \
  --contact "Jane Smith" \
  --profile managed \
  --vertical festivals
```

### Using a remote skills repo

```bash
./template/setup.sh \
  --client "Acme Co" \
  --contact "Jane Smith" \
  --skills-repo https://github.com/flynndavid/operator.git
```

## Step 4: Configure openclaw.json

Edit `deployments/acme-co/openclaw.json`:

### Set the API key

```json
{
  "ai": {
    "provider": "anthropic",
    "model": "claude-sonnet-4-20250514",
    "apiKey": "sk-ant-YOUR-KEY-HERE"
  }
}
```

**Recommended models:**
- **Primary:** Claude Sonnet 4 (good balance of cost/quality)
- **Heartbeats:** Claude Haiku 4.5 (cheaper for routine checks)
- **Complex planning:** Claude Opus 4 (when needed)

### Configure communication channel

**Slack:**
```json
{
  "channels": {
    "slack": {
      "enabled": true,
      "provider": "slack",
      "token": "xoxb-YOUR-BOT-TOKEN",
      "appToken": "xapp-YOUR-APP-TOKEN",
      "defaultChannel": "CHANNEL_ID"
    }
  }
}
```

**Discord:**
```json
{
  "channels": {
    "discord": {
      "enabled": true,
      "provider": "discord",
      "token": "YOUR-BOT-TOKEN"
    }
  }
}
```

**Telegram:**
```json
{
  "channels": {
    "telegram": {
      "enabled": true,
      "provider": "telegram",
      "token": "YOUR-BOT-TOKEN",
      "allowedChats": ["CHAT_ID"]
    }
  }
}
```

## Step 5: Start the Agent

```bash
cd deployments/acme-co
openclaw gateway start
```

For production (auto-restart on failure):
```bash
# macOS — use a LaunchAgent
# Linux — use systemd
# See OpenClaw docs for service configuration
```

## Step 6: First Boot — Onboarding Interview

On first boot, the agent detects `BOOTSTRAP.md` and starts an onboarding conversation:

1. **Introduces itself** by name
2. **Asks 5-10 questions** about the business, priorities, team, and working style
3. **Generates the Business OS**:
   - `business/context/overview.md` — Business summary
   - `business/context/team.md` — Key people
   - `business/context/priorities.md` — Current focus areas
   - Updates `USER.md` with real details
   - Creates initial tasks in `tasks/active/`
4. **Renames** `BOOTSTRAP.md` → `BOOTSTRAP.done.md`
5. **Confirms** what it set up and what to expect going forward

After onboarding, the agent operates normally — responding to messages, running heartbeat checks, and proactively surfacing relevant information.

## Step 7: Verify

```bash
# Check gateway health
openclaw doctor

# Tail logs
openclaw gateway logs

# Verify heartbeat is running (look for heartbeat entries in logs)
```

### Verification checklist

- [ ] Agent responds in the configured channel
- [ ] Onboarding interview completes and Business OS files are created
- [ ] `BOOTSTRAP.md` is renamed to `BOOTSTRAP.done.md`
- [ ] Heartbeat fires on schedule (check logs)
- [ ] Memory system works (agent remembers context across sessions)
- [ ] Morning briefing arrives (if using starter+ tier)

## Troubleshooting

### Agent not responding

1. Check that `openclaw.json` has valid API key and channel tokens
2. Verify the bot is invited to the correct channel
3. Check logs: `openclaw gateway logs`
4. Run health check: `openclaw doctor`

### Onboarding didn't trigger

1. Check that `BOOTSTRAP.md` exists in the workspace root
2. Check that the `onboarding` skill is installed in `skills/onboarding/`
3. Review logs for errors during first message processing

### Heartbeats not firing

1. Verify `heartbeat.enabled: true` in `openclaw.json`
2. Check `heartbeat.intervalMinutes` is set (default: 30)
3. Check logs for heartbeat scheduling entries

### Skills not working

1. Verify the skill directory exists in `skills/<name>/`
2. Check that `skill.md` exists inside the skill directory
3. Confirm the skill is listed in the profile used during setup

### Agent losing context

1. Check that `memory/` directory exists and is writable
2. Verify workspace path in `openclaw.json` points to the correct directory
3. Check that MEMORY.md exists
