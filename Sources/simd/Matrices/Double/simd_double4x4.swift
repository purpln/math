import math

/// A matrix with 4 rows and 4 columns.
public struct simd_double4x4: Equatable, Sendable, CustomDebugStringConvertible {

    public var columns: (simd_double4, simd_double4, simd_double4, simd_double4)



    /// Initializes a zero matrix.
    @inlinable
    public init() { columns = (.zero, .zero, .zero, .zero) }


    /// Columnwise initializer.
    @inlinable
    public init(columns: (simd_double4, simd_double4, simd_double4, simd_double4)) { self.columns = columns }


    /// Initialzes a matrix having *scalar* on main diagonal and zeros elsewhere.
    @inlinable
    public init(_ scalar: Double) {
        columns = (.init(scalar, 0.0, 0.0, 0.0),
                   .init(0.0, scalar, 0.0, 0.0),
                   .init(0.0, 0.0, scalar, 0.0),
                   .init(0.0, 0.0, 0.0, scalar))
    }


    /// Initialzes a matrix having given main *diagonal* and zeros elsewhere.
    @inlinable
    public init(diagonal: SIMD4<Double>) {
        columns = (.init(diagonal.x, 0.0, 0.0, 0.0),
                   .init(0.0, diagonal.y, 0.0, 0.0),
                   .init(0.0, 0.0, diagonal.z, 0.0),
                   .init(0.0, 0.0, 0.0, diagonal.w))
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ columns: [SIMD4<Double>]) { self.columns = (columns[0], columns[1], columns[2], columns[3]) }


    /// Rowwise initializer.
    @inlinable
    public init(rows: [SIMD4<Double>]) {
        columns = (.init(rows[0].x, rows[1].x, rows[2].x, rows[3].x),
                   .init(rows[0].y, rows[1].y, rows[2].y, rows[3].y),
                   .init(rows[0].z, rows[1].z, rows[2].z, rows[3].z),
                   .init(rows[0].w, rows[1].w, rows[2].w, rows[3].w))
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ col0: SIMD4<Double>, _ col1: SIMD4<Double>, _ col2: SIMD4<Double>, _ col3: SIMD4<Double>) { self.columns = (col0, col1, col2, col3) }


    /// Initializes a rotation matrix by given *quaternion*.
    @inlinable
    public init(_ quaternion: simd_quatd) {
        columns = (.init(1.0 - 2.0 * (quaternion.vector.y * quaternion.vector.y + quaternion.vector.z * quaternion.vector.z),
                               2.0 * (quaternion.vector.x * quaternion.vector.y + quaternion.vector.z * quaternion.vector.w),
                               2.0 * (quaternion.vector.x * quaternion.vector.z - quaternion.vector.y * quaternion.vector.w),
                         0.0),
                   .init(      2.0 * (quaternion.vector.x * quaternion.vector.y - quaternion.vector.z * quaternion.vector.w),
                         1.0 - 2.0 * (quaternion.vector.x * quaternion.vector.x + quaternion.vector.z * quaternion.vector.z),
                               2.0 * (quaternion.vector.y * quaternion.vector.z + quaternion.vector.x * quaternion.vector.w),
                         0.0),
                   .init(      2.0 * (quaternion.vector.x * quaternion.vector.z + quaternion.vector.y * quaternion.vector.w),
                               2.0 * (quaternion.vector.y * quaternion.vector.z - quaternion.vector.x * quaternion.vector.w),
                         1.0 - 2.0 * (quaternion.vector.x * quaternion.vector.x + quaternion.vector.y * quaternion.vector.y),
                         0.0),
                   [ 0.0, 0.0, 0.0, 1.0 ])
    }



    // MARK: : Equatable

    @inlinable
    public static func ==(lhs: simd_double4x4, rhs: simd_double4x4) -> Bool { lhs.columns == rhs.columns }



    // MARK: : CustomDebugStringConvertible

    @inlinable
    public var debugDescription: String { "simd_double4x4([[\(columns.0.x), \(columns.0.y), \(columns.0.z), \(columns.0.w)], [\(columns.1.x), \(columns.1.y), \(columns.1.z), \(columns.1.w)], [\(columns.2.x), \(columns.2.y), \(columns.2.z), \(columns.2.w)], [\(columns.3.x), \(columns.3.y), \(columns.3.z), \(columns.3.w)]])" }



    // MARK: Subscripts

    /// - Returns: The receiver's column at given index.
    @inlinable
    public subscript(column: Int) -> SIMD4<Double> {
        get {
            switch column {
            case 0:
                return columns.0
            case 1:
                return columns.1
            case 2:
                return columns.2
            case 3:
                return columns.3
            default:
                preconditionFailure("Failed to get column [\(column)] from \(Self.self). Index is out of range")
            }
        }
        set {
            switch column {
            case 0:
                columns.0 = newValue
            case 1:
                columns.1 = newValue
            case 2:
                columns.2 = newValue
            case 3:
                columns.3 = newValue
            default:
                preconditionFailure("Failed to set column [\(column)] in \(Self.self). Index is out of range")
            }
        }
    }


    /// - Returns: The receiver's element at given *column* and *row* indices.
    @inlinable
    public subscript(column: Int, row: Int) -> Double {
        get {
            switch column {
            case 0:
                return columns.0[row]
            case 1:
                return columns.1[row]
            case 2:
                return columns.2[row]
            case 3:
                return columns.3[row]
            default:
                preconditionFailure("Failed to get element [\(column), \(row)] from \(Self.self). An index is out of range")
            }
        }
        set {
            switch column {
            case 0:
                columns.0[row] = newValue
            case 1:
                columns.1[row] = newValue
            case 2:
                columns.2[row] = newValue
            case 3:
                columns.3[row] = newValue
            default:
                preconditionFailure("Failed to set element [\(column), \(row)] in \(Self.self). An index is out of range")
            }
        }
    }



    // MARK: Operations

    /// Transpose of the receiver.
    @inlinable
    public var transpose: double4x4 {
        .init(.init(columns.0.x, columns.1.x, columns.2.x, columns.3.x),
              .init(columns.0.y, columns.1.y, columns.2.y, columns.3.y),
              .init(columns.0.z, columns.1.z, columns.2.z, columns.3.z),
              .init(columns.0.w, columns.1.w, columns.2.w, columns.3.w))
    }

    /// Column at index 0 of the inverse matrix scaled by the determinant.
    @inline(__always)
    @usableFromInline
    internal var inverseColumn0: simd_double4 {
        .init(columns.2.y * columns.3.z * columns.1.w - columns.3.y * columns.2.z * columns.1.w + columns.3.y * columns.1.z * columns.2.w - columns.1.y * columns.3.z * columns.2.w - columns.2.y * columns.1.z * columns.3.w + columns.1.y * columns.2.z * columns.3.w,
              columns.3.y * columns.2.z * columns.0.w - columns.2.y * columns.3.z * columns.0.w - columns.3.y * columns.0.z * columns.2.w + columns.0.y * columns.3.z * columns.2.w + columns.2.y * columns.0.z * columns.3.w - columns.0.y * columns.2.z * columns.3.w,
              columns.1.y * columns.3.z * columns.0.w - columns.3.y * columns.1.z * columns.0.w + columns.3.y * columns.0.z * columns.1.w - columns.0.y * columns.3.z * columns.1.w - columns.1.y * columns.0.z * columns.3.w + columns.0.y * columns.1.z * columns.3.w,
              columns.2.y * columns.1.z * columns.0.w - columns.1.y * columns.2.z * columns.0.w - columns.2.y * columns.0.z * columns.1.w + columns.0.y * columns.2.z * columns.1.w + columns.1.y * columns.0.z * columns.2.w - columns.0.y * columns.1.z * columns.2.w)
    }
    /// Column at index 1 of the inverse matrix scaled by the determinant.
    @inline(__always)
    @usableFromInline
    internal var inverseColumn1: simd_double4 {
        .init(columns.3.x * columns.2.z * columns.1.w - columns.2.x * columns.3.z * columns.1.w - columns.3.x * columns.1.z * columns.2.w + columns.1.x * columns.3.z * columns.2.w + columns.2.x * columns.1.z * columns.3.w - columns.1.x * columns.2.z * columns.3.w,
              columns.2.x * columns.3.z * columns.0.w - columns.3.x * columns.2.z * columns.0.w + columns.3.x * columns.0.z * columns.2.w - columns.0.x * columns.3.z * columns.2.w - columns.2.x * columns.0.z * columns.3.w + columns.0.x * columns.2.z * columns.3.w,
              columns.3.x * columns.1.z * columns.0.w - columns.1.x * columns.3.z * columns.0.w - columns.3.x * columns.0.z * columns.1.w + columns.0.x * columns.3.z * columns.1.w + columns.1.x * columns.0.z * columns.3.w - columns.0.x * columns.1.z * columns.3.w,
              columns.1.x * columns.2.z * columns.0.w - columns.2.x * columns.1.z * columns.0.w + columns.2.x * columns.0.z * columns.1.w - columns.0.x * columns.2.z * columns.1.w - columns.1.x * columns.0.z * columns.2.w + columns.0.x * columns.1.z * columns.2.w)
    }
    /// Column at index 2 of the inverse matrix scaled by the determinant.
    @inline(__always)
    @usableFromInline
    internal var inverseColumn2: simd_double4 {
        .init(columns.2.x * columns.3.y * columns.1.w - columns.3.x * columns.2.y * columns.1.w + columns.3.x * columns.1.y * columns.2.w - columns.1.x * columns.3.y * columns.2.w - columns.2.x * columns.1.y * columns.3.w + columns.1.x * columns.2.y * columns.3.w,
              columns.3.x * columns.2.y * columns.0.w - columns.2.x * columns.3.y * columns.0.w - columns.3.x * columns.0.y * columns.2.w + columns.0.x * columns.3.y * columns.2.w + columns.2.x * columns.0.y * columns.3.w - columns.0.x * columns.2.y * columns.3.w,
              columns.1.x * columns.3.y * columns.0.w - columns.3.x * columns.1.y * columns.0.w + columns.3.x * columns.0.y * columns.1.w - columns.0.x * columns.3.y * columns.1.w - columns.1.x * columns.0.y * columns.3.w + columns.0.x * columns.1.y * columns.3.w,
              columns.2.x * columns.1.y * columns.0.w - columns.1.x * columns.2.y * columns.0.w - columns.2.x * columns.0.y * columns.1.w + columns.0.x * columns.2.y * columns.1.w + columns.1.x * columns.0.y * columns.2.w - columns.0.x * columns.1.y * columns.2.w)
    }
    /// Column at index 3 of the inverse matrix scaled by the determinant.
    @inline(__always)
    @usableFromInline
    internal var inverseColumn3: simd_double4 {
        .init(columns.3.x * columns.2.y * columns.1.z - columns.2.x * columns.3.y * columns.1.z - columns.3.x * columns.1.y * columns.2.z + columns.1.x * columns.3.y * columns.2.z + columns.2.x * columns.1.y * columns.3.z - columns.1.x * columns.2.y * columns.3.z,
              columns.2.x * columns.3.y * columns.0.z - columns.3.x * columns.2.y * columns.0.z + columns.3.x * columns.0.y * columns.2.z - columns.0.x * columns.3.y * columns.2.z - columns.2.x * columns.0.y * columns.3.z + columns.0.x * columns.2.y * columns.3.z,
              columns.3.x * columns.1.y * columns.0.z - columns.1.x * columns.3.y * columns.0.z - columns.3.x * columns.0.y * columns.1.z + columns.0.x * columns.3.y * columns.1.z + columns.1.x * columns.0.y * columns.3.z - columns.0.x * columns.1.y * columns.3.z,
              columns.1.x * columns.2.y * columns.0.z - columns.2.x * columns.1.y * columns.0.z + columns.2.x * columns.0.y * columns.1.z - columns.0.x * columns.2.y * columns.1.z - columns.1.x * columns.0.y * columns.2.z + columns.0.x * columns.1.y * columns.2.z)
    }

    /// Inverse of the receiver. The resulting matrix is undefined when the inverse doesn't exist.
    @available(macOS 10.10, iOS 8.0, tvOS 10.0, watchOS 3.0, *)
    @inlinable
    public var inverse: simd_double4x4 {
        var m = simd_double4x4(inverseColumn0, inverseColumn1, inverseColumn2, inverseColumn3)
        m *= (1.0 as Double) / (columns.0.x * m.columns.0.x + columns.1.x * m.columns.0.y + columns.2.x * m.columns.0.z + columns.3.x * m.columns.0.w)
        return m
    }

    /// Determinant of the receiver.
    @inlinable
    public var determinant: Double {
        let c: simd_double4 = columns.0 * ((shiftLeft1(columns.1) * ((shiftLeft2(columns.2) * shiftLeft3(columns.3)) as simd_double4 - (shiftLeft3(columns.2) * shiftLeft2(columns.3)) as simd_double4)) as simd_double4 +
                                           (shiftLeft2(columns.1) * ((shiftLeft3(columns.2) * shiftLeft1(columns.3)) as simd_double4 - (shiftLeft1(columns.2) * shiftLeft3(columns.3)) as simd_double4)) as simd_double4 +
                                           (shiftLeft3(columns.1) * ((shiftLeft1(columns.2) * shiftLeft2(columns.3)) as simd_double4 - (shiftLeft2(columns.2) * shiftLeft1(columns.3)) as simd_double4)) as simd_double4)
        return simd_reduce_add(c.evenHalf - c.oddHalf)
    }



    // MARK: Operators

    /// - Returns: Negated matrix.
    @inlinable
    public static prefix func -(rhs: simd_double4x4) -> simd_double4x4 { .init(-rhs.columns.0, -rhs.columns.1, -rhs.columns.2, -rhs.columns.3) }


    /// - Returns: Sum of given matrices.
    @inlinable
    public static func +(lhs: simd_double4x4, rhs: simd_double4x4) -> simd_double4x4 {
        .init(lhs.columns.0 + rhs.columns.0,
              lhs.columns.1 + rhs.columns.1,
              lhs.columns.2 + rhs.columns.2,
              lhs.columns.3 + rhs.columns.3)
    }


    /// - Returns: Subtraction of given matrices.
    @inlinable
    public static func -(lhs: simd_double4x4, rhs: simd_double4x4) -> simd_double4x4 {
        .init(lhs.columns.0 - rhs.columns.0,
              lhs.columns.1 - rhs.columns.1,
              lhs.columns.2 - rhs.columns.2,
              lhs.columns.3 - rhs.columns.3)
    }


    /// Adds *rhs* to *lhs* in place.
    @inlinable
    public static func +=(lhs: inout simd_double4x4, rhs: simd_double4x4) {
        lhs.columns.0 += rhs.columns.0
        lhs.columns.1 += rhs.columns.1
        lhs.columns.2 += rhs.columns.2
        lhs.columns.3 += rhs.columns.3
    }


    /// Subtracts *rhs* from *lhs* in place.
    @inlinable
    public static func -=(lhs: inout simd_double4x4, rhs: simd_double4x4) {
        lhs.columns.0 -= rhs.columns.0
        lhs.columns.1 -= rhs.columns.1
        lhs.columns.2 -= rhs.columns.2
        lhs.columns.3 -= rhs.columns.3
    }


    /// - Returns: Scaled *rhs* by *lhs*.
    @inlinable
    public static func *(lhs: Double, rhs: simd_double4x4) -> simd_double4x4 { .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2, lhs * rhs.columns.3) }


    /// - Returns: Scaled *lhs* by *rhs*.
    @inlinable
    public static func *(lhs: simd_double4x4, rhs: Double) -> simd_double4x4 { .init(rhs * lhs.columns.0, rhs * lhs.columns.1, rhs * lhs.columns.2, rhs * lhs.columns.3) }


    /// Scales *lhs* by *rhs* in place.
    @inlinable
    public static func *=(lhs: inout simd_double4x4, rhs: Double) {
        lhs.columns.0 *= rhs
        lhs.columns.1 *= rhs
        lhs.columns.2 *= rhs
        lhs.columns.3 *= rhs
    }


    /// - Returns: Product of *lhs* matrix and *rhs* vector as a single column matrix.
    @inlinable
    public static func *(lhs: simd_double4x4, rhs: SIMD4<Double>) -> SIMD4<Double> {
        .init(lhs.columns.0.x * rhs.x + lhs.columns.1.x * rhs.y + lhs.columns.2.x * rhs.z + lhs.columns.3.x * rhs.w,
              lhs.columns.0.y * rhs.x + lhs.columns.1.y * rhs.y + lhs.columns.2.y * rhs.z + lhs.columns.3.y * rhs.w,
              lhs.columns.0.z * rhs.x + lhs.columns.1.z * rhs.y + lhs.columns.2.z * rhs.z + lhs.columns.3.z * rhs.w,
              lhs.columns.0.w * rhs.x + lhs.columns.1.w * rhs.y + lhs.columns.2.w * rhs.z + lhs.columns.3.w * rhs.w)
    }


    /// - Returns: Product of *lhs* vector as a single row matrix and *rhs* matrix.
    @inlinable
    public static func *(lhs: SIMD4<Double>, rhs: simd_double4x4) -> SIMD4<Double> {
        .init(dot(lhs, rhs.columns.0),
              dot(lhs, rhs.columns.1),
              dot(lhs, rhs.columns.2),
              dot(lhs, rhs.columns.3))
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double4x4, rhs: double2x4) -> double2x4 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double4x4, rhs: double3x4) -> double3x4 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double4x4, rhs: double4x4) -> double4x4 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2, lhs * rhs.columns.3)
    }


    /// Multiplies *lhs* by *rhs* matrix in place.
    @inlinable
    public static func *=(lhs: inout simd_double4x4, rhs: double4x4) { lhs = lhs * rhs }

}
