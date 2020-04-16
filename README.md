# Senro

[![Build Status](https://travis-ci.org/walkersumida/senro.svg?branch=master)](https://travis-ci.org/walkersumida/senro)
[![Gem Version](https://badge.fury.io/rb/senro.svg)](https://badge.fury.io/rb/senro)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'senro'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install senro

## Usage
### in Rails
#### format sort

```ruby
class ApplicationController < ActionController::Base # or ::API class
  include Senro::Controller
  before_action :query_params_formatter_sort
end


pp params['sort']
# => { id: 'asc', name: 'desc' }
pp params['original_sort']
# => 'id,-name'

# e.g. in ActiveRecord
@items = Item.all.order(params['sort'])

# e.g. in Mongoid
@items = Item.all.order_by(params['sort'])
```

#### format query

```ruby
class ApplicationController < ActionController::Base # or ::API class
  include Senro::Controller
  before_action :query_params_formatter_query
end


pp params['q']
# => { 'query' => 'senro gem', 'status' => { 'is' => ['open', 'close'] } }
pp params['original_q']
# => 'is:open is:close senro gem'

# e.g.
@items = Item.where(title: params['q']['query'], status: params['q']['status']['is'])
```

## Development

- Run `docker-compose up --build` to set up.
- Run `docker-compose run ruby bundle exec rake spec` to run the tests.
- You can also run `docker-compose run ruby bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/senro. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Senro project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/senro/blob/master/CODE_OF_CONDUCT.md).
