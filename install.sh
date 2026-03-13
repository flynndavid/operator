#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Operator — One-Command Installer
# ============================================================
#
# Usage:
#   curl -sL https://operator-landing-alpha.vercel.app/install.sh | bash
#
# Or with flags:
#   curl -sL https://operator-landing-alpha.vercel.app/install.sh | bash -s -- \
#     --client "My Business" --contact "Jane" --agent-name "Scout"
#
# What it does:
#   1. Checks prerequisites (git, OpenClaw)
#   2. Asks a few questions (or reads from flags)
#   3. Clones the Operator repo
#   4. Runs setup.sh to install skills + config
#   5. Prints next steps
# ============================================================

VERSION="1.0.0"
REPO_URL="https://github.com/flynndavid/operator.git"
REPO_BRANCH="main"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

info()   { printf "${BLUE}→${NC} %s\n" "$*"; }
ok()     { printf "${GREEN}✓${NC} %s\n" "$*"; }
warn()   { printf "${YELLOW}!${NC} %s\n" "$*"; }
err()    { printf "${RED}✗${NC} %s\n" "$*" >&2; }
header() { printf "\n${BOLD}%s${NC}\n" "$*"; }
dim()    { printf "${DIM}%s${NC}\n" "$*"; }

# --- Defaults ---
CLIENT_NAME=""
CONTACT_NAME=""
AGENT_NAME=""
CONTACT_TIMEZONE=""
PROFILE="starter"
VERTICAL=""
WORKSPACE_DIR=""
SKIP_INTERACTIVE=false

# --- Parse flags ---
while [[ $# -gt 0 ]]; do
  case $1 in
    --client)      CLIENT_NAME="$2"; shift 2 ;;
    --contact)     CONTACT_NAME="$2"; shift 2 ;;
    --agent-name)  AGENT_NAME="$2"; shift 2 ;;
    --timezone)    CONTACT_TIMEZONE="$2"; shift 2 ;;
    --profile)     PROFILE="$2"; shift 2 ;;
    --vertical)    VERTICAL="$2"; shift 2 ;;
    --workspace)   WORKSPACE_DIR="$2"; shift 2 ;;
    --yes|-y)      SKIP_INTERACTIVE=true; shift ;;
    --help|-h)
      echo "Operator Installer v${VERSION}"
      echo ""
      echo "Usage: curl -sL https://operator-landing-alpha.vercel.app/install.sh | bash"
      echo ""
      echo "Options:"
      echo "  --client NAME       Your business name"
      echo "  --contact NAME      Your name"
      echo "  --agent-name NAME   Name for your AI agent (default: Operator)"
      echo "  --timezone TZ       Your timezone (default: auto-detected)"
      echo "  --profile TIER      starter|pro|managed (default: starter)"
      echo "  --vertical TYPE     Optional: festivals, home-services, saas"
      echo "  --workspace DIR     OpenClaw workspace path (default: ~/.openclaw/workspace)"
      echo "  --yes               Skip confirmations"
      exit 0
      ;;
    *) err "Unknown option: $1"; exit 1 ;;
  esac
done

# ============================================================
# Banner
# ============================================================
printf "\n"
printf "${CYAN}${BOLD}"
cat << 'BANNER'
   ____                       __            
  / __ \____  ___  _________ _/ /_____  _____
 / / / / __ \/ _ \/ ___/ __ `/ __/ __ \/ ___/
/ /_/ / /_/ /  __/ /  / /_/ / /_/ /_/ / /    
\____/ .___/\___/_/   \__,_/\__/\____/_/     
    /_/                                       
BANNER
printf "${NC}\n"
printf "${DIM}Your AI co-founder — installed in 60 seconds.${NC}\n"
printf "${DIM}v${VERSION}${NC}\n\n"

# ============================================================
# Prerequisites
# ============================================================
header "Checking prerequisites..."

# Git
if command -v git &>/dev/null; then
  ok "git found"
else
  err "git is required but not installed."
  echo "  Install: https://git-scm.com/downloads"
  exit 1
fi

# OpenClaw
OPENCLAW_FOUND=false
if command -v openclaw &>/dev/null; then
  ok "OpenClaw found ($(openclaw --version 2>/dev/null || echo 'installed'))"
  OPENCLAW_FOUND=true
else
  warn "OpenClaw not found — you'll need to install it before starting the agent."
  echo "  Install: npm install -g openclaw"
  echo ""
fi

# Detect timezone
if [[ -z "$CONTACT_TIMEZONE" ]]; then
  if command -v timedatectl &>/dev/null; then
    CONTACT_TIMEZONE=$(timedatectl show -p Timezone --value 2>/dev/null || echo "")
  fi
  if [[ -z "$CONTACT_TIMEZONE" ]] && [[ -f /etc/timezone ]]; then
    CONTACT_TIMEZONE=$(cat /etc/timezone 2>/dev/null || echo "")
  fi
  if [[ -z "$CONTACT_TIMEZONE" ]] && command -v python3 &>/dev/null; then
    CONTACT_TIMEZONE=$(python3 -c "import time; import datetime; print(datetime.datetime.now().astimezone().tzinfo)" 2>/dev/null || echo "")
  fi
  # macOS
  if [[ -z "$CONTACT_TIMEZONE" ]] && [[ -L /etc/localtime ]]; then
    CONTACT_TIMEZONE=$(readlink /etc/localtime 2>/dev/null | sed 's|.*/zoneinfo/||' || echo "")
  fi
  CONTACT_TIMEZONE="${CONTACT_TIMEZONE:-America/Chicago}"
fi

# Detect workspace
if [[ -z "$WORKSPACE_DIR" ]]; then
  if [[ -d "$HOME/.openclaw/workspace" ]]; then
    WORKSPACE_DIR="$HOME/.openclaw/workspace"
  else
    WORKSPACE_DIR="$HOME/.openclaw/workspace"
  fi
fi

# ============================================================
# Interactive Questions (if not provided via flags)
# ============================================================
header "Let's set up your AI co-founder."
echo ""

# Function to prompt with default
ask() {
  local prompt="$1"
  local default="$2"
  local var_name="$3"
  local current_val="${!var_name}"

  if [[ -n "$current_val" ]]; then
    return
  fi

  if [[ -n "$default" ]]; then
    printf "${BOLD}${prompt}${NC} ${DIM}[${default}]${NC}: "
  else
    printf "${BOLD}${prompt}${NC}: "
  fi

  # Check if stdin is a terminal
  if [[ -t 0 ]]; then
    read -r input
    if [[ -z "$input" ]]; then
      eval "$var_name='$default'"
    else
      eval "$var_name='$input'"
    fi
  else
    # Piped input (curl | bash) — use defaults
    eval "$var_name='$default'"
    echo "${default:-}"
  fi
}

ask "What's your business name?" "" CLIENT_NAME
if [[ -z "$CLIENT_NAME" ]]; then
  err "Business name is required."
  exit 1
fi

ask "What's your name?" "" CONTACT_NAME
if [[ -z "$CONTACT_NAME" ]]; then
  err "Your name is required."
  exit 1
fi

ask "Name for your AI agent?" "Operator" AGENT_NAME
ask "Your timezone?" "$CONTACT_TIMEZONE" CONTACT_TIMEZONE
ask "Plan (starter/pro/managed)?" "$PROFILE" PROFILE

echo ""

# ============================================================
# Confirmation
# ============================================================
header "Here's what we'll set up:"
echo ""
printf "  ${BOLD}Business:${NC}   %s\n" "$CLIENT_NAME"
printf "  ${BOLD}Contact:${NC}    %s\n" "$CONTACT_NAME"
printf "  ${BOLD}Agent name:${NC} %s\n" "$AGENT_NAME"
printf "  ${BOLD}Timezone:${NC}   %s\n" "$CONTACT_TIMEZONE"
printf "  ${BOLD}Plan:${NC}       %s\n" "$PROFILE"
printf "  ${BOLD}Workspace:${NC}  %s\n" "$WORKSPACE_DIR"
if [[ -n "$VERTICAL" ]]; then
  printf "  ${BOLD}Vertical:${NC}   %s\n" "$VERTICAL"
fi
echo ""

if [[ "$SKIP_INTERACTIVE" != true ]] && [[ -t 0 ]]; then
  printf "${BOLD}Look good? (Y/n):${NC} "
  read -r confirm
  if [[ "$confirm" =~ ^[Nn] ]]; then
    echo "Cancelled."
    exit 0
  fi
fi

# ============================================================
# Clone & Install
# ============================================================
header "Installing Operator..."

# Clone to temp directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf '$TEMP_DIR'" EXIT

info "Cloning Operator repository..."
git clone --depth 1 --branch "$REPO_BRANCH" "$REPO_URL" "$TEMP_DIR/operator" 2>&1 | tail -1
ok "Repository cloned"

# Build setup.sh flags
SETUP_FLAGS=(
  --client "$CLIENT_NAME"
  --contact "$CONTACT_NAME"
  --agent-name "$AGENT_NAME"
  --timezone "$CONTACT_TIMEZONE"
  --profile "$PROFILE"
  --output-dir "$WORKSPACE_DIR"
  --force
)

if [[ -n "$VERTICAL" ]]; then
  SETUP_FLAGS+=(--vertical "$VERTICAL")
fi

# Run setup
info "Running Operator setup..."
bash "$TEMP_DIR/operator/template/setup.sh" "${SETUP_FLAGS[@]}"

# ============================================================
# Next Steps
# ============================================================
echo ""
printf "${GREEN}${BOLD}"
cat << 'DONE'
   ____                        __     __
  / __ \___  ____ _____  ____/ /_  _/ /
 / /_/ / _ \/ __ `/ __ \/ __  / / / / / 
/ _, _/  __/ /_/ / /_/ / /_/ / /_/ /_/  
/_/ |_|\___/\__,_/\___,_/\__,_/\__, (_)   
                               /____/     
DONE
printf "${NC}\n"

header "Your Operator agent is installed! Here's what to do next:"
echo ""
printf "  ${BOLD}1.${NC} Configure your AI model in ${CYAN}%s/openclaw.json${NC}\n" "$WORKSPACE_DIR"
dim "     Add your API key (OpenAI, Anthropic, or Google)"
echo ""
printf "  ${BOLD}2.${NC} Set up your communication channel\n"
dim "     Discord, Slack, Telegram, or WhatsApp — add the token to openclaw.json"
echo ""
printf "  ${BOLD}3.${NC} Start your agent:\n"
printf "     ${CYAN}openclaw gateway start${NC}\n"
echo ""
printf "  ${BOLD}4.${NC} Send your first message — ${BOLD}%s${NC} will introduce itself\n" "$AGENT_NAME"
dim "     and walk you through a 10-minute onboarding conversation."
echo ""
dim "  Docs: https://operator-landing-alpha.vercel.app/install"
dim "  Help: https://discord.com/invite/clawd"
echo ""
