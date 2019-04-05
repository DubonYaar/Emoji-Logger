Pod::Spec.new do |spec|
    spec.name             = 'Logger'
    spec.version          = '0.0.1'
    spec.license          = { :type => 'BSD' }
    spec.homepage         = 'https://github.com/alongenosar/Logger'
    spec.authors          = { 'Alon Genosar' => 'alon@gmail.com' }
    spec.summary          = 'A Light weight Swift Logger with severity levels and Emojis'
    spec.source           = { :git => 'https://github.com/alongenosar/Logger', :tag => '0.0.1' }
    spec.source_files     = 'Logger.swift'
  end