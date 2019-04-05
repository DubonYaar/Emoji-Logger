//
//  Logger.swift
//  Snappers
//
//  Created by Alon Genosar on 07/02/2019.
//  Copyright © 2019 Snappers. All rights reserved.
//

import UIKit
enum LoggerLevelThreshold:Int { case info,warning,error,off }
enum LoggerLevel:Int { case info,warning,error }
enum LoggerEmojis:String { case info = "🔵", warning = "🔶", error = "🔴", heart = "♥️", beark = "🐻", unicorn = "🦄", skull = "☠️", pumpkin = "🎃", pig = "🐷", mushroom = "🍄", star = "⭐️",leaf  = "☘️" }
class Logger {
    private static let defaultLogLevel:LoggerLevel = .info
    private static var levelPrefix = [LoggerEmojis.info.rawValue + "info:",LoggerEmojis.warning.rawValue+"warning:",LoggerEmojis.error.rawValue,"error:"]
    static var level:LoggerLevelThreshold = .info
    static var showLevelPrefix:Bool = true
    class func log(level:LoggerLevel = defaultLogLevel,_ items:Any ...,prefixOverride:String? = nil) { _log(level: level, items, prefixOverride: prefixOverride) }
    class func set(prefix:String,forLevel level:LoggerLevel) { levelPrefix[level.rawValue] = prefix}
    class func info(    _ items:Any ..., prefixOverride:String? = nil) { _log(level: .info, items,prefixOverride: prefixOverride) }
    class func warning( _ items:Any ..., prefixOverride:String? = nil) { _log(level: .warning, items,prefixOverride: prefixOverride) }
    class func error(   _ items:Any ..., prefixOverride:String? = nil) { _log(level: .error, items,prefixOverride: prefixOverride) }
    class private func _log(level:LoggerLevel = defaultLogLevel,_ items:[Any],prefixOverride:String? = nil) {
        if level.rawValue >= self.level.rawValue {
            var m = [String]()
            items.forEach { item in m.append(String(describing: item))}
            if showLevelPrefix {
                m.insert(prefixOverride ?? levelPrefix[level.rawValue],at: 0)
            }
            print(m.joined(separator:" "))
        }
    }
}