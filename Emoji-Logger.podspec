Pod::Spec.new do |spec|
    spec.platform         = :ios, "9.0"
    spec.swift_version    = '4.2'
    spec.name             = 'Emoji-Logger'
    spec.version          = '0.0.9'
    spec.module_name      = 'Logger'
    spec.license          = { :type => 'Apache License, Version 2.0',:file => 'LICENSE'}
    spec.homepage         = 'https://github.com/alongenosar/Emoji-Logger'
    spec.authors          = { 'Alon Genosar' => 'alon@gmail.com' }
    spec.summary          = 'Light weight Swift Logger with severity levels and Emojis'
    spec.source           = { :git => 'https://github.com/alongenosar/Emoji-Logger.git', :tag => '0.0.9' }
    spec.source_files     = 'Logger.swift'
  end