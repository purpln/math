@inline(__always)
@usableFromInline
internal func __simd_int_rte(_ x: Float) -> simd_int1 { x < 0x1.0p31 && x >= -0x1.0p31 ? simd_int1(x.rounded(.toNearestOrEven)) : simd_int1.min }

@inlinable
public func simd_int_rte(_ x: simd_float2) -> simd_int2 { .init(__simd_int_rte(x.x), __simd_int_rte(x.y)) }

@inlinable
public func simd_int_rte(_ x: simd_float3) -> simd_int3 { .init(__simd_int_rte(x.x), __simd_int_rte(x.y), __simd_int_rte(x.z)) }

@inlinable
public func simd_int_rte(_ x: simd_float4) -> simd_int4 { .init(__simd_int_rte(x.x), __simd_int_rte(x.y), __simd_int_rte(x.z), __simd_int_rte(x.w)) }

@inlinable
public func simd_int_rte(_ x: simd_float8) -> simd_int8 { .init(__simd_int_rte(x[0]), __simd_int_rte(x[1]), __simd_int_rte(x[2]), __simd_int_rte(x[3]), __simd_int_rte(x[4]), __simd_int_rte(x[5]), __simd_int_rte(x[6]), __simd_int_rte(x[7])) }

@inlinable
public func simd_int_rte(_ x: simd_float16) -> simd_int16 { .init(__simd_int_rte(x[0]), __simd_int_rte(x[1]), __simd_int_rte(x[2]), __simd_int_rte(x[3]), __simd_int_rte(x[4]), __simd_int_rte(x[5]), __simd_int_rte(x[6]), __simd_int_rte(x[7]), __simd_int_rte(x[8]), __simd_int_rte(x[9]), __simd_int_rte(x[10]), __simd_int_rte(x[11]), __simd_int_rte(x[12]), __simd_int_rte(x[13]), __simd_int_rte(x[14]), __simd_int_rte(x[15])) }
