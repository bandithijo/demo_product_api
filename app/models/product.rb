class Product < ApplicationRecord
  belongs_to :user

  validates :name, :price, :category, :user, presence: true

  after_create :activate_product_job

  def activate_product_job
    ActivateProductJob.set(wait: 3.minutes).perform_later(self)
    puts "-- ACTIVATED job for Product name: #{name}. Successful!" unless Rails.env.test?
  end

  def activate!
    return if is_active?

    self.is_active = true
    save
    puts "-- COMPLETED job for Product name: #{name}. Successful!" unless Rails.env.test?
  end
end
