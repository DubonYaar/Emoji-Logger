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
Swift Examples. 

Set Logger sevirity output level
```swift

Logger.logLevel = .info
```

Log with sevirity 'info'
```swift
Logger.log(level:.info,"message","more information")

//You can also omit the level as .info is the default sevirity level

Logger.log("message","more information")

//Or

Logger.info("message","more information")
```
In the Debug window this will result with
```bash
🔵info: message more information
```  

Log with sevirity 'warning'
```swift
Logger.log(level:.warning,"warning message","more warning information")

//Or 

Logger.warning("warning message","more warning information")
```

In the Debug window this will result with:
```bash
🔶warning: warning message more warning information
```

Log with sevirity 'error'
```swift
Logger.log(level:.error,"error message,","more stuff")

//Or

Logger.error("error message,","more stuff")
```

In the Debug window this will result with
```bash
🔴error: error message, more stuff
```
  

Override message prefix regardless to its sevirity level
```swift
Logger.log("apple message",["foo:"bar"],prefixOverride:"🍏apple:")
```

in debug area
```bash
🍏apple: apple message {"foo":"bar"}
```

//Change level prefix
Logger.set(prefix: "** ERROR **", forLevel: .error)
Logger.error("error message,","more stuff")
//in debug area
** ERROR ** error message, more stuff

```






