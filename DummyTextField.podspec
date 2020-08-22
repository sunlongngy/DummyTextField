Pod::Spec.new do |spec|
  spec.name         = "DummyTextField"
  spec.version      = "1.0.0"
  spec.summary      = "A new custom textfield design with title on the top."
  spec.description  = <<-DESC
                    DummyTextField is a new custom textfield design with title on the top.
                   DESC
  spec.homepage     = "https://appcoda.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Sunlong" => "sunlongngy@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/tuynuyz/DummyTextField.git", :tag => "#{spec.version}" }
  spec.source_files = "DummyTextField/Source/*.{swift}"
  spec.swift_version = "5.0"
end
