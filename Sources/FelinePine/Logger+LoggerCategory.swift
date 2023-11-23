import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

extension Logger {
  internal init<Category: RawRepresentable>(
    subsystem: String,
    category: Category
  ) where Category.RawValue == String {
    #if canImport(os)
      self.init(subsystem: subsystem, category: category.rawValue)
    #else
      self.init(label: subsystem)
      self[metadataKey: "category"] = "\(category)"
    #endif
  }
}
