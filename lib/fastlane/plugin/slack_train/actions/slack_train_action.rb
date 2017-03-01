module Fastlane
  module Actions
    class SlackTrainAction < Action
      def self.run(params)
        train_emoji = params[:train]
        total_distance = lane_context[SharedValues::SLACK_TRAIN_DISTANCE]

        before = "=" * (total_distance - 1)

        message = "#{before}#{train_emoji}"
        other_action.slack(message: message)
      end

      def self.description
        "Show a train of the fastlane progress"
      end

      def self.authors
        ["Felix Krause"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Nope"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :train,
                                  env_name: "SLACK_TRAIN_TRAIN",
                               description: "Train emoji",
                             default_value: "🚝",
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
