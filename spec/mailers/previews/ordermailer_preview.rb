# Preview all emails at http://localhost:3000/rails/mailers/ordermailer
class OrdermailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ordermailer/completed
  def completed
    OrdermailerMailer.completed
  end

end
