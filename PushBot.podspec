#
#  Be sure to run `pod spec lint PushBot.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "PushBot"
  s.version      = "1.0.0"
  s.summary      = "PushBot Framework"
  s.description  = <<-DESC
           PushBot Framework for handle push notification 
                   DESC

  s.homepage     = "https://github.com/sallyahmed/PushBot"
  s.license      = "MIT"
  s.author             = { "Sally Ahmed" => "sally.692@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/sallyahmed/PushBot.git", :tag => "#{s.version}" }
  s.source_files  = 'PushBot/Source','PushBot/Source/Core'
  s.swift_version = "4.2"
end
