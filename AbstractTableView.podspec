Pod::Spec.new do |spec|

  spec.name         = "AbstractTableView"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift."

  spec.description  = <<-DESC
AbstrcatTableView will help you to use table view easily and with minimal code. The best way to inherit it if you want to make customisations.
                   DESC

  spec.homepage     = "https://github.com/lakhvirk/AbstractTableView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Lakhwinder Singh" => "lakhwinder.virk4@gmail.com" }
  
  spec.platform     = :ios
  spec.ios.deployment_target = "11.4"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/lakhvirk/AbstractTableView.git", :tag => "#{spec.version}" }
  spec.source_files  = "AbstractTableView/**/*.{h,m,swift}" 

end
