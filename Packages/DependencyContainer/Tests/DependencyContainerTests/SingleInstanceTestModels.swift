import XCTest
@testable import DependencyContainer

protocol SingleInstanceProtocol: AnyObject {
  func sampleMethod()
}

final class SingleInstanceImpl: SingleInstanceProtocol {
  func sampleMethod() { }
}
