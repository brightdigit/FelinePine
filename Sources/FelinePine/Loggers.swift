import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
public protocol Loggers {
  associatedtype LoggerCategory: CaseIterable & Hashable & RawRepresentable
    where LoggerCategory.RawValue == String
  static var subsystem: String { get }
  static var loggers: [LoggerCategory: Logger] { get }
}

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
extension Loggers {
  public static var subsystem: String {
    // swiftlint:disable:next force_unwrapping
    Bundle.main.bundleIdentifier!
  }

  // swiftlint:disable:next identifier_name
  public static var _loggers: [LoggerCategory: Logger] {
    .init(
      uniqueKeysWithValues: LoggerCategory.allCases.map {
        ($0, Logger(subsystem: Self.subsystem, category: $0))
      }
    )
  }

  public static func forCategory(_ category: LoggerCategory) -> Logger {
    guard let logger = Self.loggers[category] else {
      preconditionFailure("missing logger")
    }
    return logger
  }
}
