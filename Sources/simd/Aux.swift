// MARK: - makeInt

/// - Returns: Value all of 1 or 0 bits whether *flag* is `true`.
@inline(__always)
@usableFromInline
internal func makeInt(_ flag: Bool) -> simd_int1 { flag ? ~0 : 0 }


// MARK: - makeLong

/// - Returns: Value all of 1 or 0 bits whether *flag* is `true`.
@inline(__always)
@usableFromInline
internal func makeLong(_ flag: Bool) -> simd_long1 { flag ? ~0 : 0 }


// MARK: - shiftLeft1

/// - Returns: Cyclic shift of *x* by 1.
@inline(__always)
@usableFromInline
internal func shiftLeft1(_ x: simd_float3) -> simd_float3 { .init(x.y, x.z, x.x) }

/// - Returns: Cyclic shift of *x* by 1.
@inline(__always)
@usableFromInline
internal func shiftLeft1(_ x: simd_float4) -> simd_float4 { .init(x.y, x.z, x.w, x.x) }

/// - Returns: Cyclic shift of *x* by 1.
@inline(__always)
@usableFromInline
internal func shiftLeft1(_ x: simd_double3) -> simd_double3 { .init(x.y, x.z, x.x) }

/// - Returns: Cyclic shift of *x* by 1.
@inline(__always)
@usableFromInline
internal func shiftLeft1(_ x: simd_double4) -> simd_double4 { .init(x.y, x.z, x.w, x.x) }


// MARK: - shiftLeft2

/// - Returns: Cyclic shift of *x* by 2.
@inline(__always)
@usableFromInline
internal func shiftLeft2(_ x: simd_float3) -> simd_float3 { .init(x.z, x.x, x.y) }

/// - Returns: Cyclic shift of *x* by 2.
@inline(__always)
@usableFromInline
internal func shiftLeft2(_ x: simd_float4) -> simd_float4 { .init(x.z, x.w, x.x, x.y) }

/// - Returns: Cyclic shift of *x* by 2.
@inline(__always)
@usableFromInline
internal func shiftLeft2(_ x: simd_double3) -> simd_double3 { .init(x.z, x.x, x.y) }

/// - Returns: Cyclic shift of *x* by 2.
@inline(__always)
@usableFromInline
internal func shiftLeft2(_ x: simd_double4) -> simd_double4 { .init(x.z, x.w, x.x, x.y) }


// MARK: - shiftLeft3

/// - Returns: Cyclic shift of *x* by 3.
@inline(__always)
@usableFromInline
internal func shiftLeft3(_ x: simd_float4) -> simd_float4 { .init(x.w, x.x, x.y, x.z) }

/// - Returns: Cyclic shift of *x* by 3.
@inline(__always)
@usableFromInline
internal func shiftLeft3(_ x: simd_double4) -> simd_double4 { .init(x.w, x.x, x.y, x.z) }
