require "rails_helper"

RSpec.describe ProductConfirmationMailer, type: :mailer do
  let(:product) { FactoryBot.create(:product) }
  let(:mail) { ProductConfirmationMailer.product_confirmation_email(product) }

  context 'after is_active true' do
    before :each do
      product.activate!
    end

    it 'renders mail subject' do
      expect(mail.subject).to eq('Kamu berhasil menambahkan produk baru!')
    end

    it 'renders mail receiver' do
      expect(mail.to).to eq([product.user.email])
    end

    it 'renders mail sender' do
      expect(mail.from).to eq(['no-reply@product.api'])
    end
  end
end
