import math

/// A matrix with 2 rows and 4 columns.
public struct simd_double4x2: Equatable, Sendable, CustomDebugStringConvertible {

    public var columns: (simd_double2, simd_double2, simd_double2, simd_double2)



    /// Initializes a zero matrix.
    @inlinable
    public init() { columns = (.zero, .zero, .zero, .zero) }


    /// Columnwise initializer.
    @inlinable
    public init(columns: (simd_double2, simd_double2, simd_double2, simd_double2)) { self.columns = columns }


    /// Initialzes a matrix having *scalar* on main diagonal and zeros elsewhere.
    @inlinable
    public init(_ scalar: Double) {
        columns = (.init(scalar, 0.0),
                   .init(0.0, scalar),
                   .zero,
                   .zero)
    }


    /// Initialzes a matrix having given main *diagonal* and zeros elsewhere.
    @inlinable
    public init(diagonal: SIMD2<Double>) {
        columns = (.init(diagonal.x, 0.0),
                   .init(0.0, diagonal.y),
                   .zero,
                   .zero)
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ columns: [SIMD2<Double>]) { self.columns = (columns[0], columns[1], columns[2], columns[3]) }


    /// Rowwise initializer.
    @inlinable
    public init(rows: [SIMD4<Double>]) {
        columns = (.init(rows[0].x, rows[1].x),
                   .init(rows[0].y, rows[1].y),
                   .init(rows[0].z, rows[1].z),
                   .init(rows[0].w, rows[1].w))
    }


    /// Columnwise initializer.
    @inlinable
    public init(_ col0: SIMD2<Double>, _ col1: SIMD2<Double>, _ col2: SIMD2<Double>, _ col3: SIMD2<Double>) { self.columns = (col0, col1, col2, col3) }



    // MARK: : Equatable

    @inlinable
    public static func ==(lhs: simd_double4x2, rhs: simd_double4x2) -> Bool { lhs.columns == rhs.columns }



    // MARK: : CustomDebugStringConvertible

    @inlinable
    public var debugDescription: String { "simd_double4x2([[\(columns.0.x), \(columns.0.y)], [\(columns.1.x), \(columns.1.y)], [\(columns.2.x), \(columns.2.y)], [\(columns.3.x), \(columns.3.y)]])" }



    // MARK: Subscripts

    /// - Returns: The receiver's column at given index.
    @inlinable
    public subscript(column: Int) -> SIMD2<Double> {
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
    public var transpose: double2x4 {
        .init(.init(columns.0.x, columns.1.x, columns.2.x, columns.3.x),
              .init(columns.0.y, columns.1.y, columns.2.y, columns.3.y))
    }



    // MARK: Operators

    /// - Returns: Negated matrix.
    @inlinable
    public static prefix func -(rhs: simd_double4x2) -> simd_double4x2 { .init(-rhs.columns.0, -rhs.columns.1, -rhs.columns.2, -rhs.columns.3) }


    /// - Returns: Sum of given matrices.
    @inlinable
    public static func +(lhs: simd_double4x2, rhs: simd_double4x2) -> simd_double4x2 {
        .init(lhs.columns.0 + rhs.columns.0,
              lhs.columns.1 + rhs.columns.1,
              lhs.columns.2 + rhs.columns.2,
              lhs.columns.3 + rhs.columns.3)
    }


    /// - Returns: Subtraction of given matrices.
    @inlinable
    public static func -(lhs: simd_double4x2, rhs: simd_double4x2) -> simd_double4x2 {
        .init(lhs.columns.0 - rhs.columns.0,
              lhs.columns.1 - rhs.columns.1,
              lhs.columns.2 - rhs.columns.2,
              lhs.columns.3 - rhs.columns.3)
    }


    /// Adds *rhs* to *lhs* in place.
    @inlinable
    public static func +=(lhs: inout simd_double4x2, rhs: simd_double4x2) {
        lhs.columns.0 += rhs.columns.0
        lhs.columns.1 += rhs.columns.1
        lhs.columns.2 += rhs.columns.2
        lhs.columns.3 += rhs.columns.3
    }


    /// Subtracts *rhs* from *lhs* in place.
    @inlinable
    public static func -=(lhs: inout simd_double4x2, rhs: simd_double4x2) {
        lhs.columns.0 -= rhs.columns.0
        lhs.columns.1 -= rhs.columns.1
        lhs.columns.2 -= rhs.columns.2
        lhs.columns.3 -= rhs.columns.3
    }


    /// - Returns: Scaled *rhs* by *lhs*.
    @inlinable
    public static func *(lhs: Double, rhs: simd_double4x2) -> simd_double4x2 { .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2, lhs * rhs.columns.3) }


    /// - Returns: Scaled *lhs* by *rhs*.
    @inlinable
    public static func *(lhs: simd_double4x2, rhs: Double) -> simd_double4x2 { .init(rhs * lhs.columns.0, rhs * lhs.columns.1, rhs * lhs.columns.2, rhs * lhs.columns.3) }


    /// Scales *lhs* by *rhs* in place.
    @inlinable
    public static func *=(lhs: inout simd_double4x2, rhs: Double) {
        lhs.columns.0 *= rhs
        lhs.columns.1 *= rhs
        lhs.columns.2 *= rhs
        lhs.columns.3 *= rhs
    }


    /// - Returns: Product of *lhs* matrix and *rhs* vector as a single column matrix.
    @inlinable
    public static func *(lhs: simd_double4x2, rhs: SIMD4<Double>) -> SIMD2<Double> {
        .init(lhs.columns.0.x * rhs.x + lhs.columns.1.x * rhs.y + lhs.columns.2.x * rhs.z + lhs.columns.3.x * rhs.w,
              lhs.columns.0.y * rhs.x + lhs.columns.1.y * rhs.y + lhs.columns.2.y * rhs.z + lhs.columns.3.y * rhs.w)
    }


    /// - Returns: Product of *lhs* vector as a single row matrix and *rhs* matrix.
    @inlinable
    public static func *(lhs: SIMD2<Double>, rhs: simd_double4x2) -> SIMD4<Double> {
        .init(dot(lhs, rhs.columns.0),
              dot(lhs, rhs.columns.1),
              dot(lhs, rhs.columns.2),
              dot(lhs, rhs.columns.3))
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double4x2, rhs: double2x4) -> double2x2 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double4x2, rhs: double3x4) -> double3x2 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2)
    }


    /// - Returns: Product of *lhs* and *rhs* matrices.
    @inlinable
    public static func *(lhs: simd_double4x2, rhs: double4x4) -> double4x2 {
        .init(lhs * rhs.columns.0, lhs * rhs.columns.1, lhs * rhs.columns.2, lhs * rhs.columns.3)
    }


    /// Multiplies *lhs* by *rhs* matrix in place.
    @inlinable
    public static func *=(lhs: inout simd_double4x2, rhs: double4x4) { lhs = lhs * rhs }

}
