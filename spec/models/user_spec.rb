require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it 'able to create new user' do
    user.save
    expect(User.count).to eq(1)
    expect(User.last.name).to eq(user.name)
    expect(User.last.email).to eq(user.email)
  end
end
