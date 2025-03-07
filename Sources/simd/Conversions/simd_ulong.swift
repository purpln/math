@inlinable
public func simd_ulong(_ x: simd_char2) -> simd_ulong2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_char3) -> simd_ulong3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_char4) -> simd_ulong4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_char8) -> simd_ulong8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uchar2) -> simd_ulong2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uchar3) -> simd_ulong3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uchar4) -> simd_ulong4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uchar8) -> simd_ulong8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_short2) -> simd_ulong2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_short3) -> simd_ulong3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_short4) -> simd_ulong4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_short8) -> simd_ulong8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_ushort2) -> simd_ulong2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_ushort3) -> simd_ulong3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_ushort4) -> simd_ulong4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_ushort8) -> simd_ulong8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_int2) -> simd_ulong2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_int3) -> simd_ulong3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_int4) -> simd_ulong4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_int8) -> simd_ulong8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uint2) -> simd_ulong2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uint3) -> simd_ulong3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uint4) -> simd_ulong4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_uint8) -> simd_ulong8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ulong(_ x: simd_long2) -> simd_ulong2 { unsafeBitCast(x, to: simd_ulong2.self) }

@inlinable
public func simd_ulong(_ x: simd_long3) -> simd_ulong3 { unsafeBitCast(x, to: simd_ulong3.self) }

@inlinable
public func simd_ulong(_ x: simd_long4) -> simd_ulong4 { unsafeBitCast(x, to: simd_ulong4.self) }

@inlinable
public func simd_ulong(_ x: simd_long8) -> simd_ulong8 { unsafeBitCast(x, to: simd_ulong8.self) }

@inlinable
public func simd_ulong(_ x: simd_ulong2) -> simd_ulong2 { x }

@inlinable
public func simd_ulong(_ x: simd_ulong3) -> simd_ulong3 { x }

@inlinable
public func simd_ulong(_ x: simd_ulong4) -> simd_ulong4 { x }

@inlinable
public func simd_ulong(_ x: simd_ulong8) -> simd_ulong8 { x }

@inline(__always)
@usableFromInline
internal func __simd_ulong(_ x: Float) -> simd_ulong1 { x < 0x1.0p63 ? simd_ulong1(bitPattern: __simd_long(x)) : 0 }

@inline(__always)
@usableFromInline
internal func __simd_ulong(_ x: Double) -> simd_ulong1 { x < 0x1.0p63 ? simd_ulong1(bitPattern: __simd_long(x)) : 0 }

@inlinable
public func simd_ulong(_ x: simd_float2) -> simd_ulong2 { .init(__simd_ulong(x.x), __simd_ulong(x.y)) }

@inlinable
public func simd_ulong(_ x: simd_float3) -> simd_ulong3 { .init(__simd_ulong(x.x), __simd_ulong(x.y), __simd_ulong(x.z)) }

@inlinable
public func simd_ulong(_ x: simd_float4) -> simd_ulong4{ .init(__simd_ulong(x.x), __simd_ulong(x.y), __simd_ulong(x.z), __simd_ulong(x.w)) }

@inlinable
public func simd_ulong(_ x: simd_float8) -> simd_ulong8 { .init(__simd_ulong(x[0]), __simd_ulong(x[1]), __simd_ulong(x[2]), __simd_ulong(x[3]), __simd_ulong(x[4]), __simd_ulong(x[5]), __simd_ulong(x[6]), __simd_ulong(x[7])) }

@inlinable
public func simd_ulong(_ x: simd_double2) -> simd_ulong2 { .init(__simd_ulong(x.x), __simd_ulong(x.y)) }

@inlinable
public func simd_ulong(_ x: simd_double3) -> simd_ulong3 { .init(__simd_ulong(x.x), __simd_ulong(x.y), __simd_ulong(x.z)) }

@inlinable
public func simd_ulong(_ x: simd_double4) -> simd_ulong4{ .init(__simd_ulong(x.x), __simd_ulong(x.y), __simd_ulong(x.z), __simd_ulong(x.w)) }

@inlinable
public func simd_ulong(_ x: simd_double8) -> simd_ulong8 { .init(__simd_ulong(x[0]), __simd_ulong(x[1]), __simd_ulong(x[2]), __simd_ulong(x[3]), __simd_ulong(x[4]), __simd_ulong(x[5]), __simd_ulong(x[6]), __simd_ulong(x[7])) }
