import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

@available(iOS 14.0, watchOS 7.0, macOS 11.0, *)
extension Logger {
  internal init<LoggerCategory: RawRepresentable>(
    subsystem: String,
    category: LoggerCategory
  ) where LoggerCategory.RawValue == String {
    #if canImport(os)
      self.init(subsystem: subsystem, category: category.rawValue)
    #else
      self.init(label: subsystem)
      self[metadataKey: "category"] = "\(category)"
    #endif
  }
}
