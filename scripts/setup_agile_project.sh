#!/bin/bash

# setup_agile_project.sh
# DevOps script to initialize a GitHub Project (v2) with Agile/Scrum standards.

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}== GitHub Agile Project Setup ==${NC}"

# 1. Ask for Project Title
read -p "Enter Project Title (e.g., Sprint Board): " PROJECT_TITLE
OWNER="@me"

# 2. Create the Project
echo -e "Creating project '${PROJECT_TITLE}'..."
PROJECT_DATA=$(gh project create --owner "$OWNER" --title "$PROJECT_TITLE" --format json)
PROJECT_ID=$(echo "$PROJECT_DATA" | jq -r '.id')
PROJECT_NUMBER=$(echo "$PROJECT_DATA" | jq -r '.number')

echo -e "${GREEN}✓ Project created (Number: ${PROJECT_NUMBER})${NC}"

# 3. Create Agile Fields
echo -e "Adding Agile fields..."

# Field: Size (Story Points)
gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" --name "Size (SP)" --data-type "NUMBER" > /dev/null
echo -e "${GREEN}✓ Added field: Size (SP)${NC}"

# Field: Priority
gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" --name "Priority" \
    --data-type "SINGLE_SELECT" \
    --single-select-options "P0: Critical,P1: High,P2: Medium,P3: Low" > /dev/null
echo -e "${GREEN}✓ Added field: Priority (P0-P3)${NC}"

# 4. Success Message
echo -e "\n${BLUE}======================================${NC}"
echo -e "${GREEN}Agile Project Setup Complete!${NC}"
echo -e "URL: https://github.com/users/$(gh api user -q .login)/projects/${PROJECT_NUMBER}"
echo -e "Next Steps:"
echo -e "  1. Open the project in your browser."
echo -e "  2. Add the 'Iteration' field (Sprint) via the UI (CLI support for Iterations is limited)."
echo -e "  3. Start adding issues using 'gh project item-add'."
echo -e "${BLUE}======================================${NC}"
