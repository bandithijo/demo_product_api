require 'rails_helper'

RSpec.describe '/products', type: :request do
  let(:user) { FactoryBot.create(:user) }

  let(:product) { FactoryBot.build(:product) }

  describe 'GET /index' do
    it 'renders a successful response' do
      product.save
      get products_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product.save
      get product_url(product), as: :json
      expect(response).to be_successful
      expect(product).to eq(Product.last)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Product' do
        post products_url, params: {
          product: {
            name: Faker::Commerce.product_name,
            price: Faker::Commerce.price.to_i,
            category: Faker::Commerce.department(max: 1),
            image: nil,
            user_id: user.id
          },
          as: :json
        }
        expect(response).to have_http_status(:created)
        expect(Product.count).to eq(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Product' do
        post products_url, params: {
          product: {
            name: Faker::Commerce.product_name,
            price: Faker::Commerce.price.to_i,
            category: Faker::Commerce.department(max: 1),
            image: nil,
            user_id: nil
          },
          as: :json
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(Product.count).not_to eq(1)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested product' do
        product.save
        new_price = Faker::Commerce.price.to_i
        patch product_url(product), params: {
          product: {
            price: new_price
          },
          as: :json
        }
        expect(response).to have_http_status(:ok)
        expect(Product.find(product.id).price).to eq(new_price)
      end
    end

    context 'with invalid parameters' do
      it 'renders a JOSN response with errors for the product' do
        product.save
        new_user = nil
        patch product_url(product), params: {
          product: {
            user_id: new_user
          },
          as: :json
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested product' do
      product.save
      delete product_url(product), as: :json
      expect(Product.count).to eq(0)
    end
  end
end
