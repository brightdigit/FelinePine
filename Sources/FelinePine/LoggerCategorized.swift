import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
public protocol LoggerCategorized: Loggable {
  associatedtype LoggersType: Loggers
  static var loggingCategory: LoggersType.LoggerCategory {
    get
  }
}

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
extension LoggerCategorized {
  public static var logger: Logger {
    LoggersType.forCategory(loggingCategory)
  }
}
