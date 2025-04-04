import Foundation

public enum DependencyRegistrationType {
  case singleInstance(AnyObject)
  case closureBased(() -> Any)
}
