# Co-Ping (API) [![Coverage Status](https://coveralls.io/repos/github/pgaunitz/co_ping_api/badge.svg?branch=development)](https://coveralls.io/github/pgaunitz/co_ping_api?branch=development)[![Build Status](https://travis-ci.org/pgaunitz/co_ping_api.svg?branch=development)](https://travis-ci.org/pgaunitz/co_ping_api)

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
This application as a whole has endless possibilities and we would like to list some of them to get you as excited about Co-Ping as wer are.

##### Image Upload
A big part of this application involves trust as it should, but we also want to offer features for administrative parts such as providing your Ponger with a copy of your receipt. This could be uploaded when you've closed your shopping trip and want to send the total amount back to your neighbor. The total amount would then be delivered to the Ponger's account together with the image of the receipt.

##### Monetization
Our monetization plan for this app starts with cooperatives and community organizations paying a yearly subscription fee. This would ultimately be paid online by submitting details through third party API's such as Paypal or Klarna B2B.

##### Points and ratings
At the moment the person who needs something benefits more from this application than the shopper, should the favour not be returned. Therefor we would like to implement a ratings system where the person doing favours gets points and comments from their neighbors. This way a person who is doing favours gets something back that inspires them to keep going.

##### Local Services
As a service to the coop signing up for the subscription we would like to make local, coop-related companies available to them for hire. The coop-admin would then be able to create a Ping of what type of service they need taken care of, such as gardening or fixing electricity. The local vendors would then respond with a pong including an offer the admin then could accept or decline.

##### Coop- Chat and Contact List
Apart from the shopping features we would like to inspire people to keep communicating by offering a chat for the entire building as well as a contact list to easily get in touch with one another and start conversations.

##### Geo Location
The app started out targeting cooperations, clusters of people living super close to each other but never really talking or getting to know each other. They would be connected through a co-op manager or board member and allowed access to the building account. Our next step is to let these people widen their network by choosing how many houses in their close proximity they want to be accessible to for pings and pongs. This we more people can help each other, save time, money and reduce overall consumption by co-shopPing.

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

### License
We operate under the [MIT License](https://en.wikipedia.org/wiki/MIT_License).
