@inlinable
public func simd_ushort(_ x: simd_char2) -> simd_ushort2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_char3) -> simd_ushort3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_char4) -> simd_ushort4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_char8) -> simd_ushort8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_char16) -> simd_ushort16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_char32) -> simd_ushort32 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uchar2) -> simd_ushort2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uchar3) -> simd_ushort3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uchar4) -> simd_ushort4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uchar8) -> simd_ushort8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uchar16) -> simd_ushort16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uchar32) -> simd_ushort32 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_short2) -> simd_ushort2 { unsafeBitCast(x, to: simd_ushort2.self) }

@inlinable
public func simd_ushort(_ x: simd_short3) -> simd_ushort3 { unsafeBitCast(x, to: simd_ushort3.self) }

@inlinable
public func simd_ushort(_ x: simd_short4) -> simd_ushort4 { unsafeBitCast(x, to: simd_ushort4.self) }

@inlinable
public func simd_ushort(_ x: simd_short8) -> simd_ushort8 { unsafeBitCast(x, to: simd_ushort8.self) }

@inlinable
public func simd_ushort(_ x: simd_short16) -> simd_ushort16 { unsafeBitCast(x, to: simd_ushort16.self) }

@inlinable
public func simd_ushort(_ x: simd_short32) -> simd_ushort32 { unsafeBitCast(x, to: simd_ushort32.self) }

@inlinable
public func simd_ushort(_ x: simd_ushort2) -> simd_ushort2 { x }

@inlinable
public func simd_ushort(_ x: simd_ushort3) -> simd_ushort3 { x }

@inlinable
public func simd_ushort(_ x: simd_ushort4) -> simd_ushort4 { x }

@inlinable
public func simd_ushort(_ x: simd_ushort8) -> simd_ushort8 { x }

@inlinable
public func simd_ushort(_ x: simd_ushort16) -> simd_ushort16 { x }

@inlinable
public func simd_ushort(_ x: simd_ushort32) -> simd_ushort32 { x }

@inlinable
public func simd_ushort(_ x: simd_int2) -> simd_ushort2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_int3) -> simd_ushort3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_int4) -> simd_ushort4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_int8) -> simd_ushort8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_int16) -> simd_ushort16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uint2) -> simd_ushort2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uint3) -> simd_ushort3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uint4) -> simd_ushort4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uint8) -> simd_ushort8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_uint16) -> simd_ushort16 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_long2) -> simd_ushort2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_long3) -> simd_ushort3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_long4) -> simd_ushort4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_long8) -> simd_ushort8 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_ulong2) -> simd_ushort2 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_ulong3) -> simd_ushort3 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_ulong4) -> simd_ushort4 { .init(truncatingIfNeeded: x) }

@inlinable
public func simd_ushort(_ x: simd_ulong8) -> simd_ushort8 { .init(truncatingIfNeeded: x) }

@inline(__always)
@usableFromInline
internal func __simd_ushort(_ x: Float) -> simd_ushort1 { .init(bitPattern: __simd_short(x)) }

@inline(__always)
@usableFromInline
internal func __simd_ushort(_ x: Double) -> simd_ushort1 { .init(bitPattern: __simd_short(x)) }

@inlinable
public func simd_ushort(_ x: simd_float2) -> simd_ushort2 { .init(__simd_ushort(x.x), __simd_ushort(x.y)) }

@inlinable
public func simd_ushort(_ x: simd_float3) -> simd_ushort3 { .init(__simd_ushort(x.x), __simd_ushort(x.y), __simd_ushort(x.z)) }

@inlinable
public func simd_ushort(_ x: simd_float4) -> simd_ushort4 { .init(__simd_ushort(x.x), __simd_ushort(x.y), __simd_ushort(x.z), __simd_ushort(x.w)) }

@inlinable
public func simd_ushort(_ x: simd_float8) -> simd_ushort8 { .init(__simd_ushort(x[0]), __simd_ushort(x[1]), __simd_ushort(x[2]), __simd_ushort(x[3]), __simd_ushort(x[4]), __simd_ushort(x[5]), __simd_ushort(x[6]), __simd_ushort(x[7])) }

@inlinable
public func simd_ushort(_ x: simd_float16) -> simd_ushort16 { .init(__simd_ushort(x[0]), __simd_ushort(x[1]), __simd_ushort(x[2]), __simd_ushort(x[3]), __simd_ushort(x[4]), __simd_ushort(x[5]), __simd_ushort(x[6]), __simd_ushort(x[7]), __simd_ushort(x[8]), __simd_ushort(x[9]), __simd_ushort(x[10]), __simd_ushort(x[11]), __simd_ushort(x[12]), __simd_ushort(x[13]), __simd_ushort(x[14]), __simd_ushort(x[15])) }

@inlinable
public func simd_ushort(_ x: simd_double2) -> simd_ushort2 { .init(__simd_ushort(x.x), __simd_ushort(x.y)) }

@inlinable
public func simd_ushort(_ x: simd_double3) -> simd_ushort3 { .init(__simd_ushort(x.x), __simd_ushort(x.y), __simd_ushort(x.z)) }

@inlinable
public func simd_ushort(_ x: simd_double4) -> simd_ushort4 { .init(__simd_ushort(x.x), __simd_ushort(x.y), __simd_ushort(x.z), __simd_ushort(x.w)) }

@inlinable
public func simd_ushort(_ x: simd_double8) -> simd_ushort8 { .init(__simd_ushort(x[0]), __simd_ushort(x[1]), __simd_ushort(x[2]), __simd_ushort(x[3]), __simd_ushort(x[4]), __simd_ushort(x[5]), __simd_ushort(x[6]), __simd_ushort(x[7])) }
