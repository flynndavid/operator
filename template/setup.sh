#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# setup.sh — Provision a new Operator instance (monorepo)
# ============================================================
#
# This script creates a deployable OpenClaw workspace folder for a client/demo
# by combining:
# - `agents/operator/*` (base agent personality/config)
# - selected skills from `skills/*` based on a tier profile
# - optional vertical overlay from `template/verticals/<vertical>`
# - base OpenClaw config from `template/base/openclaw.json`
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
#   --vertical      optional overlay (e.g. festivals)
#   --demo          write into deployments/<slug> but label as demo
#   --output-dir    custom output directory
#   --help          show help
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

AGENT_DIR="$REPO_DIR/agents/operator"
SKILLS_DIR="$REPO_DIR/skills"
PROFILES_DIR="$REPO_DIR/template/profiles"
VERTICALS_DIR="$REPO_DIR/template/verticals"
BASE_OPENCLAW_JSON="$REPO_DIR/template/base/openclaw.json"

# Defaults
CLIENT_NAME=""
CONTACT_NAME=""
CONTACT_TIMEZONE="America/Chicago"
AGENT_NAME="Operator"
VERTICAL=""
CHANNEL_TYPE="discord"
PROFILE="managed"
DEMO=false
OUTPUT_DIR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --client) CLIENT_NAME="$2"; shift 2 ;;
    --contact) CONTACT_NAME="$2"; shift 2 ;;
    --timezone) CONTACT_TIMEZONE="$2"; shift 2 ;;
    --agent-name) AGENT_NAME="$2"; shift 2 ;;
    --vertical) VERTICAL="$2"; shift 2 ;;
    --channel) CHANNEL_TYPE="$2"; shift 2 ;;
    --profile) PROFILE="$2"; shift 2 ;;
    --demo) DEMO=true; shift ;;
    --output-dir) OUTPUT_DIR="$2"; shift 2 ;;
    --help)
      sed -n '1,60p' "$0"
      exit 0
      ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

if [[ -z "$CLIENT_NAME" ]]; then echo "Error: --client is required"; exit 1; fi
if [[ -z "$CONTACT_NAME" ]]; then echo "Error: --contact is required"; exit 1; fi

SLUG=$(echo "$CLIENT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')

if [[ -n "$OUTPUT_DIR" ]]; then
  DEPLOY_DIR="$OUTPUT_DIR"
else
  DEPLOY_DIR="$REPO_DIR/deployments/$SLUG"
fi

if [[ -d "$DEPLOY_DIR" ]]; then
  echo "Error: Deployment already exists at $DEPLOY_DIR"
  exit 1
fi

PROFILE_FILE="$PROFILES_DIR/$PROFILE.json"
if [[ ! -f "$PROFILE_FILE" ]]; then
  echo "Error: Unknown profile '$PROFILE' (missing $PROFILE_FILE)"
  exit 1
fi

echo "=== Operator Provisioning ==="
echo "  Client:    $CLIENT_NAME"
echo "  Contact:   $CONTACT_NAME"
echo "  Timezone:  $CONTACT_TIMEZONE"
echo "  Agent:     $AGENT_NAME"
echo "  Channel:   $CHANNEL_TYPE"
echo "  Profile:   $PROFILE"
echo "  Vertical:  ${VERTICAL:-none}"
echo "  Output:    $DEPLOY_DIR"
echo ""

mkdir -p "$DEPLOY_DIR"

# 1) Base agent files
cp -R "$AGENT_DIR"/* "$DEPLOY_DIR/"

# 2) Skills (based on profile)
mkdir -p "$DEPLOY_DIR/skills"
python3 - <<PY
import json
from pathlib import Path
profile = json.loads(Path("$PROFILE_FILE").read_text())
skills = profile.get('skills', [])
Path("$DEPLOY_DIR/.selected-profile.json").write_text(json.dumps(profile, indent=2))
print("Selected skills:", len(skills))
for s in skills:
    src = Path("$SKILLS_DIR")/s
    dst = Path("$DEPLOY_DIR")/"skills"/s
    if not src.exists():
        raise SystemExit(f"Missing skill dir: {src}")
    dst.parent.mkdir(parents=True, exist_ok=True)
PY

# copy selected skill directories
python3 - <<PY
import json, shutil
from pathlib import Path
profile = json.loads(Path("$DEPLOY_DIR/.selected-profile.json").read_text())
skills = profile['skills']
skills_dir = Path("$SKILLS_DIR")
out_dir = Path("$DEPLOY_DIR")/"skills"
for s in skills:
    shutil.copytree(skills_dir/s, out_dir/s, dirs_exist_ok=True)
PY

# 3) Vertical overlay
# Accept legacy alias
if [[ "$VERTICAL" == "festivals-events" ]]; then VERTICAL="festivals"; fi

if [[ -n "$VERTICAL" ]]; then
  VERTICAL_DIR="$VERTICALS_DIR/$VERTICAL"
  if [[ ! -d "$VERTICAL_DIR" ]]; then
    echo "Warning: Vertical directory not found: $VERTICAL_DIR (skipping)"
  else
    echo "→ Applying vertical overlay: $VERTICAL"

    if [[ -f "$VERTICAL_DIR/SOUL.patch.md" ]]; then
      echo "" >> "$DEPLOY_DIR/SOUL.md"
      echo "---" >> "$DEPLOY_DIR/SOUL.md"
      echo "" >> "$DEPLOY_DIR/SOUL.md"
      cat "$VERTICAL_DIR/SOUL.patch.md" >> "$DEPLOY_DIR/SOUL.md"
    fi

    if [[ -f "$VERTICAL_DIR/USER.template.md" ]]; then
      cp "$VERTICAL_DIR/USER.template.md" "$DEPLOY_DIR/USER.md"
    fi
  fi
fi

# 4) Replace placeholders across md/json
ONBOARD_DATE=$(date +%Y-%m-%d)
find "$DEPLOY_DIR" \( -name "*.md" -o -name "*.json" \) -print0 | while IFS= read -r -d '' file; do
  sed -i '' \
    -e "s|{{CLIENT_NAME}}|$CLIENT_NAME|g" \
    -e "s|{{CONTACT_NAME}}|$CONTACT_NAME|g" \
    -e "s|{{CONTACT_TIMEZONE}}|$CONTACT_TIMEZONE|g" \
    -e "s|{{AGENT_NAME}}|$AGENT_NAME|g" \
    -e "s|{{CHANNEL_TYPE}}|$CHANNEL_TYPE|g" \
    -e "s|{{ONBOARD_DATE}}|$ONBOARD_DATE|g" \
    -e "s|{{VERTICAL}}|$VERTICAL|g" \
    "$file" 2>/dev/null || true
  done

# 5) Generate openclaw.json
if [[ -f "$BASE_OPENCLAW_JSON" ]]; then
  sed \
    -e "s|{{AGENT_NAME}}|$AGENT_NAME|g" \
    -e "s|{{CLIENT_NAME}}|$CLIENT_NAME|g" \
    -e "s|{{CHANNEL_TYPE}}|$CHANNEL_TYPE|g" \
    "$BASE_OPENCLAW_JSON" > "$DEPLOY_DIR/openclaw.json"
fi

# Workspace directories
mkdir -p "$DEPLOY_DIR/memory" "$DEPLOY_DIR/secrets" "$DEPLOY_DIR/tasks/active" "$DEPLOY_DIR/tasks/completed"

cat > "$DEPLOY_DIR/secrets/.gitignore" << 'EOF'
# Never commit secrets
*
!.gitignore
EOF

echo ""
echo "=== Provisioning Complete ==="
echo ""
echo "Next steps:"
echo "  1. Edit $DEPLOY_DIR/USER.md"
echo "  2. Add API keys/secrets under $DEPLOY_DIR/secrets (not in git)"
echo "  3. Start the agent: cd $DEPLOY_DIR && openclaw gateway start"
