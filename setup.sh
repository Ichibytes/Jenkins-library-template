#!/bin/bash

# Jenkins Shared Library Template Setup Script
# This script customizes the template for your new library and removes example files

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored message
print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Get library name
print_info "Welcome to Jenkins Shared Library Template Setup!"
echo ""
read -p "Enter your library name (e.g., 'my-jenkins-library'): " LIBRARY_NAME

if [ -z "$LIBRARY_NAME" ]; then
    print_error "Library name cannot be empty!"
    exit 1
fi

# Convert to different formats
LIBRARY_NAME_LOWER=$(echo "$LIBRARY_NAME" | tr '[:upper:]' '[:lower:]')
LIBRARY_NAME_UPPER=$(echo "$LIBRARY_NAME" | tr '[:lower:]' '[:upper:]')
LIBRARY_NAME_TITLE=$(echo "$LIBRARY_NAME" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')

# Get GitHub username/organization (optional)
read -p "Enter your GitHub username/organization (optional, press Enter to skip): " GITHUB_USER
if [ -z "$GITHUB_USER" ]; then
    GITHUB_USER="YOUR-USERNAME"
    print_warning "Using placeholder for GitHub username. Update manually later."
fi

print_info "Setting up library: $LIBRARY_NAME"
echo ""

# Backup original files
print_info "Creating backups..."
cp README.md README.md.bak 2>/dev/null || true
cp CHANGELOG.md CHANGELOG.md.bak 2>/dev/null || true
cp settings.gradle settings.gradle.bak 2>/dev/null || true

# Replace in settings.gradle
print_info "Updating settings.gradle..."
sed -i.bak "s/jenkins-library-template/$LIBRARY_NAME_LOWER/g" settings.gradle
rm settings.gradle.bak 2>/dev/null || true
print_success "Updated settings.gradle"

# Replace in README.md
print_info "Updating README.md..."
sed -i.bak \
    -e "s/Jenkins-library-template/$LIBRARY_NAME_TITLE/g" \
    -e "s/jenkins-library-template/$LIBRARY_NAME_LOWER/g" \
    -e "s/Ichibytes/$GITHUB_USER/g" \
    README.md
rm README.md.bak 2>/dev/null || true

# Remove example sections from README
print_info "Cleaning up README.md..."
# Remove the example usage sections (from "Usage Examples" to just before "Testing")
# Using awk for better cross-platform compatibility
awk '/^## 📖 Usage Examples$/{flag=1} /^## 🧪 Testing$/{flag=0} !flag' README.md > README.md.tmp && mv README.md.tmp README.md
print_success "Updated README.md"

# Replace in CHANGELOG.md
print_info "Updating CHANGELOG.md..."
sed -i.bak \
    -e "s/Ichibytes/$GITHUB_USER/g" \
    -e "s/Jenkins-library-template/$LIBRARY_NAME_LOWER/g" \
    CHANGELOG.md
rm CHANGELOG.md.bak 2>/dev/null || true

# Reset CHANGELOG to initial state
cat > CHANGELOG.md << EOF
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial setup of $LIBRARY_NAME_TITLE

[Unreleased]: https://github.com/$GITHUB_USER/$LIBRARY_NAME_LOWER/compare/v0.1.0...HEAD
EOF
print_success "Updated CHANGELOG.md"

# Replace in CONTRIBUTING.md
print_info "Updating CONTRIBUTING.md..."
sed -i.bak \
    -e "s/Ichibytes/$GITHUB_USER/g" \
    -e "s/Jenkins-library-template/$LIBRARY_NAME_LOWER/g" \
    CONTRIBUTING.md
rm CONTRIBUTING.md.bak 2>/dev/null || true
print_success "Updated CONTRIBUTING.md"

# Update VERSION
print_info "Resetting VERSION..."
echo "0.1.0" > VERSION
print_success "Reset VERSION to 0.1.0"

# Delete example files
print_info "Removing example files..."
rm -f vars/exampleStep.groovy
rm -f test/vars/ExampleStepTest.groovy
rm -f src/org/jenkins/library/ExampleUtility.groovy
rm -f test/src/org/jenkins/library/ExampleUtilityTest.groovy
rm -f resources/example-resource.txt
print_success "Removed example files"

# Clean build directory
print_info "Cleaning build directory..."
rm -rf build/
print_success "Cleaned build directory"

# Ask about git initialization
echo ""
read -p "Do you want to initialize a fresh git repository? (y/N): " INIT_GIT
if [[ "$INIT_GIT" =~ ^[Yy]$ ]]; then
    print_info "Initializing new git repository..."
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit: $LIBRARY_NAME_TITLE"
    print_success "Initialized new git repository"
    print_info "Don't forget to add your remote: git remote add origin <your-repo-url>"
else
    print_info "Keeping existing git history"
fi

# Self-destruct
echo ""
print_warning "This script will now delete itself..."
read -p "Continue? (Y/n): " CONFIRM
if [[ ! "$CONFIRM" =~ ^[Nn]$ ]]; then
    rm -f "$0"
    print_success "Setup complete! Script has been removed."
else
    print_info "Setup complete! Script preserved for reference."
fi

echo ""
print_success "🎉 Your Jenkins Shared Library '$LIBRARY_NAME_TITLE' is ready!"
echo ""
print_info "Next steps:"
echo "  1. Review and customize README.md"
echo "  2. Update .github/workflows/*.yml with your repository URLs"
echo "  3. Add your first pipeline step in vars/"
echo "  4. Start building your library!"
echo ""

