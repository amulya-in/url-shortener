# URL Shortener Service
#### Built on Rails
-------------
### Setup
```ruby
git clone this-repo
bundle install
# Update the port number to, on which your rails server will be running in config/environments/development.rb
..
BASE_URL = 'http://localhost:3000'
..
bundle exec rails db:migrate:seed
bundle exec rails s
```

### API USAGE
###### Uses http token authentication
```
# List of Urls
curl -H "Content-Type: application/json" -H "Authorization: Token token=your-api-key" http://localhost:3000/api/urls

# Shorten a URL
curl -H "Content-Type: application/json" -H "Authorization: Token token=your-api-key" POST -d '{"original":"http://tenderlovemaking.com/"}' http://localhost:3000/api/urls

# Destroy a shortened URL
curl -H "Authorization: Token token=your-api-key" DELETE http://localhost:3000/api/urls/:id
```

### Web Interface
- Devised intentionally not used for authentication 
- URLS can be shortened via web interface too


