public class Callee {
  var value: Int

  public init(value: Int) {
    self.value = value
  }

  public func plusValue(_ value: Int) -> Int {
    return self.value + value
  }
}
