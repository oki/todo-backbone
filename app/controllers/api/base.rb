module API
  class Dispatch < Grape::API
    helpers API::Helpers

    mount API::V1::Base
  end

  Base = Rack::Builder.new do
    use API::Logger
    run API::Dispatch
  end
end
