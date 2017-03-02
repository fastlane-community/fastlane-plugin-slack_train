module Fastlane
  module Actions
    class SlackTrainAction < Action
      def self.run(params)
        train_emoji = lane_context[SharedValues::SLACK_TRAIN_EMOJI]
        rail_emoji = lane_context[SharedValues::SLACK_TRAIN_RAIL]
        total_distance = lane_context[SharedValues::SLACK_TRAIN_DISTANCE]
        current_position = lane_context[SharedValues::SLACK_TRAIN_CURRENT_TRAIN_POSITION]
        speed = lane_context[SharedValues::SLACK_TRAIN_DIRECTION]

        before = rail_emoji * current_position
        after = rail_emoji * (total_distance - current_position - 1)

        message = [before, train_emoji, after].join("")
        other_action.slack(message: message)
        UI.message(message)

        lane_context[SharedValues::SLACK_TRAIN_CURRENT_TRAIN_POSITION] += speed
      end

      def self.description
        "Show a train of the fastlane progress"
      end

      def self.authors
        ["@KrauseFx"]
      end

      def self.return_value
        "A string that is being sent to slack"
      end

      def self.available_options
        []
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
