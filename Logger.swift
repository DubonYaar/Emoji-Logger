//
//  Logger.swift
//  
//
//  Created by Alon Genosar on 07/02/2019.
//  Copyright © 2019 Alon Genosar. All rights reserved.
//

import UIKit
public enum LoggerLevelThreshold:Int { case info,warning,error,off }
public enum LoggerLevel:Int { case info,warning,error }
enum LoggerEmojis:String { case info = "🔵", warning = "🔶", error = "🔴", heart = "♥️", beark = "🐻", unicorn = "🦄", skull = "☠️", pumpkin = "🎃", pig = "🐷", mushroom = "🍄", star = "⭐️",leaf  = "☘️" }
open class Logger {
    public static let defaultLogLevel:LoggerLevel = .info
    private static var levelPrefix = [LoggerEmojis.info.rawValue + "info:",LoggerEmojis.warning.rawValue+"warning:",LoggerEmojis.error.rawValue,"error:"]
    static var level:LoggerLevelThreshold = .info
    static var showLevelPrefix:Bool = true
    public class func log(level:LoggerLevel = defaultLogLevel,_ items:Any ...,prefixOverride:String? = nil) { _log(level: level, items, prefixOverride: prefixOverride) }
    public class func set(prefix:String,forLevel level:LoggerLevel) { levelPrefix[level.rawValue] = prefix}
    public class func info(    _ items:Any ..., prefixOverride:String? = nil) { _log(level: .info, items,prefixOverride: prefixOverride) }
    public class func warning( _ items:Any ..., prefixOverride:String? = nil) { _log(level: .warning, items,prefixOverride: prefixOverride) }
    public class func error(   _ items:Any ..., prefixOverride:String? = nil) { _log(level: .error, items,prefixOverride: prefixOverride) }
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
