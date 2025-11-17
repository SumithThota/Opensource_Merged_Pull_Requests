# Opensource Merged PRs Tracker

This repository automatically tracks all merged Pull Requests with detailed information.

## 📊 Merged Pull Requests

| PR # | Title | Link | Year | Tags |
|------|-------|------|------|------|
<!-- PR_LIST_START -->
<!-- PR_LIST_END -->

## 🤖 How It Works

This repository uses GitHub Actions to automatically update the table above whenever a PR is merged. The workflow:
1. Detects when a PR is merged
2. Extracts PR details (number, title, labels, merge date)
3. Updates this README with the new entry
4. Commits the changes automatically

## 📝 Table Columns

- **PR #**: The pull request number
- **Title**: The title of the merged PR
- **Link**: Direct link to the PR
- **Year**: Year when the PR was merged
- **Tags**: Labels/tags associated with the PR