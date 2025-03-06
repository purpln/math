extension SIMD {
    @available(swift, deprecated: 5, renamed: "init(repeating:)")
    public init(_ scalar: Scalar) { self.init(repeating: scalar) }
}

extension SIMD where Scalar: FixedWidthInteger {
    @available(swift, deprecated: 5, message: "use `0 &- rhs`")
    public static prefix func -(rhs: Self) -> Self { 0 &- rhs }
}
