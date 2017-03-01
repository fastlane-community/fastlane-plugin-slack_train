module Fastlane
  module Actions
    module SharedValues
      SLACK_TRAIN_DISTANCE = :SLACK_TRAIN_DISTANCE
    end

    class SlackTrainStartAction < Action
      def self.run(params)
        # store the value somewhere
        lane_context[SharedValues::SLACK_TRAIN_DISTANCE] = params[:distance]
      end

      def self.description
        "Show a train of the fastlane progress"
      end

      def self.authors
        ["Felix Krause"]
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
