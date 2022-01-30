class ActivateProductJob < ApplicationJob
  queue_as :default

  def perform(product)
    product.activate!
  end
end
