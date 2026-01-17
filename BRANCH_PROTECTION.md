# How-To: Protect the `main` Branch

To ensure the integrity of the `main` branch, follow these steps in your GitHub repository settings.

## 1. Create Branch Protection Rule
1. Go to your repository on GitHub.
2. Click on **Settings** > **Branches**.
3. Under **Branch protection rules**, click **Add branch protection rule**.

## 2. Configure Rules for `main`
- **Branch name pattern:** `main`
- [x] **Require a pull request before merging**
  - [x] **Require approvals** (Set to at least 1)
- [x] **Require status checks to pass before merging**
  - Search for and add: `check-source-branch` (the name of the manual check from our workflow).
  - [x] **Require branches to be up to date before merging**
- [x] **Lock branch** (Optional: prevents accidental pushes)
- [x] **Restrict pushes** (Ensure only authorized actors can push)

## 3. Merge Policy
- Only merge PRs that originate from the `dev` branch.
- The `branch-protection-check` workflow will automatically fail PRs from other branches.

---
> [!IMPORTANT]
> GitHub Settings must be configured manually as they cannot be fully managed via code for public/private repos without the API or GitHub CLI.
