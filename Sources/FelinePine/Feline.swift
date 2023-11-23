import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

/// Defines the ``LoggingSystem`` to use as well as the category.
public protocol Feline {
  /// Defined ``LoggingSystemType`` to use for pulling the correct category.
  associatedtype LoggingSystemType: LoggingSystem

  /// Specific category to use for logging.
  static var loggingCategory: LoggingSystemType.Category {
    get
  }
}

extension Feline where Self: Pine {
  /// Use the ``loggingCategory`` to define the shared logger for type.
  public static var logger: Logger {
    LoggingSystemType.logger(forCategory: loggingCategory)
  }
}
