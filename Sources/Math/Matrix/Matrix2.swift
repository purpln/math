public struct Matrix2<Scalar: BinaryFloatingPoint & Sendable>: Matrixable, Hashable, Sendable {
    public typealias Vector = Vector2<Scalar>
    
    public var m11, m12: Scalar
    public var m21, m22: Scalar
    
    public static var numRows: Int { 2 }
    
    public static var identity: Matrix2 {
        Matrix2(1.0, 0.0, 0.0, 1.0)
    }
    
    public init(_ matrix: Self = .identity) {
        self = matrix
    }
    
    public init(m11: Scalar, m12: Scalar, m21: Scalar, m22: Scalar) {
        self.m11 = m11
        self.m12 = m12
        self.m21 = m21
        self.m22 = m22
    }
    
    public init<T: BinaryFloatingPoint>(_ m11: T, _ m12: T, _ m21: T, _ m22: T) {
        self.m11 = Scalar(m11)
        self.m12 = Scalar(m12)
        self.m21 = Scalar(m21)
        self.m22 = Scalar(m22)
    }
    
    public var determinant: Scalar {
        return m11 * m22 - m12 * m21
    }
    
    public func inverted() -> Self? {
        let d = self.determinant
        if d.isZero { return nil }
        let inv = 1.0 / d
        let m11 =  self.m22 * inv
        let m12 = -self.m12 * inv
        let m21 = -self.m21 * inv
        let m22 =  self.m11 * inv
        return Matrix2(m11, m12, m21, m22)
    }
    
    public func transposed() -> Self {
        return Matrix2(row1: self.column1, row2: self.column2)
    }
    
    public func concatenating(_ m: Self) -> Self {
        let (row1, row2) = (self.row1, self.row2)
        let (col1, col2) = (m.column1, m.column2)
        return Matrix2(
            Vector2.dot(row1, col1), Vector2.dot(row1, col2),
            Vector2.dot(row2, col1), Vector2.dot(row2, col2)
        )
    }
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        return Matrix2(row1: lhs.row1 + rhs.row1, row2: lhs.row2 + rhs.row2)
    }
    
    public static func - (lhs: Self, rhs: Self) -> Self {
        return Matrix2(row1: lhs.row1 - rhs.row1, row2: lhs.row2 - rhs.row2)
    }
    
    public static func * (lhs:Self, rhs: some BinaryFloatingPoint) -> Self {
        return Matrix2(row1: lhs.row1 * rhs, row2: lhs.row2 * rhs)
    }
    
    public static func / (lhs: some BinaryFloatingPoint, rhs: Self) -> Self {
        return Matrix2(row1: Scalar(lhs) / rhs.row1, row2: Scalar(lhs) / rhs.row2)
    }
}

// MARK: - Diagonal

public extension Matrix2 {
    init(diagonal: Vector) {
        self.init(
            diagonal.x, 0.0,
            0.0, diagonal.y
        )
    }
    
    var diagonal: Vector {
        Vector2(m11, m22)
    }
    
    var isDiagonal: Bool {
        m12 == 0.0 && m21 == 0.0
    }
}

// MARK: - Vectors from matrix

public extension Matrix2 {
    init(row1: Vector, row2: Vector) {
        self.init(row1.x, row1.y, row2.x, row2.y)
    }
    
    init(column1: Vector, column2: Vector) {
        self.init(column1.x, column2.x, column1.y, column2.y)
    }
    
    var row1: Vector {
        get { Vector2(x: m11, y: m12) }
        set {
            m11 = newValue.x
            m12 = newValue.y
        }
    }
    
    var row2: Vector {
        get { Vector2(x: m21, y: m22) }
        set {
            m21 = newValue.x
            m22 = newValue.y
        }
    }
    
    var column1: Vector {
        get { Vector2(x: m11, y: m21) }
        set {
            m11 = newValue.x
            m21 = newValue.y
        }
    }
    
    var column2: Vector {
        get { Vector2(x: m12, y: m22) }
        set {
            m12 = newValue.x
            m22 = newValue.y
        }
    }
}

// MARK: - Subscript

public extension Matrix2 {
    subscript(row: Int) -> Vector {
        get {
            switch row {
            case 0: return self.row1
            case 1: return self.row2
            default:
                assertionFailure("Index out of range")
                break
            }
            return .zero
        }
        set {
            switch row {
            case 0: self.row1 = newValue
            case 1: self.row2 = newValue
            default:
                assertionFailure("Index out of range")
                break
            }
        }
    }
    
    subscript(row: Int, column: Int) -> Scalar {
        get {
            switch (row, column) {
            case (0, 0): return m11
            case (0, 1): return m12
            case (1, 0): return m21
            case (1, 1): return m22
            default:
                assertionFailure("Index out of range")
                break
            }
            return 0.0
        }
        set {
            switch (row, column) {
            case (0, 0): m11 = newValue
            case (0, 1): m12 = newValue
            case (1, 0): m21 = newValue
            case (1, 1): m22 = newValue
            default:
                assertionFailure("Index out of range")
                break
            }
        }
    }
}

// MARK: - Tuples

public extension Matrix2 {
#if !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
    @available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)
    init(_ m: Half2x2) {
        self.init(row1: Vector2(m.0), row2: Vector2(m.1))
    }
    
    @available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)
    var half2x2: Half2x2 {
        get { (self.row1.half2, self.row2.half2) }
        set {
            self.row1.half2 = newValue.0
            self.row2.half2 = newValue.1
        }
    }
#endif
    init(_ m: Float2x2) {
        self.init(row1: Vector2(m.0), row2: Vector2(m.1))
    }
    
    var float2x2: Float2x2 {
        get { (self.row1.float2, self.row1.float2) }
        set {
            self.row1.float2 = newValue.0
            self.row2.float2 = newValue.1
        }
    }
    
    init(_ m: Double2x2) {
        self.init(row1: Vector2(m.0), row2: Vector2(m.1))
    }
    
    var double2x2: Double2x2 {
        get { (self.row1.double2, self.row1.double2) }
        set {
            self.row1.double2 = newValue.0
            self.row2.double2 = newValue.1
        }
    }
}

// MARK: - Vector extensions

public extension Vector2 {
    func applying(_ m: Matrix2<Scalar>) -> Self {
        let x = Self.dot(self, m.column1)
        let y = Self.dot(self, m.column2)
        return Self(x, y)
    }
    
    mutating func apply(_ m: Matrix2<Scalar>) {
        self = self.applying(m)
    }
}
