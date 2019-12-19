# require "pago_efectivo_rest/version"
require 'rest-client'

module PagoEfectivoRest
  class Client
    def initialize api_server:, code_service:, access_key:, secret_key:
      @api_server = api_server
      @code_service = code_service
      @access_key = access_key
      @secret_key = secret_key
    end

    def generate_auth_token
      date = Time.zone.now.strftime('%FT%T%:z')
      parameter = [@code_service.to_s, @access_key, @secret_key, date].join('.')
      param_hash = Digest::SHA256.hexdigest parameter
      params = {
                 "accessKey": @access_key,
                 "idService": @code_service,
                 "dateRequest": date,
                 "hashString": param_hash
               }

      response = RestClient.post "#{@api_server}/v1/authorizations", params.to_json, { content_type: :json, accept: :json }

      puts JSON.parse(response.body, symbolize_names: true)
      JSON.parse(response.body, symbolize_names: true)
    rescue => e
      puts JSON.parse(e.response, symbolize_names: true)
      JSON.parse(e.response, symbolize_names: true)
    end

    def generate_cip token:, currency:, amount:, transaction:, admin_email: nil, expire_at:, concept: nil, aditional_data: nil, client_email:, user_id: nil, fname: nil, lname: nil, phone: nil, phone_code: nil

      params = {
        "currency": currency, # PEN / USD
        "amount": amount, # separado por punto
        "transactionCode": transaction, # código unico de transacción
        "adminEmail": admin_email, # envio de copia / Optional
        "dateExpiry": expire_at, # format yyyy-mm-ddThh:mm:ss(+/-)zzzz
        "paymentConcept": concept, # concepto de pago / Optional
        "additionalData": aditional_data, # / Optional
        "userEmail": client_email, # email del usuario
        "userId": user_id, # / Optional
        "userName": fname, # / Optional
        "userLastName": lname, # / Optional
        "userPhone": phone,
        "userCodeCountry": phone_code, # +51
        "serviceId": @code_service
      }
      puts '----- params send -----'
      puts params

      response = RestClient.post "#{@api_server}/v1/cips", params.to_json, { content_type: :json, accept: :json, 'Authorization': "Bearer #{token}", 'Origin': 'web', 'Accept-Language': 'es-PE' }

      puts '----- data received -----'
      puts JSON.parse(response.body, symbolize_names: true)
      JSON.parse(response.body, symbolize_names: true)
    rescue => e
      puts '----- errors -----'
      puts JSON.parse(e.response, symbolize_names: true)
      JSON.parse(e.response, symbolize_names: true)
    end
  end
end
