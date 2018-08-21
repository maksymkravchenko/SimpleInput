Pod::Spec.new do |s|

s.name         = "SimpleInput"
s.version      = "1.0.0"
s.summary      = "A simple framework for presenting and validating text inputю"
s.description  = "The simpleInput is a set of customizable text fields that can be used in any iOS app."
s.homepage     = "https://github.com/maksymkravchenko/SimpleInput.git"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.authors     = "maksymkravchenko", "vadymborovyk"
 
s.platform     = :ios, "10.0"

s.source       = { :git => "https://github.com/maksymkravchenko/SimpleInput.git", :tag => "1.0.0" }

s.source_files = "SimpleInput/SimpleInput"

s.swift_version = "4.1" 

s.dependency "Bond", "~> 6.8.3"

end
