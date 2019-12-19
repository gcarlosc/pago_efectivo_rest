# PagoEfectivoRest

Pago Efectivo REST client api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pago_efectivo_rest'
```

And then execute:

    $ bundle

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
