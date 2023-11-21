import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

private enum LoggingSystemRepository {
  static var items = [String: Any]()
  static func loggingSystem<LoggingSystemType: LoggingSystem>(
    for system: LoggingSystemType.Type,
    using value: @autoclosure () -> [LoggingSystemType.Category: Logger]
  ) -> [LoggingSystemType.Category: Logger] {
    let anyItem = items[system.identifier]
    if let item = anyItem as? [LoggingSystemType.Category: Logger] {
      return item
    } else {
      assert(anyItem == nil)
      let value = value()
      items[system.identifier] = value
      return value
    }
  }
}

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
public protocol LoggingSystem {
  associatedtype Category: CaseIterable & Hashable & RawRepresentable
    where Category.RawValue == String
  static var identifier: String { get }
  static var subsystem: String { get }
  static var loggers: [Category: Logger] { get }
}

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
extension LoggingSystem {
  public static var identifier: String {
    String(reflecting: Self.self)
  }

  public static var subsystem: String {
    // swiftlint:disable:next force_unwrapping
    Bundle.main.bundleIdentifier!
  }

  private static func defaultLoggers() -> [Category: Logger] {
    .init(
      uniqueKeysWithValues: Category.allCases.map {
        ($0, Logger(subsystem: Self.subsystem, category: $0))
      }
    )
  }

  public static func logger(forCategory category: Category) -> Logger {
    guard let logger = Self.loggers[category] else {
      preconditionFailure("missing logger")
    }
    return logger
  }

  public static var loggers: [Category: Logger] {
    LoggingSystemRepository.loggingSystem(for: Self.self, using: defaultLoggers())
  }
}
