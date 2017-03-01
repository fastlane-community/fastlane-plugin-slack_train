describe Fastlane::Actions::SlackTrainAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The slack_train plugin is working!")

      Fastlane::Actions::SlackTrainAction.run(nil)
    end
  end
end
