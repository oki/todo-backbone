module API
  module Helpers
    def clean_params(params)
      ActionController::Parameters.new(params)
    end
  end
end
