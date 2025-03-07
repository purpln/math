@inline(__always)
@usableFromInline
internal func __simd_long_rte(_ x: Double) -> simd_long1 { x < 0x1.0p63 && x >= -0x1.0p63 ? simd_long1(x.rounded(.toNearestOrEven)) : simd_long1.min }

@inlinable
public func simd_long_rte(_ x: simd_double2) -> simd_long2 { .init(__simd_long_rte(x.x), __simd_long_rte(x.y)) }

@inlinable
public func simd_long_rte(_ x: simd_double3) -> simd_long3 { .init(__simd_long_rte(x.x), __simd_long_rte(x.y), __simd_long_rte(x.z)) }

@inlinable
public func simd_long_rte(_ x: simd_double4) -> simd_long4 { .init(__simd_long_rte(x.x), __simd_long_rte(x.y), __simd_long_rte(x.z), __simd_long_rte(x.w)) }

@inlinable
public func simd_long_rte(_ x: simd_double8) -> simd_long8 { .init(__simd_long_rte(x[0]), __simd_long_rte(x[1]), __simd_long_rte(x[2]), __simd_long_rte(x[3]), __simd_long_rte(x[4]), __simd_long_rte(x[5]), __simd_long_rte(x[6]), __simd_long_rte(x[7])) }
