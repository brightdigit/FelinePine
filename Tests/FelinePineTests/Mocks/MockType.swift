@testable import FelinePine
import XCTest

internal struct MockType: Feline, Pine {
  internal typealias LoggingSystemType = MockSystem

  internal static let loggingCategory: MockSystem.Category = .alpha
}
