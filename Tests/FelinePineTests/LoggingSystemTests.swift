@testable import FelinePine
import XCTest

internal final class LoggingSystemTests: XCTestCase {
  internal func testIdentifier() {
    XCTAssertEqual(MockSystem.identifier, String(reflecting: MockSystem.self))
  }

  internal func testSubsystem() {
    XCTAssertEqual(MockSystem.subsystem, Bundle.main.bundleIdentifier)
  }

  internal func testLogger() {
    for category in MockSystem.Category.allCases {
      _ = MockSystem.logger(forCategory: category)
    }
  }
}
