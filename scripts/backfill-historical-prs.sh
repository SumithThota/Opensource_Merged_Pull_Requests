#!/bin/bash

# Backfill Script for Historical Merged PRs
# This script fetches all previously merged PRs by the user and adds them to README.md

echo "🔍 Fetching historical merged PRs..."

# GitHub username (change this if needed)
GITHUB_USER="SumithThota"

# Create a temporary file to store PR data
TEMP_FILE="/tmp/historical_prs.txt"
> "$TEMP_FILE"

# Fetch merged PRs using GitHub CLI (requires 'gh' to be installed)
if ! command -v gh &> /dev/null; then
    echo "❌ Error: GitHub CLI (gh) is not installed."
    echo "Please install it from: https://cli.github.com/"
    exit 1
fi

echo "📥 Fetching PRs from GitHub..."

# Search for all merged PRs by the user
gh search prs --author "$GITHUB_USER" --merged --json number,title,url,mergedAt,repository,labels --limit 1000 | jq -r '.[] | 
    @json' | while read -r pr_json; do
    
    # Parse PR data
    PR_NUMBER=$(echo "$pr_json" | jq -r '.number')
    PR_TITLE=$(echo "$pr_json" | jq -r '.title')
    PR_URL=$(echo "$pr_json" | jq -r '.url')
    PR_MERGED_AT=$(echo "$pr_json" | jq -r '.mergedAt')
    REPO_NAME=$(echo "$pr_json" | jq -r '.repository.nameWithOwner')
    
    # Extract year
    YEAR=$(echo "$PR_MERGED_AT" | cut -d'-' -f1)
    
    # Extract labels
    LABELS=$(echo "$pr_json" | jq -r '[.labels[].name] | join(", ")')
    if [ -z "$LABELS" ] || [ "$LABELS" = "null" ]; then
        LABELS="-"
    fi
    
    # Escape special characters in title
    SAFE_TITLE=$(echo "$PR_TITLE" | sed 's/|/\\|/g')
    
    # Create table row with repo name
    echo "| #${PR_NUMBER} | ${SAFE_TITLE} (${REPO_NAME}) | [Link](${PR_URL}) | ${YEAR} | ${LABELS} |" >> "$TEMP_FILE"
    
    echo "✅ Added: PR #${PR_NUMBER} from ${REPO_NAME}"
done

# Count how many PRs were found
PR_COUNT=$(wc -l < "$TEMP_FILE")

if [ "$PR_COUNT" -eq 0 ]; then
    echo "⚠️  No historical PRs found."
    exit 0
fi

echo ""
echo "📊 Found $PR_COUNT merged PRs!"
echo ""

# Backup current README
echo "💾 Backing up current README.md..."
cp README.md README.md.backup

# Insert all historical PRs into README
echo "📝 Updating README.md..."

# Find the line number of the table header
TABLE_HEADER_LINE=$(grep -n "| PR # | Title | Link | Year | Tags |" README.md | cut -d: -f1)

# Insert after the separator line (2 lines after header)
INSERT_LINE=$((TABLE_HEADER_LINE + 2))

# Read the temp file in reverse order (newest first) and insert after separator
LINE_NUM=$INSERT_LINE
while IFS= read -r line; do
    sed -i "${LINE_NUM}i $line" README.md
    echo "✅ Inserted at line $LINE_NUM"
done < <(tac "$TEMP_FILE")

echo "✅ README.md has been updated with $PR_COUNT historical PRs!"
echo ""
echo "📋 Next steps:"
echo "1. Review the changes: git diff README.md"
echo "2. If satisfied, commit: git add README.md && git commit -m 'docs: add historical merged PRs'"
echo "3. If not satisfied, restore backup: mv README.md.backup README.md"
echo ""
echo "💡 Backup saved as: README.md.backup"

# Clean up
rm "$TEMP_FILE"
