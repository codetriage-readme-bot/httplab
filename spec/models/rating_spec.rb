require 'rails_helper'

RSpec.describe Rating, type: :model do
  let!(:post) { create(:post) }
  let(:params) { { user_id: post.user.id, post_id: post.id, vote: true } }

  it 'increment vote_rating' do
    Rating.create!(params)

    expect(User.find(post.user.id).vote_rating).to eq(1)
  end

  it 'Throw error if User already voted specific post message' do
    Rating.create!(params)

    expect{ Rating.create!(params) }.to raise_error('Record Already Exists')
  end
end
