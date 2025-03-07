import math

/// A matrix with 4 rows and 3 columns.
public struct simd_double3x4: Equatable, Sendable, CustomDebugStringConvertible {

    public var columns: (simd_double4, simd_double4, simd_double4)



    /// Initializes a zero matrix.
    @inlinable
    public init() { columns = (.zero, .zero, .zero) }


    /// Columnwise initializer.
    @inlinable
    public init(columns: (simd_double4, simd_double4, simd_double4)) { self.columns = columns }


    /// Initialzes a matrix having *scalar* on main diagonal and zeros elsewhere.
    @inlinable
    public init(_ scalar: Double) {
        columns = (.init(scalar, 0.0, 0.0, 0.0),
                   .init(0.0, scalar, 0.0, 0.0),
                   .init(0.0, 0.0, scalar, 0.0))
    }


    /// Initialzes a matrix having given main *diagonal* and zeros elsewhere.
    @inlinable
    public init(diagonal: SIMD3<Double>) {
        columns = (.init(diagonal.x, 0.0, 0.0, 0.0),
                   .init(0.0, diagonal.y, 0.0, 0.0),
                   .init(0.0, 0.0, diagonal.z, 0.0))
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ columns: [SIMD4<Double>]) { self.columns = (columns[0], columns[1], columns[2]) }


    /// Rowwise initializer.
    @inlinable
    public init(rows: [SIMD3<Double>]) {
        columns = (.init(rows[0].x, rows[1].x, rows[2].x, rows[3].x),
                   .init(rows[0].y, rows[1].y, rows[2].y, rows[3].y),
                   .init(rows[0].z, rows[1].z, rows[2].z, rows[3].z))
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ col0: SIMD4<Double>, _ col1: SIMD4<Double>, _ col2: SIMD4<Double>) { self.columns = (col0, col1, col2) }



    // MARK: : Equatable

    @inlinable
    public static func ==(lhs: simd_double3x4, rhs: simd_double3x4) -> Bool { lhs.columns == rhs.columns }



    // MARK: : CustomDebugStringConvertible

    @inlinable
    public var debugDescription: String { "simd_double3x4([[\(columns.0.x), \(columns.0.y), \(columns.0.z), \(columns.0.w)], [\(columns.1.x), \(columns.1.y), \(columns.1.z), \(columns.1.w)], [\(columns.2.x), \(columns.2.y), \(columns.2.z), \(columns.2.w)]])" }



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
    public var transpose: double4x3 {
        .init(.init(columns.0.x, columns.1.x, columns.2.x),
              .init(columns.0.y, columns.1.y, columns.2.y),
              .init(columns.0.z, columns.1.z, columns.2.z),
              .init(columns.0.w, columns.1.w, columns.2.w))
    }



    // MARK: Operators

    /// - Returns: Negated matrix.
    @inlinable
    public static prefix func -(rhs: simd_double3x4) -> simd_double3x4 { .init(-rhs.columns.0, -rhs.columns.1, -rhs.columns.2) }


    /// - Returns: Sum of given matrices.
    @inlinable
    public static func +(lhs: simd_double3x4, rhs: simd_double3x4) -> simd_double3x4 {
        .init(lhs.columns.0 + rhs.columns.0,
              lhs.columns.1 + rhs.columns.1,
              lhs.columns.2 + rhs.columns.2)
    }


    /// - Returns: Subtraction of given matrices.
    @inlinable
    public static func -(lhs: simd_double3x4, rhs: simd_double3x4) -> simd_double3x4 {
        .init(lhs.columns.0 - rhs.columns.0,
              lhs.columns.1 - rhs.columns.1,
              lhs.columns.2 - rhs.columns.2)
    }


    /// Adds *rhs* to *lhs* in place.
    @inlinable
    public static func +=(lhs: inout simd_double3x4, rhs: simd_double3x4) {
        lhs.columns.0 += rhs.columns.0
        lhs.columns.1 += rhs.columns.1
        lhs.columns.2 += rhs.columns.2
    }


    /// Subtracts *rhs* from *lhs* in place.
    @inlinable
    public static func -=(lhs: inout simd_double3x4, rhs: simd_double3x4) {
        lhs.columns.0 -= rhs.columns.0
        lhs.columns.1 -= rhs.columns.1
        lhs.columns.2 -= rhs.columns.2
    }


    /// - Returns: Scaled *rhs* by *lhs*.
    @inlinable
    public static func *(lhs: Double, rhs: simd_double3x4) -> simd_double3x4 { .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2) }


    /// - Returns: Scaled *lhs* by *rhs*.
    @inlinable
    public static func *(lhs: simd_double3x4, rhs: Double) -> simd_double3x4 { .init(rhs * lhs.columns.0, rhs * lhs.columns.1, rhs * lhs.columns.2) }


    /// Scales *lhs* by *rhs* in place.
    @inlinable
    public static func *=(lhs: inout simd_double3x4, rhs: Double) {
        lhs.columns.0 *= rhs
        lhs.columns.1 *= rhs
        lhs.columns.2 *= rhs
    }


    /// - Returns: Product of *lhs* matrix and *rhs* vector as a single column matrix.
    @inlinable
    public static func *(lhs: simd_double3x4, rhs: SIMD3<Double>) -> SIMD4<Double> {
        .init(lhs.columns.0.x * rhs.x + lhs.columns.1.x * rhs.y + lhs.columns.2.x * rhs.z,
              lhs.columns.0.y * rhs.x + lhs.columns.1.y * rhs.y + lhs.columns.2.y * rhs.z,
              lhs.columns.0.z * rhs.x + lhs.columns.1.z * rhs.y + lhs.columns.2.z * rhs.z,
              lhs.columns.0.w * rhs.x + lhs.columns.1.w * rhs.y + lhs.columns.2.w * rhs.z)
    }


    /// - Returns: Product of *lhs* vector as a single row matrix and *rhs* matrix.
    @inlinable
    public static func *(lhs: SIMD4<Double>, rhs: simd_double3x4) -> SIMD3<Double> {
        .init(dot(lhs, rhs.columns.0),
              dot(lhs, rhs.columns.1),
              dot(lhs, rhs.columns.2))
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double3x4, rhs: double2x3) -> double2x4 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double3x4, rhs: double3x3) -> double3x4 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double3x4, rhs: double4x3) -> double4x4 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2, lhs * rhs.columns.3)
    }


    /// Multiplies *lhs* by *rhs* matrix in place.
    @inlinable
    public static func *=(lhs: inout simd_double3x4, rhs: double3x3) { lhs = lhs * rhs }

}
