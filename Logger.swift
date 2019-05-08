//
//  Logger.swift
//
//
//  Created by Alon Genosar on 07/02/2019.
//  Copyright © 2019 Alon Genosar. All rights reserved.
//

import UIKit
public enum LoggerLevelThreshold:Int { case info,warning,error,off }
public enum LoggerLevel:Int,CaseIterable { case info,warning,error }
public enum LoggerEmojis:String { case info = "🔵", warning = "🔶", error = "🔴", heart = "♥️", beark = "🐻", unicorn = "🦄", skull = "☠️", pumpkin = "🎃", pig = "🐷", mushroom = "🍄", star = "⭐️",leaf  = "☘️" }
open class Logger {
    public static let defaultLogLevel:LoggerLevel = .info
    public static var level:LoggerLevelThreshold = .info
    public static var showLevelPrefix:Bool = true
    public class func log(level:LoggerLevel = defaultLogLevel,_ items:Any ...,prefixOverride:String? = nil) { _log(level: level, items, prefixOverride: prefixOverride) }
    public class func set(prefix:String,forLevel level:LoggerLevel) { levelPrefix[level.rawValue] = prefix}
    public class func info(    _ items:Any ..., prefixOverride:String? = nil) { _log(level: .info, items,prefixOverride: prefixOverride) }
    public class func warning( _ items:Any ..., prefixOverride:String? = nil) { _log(level: .warning, items,prefixOverride: prefixOverride) }
    public class func error(   _ items:Any ..., prefixOverride:String? = nil) { _log(level: .error, items,prefixOverride: prefixOverride) }
    private static var muted = Set<LoggerLevel>()
    private static var levelPrefix = [LoggerEmojis.info.rawValue + "info:",LoggerEmojis.warning.rawValue+"warning:",LoggerEmojis.error.rawValue,"error:"]
    class private func _log(level:LoggerLevel = defaultLogLevel,_ items:[Any],prefixOverride:String? = nil) {
        if level.rawValue >= self.level.rawValue && !muted.contains(level){
            var m = [String]()
            items.forEach { item in m.append(String(describing: item))}
            if showLevelPrefix {
                m.insert(prefixOverride ?? levelPrefix[level.rawValue],at: 0)
            }
            print(m.joined(separator:" "))
        }
    }
    public class func mute(level:LoggerLevel) { muted.insert(level) }
    public class func unmute(level:LoggerLevel) { muted.remove(level) }
    public class func unMuteAll() { muted.removeAll()}
    public class func muteAllBut(level:LoggerLevel) {
        Logger.unMuteAll()
        for l in LoggerLevel.allCases {
            if l != level {
                mute(level: l)
            }
        }
    }
}
