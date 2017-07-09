RSpec.resource 'Ratings' do
  header 'Content-Type', 'application/json'
  let!(:post) { create(:post) }
  before { header 'Authorization', "Bearer #{User.find(post.user_id).api_token}" }
  response_field :id, 'rating ID', 'Type' => 'Integer'
  response_field :post_id, 'post ID', 'Type' => 'Integer'
  response_field :user_id, 'User ID', 'Type' => 'Integer'
  response_field :vote, 'Vote', 'Type' => 'Boolean'

  post '/api/v1/ratings' do
    parameter :post_id, 'Post ID'
    parameter :user_id, 'User ID'
    parameter :vote, 'Vote'

    let(:post_id) { post.id }
    let(:user_id) { post.user_id }
    let(:vote) { true }

    let(:raw_post) { params.to_json }

    example_request 'User votes for the message' do
      explanation 'Create the new vote'

      expect(status).to eq 201
      expect(JSON.parse(response_body)['post_id']).to eq(post.id)
      expect(JSON.parse(response_body)['user_id']).to eq(post.user_id)
      expect(JSON.parse(response_body)['vote']).to eq(true)
      expect(Rating.find_by_post_id(post_id).vote).to eq(true)
    end
  end
end
