import XCTest
@testable import Perfect_Weather

class Perfect_WeatherTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Perfect_Weather().text, "Hello, World!")
    }


    static var allTests : [(String, (Perfect_WeatherTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
