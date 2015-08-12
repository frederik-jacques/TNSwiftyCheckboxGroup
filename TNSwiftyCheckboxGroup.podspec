#
# Be sure to run `pod lib lint TNSwiftyCheckboxGroup.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TNSwiftyCheckboxGroup"
  s.version          = "0.1.0"
  s.summary          = "A Swift component to create checkbox groups based on UICollectionView."
  s.description      = <<-DESC
                       With this component you can create checkbox groups with various styles, like

                       * Square checkboxes
                       * Circular checkboxes
                       * Image checkboxes
                       * Custom checkboxes

                       Works in landscape and portrait.
                       DESC
  s.homepage         = "https://github.com/frederik-jacques/TNSwiftyCheckboxGroup.git"
  s.screenshots     = "http://cl.ly/image/0I2O1m2l2i3c/square-checkboxes.png", "http://cl.ly/image/051f1K061m1j/circular-checkboxes.png", "http://cl.ly/image/3R2F0W0N431K/image-checkboxes.png"
  s.license          = 'MIT'
  s.author           = { "Frederik Jacques" => "frederik@the-nerd.be" }
  s.source           = { :git => "https://github.com/frederik-jacques/TNSwiftyCheckboxGroup.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thenerd_be'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TNSwiftyCheckboxGroup' => [
        'Pod/Assets/*.png',
        'Pod/**/*.xib'
    ]
  }

end
