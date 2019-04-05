Pod::Spec.new do |spec|
    spec.platform         = :ios, "9.0"
    spec.swift_version    = '4.0'
    spec.name             = 'Logger'
    spec.version          = '0.0.2'
    spec.license          = { :type => 'Apache License, Version 2.0',:file => 'LICENSE'}
    spec.homepage         = 'https://github.com/alongenosar/Logger'
    spec.authors          = { 'Alon Genosar' => 'alon@gmail.com' }
    spec.summary          = 'A Light weight Swift Logger with severity levels and Emojis'
    spec.source           = { :git => 'https://github.com/alongenosar/Logger.git' }
    spec.source_files     = 'Logger.swift'
  end