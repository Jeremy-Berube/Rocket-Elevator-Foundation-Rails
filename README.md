Rocket_Elevators_Information_System
🚀	Working with MVC (Model-View-Controller)	📈

Members of this week's team
Abdul Akeeb -
Ahsan Syed -
Cristiane Santiago -
Lionel Niyongabire -
Eric Moran
 
🎯 About
Week 4 - The main goal of this week is to transform the static site previously developed during the Genesis program and turn it into a web application on MVC (Model - View - Controller) foundations. The site must be in a state that allows you to create a new section that saves the Javascript form that calculates an estimate in the form of a purchase order.
Expanding the relational database model
Seeding data base with data NB: real address are used

Week 5 - During this week, participants are exposed to a more elaborate data model and must perform basic query exercises. They will be asked to create tables, alter them and extend the concepts managed by their information system.
Two types of databases will be requested for this exercise
a- A relational database
b- A data warehouse for decision-making
 
 
📌 Instructions to acces to the admin panel:

To login as Admin:
1. Navigation bar : My Account
2. Login
3. Username: admin@admin.com
4. Password: password

To login as Employee:
1. Username: Email of any employee
2. Password: codeboxx1
 
 
📌 Gems used:
1. gem 'bootstrap', '~> 5.0.0.beta1'
2. gem 'jquery-rails'
3. gem "font-awesome-rails"
4. gem 'devise'
5. gem 'rails_admin', '~> 2.0'
6. gem 'toastr-rails'
7. gem 'cancancan'
8. gem 'rails_admin_rollincode', '~> 1.0'
9. gem 'chartkick'
10. gem 'faker'
11. gem 'multiverse'
12. gem 'blazer'


📌 The queries in mysql:
1. Employee
2. Users
3. Quote
4. Address
5. Battery
6. Building
7. Building Details (Extention Building)
8. Column
9. Customer
10. Elevator
11. Lead

📌 The queries in postgres:
1. Fact Quote
2. Fact Contact
3. Fact Elevator
4. Dim Customer


📚 The three queries:

--How many contact requests are made per month?

SELECT to_char(creation_date, 'YYYY-MM') as "Month"
      ,count(contact_id) as ContactPerMonth
  FROM public.fact_contacts
 group by "Month"
 order by "Month" desc;

--How many bid solicitations are made per month?

SELECT to_char(creation_date, 'YYYY-MM') as "Month"
      ,count(quote_id) as QuotePerMonth
  FROM public.fact_quotes
 group by "Month"
 order by "Month" desc;

--How many elevators per customer do we have?

 SELECT customer_id as "Customer", count(id) as ElevPerCustomers
  FROM public.fact_elevators
 group by "Customer";




# **Life is a Web Service**

To improve your services and products offering , it is not always necessary to solve all the problems yourself and reinvent the wheel. In reality, many solutions are already available to meet the needs of many products and services such as those offered by Rocket Elevators. A large number of products and services exist today to allow an enriched and optimal experience from the beginning to the end of the value chain.
During the API week, the participants gathered in a team will have to collaborate to take advantage of seven implementations, which they will make with some of the most used products on the market:

*	Google Maps
*	Twilio
*	Slack
*	DropBox
*	SendGrid
*	IBM Watson
*	ZenDesk

# How it work

# How to install

![picture](/app/assets/images/maplogo.png)

The Google Maps API is known for its great maturity, performance and geospatial rendering capabilities. It can therefore be used as an extension within our secure back office (reserved for Rocket Elevators employees) in order to geolocate our customers on a map and display statistics on a location:

* *Instruction:*
1. Install 
    [Geocoder](https://rubygems.org/gems/geocoder/versions/1.3.7?locale=fr)

    Provides object geocoding (by street or IP address), reverse geocoding (coordinates to street address), distance queries for ActiveRecord and Mongoid, result caching, and more. Designed for Rails but works with Sinatra and other Rack frameworks too.



# Twilio
![picture](/app/assets/images/twilio.png)

Twilio’s API supports virtually all forms of communication within an application and allows integration of communications between diverse experiences regardless of the platforms on which they were built.

* *Instruction:*
1. Install 
    [Twilio](https://github.com/twilio/twilio-ruby)



# Slack
![picture](/app/assets/images/1280px-Slack_Technologies_Logo.svg.png)

The Slack API is very open and flexible, thus Rocket Elevators could greatly benefit from synergy between all of the company's collaborators. The Backoffice in particular may  be able to publish messages on Slack to leave written records and inform about certain events that occur through its infrastructure.

* *Instruction:*
1. Install 
    [Slack](https://github.com/slack-ruby/slack-ruby-client)


# Dropbox
![picture](/app/assets/images/dropbox.png)

Rocket Elevators must be able to archive their documents in the cloud and the Dropbox API and its online storage allows this to be done in a simple and flexible way while allowing access to the file from anywhere thanks to the multiple interfaces provided by Dropbox.

* *Instruction:*
1. Install 
    [Dropbox](https://github.com/zendesk/dropbox-api)


# Sendgrid
![picture](/app/assets/images/SG_Twilio_Lockup_RGBx1.png)

Sendgrid is a historic and essential service provider in the field of email communication. It allows emails to be sent to a base of users who have authorized transactional communications at the time of their registration (Opt-in). Sendgrid builds on a solid reputation as an email processor that guarantees delivery and favorable classification of emails to major suppliers like Google, Microsoft and Yahoo.

* *Instruction:*
1. Install 
    [Sengrid](https://github.com/sendgrid/sendgrid-ruby)


# IBM Watson
![picture](/app/assets/images/ibm-watson-logo.png)

IBM through its Artificial Intelligence Watson provides application developers with many services. Among the most used, there is a Text-to-Speech functionality which can be used on a multitude of platforms.
Rocket Elevators wants to add text-to-speech functionality to their 

* *Instruction:*
1. Install 
    [Watson](https://github.com/watson-developer-cloud/ruby-sdk)


# ZenDesk
![picture](/app/assets/images/zendesk_logo.png)

When the time comes to deliver quality customer service, managing customer requests should never leave a contact unanswered and ensure reasonable processing times. This is often the first of future customers.

* *Instruction:*
1. Install 
    [Zendesk](https://github.com/zendesk/zendesk_api_client_rb)

