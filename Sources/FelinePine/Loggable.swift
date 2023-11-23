import Foundation

/// Loggable type for a ``LoggingSystem``.
public protocol Loggable<LoggingSystemType>: Feline, Pine
  where LoggingSystemType: LoggingSystem {}
