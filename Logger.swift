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

public struct Logger {
    private static var levelPrefix = [Emoji.blueCircle.rawValue, Emoji.yellowCircle.rawValue, Emoji.redCircle.rawValue]
    public static let defaultLogLevel: LoggerLevel = .info
    public static var level: LoggerLevelThreshold = .info
    public static var showLevelPrefix: Bool = true
    public static var showGroupPrefix: Bool = true

    //Prefix
    public static func set(prefix: String, forLevel level: LoggerLevel) { levelPrefix[level.rawValue] = prefix}

    public static func info( _ items: Any ..., emoji: Logger.Emoji? = nil, group: String? = nil) { _log(level: .info, items, prefix: emoji?.rawValue, group: group) }
    public static func warning( _ items: Any ..., emoji: Logger.Emoji? = nil, group: String? = nil) { _log(level: .warning, items, prefix: emoji?.rawValue, group: group) }
    public static func error(   _ items: Any ..., emoji: Logger.Emoji? = nil, group: String? = nil) { _log(level: .error, items, prefix: emoji?.rawValue, group: group) }

    // Mute
    private static var muted = Set<LoggerLevel>()
    public static func mute(level: LoggerLevel) { muted.insert(level) }
    public static func unmute(level: LoggerLevel) { muted.remove(level) }
    public static func unmuteAll() { muted.removeAll()}
    public static func muteAllLevelsBut(level: LoggerLevel) {
        Logger.unmuteAll()
        for l in LoggerLevel.allCases where l != level {
            mute(level: l)
        }
    }

    // Groups
    enum EmojiGroupType { case isolate, filter }
    private static var groups = Set<String>()
    private static var groupType: EmojiGroupType = .filter

    public static func isolateGroup(group: String) {
        isolateGroup(groups: [group])
    }

    public static func isolateGroup(groups: [String]) {
        self.groups = Set(groups.map { $0 })
        groupType = .isolate
    }

    public static func filterGroup(group: String) {
        filterGroup(groups: [group])
    }
    public static func filterGroup(groups: [String]) {
        self.groups = Set(groups.map { $0 })
        groupType = .filter
    }

    public static func clearGroups() {
        groups = Set<String>()
        groupType = .filter
    }

    // Core
    //if isolate only grpups in in groups are displayed
    static private func _log(level: LoggerLevel = defaultLogLevel, _ items: [Any], prefix: String? = nil, group: String? = nil) {
        guard groups.count == 0 || 
              groupType == .isolate && group != nil && groups.contains(group!) ||
              groupType == .filter && (group == nil || !groups.contains(group!))
        else { return }

        if level.rawValue >= self.level.rawValue && !muted.contains(level) {
            var m = [String]()
            items.forEach { item in m.append(String(describing: item))}

            if let group = group, showGroupPrefix {
                m.insert("[Group: \(group)]", at: 0)
            }

            if showLevelPrefix {
                m.insert(prefix ?? levelPrefix[level.rawValue], at: 0)
            }
            print(m.joined(separator: " "))
        }
    }
}
