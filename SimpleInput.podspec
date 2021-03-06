Pod::Spec.new do |s|

s.name         = "SimpleInput"
s.version      = "0.0.1"
s.summary      = "A simple framework for presenting and validating text input."
s.description  = "The simpleInput is a set of customizable text fields that can be used in any iOS app."
s.homepage     = "https://github.com/maksymkravchenko/SimpleInput.git"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.authors     = "maksymkravchenko", "vadymborovyk"
 
s.platform     = :ios, "10.0"

s.source       = { :git => "https://github.com/maksymkravchenko/SimpleInput.git", :tag => "0.0.1" }

s.source_files = "SimpleInput", "SimpleInput/**/*.{h,m,swift}"

s.swift_version = "4.1" 

s.dependency "Bond", "~> 6.8.3"

end
