require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of :message }

  it { expect(build(:post, message: Faker::Lorem.characters(141))).not_to be_valid }
end
