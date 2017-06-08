Pod::Spec.new do |s|

  s.name         = "Colorizer"
  s.version      = "0.1.2"
  s.summary      = " Swift tool to generate Apple's Color Palette file"

  s.description  = <<-DESC
                   A Swift tool to generate Apple's Color Palette file (.clr file) from .txt file.
                   DESC

  s.homepage     = "https://github.com/arturjaworski/Colorizer"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Artur Jaworski" => "kontakt@arturjaworski.pl" }

  s.source       = { :http => "https://github.com/arturjaworski/Colorizer/releases/download/#{s.version}/colorizer-#{s.version}.zip" }
  s.preserve_paths = '*'

end
