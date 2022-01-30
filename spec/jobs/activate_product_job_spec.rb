require 'rails_helper'

RSpec.describe ActivateProductJob, type: :job do
  let(:product) { FactoryBot.create(:product) }

  it 'queues the job' do
    product.save
    expect do
      ActivateProductJob.perform_later
    end.to have_enqueued_job
  end
end
