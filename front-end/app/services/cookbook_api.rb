require 'faraday'
require 'faraday_middleware'

class CookbookApi
    class << self
        def endpoint
            Rails.configuration.cookbook_api[:base_url]
        end

        def api_version
            'v1'
        end

        def cookbook_url
            "#{endpoint}/api/#{api_version}"
        end

        def client
            @client ||= new_connection
        end

        private

        def new_connection
            Faraday.new(url: cookbook_url) do |faraday|
                faraday.use :instrumentation
                faraday.headers['Content-Type'] = 'aplication/json'

                faraday.response :json, parser_options: { simbolize_names: true },
                    content_type: /\bjson$/
                faraday.adapter :net_http
            end
        end
    end
end