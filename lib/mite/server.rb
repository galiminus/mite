module Mite
  class Server
    attr_accessor :application

    def initialize(config:)
      builder = %{
        Rack::Builder.new do
          #{File.read(config)}
        end
      }
      @application = eval(builder, nil, config)
    end

    def process(request)
      application.call(request.merge("rack.errors" => $stderr, "rack.version" => Rack::VERSION))
    end
  end
end
