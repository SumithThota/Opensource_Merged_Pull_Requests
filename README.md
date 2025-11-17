# Opensource Merged PRs Tracker

This repository automatically tracks all my merged Open source Pull Requests with detailed information.

## 📊 Merged Pull Requests

<!-- PR_LIST_START -->

| PR # | Title | Link | Year | Tags |
|------|-------|------|------|------|
| #1 | Add automated merged PR tracking with GitHub Actions and historical PRs backfill | [Link](https://github.com/SumithThota/Opensource-Merged-PR-s-/pull/1) | 2025 | - |
| #2392 | Prevent invalid user ID (ServiceNowDevProgram/code-snippets) | [Link](https://github.com/ServiceNowDevProgram/code-snippets/pull/2392) | 2025 | - |
| #2381 | Correct Readme files added according to the scripts (ServiceNowDevProgram/code-snippets) | [Link](https://github.com/ServiceNowDevProgram/code-snippets/pull/2381) | 2025 | - |
| #2376 | Script to update all email domains (ServiceNowDevProgram/code-snippets) | [Link](https://github.com/ServiceNowDevProgram/code-snippets/pull/2376) | 2025 | - |
| #1 | Event Space booking Application (SumithThota/Servicenow) | [Link](https://github.com/SumithThota/Servicenow/pull/1) | 2025 | - |
| #2064 | Add CartJS script to submit catalog items (ServiceNowDevProgram/code-snippets) | [Link](https://github.com/ServiceNowDevProgram/code-snippets/pull/2064) | 2025 | - |
| #2052 | Bugfix added comprehensive email regex pattern (ServiceNowDevProgram/code-snippets) | [Link](https://github.com/ServiceNowDevProgram/code-snippets/pull/2052) | 2025 | - |
| #843 | Successfully enhanced box shadow of DIV's in both Scholarship pages (aditya-bhaumik/Pathsphere) | [Link](https://github.com/aditya-bhaumik/Pathsphere/pull/843) | 2024 | gssoc-ext, level 1, hacktoberfest-accepted |
| #550 | Update auto-assign-label-pr.yml (swaraj-das/Collect-your-GamingTools) | [Link](https://github.com/swaraj-das/Collect-your-GamingTools/pull/550) | 2024 | - |
| #549 | Successfully youtube icon got responsive with hover (swaraj-das/Collect-your-GamingTools) | [Link](https://github.com/swaraj-das/Collect-your-GamingTools/pull/549) | 2024 | gssoc-ext, level1, hacktoberfest-accepted |
| #1262 | Hover effect successfully added to Login & Register Buttons (anuragverma108/WildGuard) | [Link](https://github.com/anuragverma108/WildGuard/pull/1262) | 2024 | hacktoberfest-accepted, hacktoberfest |
| #445 | Update add-your-certificate.md (GSSoC24/Postman-Challenge) | [Link](https://github.com/GSSoC24/Postman-Challenge/pull/445) | 2024 | postman, gssoc |
| #1323 | Margin is added to each card successfully (khushi-joshi-05/Food-ordering-website) | [Link](https://github.com/khushi-joshi-05/Food-ordering-website/pull/1323) | 2024 | gssoc |
| #1548 | Added Centroid Of A Triangle Calculator (Rakesh9100/CalcDiverse) | [Link](https://github.com/Rakesh9100/CalcDiverse/pull/1548) | 2024 | Completed 🥳, gssoc, level3 |
| #934 | fix: Issue #861 Removed improper Flickering of elements (apu52/Travel_Website) | [Link](https://github.com/apu52/Travel_Website/pull/934) | 2024 | bug, level1, gssoc |
| #1001 | Navbar Position is fixed Properly (Suchitra-Sahoo/AgriLearnNetwork) | [Link](https://github.com/Suchitra-Sahoo/AgriLearnNetwork/pull/1001) | 2024 | gssoc, level1 |
| #1440 | Added Trisection Point Calculator (Rakesh9100/CalcDiverse) | [Link](https://github.com/Rakesh9100/CalcDiverse/pull/1440) | 2024 | Completed 🥳, gssoc, level3 |
| #972 | Sets proper fonts size to FAQs (Suchitra-Sahoo/AgriLearnNetwork) | [Link](https://github.com/Suchitra-Sahoo/AgriLearnNetwork/pull/972) | 2024 | gssoc, level1 |
| #923 | Hover to quicklinks is added to all pages & FAQ is added (Suchitra-Sahoo/AgriLearnNetwork) | [Link](https://github.com/Suchitra-Sahoo/AgriLearnNetwork/pull/923) | 2024 | gssoc, level2 |
| #898 | Updated welcome div by enhancing it & added glow effect (Suchitra-Sahoo/AgriLearnNetwork) | [Link](https://github.com/Suchitra-Sahoo/AgriLearnNetwork/pull/898) | 2024 | gssoc, level1 |

<!-- PR_LIST_END -->

## 🚀 How to setup

1. Fork or clone this repository
2. Ensure GitHub Actions has write permissions:
   - Go to Settings → Actions → General
   - Select "Read and write permissions"
3. (Optional) Run the backfill script to add your historical merged PRs:
   ```bash
   ./scripts/backfill-historical-prs.sh
   ```
4. Start merging PRs - they'll be automatically tracked!

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
