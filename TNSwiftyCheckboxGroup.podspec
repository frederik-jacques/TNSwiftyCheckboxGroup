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
  s.version          = "1.0.1"
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
  s.screenshots     = "http://cl.ly/image/1g173h3B1n02/tnswiftycheckboxgroup.jpg"
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
