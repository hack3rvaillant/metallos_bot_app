RSpec.describe TelegramWebhooksController, telegram_bot: :rails do
  xdescribe "#start!" do
    subject { -> { dispatch_command :start } }
    it { should respond_with_message(/Bienvenue au Bureau des Méthodes/) }

    context "when there is a current protocol" do
      it { should respond_with_message(/Un protocole est actuellement en cours/) }
    end
    context "when there is no current protocol" do
    end
  end

  describe "#message" do
    subject { -> { dispatch_message text } }
    let(:text) { "some plain text" }
    it { should respond_with_message "You wrote: #{text}" }
  end

  context "for unsupported command" do
    subject { -> { dispatch_command :makeMeGreatBot } }
    it { should respond_with_message "Can not perform makeMeGreatBot" }
  end

  context "for unsupported feature" do
    subject { -> { dispatch time_travel: {back_to: :the_future} } }
    it "does nothing" do
      subject.call
      expect(response).to be_ok
    end
  end
end
