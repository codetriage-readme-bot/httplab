require 'rails_helper'

RSpec.describe User, type: :model do
  context 'can not create user' do
    it 'without password' do
      is_expected.to validate_presence_of :password
    end

    it 'without password_confirmation' do
      expect(build(:user, password_confirmation: '')).not_to be_valid
    end

    it 'if password not match password_confirmation' do
      expect(build(:user, password: 'Not', password_confirmation: 'Match')).not_to be_valid
    end
  end

  it 'incorrect format' do
    expect(build(:user, email: 'not_format_email_string')).not_to be_valid
  end

  it 'middle rating without posts' do
    expect(create(:user).middle_rating).to eq(0)
  end
end
