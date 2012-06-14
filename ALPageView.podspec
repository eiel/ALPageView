Pod::Spec.new do |s|
  s.name     = 'ALPageView'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'ALPageView is view which can swipe.'
  s.homepage = 'https://github.com/eiel/ALPageView'
  s.author   = { 'Tomohiko Himura' => 'eiel.hal@gmail.com' }
  s.source   = { :git => 'https://github.com/eiel/ALPageView.git', :tag => 'v0.0.1' }

  s.description = 'ALPageView is view which can swipe. ALPageView use UIViewControll and UIPageControl'
  s.platform = :ios

  s.source_files = 'ALPageView'
  s.clean_paths = 'ALPageViewDemo', 'ALPageViewDemoTests'

  s.requires_arc = true
end
