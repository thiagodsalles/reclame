<h1># Backend Engineer Challenge - Reclame Aqui</h1> 

<p align="center">
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.6&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=Ruby%20On%20Rails%20&message=5.2.4.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=TESTS&message=%3E100&color=GREEN&style=for-the-badge"/>
</p>

### Topics

:small_blue_diamond: [Project descriptions](#project-descriptions)

:small_blue_diamond: [Functionalities](#functionalities)

:small_blue_diamond: [Deploy da Aplicação](#deploy-da-aplicação-dash)

:small_blue_diamond: [Prerequisites](#prerequisites)

:small_blue_diamond: [How to run the application](#how-to-run-the-application-arrow_forward)

:small_blue_diamond: [How to run the tests](#how-to-run-the-tests)

:small_blue_diamond: [Endpoints](#endpoints)

:small_blue_diamond: [JSON](#json-floppy_disk)

:small_blue_diamond: [Gems added](#gems-added-gem)

## Project descriptions 

<p align="justify">
This service aims to receive complaints via API containing the following data: title, description, locale (geocode) and company.
</p>
<p align="justify">
In turn, it will process the geocode looking for the corresponding full address and saving it in the database.
</p>
<p align="justify">
Endpoints for querying, editing and deleting data will be available
</p>

## Functionalities

:heavy_check_mark: Receive complaint data via API

:heavy_check_mark: Search complaints through filters via API

:heavy_check_mark: Edit complaint data via API

:heavy_check_mark: Delete complaints via API

## Prerequisites

:warning: [Docker](https://www.docker.com/get-started)

## How to run the application :arrow_forward:

Clone the project: 
```
$ git clone https://github.com/thiagodsalles/reclame.git
```
In the root directory, build the docker-compose
```
$ docker-compose build
```
In the root directory, run docker-compose
```
$ docker-compose up
```  
In the root directory, run the command to create the database, migrations and seeds
```
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose run web rails db:seed
```

## How to run the tests

In the root directory, run Rspec
```
$ bundle exec rspec 
```

## Endpoints

Search for a list of complaints. Can be combined with some parameters:

    endpoint: /api/v1/complaints
    method: GET
    parameter: title, company, country, state, city, latitude, longitude, suburb

Search for a specific complaint by id:

    endpoint: /api/v1/complaints/:id
    method: GET

Create a complaint:

    endpoint: /api/v1/complaints
    method: POST
    body: [complaint]title :string
          [complaint]description :text
          [complaint]locale :array
          [complaint]company :string

Change complaint data:

    endpoint: /api/v1/complaints/:id
    method: PUT
    body: [complaint]title :string
          [complaint]description :text
          [complaint]company :string
          [complaint]country :string
          [complaint]state :string
          [complaint]city :string
          [complaint]latitude :integer
          [complaint]longitude :integer
          [complaint]suburb :string

Delete complaint:

    endpoint: /api/v1/complaints/:id
    method: DELETE

## JSON :floppy_disk:

### Complaints: 

|title|description|company|country|state|city|latitude|longitude|created_at|updated_at|suburb|
| -------- | -------- |-------- |-------- |-------- |-------- |-------- |-------- |-------- |-------- |-------- |
|My phone won't turn on|My phone gave a white screen and after that it does not start|Ponto Frio|Brazil|Rio de Janeiro|Rio de Janeiro|-22.9905557|-43.4627601|2020-08-16T21:56:31.070Z|2020-08-16T21:56:31.070Z|Vargem Pequena

## Gems added :gem:

- [geocoder](https://github.com/alexreisner/geocoder)
- [faker](https://github.com/faker-ruby/faker)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [rspec-rails](https://github.com/rspec/rspec-rails)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot)

## 
2020 - Backend Engineer Challenge - Reclame Aqui
