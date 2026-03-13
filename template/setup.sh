#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# setup.sh — Provision a new Operator instance (monorepo)
# ============================================================
#
# Creates a deployable OpenClaw workspace for a client/demo by combining:
# - agents/operator/* (base agent personality/config)
# - selected skills from skills/* based on a tier profile
# - optional vertical overlay from template/verticals/<vertical>
# - base OpenClaw config from template/base/openclaw.json
#
# Usage:
#   ./template/setup.sh \
#     --client "Acme Co" \
#     --contact "Jane Smith" \
#     --agent-name "Scout" \
#     --channel discord \
#     --profile managed \
#     --vertical festivals
#
# Options:
#   --client        Business/organization name (required)
#   --contact       Primary contact name (required)
#   --timezone      Contact timezone (default: America/Chicago)
#   --agent-name    Name for the agent (default: Operator)
#   --channel       Communication channel type (default: discord)
#   --profile       starter|pro|managed (default: managed)
#   --vertical      Optional overlay (e.g. festivals)
#   --skills-repo   Git URL or local path for skills (default: local repo)
#   --demo          Write into deployments/<slug> but label as demo
#   --output-dir    Custom output directory
#   --dry-run       Show what would happen without making changes
#   --force         Overwrite existing deployment
#   --help          Show help
# ============================================================

# --- Color output ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

info()  { printf "${BLUE}→${NC} %s\n" "$*"; }
ok()    { printf "${GREEN}✓${NC} %s\n" "$*"; }
warn()  { printf "${YELLOW}!${NC} %s\n" "$*"; }
err()   { printf "${RED}✗${NC} %s\n" "$*" >&2; }
header(){ printf "\n${BOLD}%s${NC}\n" "$*"; }

# --- Detect repo root ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

AGENT_DIR="$REPO_DIR/agents/operator"
SKILLS_DIR="$REPO_DIR/skills"
PROFILES_DIR="$REPO_DIR/template/profiles"
VERTICALS_DIR="$REPO_DIR/template/verticals"
BASE_OPENCLAW_JSON="$REPO_DIR/template/base/openclaw.json"

# --- Defaults ---
CLIENT_NAME=""
CONTACT_NAME=""
CONTACT_TIMEZONE="America/Chicago"
AGENT_NAME="Operator"
VERTICAL=""
CHANNEL_TYPE="discord"
PROFILE="managed"
DEMO=false
OUTPUT_DIR=""
DRY_RUN=false
FORCE=false
SKILLS_REPO=""

# --- Parse arguments ---
while [[ $# -gt 0 ]]; do
  case $1 in
    --client)       CLIENT_NAME="$2"; shift 2 ;;
    --contact)      CONTACT_NAME="$2"; shift 2 ;;
    --timezone)     CONTACT_TIMEZONE="$2"; shift 2 ;;
    --agent-name)   AGENT_NAME="$2"; shift 2 ;;
    --vertical)     VERTICAL="$2"; shift 2 ;;
    --channel)      CHANNEL_TYPE="$2"; shift 2 ;;
    --profile)      PROFILE="$2"; shift 2 ;;
    --skills-repo)  SKILLS_REPO="$2"; shift 2 ;;
    --demo)         DEMO=true; shift ;;
    --output-dir)   OUTPUT_DIR="$2"; shift 2 ;;
    --dry-run)      DRY_RUN=true; shift ;;
    --force)        FORCE=true; shift ;;
    --help)
      sed -n '/^# ===/,/^# ===/p' "$0" | head -n -1
      exit 0
      ;;
    *) err "Unknown option: $1"; exit 1 ;;
  esac
done

# --- Validate prerequisites ---
header "Checking prerequisites..."

MISSING_TOOLS=()
for tool in git jq python3; do
  if ! command -v "$tool" &>/dev/null; then
    MISSING_TOOLS+=("$tool")
  fi
done

if [[ ${#MISSING_TOOLS[@]} -gt 0 ]]; then
  err "Missing required tools: ${MISSING_TOOLS[*]}"
  echo "  Install them before running setup:"
  for tool in "${MISSING_TOOLS[@]}"; do
    case $tool in
      git)     echo "    brew install git       (or apt install git)" ;;
      jq)      echo "    brew install jq        (or apt install jq)" ;;
      python3) echo "    brew install python3   (or apt install python3)" ;;
    esac
  done
  exit 1
fi
ok "All required tools found (git, jq, python3)"

# --- Validate required arguments ---
if [[ -z "$CLIENT_NAME" ]]; then err "--client is required"; exit 1; fi
if [[ -z "$CONTACT_NAME" ]]; then err "--contact is required"; exit 1; fi

# --- Handle --skills-repo (clone remote or use local path) ---
if [[ -n "$SKILLS_REPO" ]]; then
  if [[ -d "$SKILLS_REPO" ]]; then
    info "Using skills from local path: $SKILLS_REPO"
    SKILLS_DIR="$SKILLS_REPO"
  else
    CLONE_DIR=$(mktemp -d)
    info "Cloning skills from $SKILLS_REPO..."
    git clone --depth 1 "$SKILLS_REPO" "$CLONE_DIR" 2>/dev/null
    SKILLS_DIR="$CLONE_DIR/skills"
    if [[ ! -d "$SKILLS_DIR" ]]; then
      err "Cloned repo does not contain a skills/ directory"
      rm -rf "$CLONE_DIR"
      exit 1
    fi
    ok "Skills cloned to temp directory"
  fi
fi

# --- Compute paths ---
SLUG=$(echo "$CLIENT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')

if [[ -n "$OUTPUT_DIR" ]]; then
  DEPLOY_DIR="$OUTPUT_DIR"
else
  DEPLOY_DIR="$REPO_DIR/deployments/$SLUG"
fi

# --- Validate profile ---
PROFILE_FILE="$PROFILES_DIR/$PROFILE.json"
if [[ ! -f "$PROFILE_FILE" ]]; then
  err "Unknown profile '$PROFILE' (missing $PROFILE_FILE)"
  echo "  Available profiles: starter, pro, managed"
  exit 1
fi

SKILL_COUNT=$(jq '.skills | length' "$PROFILE_FILE")

# --- Dry run ---
if $DRY_RUN; then
  header "=== DRY RUN — Operator Provisioning ==="
  echo ""
  info "Client:       $CLIENT_NAME"
  info "Contact:      $CONTACT_NAME"
  info "Timezone:     $CONTACT_TIMEZONE"
  info "Agent:        $AGENT_NAME"
  info "Channel:      $CHANNEL_TYPE"
  info "Profile:      $PROFILE ($SKILL_COUNT skills)"
  info "Vertical:     ${VERTICAL:-none}"
  info "Output:       $DEPLOY_DIR"
  info "Demo:         $DEMO"
  echo ""
  header "Would create:"
  echo "  $DEPLOY_DIR/"
  echo "  ├── SOUL.md, AGENTS.md, IDENTITY.md, USER.md, ..."
  echo "  ├── BOOTSTRAP.md            (first-boot onboarding trigger)"
  echo "  ├── openclaw.json            (from template)"
  echo "  ├── skills/                  ($SKILL_COUNT skills from $PROFILE profile)"
  echo "  ├── business/                (empty — populated during onboarding)"
  echo "  │   ├── context/"
  echo "  │   ├── sops/"
  echo "  │   └── reports/"
  echo "  ├── memory/"
  echo "  ├── secrets/"
  echo "  └── tasks/{active,completed}"
  echo ""
  if [[ -n "$VERTICAL" ]]; then
    info "Would apply vertical overlay: $VERTICAL"
  fi
  header "Placeholders that would be replaced:"
  echo "  {{CLIENT_NAME}}       → $CLIENT_NAME"
  echo "  {{CONTACT_NAME}}      → $CONTACT_NAME"
  echo "  {{CONTACT_TIMEZONE}}  → $CONTACT_TIMEZONE"
  echo "  {{AGENT_NAME}}        → $AGENT_NAME"
  echo "  {{CHANNEL_TYPE}}      → $CHANNEL_TYPE"
  echo "  {{ONBOARD_DATE}}      → $(date +%Y-%m-%d)"
  echo "  {{VERTICAL}}          → ${VERTICAL:-<empty>}"
  echo ""
  ok "Dry run complete. Remove --dry-run to provision."
  exit 0
fi

# --- Check for existing deployment ---
if [[ -d "$DEPLOY_DIR" ]]; then
  if $FORCE; then
    warn "Deployment exists at $DEPLOY_DIR — overwriting (--force)"
    rm -rf "$DEPLOY_DIR"
  else
    err "Deployment already exists at $DEPLOY_DIR"
    echo "  Use --force to overwrite, or --output-dir to specify a different path."
    exit 1
  fi
fi

# --- Begin provisioning ---
header "=== Operator Provisioning ==="
echo ""
info "Client:       $CLIENT_NAME"
info "Contact:      $CONTACT_NAME"
info "Timezone:     $CONTACT_TIMEZONE"
info "Agent:        $AGENT_NAME"
info "Channel:      $CHANNEL_TYPE"
info "Profile:      $PROFILE ($SKILL_COUNT skills)"
info "Vertical:     ${VERTICAL:-none}"
info "Output:       $DEPLOY_DIR"
echo ""

mkdir -p "$DEPLOY_DIR"

# 1) Base agent files
info "Copying agent config files..."
cp -R "$AGENT_DIR"/* "$DEPLOY_DIR/"
ok "Agent files copied"

# 2) Copy BOOTSTRAP.md (first-boot onboarding trigger)
if [[ -f "$AGENT_DIR/BOOTSTRAP.md" ]]; then
  cp "$AGENT_DIR/BOOTSTRAP.md" "$DEPLOY_DIR/BOOTSTRAP.md"
  ok "BOOTSTRAP.md copied (will trigger onboarding on first boot)"
else
  warn "No BOOTSTRAP.md found in $AGENT_DIR — onboarding trigger skipped"
fi

# 3) Skills (based on profile)
info "Installing skills ($SKILL_COUNT from $PROFILE profile)..."
mkdir -p "$DEPLOY_DIR/skills"
python3 - <<PY
import json, shutil, sys
from pathlib import Path

profile = json.loads(Path("$PROFILE_FILE").read_text())
skills = profile.get('skills', [])
skills_dir = Path("$SKILLS_DIR")
out_dir = Path("$DEPLOY_DIR") / "skills"

missing = []
for s in skills:
    src = skills_dir / s
    dst = out_dir / s
    if not src.exists():
        missing.append(s)
        continue
    shutil.copytree(src, dst, dirs_exist_ok=True)

if missing:
    print(f"Warning: {len(missing)} skill(s) not found (may be pending build): {', '.join(missing)}", file=sys.stderr)
    sys.exit(0)
PY
ok "Skills installed"

# 4) Vertical overlay
# Accept legacy alias
if [[ "$VERTICAL" == "festivals-events" ]]; then VERTICAL="festivals"; fi

if [[ -n "$VERTICAL" ]]; then
  VERTICAL_DIR="$VERTICALS_DIR/$VERTICAL"
  if [[ ! -d "$VERTICAL_DIR" ]]; then
    warn "Vertical directory not found: $VERTICAL_DIR (skipping)"
  else
    info "Applying vertical overlay: $VERTICAL"

    if [[ -f "$VERTICAL_DIR/SOUL.patch.md" ]]; then
      echo "" >> "$DEPLOY_DIR/SOUL.md"
      echo "---" >> "$DEPLOY_DIR/SOUL.md"
      echo "" >> "$DEPLOY_DIR/SOUL.md"
      cat "$VERTICAL_DIR/SOUL.patch.md" >> "$DEPLOY_DIR/SOUL.md"
    fi

    if [[ -f "$VERTICAL_DIR/USER.template.md" ]]; then
      cp "$VERTICAL_DIR/USER.template.md" "$DEPLOY_DIR/USER.md"
    fi
    ok "Vertical overlay applied"
  fi
fi

# 5) Replace placeholders across md/json
info "Replacing placeholders..."
ONBOARD_DATE=$(date +%Y-%m-%d)
# Detect sed in-place syntax (macOS vs Linux)
if sed --version 2>/dev/null | grep -q GNU; then
  SED_INPLACE=(sed -i)
else
  SED_INPLACE=(sed -i '')
fi

find "$DEPLOY_DIR" \( -name "*.md" -o -name "*.json" \) -print0 | while IFS= read -r -d '' file; do
  "${SED_INPLACE[@]}" \
    -e "s|{{CLIENT_NAME}}|$CLIENT_NAME|g" \
    -e "s|{{CONTACT_NAME}}|$CONTACT_NAME|g" \
    -e "s|{{CONTACT_TIMEZONE}}|$CONTACT_TIMEZONE|g" \
    -e "s|{{AGENT_NAME}}|$AGENT_NAME|g" \
    -e "s|{{CHANNEL_TYPE}}|$CHANNEL_TYPE|g" \
    -e "s|{{ONBOARD_DATE}}|$ONBOARD_DATE|g" \
    -e "s|{{VERTICAL}}|$VERTICAL|g" \
    -e "s|{{PROFILE}}|$PROFILE|g" \
    "$file" 2>/dev/null || true
done
ok "Placeholders replaced"

# 6) Generate openclaw.json
if [[ -f "$BASE_OPENCLAW_JSON" ]]; then
  info "Generating openclaw.json..."
  sed \
    -e "s|{{AGENT_NAME}}|$AGENT_NAME|g" \
    -e "s|{{CLIENT_NAME}}|$CLIENT_NAME|g" \
    -e "s|{{CHANNEL_TYPE}}|$CHANNEL_TYPE|g" \
    "$BASE_OPENCLAW_JSON" > "$DEPLOY_DIR/openclaw.json"
  ok "openclaw.json generated"
fi

# 7) Workspace directories
info "Creating workspace directories..."
mkdir -p "$DEPLOY_DIR/memory"
mkdir -p "$DEPLOY_DIR/secrets"
mkdir -p "$DEPLOY_DIR/tasks/active"
mkdir -p "$DEPLOY_DIR/tasks/completed"
mkdir -p "$DEPLOY_DIR/business/context"
mkdir -p "$DEPLOY_DIR/business/sops"
mkdir -p "$DEPLOY_DIR/business/reports"

cat > "$DEPLOY_DIR/secrets/.gitignore" << 'EOF'
# Never commit secrets
*
!.gitignore
EOF

cat > "$DEPLOY_DIR/business/.gitkeep" << 'EOF'
EOF

ok "Workspace directories created"

# 8) Write deployment metadata
cat > "$DEPLOY_DIR/.operator-meta.json" << METAEOF
{
  "client": "$CLIENT_NAME",
  "contact": "$CONTACT_NAME",
  "timezone": "$CONTACT_TIMEZONE",
  "agent": "$AGENT_NAME",
  "channel": "$CHANNEL_TYPE",
  "profile": "$PROFILE",
  "vertical": "${VERTICAL:-}",
  "demo": $DEMO,
  "provisioned": "$ONBOARD_DATE",
  "version": "1.0.0"
}
METAEOF
ok "Deployment metadata written"

# --- Done ---
echo ""
printf "${GREEN}${BOLD}=== Provisioning Complete ===${NC}\n"
echo ""
printf "${BOLD}NEXT STEPS:${NC}\n"
echo ""
printf "  ${BOLD}1. Configure API keys${NC}\n"
echo "     Edit $DEPLOY_DIR/openclaw.json"
echo "     - Set ai.apiKey to your Anthropic or OpenAI key"
echo "     - Configure your channel (Slack/Discord/Telegram) tokens"
echo ""
printf "  ${BOLD}2. Review agent personality${NC}\n"
echo "     Edit $DEPLOY_DIR/USER.md with real client details"
echo "     (Or let the onboarding interview handle this automatically)"
echo ""
printf "  ${BOLD}3. Start the agent${NC}\n"
echo "     cd $DEPLOY_DIR"
echo "     openclaw gateway start"
echo ""
printf "  ${BOLD}4. First boot — what to expect${NC}\n"
echo "     The agent will detect BOOTSTRAP.md and start an onboarding"
echo "     interview. It will ask about the business, goals, and"
echo "     working style, then generate the Business OS automatically"
echo "     (populating business/, updating USER.md, creating initial tasks)."
echo ""
printf "  ${BOLD}5. Verify${NC}\n"
echo "     openclaw doctor          # check health"
echo "     openclaw gateway logs    # tail logs"
echo ""
