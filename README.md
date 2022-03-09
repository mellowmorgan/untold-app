## Technologies Used

* Ruby 2.7
* Rails 6
* Gems
* JQuery3
* PG
* Bootstrap
* HTML/CSS
* Postman
* open-uri
* Webpacker
* ActiveStorage
* Postgres
* pry
* Heroku

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

![database schema image](./public/sqldesign.png)

### Research & Planning Log
#### Friday, 02/18 8 hours
* 8:30: Create app with webpacker=react flag
* 8:45: Capstone proposal 
* 9:00: Plan database with sqldesigner, add to readme
* 9:45: Start building out database ?
* 10:45: Set up Devise ?
* 11:00: Testing
* 1:00: Devise set up authentication controllers
* 2:00: Work on API requests
* 3:30: Watch Youtube video CRUD React 40 minutes https://www.youtube.com/watch?v=oyjzi837wME&t=243s


#### Sunday, 02/20 2.5 hours

* 6:00-7:40: Work on API, test endpoints in Postman. Finish API for descriptions and requests done!
* 7:45-8:45: Modify user model look up devise stuff

#### Friday, 02/25 ~6 hours

8:45am-10am: Work on homepage, Devise views.
10:10am: NOTE TO SELF: from stuff online I've seen, using Devise with React is not advised, might have to scrap react idea as I've already begun implementing Devise, so might stick to just a Rails app!:(
11:00-12:30: Trying to figure out Devise auth with API use.
1pm: https://github.com/waiting-for-dev/devise-jwt (NOTE FOR SELF: DONT TRY AND USE THIS AGAIN IT MESSED UP YOUR APP WARNING!!)
2:15pm: Tried implementing Devise, messed up my project and had to fetch and reset to last git push. 
2:30pm: Failing yet again with authentication. Why is authentication with devise so tricky? *bangs head* 
2:45pm Note to self: when using authenticated API in postman, go to Auth section, choose Basic Auth, then enter email, password to access API. https://github.com/heartcombo/devise/wiki/How-To:-Use-HTTP-Basic-Authentication

#### Saturday 2.5 hours
10:30 to 1am: Migration categories array add; "open requests" button left pane, published requests section with answer in middle section start building out


#### Sunday 1 hour
12:00pm: building out homepage

#### Monday 1.5 hour
9:00pm try to use react api call?
10pm Read this tutorial https://github.com/DakotaLMartinez/rails-react-devise-tutorial
11:pm found this https://www.youtube.com/watch?v=gLWIYk0Sd38 WATCH TOMORROW, do modal with new request form popup

### Tuesday put 2 hours in
5:00-6:45pm Try modifying create with current user being user id? in controller; do data dump
11:30 work on improving add request form, category click handlers javascript/coffeescript? https://coderwall.com/p/kqb3xq/rails-4-how-to-partials-ajax-dead-easy no luck but found this tutorial

Wednesday 
5pm work 2 hours on add category click handlers side menu js

Thursday 1 hour add js partials side menu categories for open and answered request pages

Friday
DONE! 1. change home vs requests to limit 10 newest for home, all for others and add will_paginate
2. nav and home styling, forgot password edit account styling? 
DONE! 3. make home only show highest rating description
4. click on request show request and add description option new page completely
5. add more entries to database, backup pg_dump

Weekend: Submit photo url add photo from computer, implement active storage photos, santitize url if url

pop-up? modal video https://www.youtube.com/watch?v=gLWIYk0Sd38
modal for reporting an answer or description 
Weekend get likes and flag buttons, pop ups for latter, add username to published and approved and scriptions, styling put 4 hours in?

### Tuesday, March 8

* Allow manual font size adjustment STRETCH GOALS

1. Check ScreenReader on whole website
2. https://www.thecut.com/2014/07/could-you-describe-colors-to-a-blind-person.html
3. Tab through whole website
4. Practice presentation make notes

98% of U.S.-based webpages are not accessible to the disability community from a legal perspective, according to the 2020 Web Accessibility Annual Report

Resources - Bureau of internet accessibility https://www.boia.org/blog/5-quick-ways-to-self-check-the-accessibility-of-a-website and vision impaired people I spoke personally to. And I'd like to thank Matt Luker for connecting me with his vision impaired friend. Reddit user telling me I should let the user submit photos as part of the request because they lamented that they will freqently come across a photo on the internet and because alt text is so limited; they have no clue what the photo is, and why any sort of controversy or excitement might be like created because of it.

How to make sure site is accessible?
Is there alt text for every image?
Is the website still functional and no loss of content when zoomed in at 200%
Does the text pop from the background with high contrast?
User color contrast checker:
https://color.a11y.com/ContrastPair/?bgcolor=1B1D1E&fgcolor=E27D53
Check with Dark Reader/ a lot of users that are vision impaired, like those with tunnel vision or low vision use this chrome extension
Can you use the site without clicking a single time? Tab through each button, form field, link?
ScreenReader does it work on whole page fluidly??
Use headings to organize page content and descriptive titles