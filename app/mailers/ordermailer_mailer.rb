class OrdermailerMailer < ApplicationMailer
  add_template_helper(MailHelper)
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ordermailer_mailer.completed.subject
  #
  def completed(user=User.first, order=User.first.orders.last.order_items)
    @user_email = user.email
    @order = order
    @ready_time = DateTime.now + 20.minutes
    mail to: @user_email, subject: "From TacoChic: Your order is being prepared"
  end
end
