Pod::Spec.new do |spec|
  spec.name = "Transform.swift"
  spec.version = "0.1.1"
  spec.summary = "A Swiftier way to transform UIView and its subclasses."
  spec.homepage = "https://github.com/jhurray/Transform.swift"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.author = { "Jeff Hurray" => "jhurray@umich.edu" }
  spec.source = { :git => "https://github.com/jhurray/SQLiteModel.git", :tag => spec.version }  
  spec.social_media_url = "http://twitter.com/JeffHurray"
  spec.requires_arc = true
  spec.source_files = "Transform.swift/*.{h,swift}"
  spec.ios.deployment_target = '8.0'
  spec.tvos.deployment_target = '9.0'
end
