class Product < ApplicationRecord
  belongs_to :user

  validates :name, :price, :category, :user, presence: true

  after_create :activate_product_job

  def activate_product_job
    ActivateProductJob.set(wait: 3.minutes).perform_later(self)
  end

  def activate!
    return if is_active?

    self.is_active = true
    save
    product_confirmation
  end

  private

  def product_confirmation
    ProductConfirmationMailer.with(
      user:     user,
      name:     name,
      price:    price,
      category: category,
      image:    image,
      is_state: is_active
    ).product_confirmation_email(self).deliver_now
  end
end
