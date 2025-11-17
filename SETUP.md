# Setup and Usage Guide

## Overview

This repository automatically tracks all merged Pull Requests using GitHub Actions. Every time a PR is merged, the workflow automatically updates the README.md file with the PR details.

## How the Automation Works

### Trigger
The automation is triggered when a Pull Request is closed. It only runs when the PR is actually merged (not just closed without merging).

### Workflow Steps

1. **Detection**: GitHub Actions detects when a PR is merged
2. **Checkout**: The workflow checks out the repository code
3. **Data Extraction**: Extracts the following information:
   - PR Number
   - PR Title
   - PR URL
   - Merge Date (Year)
   - Labels/Tags
4. **Update README**: Inserts a new row in the README table with the PR information
5. **Commit & Push**: Automatically commits and pushes the changes back to the repository

### Data Processing

- **Year Extraction**: Parses the merge timestamp to get the year
- **Label Processing**: Converts label array to comma-separated string
- **Special Character Handling**: Escapes special characters (like `|`) in PR titles
- **Table Formatting**: Maintains proper markdown table format

## File Structure

```
.
├── README.md                          # Main file with PR tracking table
├── .github/
│   └── workflows/
│       └── update-pr-list.yml        # GitHub Actions workflow
└── SETUP.md                           # This file
```

## Configuration

### Required Permissions

The workflow needs the following permissions (already configured):
- `contents: write` - To commit and push changes to README.md
- `pull-requests: read` - To read PR details

### Repository Settings

1. Go to repository **Settings** → **Actions** → **General**
2. Under **Workflow permissions**, ensure:
   - "Read and write permissions" is selected
   - "Allow GitHub Actions to create and approve pull requests" is checked (optional)

## Customization

### Modifying the Table Format

To change the table columns or format, edit the workflow file:

```yaml
# In .github/workflows/update-pr-list.yml
# Modify the NEW_ROW variable to change table format
NEW_ROW="| #${PR_NUMBER} | ${SAFE_TITLE} | [Link](${PR_URL}) | ${YEAR} | ${TAGS} |"
```

### Adding More PR Information

You can add more fields from the GitHub event payload. Available fields include:
- `github.event.pull_request.user.login` - PR author
- `github.event.pull_request.merged_by.login` - Who merged the PR
- `github.event.pull_request.base.ref` - Base branch
- `github.event.pull_request.head.ref` - Head branch

Example to add author:
```yaml
env:
  PR_AUTHOR: ${{ github.event.pull_request.user.login }}
```

### Changing the Sort Order

Currently, new PRs are added at the top of the list. To add them at the bottom:

Change:
```bash
sed -i "/<!-- PR_LIST_START -->/a ${NEW_ROW}" README.md
```

To:
```bash
sed -i "/<!-- PR_LIST_END -->/i ${NEW_ROW}" README.md
```

## Testing

### Local Testing

You can test the workflow logic locally using the test script:

```bash
# Set environment variables
export PR_NUMBER=123
export PR_TITLE="Test PR"
export PR_URL="https://github.com/owner/repo/pull/123"
export PR_MERGED_AT="2025-11-17T07:00:00Z"
export PR_LABELS='[{"name": "bug"}, {"name": "critical"}]'

# Run the workflow commands
YEAR=$(echo "$PR_MERGED_AT" | cut -d'-' -f1)
TAGS=$(echo "$PR_LABELS" | jq -r '[.[].name] | join(", ")')
# ... etc
```

### Workflow Testing

1. Create a test branch
2. Make some changes and open a PR
3. Merge the PR
4. Check if the README.md is updated automatically

### Backfilling Historical PRs

To populate the table with your previously merged PRs from other repositories:

#### Option 1: Using the Backfill Script (Requires GitHub CLI)

```bash
# Install GitHub CLI if not already installed
# Visit: https://cli.github.com/

# Authenticate with GitHub
gh auth login

# Run the backfill script
./scripts/backfill-historical-prs.sh
```

The script will:
1. Search for all your merged PRs across GitHub
2. Extract PR details (number, title, URL, year, labels, repository)
3. Add them to the README table
4. Create a backup (README.md.backup) before making changes

#### Option 2: Manual Addition

You can manually add historical PRs by editing README.md:

```markdown
<!-- PR_LIST_START -->
| #123 | My PR Title (owner/repo) | [Link](url) | 2024 | bug, feature |
<!-- PR_LIST_END -->
```

**Important**: Always add new entries between the `<!-- PR_LIST_START -->` and `<!-- PR_LIST_END -->` markers.

## Troubleshooting

### Workflow Not Running

1. Check if the workflow file is in the correct location: `.github/workflows/update-pr-list.yml`
2. Verify repository permissions (Settings → Actions → General)
3. Check the Actions tab for any errors

### README Not Updated

1. Check the workflow logs in the Actions tab
2. Verify that the PR was actually merged (not just closed)
3. Ensure the markers `<!-- PR_LIST_START -->` and `<!-- PR_LIST_END -->` exist in README.md

### Permission Errors

If you see permission errors:
1. Go to Settings → Actions → General
2. Enable "Read and write permissions"
3. Re-run the workflow

## Best Practices

1. **Don't manually edit** the PR list section between the markers
2. **Keep the markers** (`<!-- PR_LIST_START -->` and `<!-- PR_LIST_END -->`) intact
3. **Use meaningful PR titles** as they will appear in the table
4. **Add relevant labels** to PRs for better categorization
5. **Review the automated commit** after merging to ensure correct formatting

## Example Workflow

Here's what happens when you merge a PR:

1. You merge PR #5 titled "Add new feature" with labels "enhancement" and "feature"
2. GitHub Actions workflow is triggered
3. Workflow extracts: PR #5, title, URL, year 2025, tags "enhancement, feature"
4. A new row is added to the README table:
   ```
   | #5 | Add new feature | [Link](url) | 2025 | enhancement, feature |
   ```
5. Changes are committed and pushed automatically
6. README is updated instantly

## Support

For issues or questions:
1. Check the workflow logs in the Actions tab
2. Review this documentation
3. Check GitHub Actions documentation for more details on workflows
