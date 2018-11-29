module Request
  module JsonHelpers
    def json_response
      #@json_response ||= JSON.parse(response.body, symbolize_names: true)
      JSON.parse(response.body)
    end
  end
end

RSpec.configure do |config|
  config.include Request::JsonHelpers, type: :request
end