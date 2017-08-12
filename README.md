# Clarify API

Clarify is a service that attempts to provide clarity in the world of online learning. A user selects some content that they don't fully understand, and get a clear explaination tailored to there learning needs.

This particular API is meant to handle requests for clarification that are sent from a Google Chrome extension client and return a clarified response. 

If the selected clarification text is available the API will first look to return an existing clarification response with the highest rating. If no clarification exists, the selection will be queued for moderation by a tutor in that field.

#### Ruby version
2.4.1


