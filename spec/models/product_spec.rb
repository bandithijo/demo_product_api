require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.create(:product) }

  context 'create new product' do
    it 'able to create new product' do
      product.save
      expect(Product.all.count).to eq(1)
    end

    it 'able to create new product with association with user' do
      product.save
      expect(product.user).to eq(User.find(product.user_id))
    end

    it 'able to use activate! method' do
      product.activate!
      expect(product.is_active).to eq(true)
    end
  end
end
