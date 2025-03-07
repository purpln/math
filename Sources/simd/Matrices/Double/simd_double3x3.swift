import math

/// A matrix with 3 rows and 3 columns.
public struct simd_double3x3: Equatable, Sendable, CustomDebugStringConvertible {

    public var columns: (simd_double3, simd_double3, simd_double3)



    /// Initializes a zero matrix.
    @inlinable
    public init() { columns = (.zero, .zero, .zero) }


    /// Columnwise initializer.
    @inlinable
    public init(columns: (simd_double3, simd_double3, simd_double3)) { self.columns = columns }


    /// Initialzes a matrix having *scalar* on main diagonal and zeros elsewhere.
    @inlinable
    public init(_ scalar: Double) {
        columns = (.init(scalar, 0.0, 0.0),
                   .init(0.0, scalar, 0.0),
                   .init(0.0, 0.0, scalar))
    }


    /// Initialzes a matrix having given main *diagonal* and zeros elsewhere.
    @inlinable
    public init(diagonal: SIMD3<Double>) {
        columns = (.init(diagonal.x, 0.0, 0.0),
                   .init(0.0, diagonal.y, 0.0),
                   .init(0.0, 0.0, diagonal.z))
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ columns: [SIMD3<Double>]) { self.columns = (columns[0], columns[1], columns[2]) }


    /// Rowwise initializer.
    @inlinable
    public init(rows: [SIMD3<Double>]) {
        columns = (.init(rows[0].x, rows[1].x, rows[2].x),
                   .init(rows[0].y, rows[1].y, rows[2].y),
                   .init(rows[0].z, rows[1].z, rows[2].z))
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ col0: SIMD3<Double>, _ col1: SIMD3<Double>, _ col2: SIMD3<Double>) { self.columns = (col0, col1, col2) }


    /// Initializes a rotation matrix by given *quaternion*.
    @inlinable
    public init(_ quaternion: simd_quatd) {
        columns = (.init(1.0 - 2.0 * (quaternion.vector.y * quaternion.vector.y + quaternion.vector.z * quaternion.vector.z),
                               2.0 * (quaternion.vector.x * quaternion.vector.y + quaternion.vector.z * quaternion.vector.w),
                               2.0 * (quaternion.vector.x * quaternion.vector.z - quaternion.vector.y * quaternion.vector.w)),
                   .init(      2.0 * (quaternion.vector.x * quaternion.vector.y - quaternion.vector.z * quaternion.vector.w),
                         1.0 - 2.0 * (quaternion.vector.x * quaternion.vector.x + quaternion.vector.z * quaternion.vector.z),
                               2.0 * (quaternion.vector.y * quaternion.vector.z + quaternion.vector.x * quaternion.vector.w)),
                   .init(      2.0 * (quaternion.vector.x * quaternion.vector.z + quaternion.vector.y * quaternion.vector.w),
                               2.0 * (quaternion.vector.y * quaternion.vector.z - quaternion.vector.x * quaternion.vector.w),
                         1.0 - 2.0 * (quaternion.vector.x * quaternion.vector.x + quaternion.vector.y * quaternion.vector.y)))
    }



    // MARK: : Equatable

    @inlinable
    public static func ==(lhs: simd_double3x3, rhs: simd_double3x3) -> Bool { lhs.columns == rhs.columns }



    // MARK: : CustomDebugStringConvertible

    @inlinable
    public var debugDescription: String { "simd_double3x3([[\(columns.0.x), \(columns.0.y), \(columns.0.z)], [\(columns.1.x), \(columns.1.y), \(columns.1.z)], [\(columns.2.x), \(columns.2.y), \(columns.2.z)]])" }



    // MARK: Subscripts

    /// - Returns: The receiver's column at given index.
    @inlinable
    public subscript(column: Int) -> SIMD3<Double> {
        get {
            switch column {
            case 0:
                return columns.0
            case 1:
                return columns.1
            case 2:
                return columns.2
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
            default:
                preconditionFailure("Failed to set element [\(column), \(row)] in \(Self.self). An index is out of range")
            }
        }
    }



    // MARK: Operations

    /// Transpose of the receiver.
    @inlinable
    public var transpose: double3x3 {
        .init(.init(columns.0.x, columns.1.x, columns.2.x),
              .init(columns.0.y, columns.1.y, columns.2.y),
              .init(columns.0.z, columns.1.z, columns.2.z))
    }

    /// Inverse of the receiver. The resulting matrix is undefined when the inverse doesn't exist.
    @available(macOS 10.10, iOS 8.0, tvOS 10.0, watchOS 3.0, *)
    @inlinable
    public var inverse: simd_double3x3 {
        let col0 = simd_double3(columns.1.y * columns.2.z - columns.1.z * columns.2.y,
                                columns.0.z * columns.2.y - columns.0.y * columns.2.z,
                                columns.0.y * columns.1.z - columns.0.z * columns.1.y)

        let col1 = simd_double3(columns.1.z * columns.2.x - columns.1.x * columns.2.z,
                                columns.0.x * columns.2.z - columns.0.z * columns.2.x,
                                columns.0.z * columns.1.x - columns.0.x * columns.1.z)

        let col2 = simd_double3(columns.1.x * columns.2.y - columns.1.y * columns.2.x,
                                columns.0.y * columns.2.x - columns.0.x * columns.2.y,
                                columns.0.x * columns.1.y - columns.0.y * columns.1.x)

        let determinant⁻¹ = 1.0 / (columns.0.x * col0.x + columns.1.x * col0.y + columns.2.x * col0.z)

        return simd_double3x3(determinant⁻¹ * col0,
                              determinant⁻¹ * col1,
                              determinant⁻¹ * col2)
    }

    /// Determinant of the receiver.
    @inlinable
    public var determinant: Double {
        simd_reduce_add(columns.0 * ((shiftLeft1(columns.1) * shiftLeft2(columns.2)) as simd_double3 -
                                     (shiftLeft2(columns.1) * shiftLeft1(columns.2)) as simd_double3))
    }



    // MARK: Operators

    /// - Returns: Negated matrix.
    @inlinable
    public static prefix func -(rhs: simd_double3x3) -> simd_double3x3 { .init(-rhs.columns.0, -rhs.columns.1, -rhs.columns.2) }


    /// - Returns: Sum of given matrices.
    @inlinable
    public static func +(lhs: simd_double3x3, rhs: simd_double3x3) -> simd_double3x3 {
        .init(lhs.columns.0 + rhs.columns.0,
              lhs.columns.1 + rhs.columns.1,
              lhs.columns.2 + rhs.columns.2)
    }


    /// - Returns: Subtraction of given matrices.
    @inlinable
    public static func -(lhs: simd_double3x3, rhs: simd_double3x3) -> simd_double3x3 {
        .init(lhs.columns.0 - rhs.columns.0,
              lhs.columns.1 - rhs.columns.1,
              lhs.columns.2 - rhs.columns.2)
    }


    /// Adds *rhs* to *lhs* in place.
    @inlinable
    public static func +=(lhs: inout simd_double3x3, rhs: simd_double3x3) {
        lhs.columns.0 += rhs.columns.0
        lhs.columns.1 += rhs.columns.1
        lhs.columns.2 += rhs.columns.2
    }


    /// Subtracts *rhs* from *lhs* in place.
    @inlinable
    public static func -=(lhs: inout simd_double3x3, rhs: simd_double3x3) {
        lhs.columns.0 -= rhs.columns.0
        lhs.columns.1 -= rhs.columns.1
        lhs.columns.2 -= rhs.columns.2
    }


    /// - Returns: Scaled *rhs* by *lhs*.
    @inlinable
    public static func *(lhs: Double, rhs: simd_double3x3) -> simd_double3x3 { .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2) }


    /// - Returns: Scaled *lhs* by *rhs*.
    @inlinable
    public static func *(lhs: simd_double3x3, rhs: Double) -> simd_double3x3 { .init(rhs * lhs.columns.0, rhs * lhs.columns.1, rhs * lhs.columns.2) }


    /// Scales *lhs* by *rhs* in place.
    @inlinable
    public static func *=(lhs: inout simd_double3x3, rhs: Double) {
        lhs.columns.0 *= rhs
        lhs.columns.1 *= rhs
        lhs.columns.2 *= rhs
    }


    /// - Returns: Product of *lhs* matrix and *rhs* vector as a single column matrix.
    @inlinable
    public static func *(lhs: simd_double3x3, rhs: SIMD3<Double>) -> SIMD3<Double> {
        .init(lhs.columns.0.x * rhs.x + lhs.columns.1.x * rhs.y + lhs.columns.2.x * rhs.z,
              lhs.columns.0.y * rhs.x + lhs.columns.1.y * rhs.y + lhs.columns.2.y * rhs.z,
              lhs.columns.0.z * rhs.x + lhs.columns.1.z * rhs.y + lhs.columns.2.z * rhs.z)
    }


    /// - Returns: Product of *lhs* vector as a single row matrix and *rhs* matrix.
    @inlinable
    public static func *(lhs: SIMD3<Double>, rhs: simd_double3x3) -> SIMD3<Double> {
        .init(dot(lhs, rhs.columns.0),
              dot(lhs, rhs.columns.1),
              dot(lhs, rhs.columns.2))
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double3x3, rhs: double2x3) -> double2x3 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double3x3, rhs: double3x3) -> double3x3 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double3x3, rhs: double4x3) -> double4x3 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2, lhs * rhs.columns.3)
    }


    /// Multiplies *lhs* by *rhs* matrix in place.
    @inlinable
    public static func *=(lhs: inout simd_double3x3, rhs: double3x3) { lhs = lhs * rhs }

}
