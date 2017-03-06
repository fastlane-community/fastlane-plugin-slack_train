# slack_train plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-slack_train)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-slack_train`, add it to your project by running:

```bash
fastlane add_plugin slack_train
```

## About slack_train

Idea from [Paul Taykalo](https://twitter.com/TT_Kilew/status/766651907117023233)

Show a train of the fastlane progress

Train | Rocket | Crash
------|--------|-------
![assets/train.png](assets/train.png) | ![assets/rocket.png](assets/rocket.png) | ![assets/crash.png](assets/crash.png)

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

```ruby
lane :beta do
  slack_train_start(distance: 4)
  slack_train

  cocoapods
  slack_train

  gym
  slack_train

  crashlytics
  slack_train
end
```

Or use a rocket emoji:

```ruby
lane :beta do
  slack_train_start(distance: 4,
                       train: "🚀", 
           reverse_direction: true, 
                        rail: "✨")
  slack_train

  cocoapods
  slack_train

  gym
  slack_train

  crashlytics
  slack_train
end
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
