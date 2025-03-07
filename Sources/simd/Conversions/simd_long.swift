@inlinable
public func simd_long(_ x: simd_char2) -> simd_long2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_char3) -> simd_long3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_char4) -> simd_long4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_char8) -> simd_long8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uchar2) -> simd_long2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uchar3) -> simd_long3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uchar4) -> simd_long4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uchar8) -> simd_long8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_short2) -> simd_long2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_short3) -> simd_long3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_short4) -> simd_long4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_short8) -> simd_long8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_ushort2) -> simd_long2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_ushort3) -> simd_long3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_ushort4) -> simd_long4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_ushort8) -> simd_long8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_int2) -> simd_long2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_int3) -> simd_long3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_int4) -> simd_long4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_int8) -> simd_long8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uint2) -> simd_long2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uint3) -> simd_long3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uint4) -> simd_long4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_uint8) -> simd_long8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_long(_ x: simd_long2) -> simd_long2 { x }

@inlinable
public func simd_long(_ x: simd_long3) -> simd_long3 { x }

@inlinable
public func simd_long(_ x: simd_long4) -> simd_long4 { x }

@inlinable
public func simd_long(_ x: simd_long8) -> simd_long8 { x }

@inlinable
public func simd_long(_ x: simd_ulong2) -> simd_long2 { unsafeBitCast(x, to: simd_long2.self) }

@inlinable
public func simd_long(_ x: simd_ulong3) -> simd_long3 { unsafeBitCast(x, to: simd_long3.self) }

@inlinable
public func simd_long(_ x: simd_ulong4) -> simd_long4 { unsafeBitCast(x, to: simd_long4.self) }

@inlinable
public func simd_long(_ x: simd_ulong8) -> simd_long8 { unsafeBitCast(x, to: simd_long8.self) }

@inline(__always)
@usableFromInline
internal func __simd_long(_ x: Float) -> simd_long1 { x < 0x1.0p63 && x >= -0x1.0p63 ? simd_long1(x) : simd_long1.min }

@inline(__always)
@usableFromInline
internal func __simd_long(_ x: Double) -> simd_long1 { x < 0x1.0p63 && x >= -0x1.0p63 ? simd_long1(x) : simd_long1.min }

@inlinable
public func simd_long(_ x: simd_float2) -> simd_long2 { .init(__simd_long(x.x), __simd_long(x.y)) }

@inlinable
public func simd_long(_ x: simd_float3) -> simd_long3 { .init(__simd_long(x.x), __simd_long(x.y), __simd_long(x.z)) }

@inlinable
public func simd_long(_ x: simd_float4) -> simd_long4 { .init(__simd_long(x.x), __simd_long(x.y), __simd_long(x.z), __simd_long(x.w)) }

@inlinable
public func simd_long(_ x: simd_float8) -> simd_long8 { .init(__simd_long(x[0]), __simd_long(x[1]), __simd_long(x[2]), __simd_long(x[3]), __simd_long(x[4]), __simd_long(x[5]), __simd_long(x[6]), __simd_long(x[7])) }

@inlinable
public func simd_long(_ x: simd_double2) -> simd_long2 { .init(__simd_long(x.x), __simd_long(x.y)) }

@inlinable
public func simd_long(_ x: simd_double3) -> simd_long3 { .init(__simd_long(x.x), __simd_long(x.y), __simd_long(x.z)) }

@inlinable
public func simd_long(_ x: simd_double4) -> simd_long4 { .init(__simd_long(x.x), __simd_long(x.y), __simd_long(x.z), __simd_long(x.w)) }

@inlinable
public func simd_long(_ x: simd_double8) -> simd_long8 { .init(__simd_long(x[0]), __simd_long(x[1]), __simd_long(x[2]), __simd_long(x[3]), __simd_long(x[4]), __simd_long(x[5]), __simd_long(x[6]), __simd_long(x[7])) }
