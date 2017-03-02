module Fastlane
  module Actions
    class SlackTrainCrashAction < Action
      def self.run(params)
        message = "💥" * lane_context[SharedValues::SLACK_TRAIN_DISTANCE]
        other_action.slack(message: message)
      end

      def self.description
        ""
      end

      def self.authors
        ["@KrauseFx"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
