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
Swift Examples
```swift
import Logger
.
.
.
//Set Logger sevirity level thrashold 
Logger.logLevel = .info

Logger.log(level:.info,"message","more information")
//in debug area 
🔵info: message more information

Logger.log(level:.warning,"warning message","more warning information")
//in debug area 
🔶warning: warning message more warning information

Logger.log(level:.error,"error message","more error information")
//in debug area 
🔴error: error message more error information

//Override message prefix regardless to its sevirity level
Logger.log(level:.info,"apple message",["foo:"bar"],prefixOverride:"🍏apple:")
//in debug area
🍏apple: apple message {"foo":"bar"}

```






