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

//Log with sevirity 'info'
Logger.log(level:.info,"message","more information")
//in debug area 
🔵info: message more information

//Log with sevirity 'warning'
Logger.log(level:.warning,"warning message","more warning information")
//in debug area 
🔶warning: warning message more warning information

//Log with sevirity 'error'
Logger.log(level:.error,"error message,","more stuff")
//in debug area 
🔴error: error message, more stuff

//Override message prefix regardless to its sevirity level
Logger.log(level:.info,"apple message",["foo:"bar"],prefixOverride:"🍏apple:")
//in debug area
🍏apple: apple message {"foo":"bar"}

//Change level prefix
Logger.set(prefix: "** ERROR **", forLevel: .error)
Logger.log(level:.error,"error message,","more stuff")
//in debug area
** ERROR ** error message, more stuff

```






