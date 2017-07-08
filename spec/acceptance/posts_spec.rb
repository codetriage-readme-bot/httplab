RSpec.resource 'Posts' do
  header 'Host', 'localhost:3000'
  header 'Content-Type', 'application/json'
  let!(:user) { create(:user) }
  before { header 'Authorization', "Bearer #{user.api_token}" }
  response_field :id, 'post ID', 'Type' => 'Integer'
  response_field :user_id, 'User ID', 'Type' => 'Integer'
  response_field :message, 'Some message', 'Type' => 'Text'

  get '/api/v1/posts' do
    before { create_list(:post, 2) }
    example_request 'All posts' do
      explanation 'List all existing messages'

      expect(status).to eq 200
      expect(JSON.parse(response_body).size).to eq(2)
    end
  end

  post '/api/v1/posts' do
    parameter :user_id, 'User ID'
    parameter :message, 'Message'

    let(:user_id) { user.id }
    let(:message) { 'something' }

    let(:raw_post) { params.to_json }

    example_request 'Create page' do
      explanation 'Create the new page'

      expect(status).to eq 201
      expect(JSON.parse(response_body)['user_id']).to eq(user.id)
      expect(Post.find_by_user_id(user.id).message).to eq('something')
    end
  end
end
