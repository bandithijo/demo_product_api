class ProductConfirmationMailer < ApplicationMailer
  default from: 'no-reply@product.api'

  def product_confirmation_email(product)
    @user         = product.user
    @product_name = product.name
    @price        = product.price
    @category     = product.category
    @image        = product.image
    @state        = product.is_active

    mail(
      to: @user.email,
      subject: 'Kamu berhasil menambahkan produk baru!'
    )
  end
end
