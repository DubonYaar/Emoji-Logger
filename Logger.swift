//
//  Logger.swift
//
//
//  Created by Alon Genosar on 07/02/2019.
//  Copyright © 2019 Alon Genosar. All rights reserved.
//
import UIKit
public enum LoggerLevelThreshold: Int { case info, warning, error, off }
public enum LoggerLevel: Int, CaseIterable { case info, warning, error }

struct Logger {
    private static var levelPrefix = [Emoji.blueCircle.rawValue, Emoji.yellowCircle.rawValue, Emoji.redCircle.rawValue]
    open static let defaultLogLevel: LoggerLevel = .info
    open static var level: LoggerLevelThreshold = .info
    open static var showLevelPrefix: Bool = true
    open static var showGroupPrefix: Bool = true

    //Prefix
    open static func set(prefix: String, forLevel level: LoggerLevel) { levelPrefix[level.rawValue] = prefix}

    open static func info( _ items: Any ..., emoji: Logger.Emoji? = nil, group: String? = nil) { _log(level: .info, items, prefix: emoji?.rawValue, group: group) }
    open static func warning( _ items: Any ..., emoji: Logger.Emoji? = nil, group: String? = nil) { _log(level: .warning, items, prefix: emoji?.rawValue, group: group) }
    open static func error(   _ items: Any ..., emoji: Logger.Emoji? = nil, group: String? = nil) { _log(level: .error, items, prefix: emoji?.rawValue, group: group) }

    // Mute
    private static var muted = Set<LoggerLevel>()
    open static func mute(level: LoggerLevel) { muted.insert(level) }
    open static func unmute(level: LoggerLevel) { muted.remove(level) }
    open static func unmuteAll() { muted.removeAll()}
    open static func muteAllLevelsBut(level: LoggerLevel) {
        Logger.unmuteAll()
        for l in LoggerLevel.allCases where l != level {
            mute(level: l)
        }
    }

    // Groups
    private static var filteredGroups = Set<String>()

    open static func includeGroup(group: String) {
        filteredGroups.insert(group)
    }

    open static func uninclude(category: String) {
        filteredGroups.remove(category)
    }

    open static func removeGroups() {
        filteredGroups.removeAll()
    }

    static private func _log(level: LoggerLevel = defaultLogLevel, _ items: [Any], prefix: String? = nil, group: String? = nil) {
        guard (group != nil && filteredGroups.contains(group!)) || filteredGroups.count == 0 else { return }
        if level.rawValue >= self.level.rawValue && !muted.contains(level) {
            var m = [String]()
            items.forEach { item in m.append(String(describing: item))}

            if let group = group, showGroupPrefix {
                m.insert("(group: \(group))", at: 0)
            }

            if showLevelPrefix {
                m.insert(prefix ?? levelPrefix[level.rawValue], at: 0)
            }
            print(m.joined(separator: " "))
        }
    }
}
