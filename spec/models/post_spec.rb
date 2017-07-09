require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of :message }

  it { expect(build(:post, message: Faker::Lorem.characters(141))).not_to be_valid }

  it 'increment posts_count' do
    post = create(:post)

    expect(User.find(post.user.id).posts_count).to eq(1)
  end
end
