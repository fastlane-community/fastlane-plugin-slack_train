module Fastlane
  module Actions
    class SlackTrainCrashAction < Action
      def self.run(params)
        total_distance = lane_context[SharedValues::SLACK_TRAIN_DISTANCE]
        return if total_distance.nil? # train hasn't started yet

        message = "💥" * total_distance
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
