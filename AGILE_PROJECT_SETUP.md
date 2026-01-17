# Agile Project Setup on GitHub

This repository contains tools and documentation to replace Jira with a native GitHub Project (v2) for Scrum/Agile ceremonies.

## 🚀 One-Click Setup (Fast Track)
You can automate the creation of a new Agile project using the included script:
```bash
./scripts/setup_agile_project.sh
```
This script will:
1. Create a new GitHub Project.
2. Add the **Size (SP)** number field.
3. Add the **Priority** (P0-P3) single-select field.

---

## 1. Manual Creation (Alternative)
1. Go to your GitHub Profile or Organization.
2. Select **Projects** > **New project**.
3. Choose the **Table** or **Board** layout (Board is usually preferred for Sprints).

## 2. Standardize Agile Labels
Ensure these labels exist in your repository (required for the Auto-Labeler and manual categorization):

| Label | Purpose | Color |
| :--- | :--- | :--- |
| `feature` | New functionality | `#a2eeef` |
| `bug` | Critical or minor fixes | `#d73a4a` |
| `refactor` | Code quality / Debt | `#e99695` |
| `devops` | Infrastructure & Automation | `#006b75` |
| `documentation` | README / Guides | `#0075ca` |
| `scrum:sprint` | Items in the current sprint | `#f9d0c4` |
| `scrum:backlog` | Items in the product backlog | `#cfd3d7` |

## 3. Custom Fields (The Jira Replacements)
GitHub Projects allows "Custom Fields". In your Project settings, add the following:

- **Sprint**: Type `Iteration`. Set the duration (e.g., 2 weeks).
- **Size (SP)**: Type `Number`. Use Fibonacci (1, 2, 3, 5, 8) for Story Points.
- **Priority**: Type `Single select`. Options: `P0: Critical`, `P1: High`, `P2: Medium`, `P3: Low`.

## 4. Automation & Workflows
In the **Workflows** section of your GitHub Project:

- **Auto-add to project**: Set a rule to automatically add issues with specific labels (e.g., `scrum:sprint`) to the project.
- **Item closed**: Automatically move items to the `Done` column when an issue or PR is closed.

## 5. Agile Automation (Optional / Advanced)
This repository includes a `project-automation.yml` workflow to automatically manage item states.

### ⚠️ Engineer's Warning
GitHub Projects (v2) has a built-in **"Workflows"** tab in the UI. For 90% of users, the UI version is **better** because:
- No Personal Access Tokens (PAT) required.
- No Action minutes consumed.
- Zero maintenance.

### Using the Advanced Action
If you want to use the included `.github/workflows/project-automation.yml`:
1. **Create a PAT**: Generat a Personal Access Token with the `project` scope.
2. **Add Secret**: Add it to your repo as `PROJECT_AUTOMATION_TOKEN`.
3. **Configure**: Update the `PROJECT_OWNER` and `PROJECT_NUMBER` in the workflow file.

---

## 6. Success Message
echo -e "\n${BLUE}======================================${NC}"
