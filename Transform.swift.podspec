Pod::Spec.new do |spec|
  spec.name = "Transform.swift"
  spec.version = "0.1.0"
  spec.summary = "A Swiftier way to transform UIViews"
  spec.homepage = "https://github.com/jhurray/Transform.swift"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.author = { "Jeff Hurray" => "jhurray@umich.edu" }
  spec.source = { :git => "https://github.com/jhurray/SQLiteModel.git", :tag => s.version.to_s }  
  spec.social_media_url = "http://twitter.com/JeffHurray"
  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source_files = "Transform.swift/*.{h,swift}"
end
