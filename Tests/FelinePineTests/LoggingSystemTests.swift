@testable import FelinePine
import XCTest

internal final class LoggingSystemTests: XCTestCase {
  internal func testIdentifier() {
    XCTAssertEqual(MockSystem.identifier, String(reflecting: MockSystem.self))
  }

  internal func testSubsystem() {
    let subsystem = MockSystem.subsystem
    if let bundleIdentifier = Bundle.main.bundleIdentifier {
      XCTAssertEqual(subsystem, bundleIdentifier)
    } else {
      XCTAssertEqual(subsystem, MockSystem.identifier)
    }
  }

  internal func testLogger() {
    for category in MockSystem.Category.allCases {
      _ = MockSystem.logger(forCategory: category)
    }
  }
}
