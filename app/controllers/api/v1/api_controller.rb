module API
  module V1
    class ApiController < ApplicationController
      include Knock::Authenticable
      protect_from_forgery with: :null_session

      before_action :destroy_session
      before_action :authenticate_user

      def destroy_session
        request.session_options[:skip] = true
      end

      def create
        save_attributes_with_status(resource_model.new, :created)
      end

      private

      def resource_model
        request.path.split('/')[3].classify.constantize
      end

      def resource_params(resource)
        params.permit(policy(resource).permitted_attributes)
      end

      def save_attributes_with_status(resource, status)
        resource.user_id = current_user.id
        resource.assign_attributes(resource_params(resource))
        authorize(resource)

        if resource.save
          render json: resource, status: status
        else
          render json: resource.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
