# INWX::Domrobot

You can access all functions of our frontend via an application programming interface (API). Our API is based on the XML-RPC protocol and thus can be easily addressed by almost all programming languages. The documentation and programming examples in PHP, Java, Ruby and Python can be downloaded here.

There is also an OT&E test system, which you can access via ote.inwx.com. Here you will find the known web interface which is using a test database. On the OTE system no actions will be charged. So you can test how to register domains etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inwx-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inwx-rb


## Documentation

You can view a detailed description of the API functions in our documentation. The documentation as PDF ist part of the Projekt. You also can read the documentation online http://www.inwx.de/en/help/apidoc

## Usage

```ruby
require "inwx/domrobot"
require "yaml"

addr = "api.ote.domrobot.com"
# addr = "api.domrobot.com"
user = "your_username"
pass = "your_password"

domrobot = INWX::Domrobot.new(addr)

result = domrobot.login(user,pass)
puts YAML::dump(result)

object = "domain"
method = "check"

params = { :domain => "mydomain.com" }

result = domrobot.call(object, method, params)

puts YAML::dump(result)
```

You can also look at the example.rb in the Project.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/steigr/inwx-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

MIT