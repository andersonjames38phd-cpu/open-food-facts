"""Open Food Facts Scraper - Python example.

pip install apify-client
export APIFY_TOKEN=your_token
"""
import os

from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

# Energy drinks sold in the UK
run = client.actor("Turboextract/open-food-facts").call(run_input={
    "searchQueries": [
        "energy drink"
    ],
    "country": "united-kingdom",
    "maxResults": 50
})

# Stream every item
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("name"), item.get("nutriscore"), item.get("sugars100g"))

# Or fetch one page of items
page = client.dataset(run["defaultDatasetId"]).list_items(limit=100)
print(f"{page.total} items in dataset")
