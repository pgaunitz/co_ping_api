# Co-Ping (API) [![Coverage Status](https://coveralls.io/repos/github/CraftAcademy/co_ping_api/badge.svg?branch=development)](https://coveralls.io/github/CraftAcademy/co_ping_api?branch=development) [![Build Status](https://semaphoreci.com/api/v1/pgaunitz/co_ping_api/branches/development/badge.svg)](https://semaphoreci.com/pgaunitz/co_ping_api)

![Co-ping image](./public/copingWide.png)

### So what is Co-Ping?

Co-Ping is the cooperative shopping app for amazing neighbor's. With it you can announce when you'll go shopping so that a neighbor who may need a few items can request you pick it up for them. Next time, when they go shopping, you may be out of something and they can return the favour. This app is about bringing people in a co-operative or neighborhood closer - one kind gesture at a time (while saving time, money and reducing consumption).

### Let's get started

##### Fork & clone
To start working on this project you will need to fork [this Repo](https://github.com/CraftAcademy/co_ping_api), the [mobile client Repo](https://github.com/CraftAcademy/co_ping_mobile) and also the [browser client Repo](https://github.com/CraftAcademy/co_ping_client). Clone it down to your local workspace, if more than two Repos we recommend that you start with the API. Make sure you have a text editor, we recommend [VSCode](https://code.visualstudio.com/) but there are many to choose from.

##### This app was built with...

* [React](https://reactjs.org/)
* [Ruby on Rails](https://rubyonrails.org/)

##### ... and tested using

* [Cypress](https://www.cypress.io/)
* [RSpec](https://rspec.info/)

##### ... additional packages and gems includes
* [Active Model Serializer](https://www.rubydoc.info/gems/active_model_serializers)
* [Devise Token Auth](https://www.rubydoc.info/gems/devise_token_auth/0.1.14)
* [Rack Cors](https://www.rubydoc.info/gems/rack-cors/0.2.9)
* [Shoulda Matchers](https://matchers.shoulda.io/docs/v4.3.0/)
* [Factory Bot](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)

##### we love to deploy with...

* [Netlify](https://www.netlify.com/)
* [Heroku](https://www.heroku.com/)

##### ... and don't forget to monitor your test coverage...

* [Semaphore](https://semaphoreci.com/)
* [Coveralls](https://coveralls.io/)

##### Installments
Now let's get to it shall we?
... get the gems needed

```
bundle install
```
... get RSpec for testing
```
rspec-rails
```
... start the server
```
rails s
```
Awesome! Now you should be good to go on the back-end, let's continue on the front end...

... get [Yarn](https://yarnpkg.com/)
```
yarn install
```
... start Cypress to run some tests
```
yarn run cy:open
```
... start the React application and run it on your local host
```
yarn start
```
**... There, now you should be good to go. make some coder magic!**

### Updates and improvements
There are still some things to check off before we feel "done" with this project (if you're ever done with anything) and that would primarily be:
* This
* That
* Oh and that too
* Let me just adjust this, then we're ok

### Authors
These are the people behind this amazing application:
* [Emma-Maria Thalen](https://github.com/emtalen)
* [Philip Gaunitz](https://github.com/pgaunitz)
* [Kayla Woodbury](https://github.com/kaylawoodbury)
* [Johan Bons](https://github.com/johanbounce)
* [Karolina Frostare](https://github.com/kaylawoodbury)

### Acknowledgements
We would like to show our appreciation to the following people and places
* [Thomas Ochman](https://github.com/tochman) for helping us out with bug hunts
* [Aditya Naik](https://github.com/kianaditya) for supporting us during our swish implementation phase
* [This website]() that got us through this huge bug hunt
* [This YouTube video]() which taught us some new stuff

### License
We operate under the [MIT License](https://en.wikipedia.org/wiki/MIT_License).
