@inlinable
public func simd_uint_sat(_ x: simd_char2) -> simd_uint2 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_char3) -> simd_uint3 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_char4) -> simd_uint4 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_char8) -> simd_uint8 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_char16) -> simd_uint16 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_uchar2) -> simd_uint2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_uchar3) -> simd_uint3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_uchar4) -> simd_uint4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_uchar8) -> simd_uint8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_uchar16) -> simd_uint16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_short2) -> simd_uint2 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_short3) -> simd_uint3 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_short4) -> simd_uint4 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_short8) -> simd_uint8 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_short16) -> simd_uint16 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ushort2) -> simd_uint2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ushort3) -> simd_uint3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ushort4) -> simd_uint4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ushort8) -> simd_uint8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ushort16) -> simd_uint16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_int2) -> simd_uint2 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_int3) -> simd_uint3 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_int4) -> simd_uint4 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_int8) -> simd_uint8 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_int16) -> simd_uint16 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_uint2) -> simd_uint2 { x }

@inlinable
public func simd_uint_sat(_ x: simd_uint3) -> simd_uint3 { x }

@inlinable
public func simd_uint_sat(_ x: simd_uint4) -> simd_uint4 { x }

@inlinable
public func simd_uint_sat(_ x: simd_uint8) -> simd_uint8 { x }

@inlinable
public func simd_uint_sat(_ x: simd_uint16) -> simd_uint16 { x }

@inlinable
public func simd_uint_sat(_ x: simd_long2) -> simd_uint2 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_long3) -> simd_uint3 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_long4) -> simd_uint4 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_long8) -> simd_uint8 { .init(clamping: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ulong2) -> simd_uint2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ulong3) -> simd_uint3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ulong4) -> simd_uint4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uint_sat(_ x: simd_ulong8) -> simd_uint8 { .init(truncatingIfNeeded: x) }

@inline(__always)
@usableFromInline
internal func __simd_uint_sat(_ x: Float) -> simd_uint1 { x < 0x1.0p32 ? simd_uint1(max(x, 0.0)) : simd_uint1.max }

@inline(__always)
@usableFromInline
internal func __simd_uint_sat(_ x: Double) -> simd_uint1 { x < 0x1.0p32 ? simd_uint1(max(x, 0.0)) : simd_uint1.max }

@inlinable
public func simd_uint_sat(_ x: simd_float2) -> simd_uint2 { .init(__simd_uint_sat(x.x), __simd_uint_sat(x.y)) }

@inlinable
public func simd_uint_sat(_ x: simd_float3) -> simd_uint3 { .init(__simd_uint_sat(x.x), __simd_uint_sat(x.y), __simd_uint_sat(x.z)) }

@inlinable
public func simd_uint_sat(_ x: simd_float4) -> simd_uint4 { .init(__simd_uint_sat(x.x), __simd_uint_sat(x.y), __simd_uint_sat(x.z), __simd_uint_sat(x.w)) }

@inlinable
public func simd_uint_sat(_ x: simd_float8) -> simd_uint8 { .init(__simd_uint_sat(x[0]), __simd_uint_sat(x[1]), __simd_uint_sat(x[2]), __simd_uint_sat(x[3]), __simd_uint_sat(x[4]), __simd_uint_sat(x[5]), __simd_uint_sat(x[6]), __simd_uint_sat(x[7])) }

@inlinable
public func simd_uint_sat(_ x: simd_float16) -> simd_uint16 { .init(__simd_uint_sat(x[0]), __simd_uint_sat(x[1]), __simd_uint_sat(x[2]), __simd_uint_sat(x[3]), __simd_uint_sat(x[4]), __simd_uint_sat(x[5]), __simd_uint_sat(x[6]), __simd_uint_sat(x[7]), __simd_uint_sat(x[8]), __simd_uint_sat(x[9]), __simd_uint_sat(x[10]), __simd_uint_sat(x[11]), __simd_uint_sat(x[12]), __simd_uint_sat(x[13]), __simd_uint_sat(x[14]), __simd_uint_sat(x[15])) }

@inlinable
public func simd_uint_sat(_ x: simd_double2) -> simd_uint2 { .init(__simd_uint_sat(x.x), __simd_uint_sat(x.y)) }

@inlinable
public func simd_uint_sat(_ x: simd_double3) -> simd_uint3 { .init(__simd_uint_sat(x.x), __simd_uint_sat(x.y), __simd_uint_sat(x.z)) }

@inlinable
public func simd_uint_sat(_ x: simd_double4) -> simd_uint4 { .init(__simd_uint_sat(x.x), __simd_uint_sat(x.y), __simd_uint_sat(x.z), __simd_uint_sat(x.w)) }

@inlinable
public func simd_uint_sat(_ x: simd_double8) -> simd_uint8 { .init(__simd_uint_sat(x[0]), __simd_uint_sat(x[1]), __simd_uint_sat(x[2]), __simd_uint_sat(x[3]), __simd_uint_sat(x[4]), __simd_uint_sat(x[5]), __simd_uint_sat(x[6]), __simd_uint_sat(x[7])) }
