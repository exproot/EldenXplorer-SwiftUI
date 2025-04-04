import XCTest
@testable import DependencyContainer

protocol ClosureBasedProtocol {
  func sampleMethod()
}

protocol AnotherProtocol {
  func anotherSampleMethod()
}

struct ClosureBasedImpl: ClosureBasedProtocol {
  func sampleMethod() { }
}

struct AnotherProtocolImpl: AnotherProtocol {

  let manager: ClosureBasedProtocol

  init(manager: ClosureBasedProtocol) {
    self.manager = manager
  }

  func anotherSampleMethod() { }
}
