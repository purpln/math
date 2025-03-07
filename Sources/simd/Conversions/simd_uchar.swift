@inlinable
public func simd_uchar(_ x: simd_char2) -> simd_uchar2 { unsafeBitCast(x, to: simd_uchar2.self) }

@inlinable
public func simd_uchar(_ x: simd_char3) -> simd_uchar3 { unsafeBitCast(x, to: simd_uchar3.self) }

@inlinable
public func simd_uchar(_ x: simd_char4) -> simd_uchar4 { unsafeBitCast(x, to: simd_uchar4.self) }

@inlinable
public func simd_uchar(_ x: simd_char8) -> simd_uchar8 { unsafeBitCast(x, to: simd_uchar8.self) }

@inlinable
public func simd_uchar(_ x: simd_char16) -> simd_uchar16 { unsafeBitCast(x, to: simd_uchar16.self) }

@inlinable
public func simd_uchar(_ x: simd_char32) -> simd_uchar32 { unsafeBitCast(x, to: simd_uchar32.self) }

@inlinable
public func simd_uchar(_ x: simd_uchar2) -> simd_uchar2 { x }

@inlinable
public func simd_uchar(_ x: simd_uchar3) -> simd_uchar3 { x }

@inlinable
public func simd_uchar(_ x: simd_uchar4) -> simd_uchar4 { x }

@inlinable
public func simd_uchar(_ x: simd_uchar8) -> simd_uchar8 { x }

@inlinable
public func simd_uchar(_ x: simd_uchar16) -> simd_uchar16 { x }

@inlinable
public func simd_uchar(_ x: simd_uchar32) -> simd_uchar32 { x }

@inlinable
public func simd_uchar(_ x: simd_short2) -> simd_uchar2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_short3) -> simd_uchar3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_short4) -> simd_uchar4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_short8) -> simd_uchar8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_short16) -> simd_uchar16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_short32) -> simd_uchar32 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ushort2) -> simd_uchar2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ushort3) -> simd_uchar3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ushort4) -> simd_uchar4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ushort8) -> simd_uchar8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ushort16) -> simd_uchar16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ushort32) -> simd_uchar32 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_int2) -> simd_uchar2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_int3) -> simd_uchar3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_int4) -> simd_uchar4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_int8) -> simd_uchar8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_int16) -> simd_uchar16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_uint2) -> simd_uchar2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_uint3) -> simd_uchar3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_uint4) -> simd_uchar4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_uint8) -> simd_uchar8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_uint16) -> simd_uchar16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_long2) -> simd_uchar2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_long3) -> simd_uchar3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_long4) -> simd_uchar4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_long8) -> simd_uchar8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ulong2) -> simd_uchar2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ulong3) -> simd_uchar3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ulong4) -> simd_uchar4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_uchar(_ x: simd_ulong8) -> simd_uchar8 { .init(truncatingIfNeeded: x) }

@inline(__always)
@usableFromInline
internal func __simd_uchar(_ x: Float) -> simd_uchar1 { .init(bitPattern: __simd_char(x)) }

@inline(__always)
@usableFromInline
internal func __simd_uchar(_ x: Double) -> simd_uchar1 { .init(bitPattern: __simd_char(x)) }

@inlinable
public func simd_uchar(_ x: simd_float2) -> simd_uchar2 { .init(__simd_uchar(x.x), __simd_uchar(x.y)) }

@inlinable
public func simd_uchar(_ x: simd_float3) -> simd_uchar3 { .init(__simd_uchar(x.x), __simd_uchar(x.y), __simd_uchar(x.z)) }

@inlinable
public func simd_uchar(_ x: simd_float4) -> simd_uchar4 { .init(__simd_uchar(x.x), __simd_uchar(x.y), __simd_uchar(x.z), __simd_uchar(x.w)) }

@inlinable
public func simd_uchar(_ x: simd_float8) -> simd_uchar8 { .init(__simd_uchar(x[0]), __simd_uchar(x[1]), __simd_uchar(x[2]), __simd_uchar(x[3]), __simd_uchar(x[4]), __simd_uchar(x[5]), __simd_uchar(x[6]), __simd_uchar(x[7])) }

@inlinable
public func simd_uchar(_ x: simd_float16) -> simd_uchar16 { .init(__simd_uchar(x[0]), __simd_uchar(x[1]), __simd_uchar(x[2]), __simd_uchar(x[3]), __simd_uchar(x[4]), __simd_uchar(x[5]), __simd_uchar(x[6]), __simd_uchar(x[7]), __simd_uchar(x[8]), __simd_uchar(x[9]), __simd_uchar(x[10]), __simd_uchar(x[11]), __simd_uchar(x[12]), __simd_uchar(x[13]), __simd_uchar(x[14]), __simd_uchar(x[15])) }

@inlinable
public func simd_uchar(_ x: simd_double2) -> simd_uchar2 { .init(__simd_uchar(x.x), __simd_uchar(x.y)) }

@inlinable
public func simd_uchar(_ x: simd_double3) -> simd_uchar3 { .init(__simd_uchar(x.x), __simd_uchar(x.y), __simd_uchar(x.z)) }

@inlinable
public func simd_uchar(_ x: simd_double4) -> simd_uchar4 { .init(__simd_uchar(x.x), __simd_uchar(x.y), __simd_uchar(x.z), __simd_uchar(x.w)) }

@inlinable
public func simd_uchar(_ x: simd_double8) -> simd_uchar8 { .init(__simd_uchar(x[0]), __simd_uchar(x[1]), __simd_uchar(x[2]), __simd_uchar(x[3]), __simd_uchar(x[4]), __simd_uchar(x[5]), __simd_uchar(x[6]), __simd_uchar(x[7])) }
