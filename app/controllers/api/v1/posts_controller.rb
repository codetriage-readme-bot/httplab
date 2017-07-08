module API
  module V1
    class PostsController < API::V1::ApiController
      def index
        authorize(resource_model)
        resources = policy_scope(resource_model)
        render json: resources
      end
    end
  end
end
