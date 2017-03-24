require "rails_helper"

RSpec.describe OrdermailerMailer, type: :mailer do
  describe "completed" do
    let(:mail) { OrdermailerMailer.completed }

    it "renders the headers" do
      expect(mail.subject).to eq("Completed")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
