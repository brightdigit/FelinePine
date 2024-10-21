//
//  LoggingSystemTests.swift
//  FelinePine
//
//  Created by Leo Dion.
//  Copyright © 2024 BrightDigit.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the “Software”), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

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

  internal func testLogger() throws {
    #if canImport(os)
      for category in MockSystem.Category.allCases {
        _ = MockSystem.logger(forCategory: category)
      }
    #else
      throw XCTSkip("Logger not available.")
    #endif
  }
}
