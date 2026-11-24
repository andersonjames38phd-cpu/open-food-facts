// Open Food Facts Scraper - Node.js example
// npm install apify-client
// APIFY_TOKEN=your_token node node.mjs
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

// Look up barcodes
const run = await client.actor('Turboextract/open-food-facts').call({
    "searchQueries": [],
    "barcodes": [
        "3017624010701",
        "5449000000996"
    ]
});

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) {
    console.log(item.name, item.nutriscore, item.sugars100g);
}
