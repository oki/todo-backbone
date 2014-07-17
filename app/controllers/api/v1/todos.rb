module API
  module V1

    module Entities
      class Task < Grape::Entity
        expose :id
        expose :title, documentation: { type: "String", desc: "Task name", required: true }
        expose :completed, documentation: { type: "Boolean", desc: "Task completed?", required: true }
      end
    end

    class Todos < Grape::API
      include API::V1::Defaults

      resource :todos do
        desc "Return list of todo"
        get do
          present Task.all, with: Entities::Task
        end

        desc 'Create a task', params: Entities::Task.documentation
        put ':id' do
          task = Task.find(params[:id])

          task_params = clean_params(params).permit(*Entities::Task.documentation.keys)
          task.update!(task_params)

          present task, with: Entities::Task
        end

        desc 'Update a task', params: Entities::Task.documentation
        post do
          task_params = clean_params(params).permit(*Entities::Task.documentation.keys)
          task = Task.create!(task_params)
          present task, with: Entities::Task
        end

        desc "Delete a task"
        delete ':id' do
          Task.find(params[:id]).destroy
          nil
        end

      end
    end
  end
end
