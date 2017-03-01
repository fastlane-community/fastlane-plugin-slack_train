module Fastlane
  module Helper
    class SlackTrainHelper
      # class methods that you define here become available in your action
      # as `Helper::SlackTrainHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the slack_train plugin helper!")
      end
    end
  end
end
