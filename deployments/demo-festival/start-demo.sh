#!/bin/bash
# Start Scout — AI Co-founder Demo for Lakeside Music Festival
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "🎪 Scout — AI Co-founder for Lakeside Music Festival"
echo "=================================================="
echo ""

# Check OpenClaw
if ! command -v openclaw &>/dev/null; then
  echo "❌ OpenClaw not found. Install: npm i -g openclaw"
  exit 1
fi

# Check API key
if grep -q "DEMO_REPLACE_WITH_YOUR_API_KEY" openclaw.json 2>/dev/null; then
  echo "❌ Replace the API key placeholder in openclaw.json first."
  echo "   Edit: $SCRIPT_DIR/openclaw.json"
  echo "   Replace DEMO_REPLACE_WITH_YOUR_API_KEY with your Anthropic API key."
  exit 1
fi

# Create skills directory and symlink all skills
echo "📦 Linking skills..."
mkdir -p skills

# Base template skills
for skill_dir in ../../template/skills/*/; do
  skill_name=$(basename "$skill_dir")
  if [ ! -e "skills/$skill_name" ]; then
    ln -sf "../../template/skills/$skill_name" "skills/$skill_name"
  fi
done

# Marketing sub-skills (flatten into skills/)
if [ -d "../../template/skills/marketing" ]; then
  for skill_dir in ../../template/skills/marketing/*/; do
    skill_name="marketing-$(basename "$skill_dir")"
    if [ ! -e "skills/$skill_name" ]; then
      ln -sf "$skill_dir" "skills/$skill_name"
    fi
  done
fi

# Vertical skills (festivals-events)
for skill_dir in ../../verticals/festivals-events/skills/*/; do
  skill_name=$(basename "$skill_dir")
  if [ ! -e "skills/$skill_name" ]; then
    ln -sf "../../verticals/festivals-events/skills/$skill_name" "skills/$skill_name"
  fi
done

SKILL_COUNT=$(find skills -maxdepth 2 -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
echo "✅ $SKILL_COUNT skills linked"
echo ""

echo "📋 Demo script: docs/demo-script.md"
echo ""
echo "🚀 Starting Scout..."
echo ""

openclaw gateway start
