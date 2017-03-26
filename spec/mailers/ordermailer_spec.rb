require "rails_helper"

RSpec.describe OrdermailerMailer, type: :mailer do
  describe "completed" do
    before do
      menu = FactoryGirl.create(:menu)
      category = FactoryGirl.create(:category, menu: menu)
      @item = FactoryGirl.create(:item, menu: menu, category: category)
      @user = FactoryGirl.create(:user, :admin)
      @user.orders.build.order_items << OrderItem.create(item: @item)
      @order = @user.orders.last
    end
    let(:mail) { OrdermailerMailer.completed(@user, @order.order_items) }

    it "renders the headers" do
      expect(mail.subject).to eq("From TacoChic: Your order is being prepared")
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("#{@item.name} | #{@item.price}")
    end
  end

end
