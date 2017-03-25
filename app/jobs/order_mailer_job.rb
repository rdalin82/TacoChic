class OrderMailerJob < ApplicationJob
  queue_as :default

  def perform(current_user, last_order)
    OrdermailerMailer.completed(current_user, last_order).deliver_now
  end
end
