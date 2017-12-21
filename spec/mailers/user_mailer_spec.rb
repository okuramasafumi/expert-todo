require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "registration_confirmation" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.registration_confirmation(user.id) }

    it "renders the headers" do
      expect(mail.subject).to eq('Yaftへようこそ！')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['yaft@okuramasafumi.com'])
    end

    it "renders the body" do
      expect(mail.part[0].body.to_s).to match('ようこそ、Yaftへ。')
      expect(mail.part[1].body.to_s).to match('ようこそ、Yaftへ。')
    end
  end
end
