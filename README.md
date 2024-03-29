[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<br />
<p align="center">
  <a href="git@github.com:IBUNHABIBU/TZ-social-events-booking.git">
    <p align="center">
      <img src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/rails/rails.png" alt="rails" width="100" height="100">
  </a>

  <h2 align="center"> TZ-CAR RENTAL RAILS API FINAL CAPSTONE PROJECT</h2>
  <h3 align="center"> This is the rails API to build a car booking</h3>

  <p align="center">
    <a href="https://github.com/IBUNHABIBU/TZ-social-events-booking/issues">Report Bug</a>
    <a href="https://github.com/IBUNHABIBU/TZ-social-events-booking/issues">Request Feature</a>
  </p>
</p>


## Table of Contents

* [About the Project](#about-the-project)
* [Built With](#built-with)
* [Features](#features)
* [Requirements](#requirements)
* [Useful Commands](#useful-commands)
* [Live Link](#Live-link)
* [Contact](#Authors)
* [Acknowledgements](#Acknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project
#### Capstone project

Capstone projects are solo projects at the end of each of the Microverse Main Technical Curriculum sections. Building this project is very important because:

- It's a real-world-like project, built with business specifications that will look nice in my portfolio; and
- Get feedback about the achievement of technical and soft skills gained during this section of the program.

### Project specifications

This is Rails final capstone project is based on an app to book a Car. I have built a REST API using Ruby on rails as a backend where the front end will be the react-redux. 

### Features
- User authentication
- Create Car and appointment
- Display all cars and appointments

### Api end points

| Endpoint | Description |
|---------|-------------|
| `https://atown-rentals.onrender.com/` | baseUrl |
| `baseUrl/users` | users resource |
| `baseUrl/logout` | logout |
| `baseUrl/logged_in` | login |
| `baseUrl/api/v1/cars` | cars resource |
| `baseUrl/api/v1/bookings` | bookings resource |

<h3 align="center"> Entity Relationship Diagram (ERD) </h3>

![screenshot](https://github.com/IBUNHABIBU/car-rent-booking-api/blob/main/app/assets/ERD.png)

<!-- BUILD WITH -->
## Built With

This project was built using these technologies.
* Ruby on Rails


### Requirements
* Ruby
* Ruby on Rails


### How to Install 

To run this locally, clone the repository, navigate to its containing directory.

#### Follow these commands step by step:-

`
 git@github.com:IBUNHABIBU/car-rent-booking.git
`

`
cd car-rent-booking
`

 `$bundle install --without production`

 `$sudo service postgresql start`
 
 `$rails db:setup`

 `$rails db:migrate`
 
 `$rails server`
 
Enjoy playing it.

## Live link

[Live Demo ](https://car.darlive.cyou/api/v1/cars) of the project

### Testing

Navigate to the project folder make sure Rspec is installed and then run the following command

 `$rspec -f d `

  ### Test coverage
  ![screenshot](https://github.com/IBUNHABIBU/car-rent-booking-api/blob/dev/app/assets/cartest.PNG)

## Useful Commands

| Command | Description |
|---------|-------------|
| `bundle install` | Install project dependencies |
| `sudo service postgresql start` | Starting the database |
| `rails db:migrate` | Database migration |
| `rails server` | start the server |
| `rubocop -a` | Fix all the lint errors automatically |
| `bundle exec rspec` | Run rspec tests |
| `EDITOR='code --wait' rails credentials:edit` | Edit credentials |
| `bundle exec rspec -f d` | run test |
| `cap production deploy` | Deploy the application to production |

<!-- ### How to play -->

## DB migration in production
`rails db:drop db:create db:migrate`

`rails db:seed`

`rails assets:precompile`
`rails tmp:clear`


### Challenges
1. 

![screenshot](https://github.com/IBUNHABIBU/car-rent-booking-api/blob/dev/app/assets/Errors.PNG)
      solution

      bundle config --delete bin

      bundle install --binstubs
<!-- CONTACT -->

2. Upload image in local was working but not in production

it causes the error undefined cars for nil class

Solution
I removed the association btn user model and car model
so instead of @car = current_user.cars.build(car_params)  I used @car = Car.new(car_params)

3. Another cause of blocked by cors

setting enviroment variables in heroku I used heroku config:set RAILS_MASTER_KEY = 'cat config/master.key' insead of using the backticks ``



to obtain letsencrypt certificate I used the command

`sudo certbot --nginx -d subdomain.darlive.cyou`

i.e 
```bash
sudo certbot --nginx -d car.darlive.cyou
```

to see nginx logs 

`sudo tail -f /var/log/nginx/error.log`   then type shift + G to go down to the very bottom of the error logs

to see the logs of the app

`sudo tail -f /var/log/syslog`

to see production logs in Linux

`sudo tail -f /var/log/nginx/access.log`

to view rails log

`sudo tail -f /var/log/syslog | grep rails less /home/deployer/carlinode/current/log/production.log`


## Authors

👤 **Salum Habibu** 
    
* Github: [IBUNHABIBU](https://github.com/IBUNHABIBU)
* Twitter: [@ibunhabibu](https://twitter.com/Ibunhabibu)
* LinkedIn: [Salum Habibu Kombo](https://www.linkedin.com/in/salum-habibu/)

## Show your support

Give a :star: if you like this project!


## Acknowledgements
Credits go to 
- [Mr Eric Mbouwe](https://github.com/EricMbouwe), [Emmanuel Kamala](https://github.com/emmanuelkamala) and [Marcelo Araújo](https://github.com/marcelomaidden)(Microverse students) for their help to resolve the bugs.
- All my standup team for their help.
- All TSE who reviewed my project.
- All those helped me to resolve bugs.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/IBUNHABIBU/TZ-social-events-booking.svg?style=flat-square
[contributors-url]: https://github.com/IBUNHABIBU/TZ-social-events-booking/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/IBUNHABIBU/TZ-social-events-booking.svg?style=flat-square
[forks-url]: https://github.com/IBUNHABIBU/TZ-social-events-booking/network/members
[stars-shield]: https://img.shields.io/github/stars/IBUNHABIBU/TZ-social-events-booking.svg?style=flat-square
[stars-url]: https://github.com/IBUNHABIBU/TZ-social-events-booking/stargazers
[issues-shield]: https://img.shields.io/github/issues/IBUNHABIBU/TZ-social-events-booking.svg?style=flat-square
[issues-url]: https://github.com/IBUNHABIBU/TZ-social-events-booking/issues

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
Why this garbage
