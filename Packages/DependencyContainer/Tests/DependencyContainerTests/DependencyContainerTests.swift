import XCTest
@testable import DependencyContainer

final class DependencyContainerTests: XCTestCase {

  func test_single_instance_registration_and_resolving() {
    let instance = SingleInstanceImpl()

    DC.shared.register(type: .singleInstance(instance), for: SingleInstanceProtocol.self)

    let resolvedInstance = DC.shared.resolve(type: .singleInstance, for: SingleInstanceProtocol.self)

    XCTAssertIdentical(instance, resolvedInstance)
  }

  func test_closure_based_registration_and_resolving() {
    let closure: () -> ClosureBasedProtocol = {
      ClosureBasedImpl()
    }

    DC.shared.register(type: .closureBased(closure), for: ClosureBasedProtocol.self)

    let resolved = DC.shared.resolve(type: .closureBased, for: ClosureBasedProtocol.self)

    XCTAssert(resolved is ClosureBasedImpl)
  }

  func test_closure_based_dependency_that_depends_on_another() {
    let managerClosure: () -> ClosureBasedProtocol = {
      ClosureBasedImpl()
    }

    DC.shared.register(type: .closureBased(managerClosure), for: ClosureBasedProtocol.self)

    let closure: () -> AnotherProtocol = {
      let manager = DC.shared.resolve(type: .closureBased, for: ClosureBasedProtocol.self)

      return AnotherProtocolImpl(manager: manager)
    }

    DC.shared.register(type: .closureBased(closure), for: AnotherProtocol.self)

    let resolved = DC.shared.resolve(type: .closureBased, for: AnotherProtocol.self)

    XCTAssert(resolved is AnotherProtocolImpl)
  }

}
