@inlinable
public func simd_short(_ x: simd_char2) -> simd_short2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_char3) -> simd_short3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_char4) -> simd_short4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_char8) -> simd_short8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_char16) -> simd_short16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_char32) -> simd_short32 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uchar2) -> simd_short2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uchar3) -> simd_short3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uchar4) -> simd_short4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uchar8) -> simd_short8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uchar16) -> simd_short16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uchar32) -> simd_short32 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_short2) -> simd_short2 { x }

@inlinable
public func simd_short(_ x: simd_short3) -> simd_short3 { x }

@inlinable
public func simd_short(_ x: simd_short4) -> simd_short4 { x }

@inlinable
public func simd_short(_ x: simd_short8) -> simd_short8 { x }

@inlinable
public func simd_short(_ x: simd_short16) -> simd_short16 { x }

@inlinable
public func simd_short(_ x: simd_short32) -> simd_short32 { x }

@inlinable
public func simd_short(_ x: simd_ushort2) -> simd_short2 { unsafeBitCast(x, to: simd_short2.self) }

@inlinable
public func simd_short(_ x: simd_ushort3) -> simd_short3 { unsafeBitCast(x, to: simd_short3.self) }

@inlinable
public func simd_short(_ x: simd_ushort4) -> simd_short4 { unsafeBitCast(x, to: simd_short4.self) }

@inlinable
public func simd_short(_ x: simd_ushort8) -> simd_short8 { unsafeBitCast(x, to: simd_short8.self) }

@inlinable
public func simd_short(_ x: simd_ushort16) -> simd_short16 { unsafeBitCast(x, to: simd_short16.self) }

@inlinable
public func simd_short(_ x: simd_ushort32) -> simd_short32 { unsafeBitCast(x, to: simd_short32.self) }

@inlinable
public func simd_short(_ x: simd_int2) -> simd_short2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_int3) -> simd_short3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_int4) -> simd_short4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_int8) -> simd_short8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_int16) -> simd_short16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uint2) -> simd_short2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uint3) -> simd_short3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uint4) -> simd_short4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uint8) -> simd_short8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_uint16) -> simd_short16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_long2) -> simd_short2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_long3) -> simd_short3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_long4) -> simd_short4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_long8) -> simd_short8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_ulong2) -> simd_short2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_ulong3) -> simd_short3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_ulong4) -> simd_short4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_short(_ x: simd_ulong8) -> simd_short8 { .init(truncatingIfNeeded: x) }

@inline(__always)
@usableFromInline
internal func __simd_short(_ x: Float) -> simd_short1 { x < 0x1.0p15 && x >= -0x1.0p15 ? simd_short1(x) : 0 }

@inline(__always)
@usableFromInline
internal func __simd_short(_ x: Double) -> simd_short1 { x < 0x1.0p15 && x >= -0x1.0p15 ? simd_short1(x) : 0 }

@inlinable
public func simd_short(_ x: simd_float2) -> simd_short2 { .init(__simd_short(x.x), __simd_short(x.y)) }

@inlinable
public func simd_short(_ x: simd_float3) -> simd_short3 { .init(__simd_short(x.x), __simd_short(x.y), __simd_short(x.z)) }

@inlinable
public func simd_short(_ x: simd_float4) -> simd_short4 { .init(__simd_short(x.x), __simd_short(x.y), __simd_short(x.z), __simd_short(x.w)) }

@inlinable
public func simd_short(_ x: simd_float8) -> simd_short8 { .init(__simd_short(x[0]), __simd_short(x[1]), __simd_short(x[2]), __simd_short(x[3]), __simd_short(x[4]), __simd_short(x[5]), __simd_short(x[6]), __simd_short(x[7])) }

@inlinable
public func simd_short(_ x: simd_float16) -> simd_short16 { .init(__simd_short(x[0]), __simd_short(x[1]), __simd_short(x[2]), __simd_short(x[3]), __simd_short(x[4]), __simd_short(x[5]), __simd_short(x[6]), __simd_short(x[7]), __simd_short(x[8]), __simd_short(x[9]), __simd_short(x[10]), __simd_short(x[11]), __simd_short(x[12]), __simd_short(x[13]), __simd_short(x[14]), __simd_short(x[15])) }

@inlinable
public func simd_short(_ x: simd_double2) -> simd_short2 { .init(__simd_short(x.x), __simd_short(x.y)) }

@inlinable
public func simd_short(_ x: simd_double3) -> simd_short3 { .init(__simd_short(x.x), __simd_short(x.y), __simd_short(x.z)) }

@inlinable
public func simd_short(_ x: simd_double4) -> simd_short4 { .init(__simd_short(x.x), __simd_short(x.y), __simd_short(x.z), __simd_short(x.w)) }

@inlinable
public func simd_short(_ x: simd_double8) -> simd_short8 { .init(__simd_short(x[0]), __simd_short(x[1]), __simd_short(x[2]), __simd_short(x[3]), __simd_short(x[4]), __simd_short(x[5]), __simd_short(x[6]), __simd_short(x[7])) }
