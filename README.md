# Find my dream apartment bot

This simple robot goes to [Oikotie](https://asunnot.oikotie.fi/myytavat-asunnot), a Finnish website for buying and selling apartments and houses.

The bot accepts the cookie consent. The cookie consent is in an iframe so first the bot has to select the iframe before trying to find the OK button.

Then the bot inputs some search criteria hard coded into the bot, clicks search and sorts the results from the cheapest to the most expensive.

Lastly the robot takes a screenshot of each thumbnail and shows them in the logs.

TODO:

- Show thumbnails from all pages instead of only the first page
- Select building type and room count (Trying to select them gave an error)
- Show the results in a way that would actually be useful (e.g. create an HTML page with all the screenshots as links to the apartment page)