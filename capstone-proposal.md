Name of Student: Morgan Waites

Name of Project: Untold App

Project's Purpose or Goal: Primarily for the vision-impaired, this project will provide detailed visual descriptions of things such as landmarks, buildings, famous people, animals, et cetera. Users can submit requests and other users can submit descriptions which other users can then rate.

List the absolute minimum features the project requires to meet this purpose or goal: 
* User sign in/registration/authentication
* Feature to submit requests
* Admin approve request and publish to queue
* Other users can submit descriptions and then those can get approved and published to site.
* Must be accessible to vision-impaired.

Tools: 
* Ruby on Rails with partial or full React frontend (might fall back on fully Rails app). 
* Database with Postgres. Devise gem for user. 
* Webpacker gem (react). 
* Axios for API use in react. 
* Potentially Serializer? 

Stretch Goals: 
* Make UI really nice. 
* Banning/reporting feature. 
* Setup email host so people can reach out. 
* Image upload or voice recording upload instead of text-based request/description. 
* User profile with nice styling, flesh out setting. 
* User can upload a photo as avatar if they want. 
* Anyone can rate published descriptions. 
* Add user username, or first and last name fields to tables, profiles, requests and descriptions?

What additional tools, frameworks, libraries, APIs, or other resources will these additional features require? 
* I am not sure what the full extent of libraries or resources will need to be used to make my site accessible, this will require a lot of research and testing and is the biggest hurdle in my project. VoiceOver with Mac will be used for sure with testing, as will Dictation and Voice Control and color inversion, and Dark Reader, a Chrome extension visually impaired people use. 
* Potentially ActiveStorage for image upload, unsure if I want to implement it though.
* Audio might not happen but would need to research that with Rails/Postgres integration.
Read https://fuzzymath.com/blog/improve-accessibility-for-visually-impaired-users/ 
use this:
https://chrome.google.com/webstore/detail/accessibility-insights-fo/pbjjkligggfmakdaogkfomddhfmpjeni
read this:
https://www.boia.org/blog/5-quick-ways-to-self-check-the-accessibility-of-a-website
Sticky navbar:
https://www.w3schools.com/howto/howto_js_navbar_sticky.asp
Is there anything else you'd like your instructor to know? I have signed an offer letter for a job I start march 14, and have been told I don't need to complete capstone, but still intend to, but might not implement as much as I intended; I might not incorporate React in this Rails app, I might not do moderation on requests and descriptions.