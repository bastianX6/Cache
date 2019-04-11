Pod::Spec.new do |s|
  s.name             = "Cache"
  s.summary          = "Nothing but cache."
  s.version          = "3.3.1"
  s.homepage         = "https://github.com/bastianX6/Cache"
  s.license          = 'MIT'
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = { :git => "https://github.com/bastianX6/Cache.git", :branch => "fix_tag" }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'

  s.requires_arc = true
  s.ios.source_files = 'Source/{iOS,Shared}/**/*'

  s.frameworks = 'Foundation'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
end
