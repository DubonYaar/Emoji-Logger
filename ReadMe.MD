# Logger
<p align="center">
  <img width="166" height="208" src="https://github.com/alongenosar/Logger/blob/master/light.png">
</p>


## Overview
A light weight Swift logger with sevirity levels and built in Emojis

## Installation

### Manually
- Clone this git
- Drag Logger.swift file into xCode
- Select "Copy Files" from dialog

### CocoaPods
Add the following line to your Podfile:

```bash
pod 'Logger'
```

### Carthage
Add the following line to your Cartfile:

```bash
github "alongenosar/Logger"
```

## Usage
Swift
```swift
import Logger
.
.
.
//Set Logger sevirity level thrashold 
Logger.logLevel = .info

Logger.log(level:.info,"message","more information")

🔵info: message more information

Logger.log(level:.warning,"warning message","more warning information")
//In console 
🔶info: warning message more warning information

Logger.log(level:.error,"error message","more error information")
//In console 
🔴info: error message more error information

```







