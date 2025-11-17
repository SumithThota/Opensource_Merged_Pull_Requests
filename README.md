# Opensource Merged PRs Tracker

This repository automatically tracks all merged Pull Requests with detailed information.

## 🚀 Quick Start

1. Fork or clone this repository
2. Ensure GitHub Actions has write permissions:
   - Go to Settings → Actions → General
   - Select "Read and write permissions"
3. Start merging PRs - they'll be automatically tracked!

## 📊 Merged Pull Requests

| PR # | Title | Link | Year | Tags |
|------|-------|------|------|------|
<!-- PR_LIST_START -->
| #1 | Initial setup and automation | [Link](https://github.com/SumithThota/Opensource-Merged-PR-s-/pull/1) | 2025 | automation, documentation |
<!-- PR_LIST_END -->

## ✨ Features

- 🔄 **Automatic Updates**: README is updated instantly when PRs are merged
- 📝 **Rich Information**: Captures PR number, title, link, year, and tags
- 🏷️ **Tag Support**: Automatically extracts and displays PR labels
- 🔗 **Direct Links**: Quick access to merged PRs
- 📅 **Year Tracking**: Organizes PRs by merge year
- 🤖 **Zero Maintenance**: Fully automated with GitHub Actions

## 🤖 How It Works

This repository uses GitHub Actions to automatically update the table above whenever a PR is merged. 

**Workflow Process:**
```
PR Merged → GitHub Actions Triggered → Extract PR Details → Update README Table → Auto Commit & Push
```

The workflow:
1. Detects when a PR is merged
2. Extracts PR details (number, title, labels, merge date)
3. Updates this README with the new entry
4. Commits the changes automatically

📖 For detailed setup and customization instructions, see [SETUP.md](SETUP.md)

## 📝 Table Columns

- **PR #**: The pull request number
- **Title**: The title of the merged PR
- **Link**: Direct link to the PR
- **Year**: Year when the PR was merged
- **Tags**: Labels/tags associated with the PR