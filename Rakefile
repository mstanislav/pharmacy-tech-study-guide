$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'rubygems'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = "PTCB Study"
  app.version = "0.1"
  app.deployment_target = '6.0'
  app.identifier = "com.pardalislabs.ptcb"
  app.codesign_certificate = "iPhone Developer: Mark Stanislav (AP9EVYCGVJ)"
  app.provisioning_profile = "/Users/mstanislav/Library/MobileDevice/Provisioning\ Profiles/07D579D1-F44C-4B0A-9963-F563E8C663CF.mobileprovision"
  app.device_family = [:iphone]
  app.interface_orientations = [:portrait]
  app.detect_dependencies = false
end
