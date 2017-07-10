require 'rails_helper'

module API
  module V1
    class ResourcesController < API::V1::ApiController
    end
  end
end

class Resource < ApplicationRecord
  validates_presence_of :content
end

class ResourcePolicy < ApplicationPolicy
  def create?
    user
  end

  def permitted_attributes
    [:content]
  end
end

RSpec.describe API::V1::ResourcesController do
  before do
    Rails.application.routes.draw do
      namespace :api do
        namespace :v1 do
          resources :resources
        end
      end
    end

    m = ActiveRecord::Migration.new
    m.verbose = false
    m.create_table :resources do |t|
      t.string :content
      t.string :user_id
    end
  end

  after do
    Rails.application.reload_routes!

    m = ActiveRecord::Migration.new
    m.verbose = false
    m.drop_table :resources
  end

  let(:authenticated_header) do
    { 'Authorization' => "Bearer #{create(:user).api_token}" }
  end

  describe 'POST#create' do
    context 'when request is invalid returns status 422' do
      before { post '/api/v1/resources', headers: authenticated_header }

      it 'returns status 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end
end
