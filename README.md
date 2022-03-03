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

Wednesday 1 hour
5pm work 1 hour on improving add request form, category click handlers javascript/coffeescript? https://coderwall.com/p/kqb3xq/rails-4-how-to-partials-ajax-dead-easy

Thursday 2 hours
answer request pop-up? modal video https://www.youtube.com/watch?v=gLWIYk0Sd38
Friday
modal answer request, links to view all; paginate? categories filter on side again, modify homepage limit to 10 newest, styling, forgot password edit account styling? 8 hours
Weekend get base website done, likes and flag buttons, pop ups for it, add username to published and approved, styling put 4 hours in?

Read https://fuzzymath.com/blog/improve-accessibility-for-visually-impaired-users/ 
use this:
https://chrome.google.com/webstore/detail/accessibility-insights-fo/pbjjkligggfmakdaogkfomddhfmpjeni
read this:
https://www.boia.org/blog/5-quick-ways-to-self-check-the-accessibility-of-a-website
Sticky navbar:
https://www.w3schools.com/howto/howto_js_navbar_sticky.asp