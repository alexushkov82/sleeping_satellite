#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
cd "$PROJECT_ROOT"

echo "🚀 Starting Flutter Web build..."
fvm flutter build web

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build completed successfully!"
    echo "📦 Files built in directory: build/web"
else
    echo "❌ Error building Flutter application"
    exit 1
fi

