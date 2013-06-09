$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = "PTCB Study"
  app.version = "1.1"
  app.short_version = "1.1"
  app.deployment_target = '6.0'
  app.identifier = "com.pardalislabs.ptcbstudy"
  app.codesign_certificate = "iPhone Distribution: Pardalis Labs, LLC"
  app.provisioning_profile = "/Users/mstanislav/Library/MobileDevice/Provisioning\ Profiles/2BD04993-6DDF-4F63-B4F3-35AE4B135602.mobileprovision"
  #app.codesign_certificate = "iPhone Developer: Mark Stanislav (AP9EVYCGVJ)"
  #app.provisioning_profile = "/Users/mstanislav/Library/MobileDevice/Provisioning\ Profiles/D1767A1A-9500-42F1-8F3D-6A4B95CED3E0.mobileprovision"
  app.device_family = [:iphone]
  app.interface_orientations = [:portrait]
  app.icons = %w{Icon-20.png Icon-29.png Icon-57.png Icon-58.png Icon-114.png Icon-512.png Icon-1024.png}
  app.detect_dependencies = false
  app.info_plist['UILaunchImageFile'] = 'launch'
end
