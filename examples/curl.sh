#!/usr/bin/env bash
# Open Food Facts Scraper - curl examples
# Replace YOUR_TOKEN with an Apify API token (https://console.apify.com/account/integrations).

set -euo pipefail

ACTOR="Turboextract~open-food-facts"
TOKEN="${APIFY_TOKEN:-YOUR_TOKEN}"

# 1. Energy drinks sold in the UK (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [
      "energy drink"
    ],
    "country": "united-kingdom",
    "maxResults": 50
  }'

# 2. Look up barcodes (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [],
    "barcodes": [
      "3017624010701",
      "5449000000996"
    ]
  }'

# 3. A brand range with Nutri-Score A (wait and get the dataset items in one call)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [],
    "brands": [
      "danone"
    ],
    "nutriscore": "a"
  }'
