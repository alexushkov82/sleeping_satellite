#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
cd "$PROJECT_ROOT"

./scripts/build.sh

if [ $? -eq 0 ]; then
    echo ""
    echo "📤 Starting Firebase deployment (default hosting)..."
    firebase deploy --only hosting:default
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "🎉 Deployment completed successfully!"
        echo "🌐 Site available at: https://sleeping-satellite.web.app"
    else
        echo "❌ Error deploying to Firebase"
        exit 1
    fi
else
    echo "❌ Error building Flutter application"
    exit 1
fi

