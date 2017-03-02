module Fastlane
  module Actions
    module SharedValues
      SLACK_TRAIN_DISTANCE = :SLACK_TRAIN_DISTANCE
    end

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

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :distance,
                                  env_name: "SLACK_TRAIN_DISTANCE",
                               description: "How many rails do we need?",
                             default_value: 5,
                                      type: Integer)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
