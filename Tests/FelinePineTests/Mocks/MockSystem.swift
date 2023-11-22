@testable import FelinePine
import XCTest

internal struct MockSystem: LoggingSystem {
  internal enum Category: String, CaseIterable {
    case alpha
    case beta
    case gamma
  }
}
