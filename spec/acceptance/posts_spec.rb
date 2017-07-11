RSpec.resource 'Posts' do
  header 'Content-Type', 'application/json'
  let!(:user) { create(:user) }
  before { header 'Authorization', "Bearer #{user.api_token}" }
  response_field :id, 'post ID', 'Type' => 'Integer'
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
    parameter :message, 'Message'
    let(:message) { 'something' }
    let(:raw_post) { params.to_json }

    example_request 'Create post' do
      explanation 'Create the new post'

      expect(status).to eq 201
      expect(Post.find_by(user_id: user.id).message).to eq('something')
    end
  end
end
