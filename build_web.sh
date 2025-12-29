#!/bin/bash

echo "Building Flutter web app..."

# Clean previous build
rm -rf docs/

# Build Flutter web using FVM
fvm flutter build web --release

# Copy build to docs folder
cp -r build/web/ docs/

# Ensure CNAME is in docs
cp web/CNAME docs/CNAME

# Create .nojekyll to prevent GitHub Pages from processing
touch docs/.nojekyll

echo "Build complete! The /docs folder is ready for GitHub Pages deployment."
echo "Don't forget to:"
echo "1. git add docs/"
echo "2. git commit -m 'Deploy Flutter web app'"
echo "3. git push"
