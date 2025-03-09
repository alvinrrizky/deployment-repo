#!/bin/bash

# Load environment variables dari .env
export $(grep -v '^#' .env | xargs)

echo "🚀 Starting Deployment..."

# Pastikan GHCR_TOKEN tidak kosong
if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "❌ Error: GHCR_TOKEN belum diatur. Pastikan sudah ada di .env!"
  exit 1
fi

# Login ke GHCR
echo "🔑 Logging in to GHCR..."
echo "$GITHUB_TOKEN" | docker login ghcr.io -u "$GITHUB_USERNAME" --password-stdin

echo "⬇️ Pulling latest Docker images..."
docker-compose pull

echo "🔄 Restarting services..."
docker-compose up -d

echo "✅ Deployment Complete!"