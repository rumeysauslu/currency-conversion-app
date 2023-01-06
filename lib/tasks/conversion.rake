require 'uri'
require 'net/http'

namespace :conversion do
  desc 'set conversion rates'
  task set_rates: [:environment] do
    Conversion.all.each do |con|
      response = get_response(con.base_currency, con.target_currency)
      con.update(rate: response['info']['rate'])
    end
    ActionCable.server.broadcast('conversion_channel', Conversion.all)
  end

  def get_response(from, to)
    url = URI("https://api.apilayer.com/fixer/convert?to=#{to}&from=#{from}&amount=1")
    send_request(url)
  end

  def send_request(url)
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = "#{Setting.api_key}"

    response = https.request(request).read_body
    response_obj = JSON.parse(response)
  end
end
