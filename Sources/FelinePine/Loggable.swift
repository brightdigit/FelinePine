import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
public protocol Loggable {
  static var logger: Logger {
    get
  }
}
