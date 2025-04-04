import Foundation

public typealias DC = DependencyContainer

public final class DependencyContainer: @unchecked Sendable {
  
  public static let shared = DependencyContainer()
  
  private var singleInstanceDependencies: [ObjectIdentifier: AnyObject] = [:]
  private var closureBasedDependencies: [ObjectIdentifier: () -> Any] = [:]
  
  private let dependencyAccessQueue = DispatchQueue(label: "com.ertan.EldenXplorerSwiftUI.dependency.queue", attributes: .concurrent)
  
  private init() { }
  
  public func register(type: DependencyRegistrationType, for interface: Any.Type) {
    dependencyAccessQueue.sync(flags: .barrier) {
      switch type {
      case .singleInstance(let instance):
        singleInstanceDependencies[ObjectIdentifier(interface)] = instance
      case .closureBased(let closure):
        closureBasedDependencies[ObjectIdentifier(interface)] = closure
      }
    }
  }
  
  public func resolve<Value>(type: DependencyResolvingType, for interface: Value.Type) -> Value {
    var value: Value!
    
    dependencyAccessQueue.sync {
      switch type {
      case .singleInstance:
        guard let resolvedSingleInstance = singleInstanceDependencies[ObjectIdentifier(interface)] as? Value else {
          fatalError("")
        }
        
        value = resolvedSingleInstance
        
      case .closureBased:
        guard let resolvedClosureDependency = closureBasedDependencies[ObjectIdentifier(interface)]?() as? Value else {
          fatalError("")
        }
        
        value = resolvedClosureDependency
      }
    }
    
    return value
  }
  
}
