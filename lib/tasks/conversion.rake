require 'uri'
require 'net/http'

namespace :conversion do
  desc 'set conversion rates'
  task set_rates: [:environment] do

    Conversion.all.each do |con|
      from = con.base_currency
      to = con.target_currency
      amount = 1

      url = URI("https://api.apilayer.com/fixer/convert?to=#{to}&from=#{from}&amount=#{amount}")

      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request['apikey'] = 'UX7hwoAaztLUYYyoP3kRuKv6dAOIPRAZ'

      response = https.request(request).read_body
      response_obj = JSON.parse(response)
      
      con.update(rate: response_obj['info']['rate'])
    end
  end
end
