
## Instructions to acces to the admin panel:

To login as Admin:

1. Navigation bar : My Account
2. Login
3. Username: nicolas.genest@codeboxx.biz
4. Password: codeboxx1


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

# Introduction to week 7 (API WEEK)

![picture](/app/assets/images/rocketbonus.png)

During the API week, the participants gathered in a team will have to collaborate to take advantage of seven implementations, which they will make with some of the most used products on the market:
**Rocket Elevators' information system** continues to evolve. It now has a website, operational functions in its back office and the ability to perform business intelligence using its data warehouse and graphic rendering capabilities of key facts in their context.
The time has now come to increase the functional capacities of certain sections of the information system in order to:
1.	Provide a rich experience for website visitors and clients.
2.	Improve **Back Office** 

In order to achieve these objectives, the product team has identified certain capabilities offered by APIs (**Application Programming Interfaces**) published by specialized partners and accessible in SaaS (Software as a Service) mode via subscriptions. The functionalities to be implemented must meet specific requirements.

The Ruby on Rails implementations delivered must serve as the foundation for this new iteration of the information system.


# The Requierement

![picture](/app/assets/images/mapsmale.jpg)

**The Google Maps API** is known for its great maturity, performance and geospatial rendering capabilities. It can therefore be used as an extension within our secure back office (reserved for Rocket Elevators employees) in order to geolocate our customers on a map and display statistics on a location:

* *Instruction:*

The geolocation page must be a page in the Admin section of the website, available only to authenticated members.
The addresses table of the database, if it is not already the case, must now include real addresses, geolocalizable by Google Maps.

* *To Access:*
    
    * On  the Rocket Elevators pages:

        * log in to: MY ACCOUNT

            - with user name: nicolas.genest@codeboxx.biz
            - with Password: codeboxx1

    This will give you access to the BackOffice Dashboard.

    * Click on *Map*

    You have now access to the location and details on our clients indicated by marker. You will also notice the actual weather on the specific marker.

**How we did it**
1. Install 
    [Geocoder gem](https://rubygems.org/gems/geocoder/versions/1.3.7?locale=fr) 

    Provides object geocoding (by street or IP address), reverse geocoding (coordinates to street address), distance queries for ActiveRecord and Mongoid, result caching, and more. Designed for Rails but works with Sinatra and other Rack frameworks too.
2. Creating [API key](https://developers.google.com/maps/documentation/javascript/get-api-key)

    The API key is a unique identifier that authenticates requests associated with your project for usage and billing purposes. You must have at least one API key associated with your project

# Twilio
![picture](/app/assets/images/twilio.png)

**Twilio’s API** supports virtually all forms of communication within an application and allows integration of communications between diverse experiences regardless of the platforms on which they were built.

* *Instruction:*
1. Install 
    [Twilio gem](https://github.com/twilio/twilio-ruby) 

2. Creating [API key](https://www.twilio.com/docs/iam/keys/api-key-resource)

For Rocket Elevators, Twilio can be used to allow the platform to get in touch with the technicians in case of problems.
If the status of an Elevator in the database changes to "Intervention" status, the building's technical contact must be identified and an SMS must be sent to the telephone number associated with this contact.
In this case, the designated contact must be the coach assigned to each team, and he must receive the alerts on his mobile phone.


# Slack
![picture](/app/assets/images/slacksmall.png)

**The Slack API** is very open and flexible, thus Rocket Elevators could greatly benefit from synergy between all of the company's collaborators. The Backoffice in particular may  be able to publish messages on Slack to leave written records and inform about certain events that occur through its infrastructure.

* *Instruction:*
1. Install 
    [Slack](https://github.com/slack-ruby/slack-ruby-client)

2. Creating [API key](https://slack.com/intl/fr-ca/help/articles/215770388-Cr%C3%A9er-et-r%C3%A9actualiser-un-jeton-API)


In the current use case, when a controller changes the status of an elevator, this status is reflected in the information system and persists in the operational database . When these status changes occur, a message is sent to the slack “elevator_operations” channel to leave a written record.
The written message must have the following format:
The Elevator [Elevator’s ID] with Serial Number [Serial Number] changed status from [Old Status] to [New Status]


# Dropbox
![picture](/app/assets/images/dropbox.png)

Rocket Elevators must be able to archive their documents in the cloud and the **Dropbox API** and its online storage allows this to be done in a simple and flexible way while allowing access to the file from anywhere thanks to the multiple interfaces provided by Dropbox.

* *Instruction:*
1. Install 
    [Dropbox gem](https://github.com/zendesk/dropbox-api) 

2. Creating [API key](https://www.dropbox.com/developers/documentation/http/documentation)

    * to login:

    Email:rocket_elevator12345@outlook.com

    password: codeboxx1 

When a contact becomes a customer, that is to say when the “Customers” table in the information system can be linked to a record in the “Leads” table, which itself offers the possibility of uploading files in a binary field of the table, it is necessary to trigger an archiving procedure which:

    1.	Connect to the Rocket Elevators DropBox account
    2.	Create a directory in DropBox on behalf of the client if the client does not already exist
    3.	Extract the file stored in the binary field of the MySQL database
    4.	Copy this file to the client DropBox directory
    5.	If the document is successfully downloaded to Dropbox, the controller deletes the content of the binary field from the database to avoid duplication


# Sendgrid
![picture](/app/assets/images/sengridsmall.png)


**Sendgrid** is a historic and essential service provider in the field of email communication. It allows emails to be sent to a base of users who have authorized transactional communications at the time of their registration (Opt-in). Sendgrid builds on a solid reputation as an email processor that guarantees delivery and favorable classification of emails to major suppliers like Google, Microsoft and Yahoo.

* *Instruction:*
1. Install 
    [Sengrid gem](https://github.com/sendgrid/sendgrid-ruby)

For Rocket Elevators, one use case to implement is sending a thank you email automatically when a contact completes the "Contact Us" form on the Rocket Elevators website. The form is saved with the email field to use. When saving to the database, a transactional thank-you email must be sent with the text below:
Greetings [Full Name]
We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project [Project Name].
A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
We’ll Talk soon
The Rocket Team
The email must also contain the logo and overall design of Rocket Elevators.


# IBM Watson
![picture](/app/assets/images/watsonsmall.jpg)

IBM through its Artificial Intelligence **Watson** provides application developers with many services. Among the most used, there is a Text-to-Speech functionality which can be used on a multitude of platforms.
Rocket Elevators wants to add text-to-speech functionality to their 

* *Instruction:*
1. Install 
    [Watson gem](https://github.com/watson-developer-cloud/ruby-sdk) 

    Rocket Elevators wants to add text-to-speech functionality to their Home Dashboard (/ admin). We must have the option to start the every time the Admin Dashboard page appears.
The type of information that speech synthesis allows are the following:

       1.Greetings to the logged users
       2.There are currently XXX elevators deployed in the XXX buildings of your XXX customers
       3.Currently, XXX elevators are not in Running Status and are being serviced
       4.	You currently have XXX quotes awaiting processing
       5.	You currently have XXX leads in your contact requests
       6.	XXX Batteries are deployed across XXX cities

    To provide the type of voice summary described, it is necessary to execute the appropriate queries in the database to collect the relevant data. Then form sentences in English and combine them with the data collected.


2. Creating [API key](https://developer.ibm.com/technologies/iot/tutorials/iot-generate-apikey-apitoken/)

* *To Access:*
        
    You will need to create an account in [Watson text-to-speech](https://www.ibm.com/cloud/watson-text-to-speech?p1=Search&p4=43700057522849808&p5=e&gclid=Cj0KCQiAnKeCBhDPARIsAFDTLTJAGF9fs9KEOWVFGQXU3KAGvLFfi7FN-l2nYzCVCeOXafqYHXEhrnwaAmm9EALw_wcB&gclsrc=aw.ds)

    * to login:

    Email:rocket_elevator12345@outlook.com

    password: codeboxx1  

from there, you will have access to the Watson dashboard enabling you to control the API

# ZenDesk
![picture](/app/assets/images/Zendesk_Buddha.jpeg)

When the time comes to deliver quality customer service, managing customer requests should never leave a contact unanswered and ensure reasonable processing times. This is often the first of future customers.

* *Instruction:*
1. Install 
    [Zendesk ruby gems](https://github.com/zendesk/zendesk_api_client_rb)

    You will need to open an account with Zendesk. To do so, visit:  [Zendesk.com](https://www.zendesk.com/?utm_source=google&utm_medium=Search-Paid&utm_network=g&utm_campaign=SE_AW_AM_CA_EN_N_Sup_Brand_TM_Alpha_D_H&matchtype=e&utm_term=zendesk%20api&utm_content=472670451081&utm_adgroup=&gclsrc=aw.ds&&gclid=Cj0KCQiA-aGCBhCwARIsAHDl5x-ONLWiuqKW30zsRZe6Occu73cinaG3MOcHkR3p27_jPob_wudtmBsaAu6HEALw_wcB)

* *To Access:*

    Log in to your Zendesk account, this is where the actual Zendesk Dashboard wil be found.
    
    Email: rocket_elevator12345@outlook.com

    password: codeboxx1


1.	The website's “Contact Us” form creates a new “Question” type ticket in ZenDesk
2.	The website's “Get a Quote” form creates a new “Task” type ticket in ZenDesk
3.	The tickets created are visible in the ZenDesk Console and it is possible to respond to them or even manage a workflow for these contacts.
The content of each ticket created must include the contact information which has been stored in the database:
Subject: [Full Name] from [Company Name]
Comment: The contact [Full Name] from company [Company Name] can be reached at email  [E-Mail Address] and at phone number [Phone]. [Department] has a project named [Project Name] which would require contribution from Rocket Elevators. 
[Project Description]
Attached Message: [Message]
The Contact uploaded an attachment

2. Creating [API key](https://support.zendesk.com/hc/fr/articles/226022787-G%C3%A9n%C3%A9ration-d-un-nouveau-token-API)


## Gems add for Week 7:
    * gem 'ibm_watson'
    * gem 'google_maps_service'
    * gem 'gmaps4rails'
    * gem 'geocoder'
    * gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
    * gem 'mysql2', '>= 0.4.4', '< 0.6.0'
    * gem 'pg', '>= 0.18', '< 2.0'
    * gem 'puma', '~> 3.11'
    * gem 'uglifier', '>= 1.3.0'
    * gem 'coffee-rails', '~> 4.2'
    * gem 'jbuilder', '~> 2.5'
    * gem 'bootsnap', '>= 1.1.0', require: false
    * gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    * gem 'web-console', '>= 3.3.0'
    * gem 'listen', '>= 3.0.5', '< 3.2'
    * gem 'spring'
    * gem 'spring-watcher-listen', '~> 2.0.0'
    * gem 'capistrano', '~> 3.10', require: false
    * gem 'capistrano-rails', '~> 1.4', require: false
    * gem 'capistrano-bundler', '>= 1.1.0'
    * gem 'rvm1-capistrano3', require: false
    * gem 'capistrano3-puma'
    * gem 'capybara', '>= 2.15'
    * gem 'selenium-webdriver'
    * gem 'chromedriver-helper'
    * gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
    * gem 'figaro'
    * gem 'slack-ruby-client'
    * gem 'async-websocket', '~> 0.8.0'
    * gem 'slack-incoming-webhooks'
    * gem "slack-notifier"
    * gem 'sendgrid-ruby'
    * gem 'twilio-ruby'
    * gem 'sinatra'
    * gem 'phonelib'
    * gem 'zendesk_api'

# By Team Week 7

- Gabriel Rioux : team leader
- Eric Moran
- Tatiana Ramirez
- Jeremy Berube
- Eric Turcotte
