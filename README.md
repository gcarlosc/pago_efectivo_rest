# PagoEfectivoRest

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/pago_efectivo_rest`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pago_efectivo_rest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pago_efectivo_rest

## Usage
To use this gem you need a service code and keys provided by pago efectivo.

```ruby
require 'pago_efectivo_rest'

pago_efectivo = PagoEfectivoRest::Client.new api_server:, code_service:, access_key:, secret_key:
```

Generate auth token

```ruby
auth_token = pago_efectivo.generate_auth_token
```

Generate CIP

```ruby
pago_efectivo.generate_cip token: auth_token, currency: 'PEN', amount: '10.50', transaction: 'COD0001', expire_at: '2019-12-24T23:59:59-0500', client_email: 'client@email.com', admin_email: 'admin@email.com', phone: '977123456', phone_code: '+51'
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
