import Foundation
#if canImport(os)
  import os
#else
  import Logging
#endif

/// Defines a shared logger for the type.
///
/// Provides a shared ``Logger`` to use in this type.
public protocol Pine {
  /// Shared logger for Type.
  static var logger: Logger {
    get
  }
}
