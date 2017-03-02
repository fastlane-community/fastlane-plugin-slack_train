module Fastlane
  module Actions
    module SharedValues
      SLACK_TRAIN_DISTANCE = :SLACK_TRAIN_DISTANCE
      SLACK_TRAIN_EMOJI = :SLACK_TRAIN_EMOJI
      SLACK_TRAIN_RAIL = :SLACK_TRAIN_RAIL
      SLACK_TRAIN_CURRENT_TRAIN_POSITION = :SLACK_TRAIN_CURRENT_TRAIN_POSITION
      SLACK_TRAIN_DIRECTION = :SLACK_TRAIN_DIRECTION
    end

    class SlackTrainStartAction < Action
      def self.run(params)
        lane_context[SharedValues::SLACK_TRAIN_DISTANCE] = params[:distance]
        lane_context[SharedValues::SLACK_TRAIN_EMOJI] = params[:train]
        lane_context[SharedValues::SLACK_TRAIN_RAIL] = params[:rail]
        lane_context[SharedValues::SLACK_TRAIN_DIRECTION] = params[:reverse_direction] ? 1 : -1
        lane_context[SharedValues::SLACK_TRAIN_CURRENT_TRAIN_POSITION] = params[:reverse_direction] ? 0 : (params[:distance] - 1)
      end

      def self.description
        "Show a train of the fastlane progress"
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
                                      type: Integer),
          FastlaneCore::ConfigItem.new(key: :train,
                                  env_name: "SLACK_TRAIN_TRAIN",
                               description: "Train emoji",
                             default_value: "🚝",
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :rail,
                                  env_name: "SLACK_TRAIN_RAIL",
                               description: "Character or emoji for the rail",
                             default_value: "=",
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :reverse_direction,
                                  env_name: "SLACK_TRAIN_REVERSE_DIRECTION",
                               description: "Pass true if you want the train to go from left to right",
                             default_value: false,
                                 is_string: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
