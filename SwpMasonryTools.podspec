
Pod::Spec.new do |s|

  s.name                  = "SwpMasonryTools"
  s.version               = "1.0.2"
  s.ios.deployment_target = '7.0'
  s.summary               = " Masonry 小工具  "
  s.homepage              = "https://github.com/swp-song/SwpMasonryTools"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpMasonryTools.git", :tag => s.version }
  s.source_files          = "SwpMasonryTools"
  s.requires_arc          = true
  s.framework             = "Foundation"
  s.dependency "Masonry"

end
