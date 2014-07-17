module API
  module V1
    class Todos < Grape::API
      include API::V1::Defaults

      resource :todos do
        desc "Return list of todo"
        get do
          [
            { id: 1, title: "Test job", completed: false },
            { id: 2, title: "Test job2", completed: false }
          ]
          # '[{"id": 1, "title":"Test job","completed":false}]'
          # Hussar.all # obviously you never want to call #all here
        end
      end
    end
  end
end
