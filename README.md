# URL Shortener

**Please note that I have used Rails' system test using RSpec.**
**You can find that spec in spec folder i.e., spec/system/url_shortener_spec.rb**

## Setup

- docker-compose build
- docker-compose up
- docker-compose run app rake db:create
- docker-compose run app rake db:migrate

## Run specs

- docker-compose run app rspec spec/system/url_shortener_spec.rb
