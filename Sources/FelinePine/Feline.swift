import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
public protocol Feline {
  associatedtype LoggingSystemType: LoggingSystem
  static var loggingCategory: LoggingSystemType.Category {
    get
  }
}

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
extension Feline where Self: Pine {
  public static var logger: Logger {
    LoggingSystemType.logger(forCategory: loggingCategory)
  }
}
