# Agile Project Setup on GitHub

This guide explains how to replace Jira with a native GitHub Project (v2) for Scrum/Agile ceremonies.

## 1. Create the Project
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

## 5. Agile Ceremonies
- **Backlog Grooming**: Filter items with the `scrum:backlog` label.
- **Sprint Planning**: Move items from `Backlog` to the current `Iteration` (Sprint) field and assign `Size (SP)`.
- **Daily Standup**: Use the **Board** view grouped by **Assignee** or **Status**.

---
> [!TIP]
> Use the `.github` repository as a template to ensure all new projects inherit the Issue Templates (`ISSUE_TEMPLATE/`) we've already defined.
