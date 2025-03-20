#if os(Windows)
import math

@inline(__always)
@usableFromInline
func acos(_ value: Float) -> Float {
    acosf(value)
}

@inline(__always)
@usableFromInline
func asin(_ value: Float) -> Float {
    asinf(value)
}

@inline(__always)
@usableFromInline
func atan(_ value: Float) -> Float {
    atanf(value)
}

@inline(__always)
@usableFromInline
func atan2(_ a: Float, _ b: Float) -> Float {
    atan2f(a, b)
}

@inline(__always)
@usableFromInline
func cos(_ value: Float) -> Float {
    cosf(value)
}

@inline(__always)
@usableFromInline
func sin(_ value: Float) -> Float {
    sinf(value)
}

@inline(__always)
@usableFromInline
func tan(_ value: Float) -> Float {
    tanf(value)
}

@inline(__always)
@usableFromInline
func acosh(_ value: Float) -> Float {
    acoshf(value)
}

@inline(__always)
@usableFromInline
func asinh(_ value: Float) -> Float {
    asinhf(value)
}

@inline(__always)
@usableFromInline
func atanh(_ value: Float) -> Float {
    atanhf(value)
}

@inline(__always)
@usableFromInline
func cosh(_ value: Float) -> Float {
    coshf(value)
}

@inline(__always)
@usableFromInline
func sinh(_ value: Float) -> Float {
    sinhf(value)
}

@inline(__always)
@usableFromInline
func tanh(_ value: Float) -> Float {
    tanhf(value)
}

@inline(__always)
@usableFromInline
func exp(_ value: Float) -> Float {
    expf(value)
}

@inline(__always)
@usableFromInline
func exp2(_ value: Float) -> Float {
    exp2f(value)
}

@inline(__always)
@usableFromInline
func expm1(_ value: Float) -> Float {
    expm1f(value)
}

@inline(__always)
@usableFromInline
func log(_ value: Float) -> Float {
    logf(value)
}

@inline(__always)
@usableFromInline
func log10(_ value: Float) -> Float {
    log10f(value)
}

@inline(__always)
@usableFromInline
func log2(_ value: Float) -> Float {
    log2f(value)
}

@inline(__always)
@usableFromInline
func log1p(_ value: Float) -> Float {
    log1pf(value)
}

@inline(__always)
@usableFromInline
func logb(_ value: Float) -> Float {
    logbf(value)
}

@inline(__always)
@usableFromInline
func ldexp(_ a: Float, _ b: CInt) -> Float {
    ldexpf(a, b)
}

@inline(__always)
@usableFromInline
func ilogb(_ value: Float) -> CInt {
    ilogbf(value)
}

@inline(__always)
@usableFromInline
func scalbn(_ a: Float, _ b: CInt) -> Float {
    scalbnf(a, b)
}

@inline(__always)
@usableFromInline
func scalbln(_ a: Float, _ b: Int) -> Float {
    scalblnf(a, CInt(b))
}

@inline(__always)
@usableFromInline
func fabs(_ x: Float) -> Float {
    fabsf(x)
}

@inline(__always)
@usableFromInline
func cbrt(_ x: Float) -> Float {
    cbrtf(x)
}

@inline(__always)
@usableFromInline
func hypot(_ a: Float, _ b: Float) -> Float {
    hypotf(a, b)
}

@inline(__always)
@usableFromInline
func pow(_ a: Float, _ b: Float) -> Float {
    powf(a, b)
}

@inline(__always)
@usableFromInline
func sqrt(_ x: Float) -> Float {
    sqrtf(x)
}

@inline(__always)
@usableFromInline
func erf(_ x: Float) -> Float {
    erff(x)
}

@inline(__always)
@usableFromInline
func erfc(_ x: Float) -> Float {
    erfcf(x)
}

@inline(__always)
@usableFromInline
func lgamma(_ x: Float) -> Float {
    lgammaf(x)
}

@inline(__always)
@usableFromInline
func tgamma(_ x: Float) -> Float {
    tgammaf(x)
}

@inline(__always)
@usableFromInline
func ceil(_ x: Float) -> Float {
    ceilf(x)
}

@inline(__always)
@usableFromInline
func floor(_ x: Float) -> Float {
    floorf(x)
}

@inline(__always)
@usableFromInline
func nearbyint(_ x: Float) -> Float {
    nearbyintf(x)
}

@inline(__always)
@usableFromInline
func rint(_ x: Float) -> Float {
    rintf(x)
}

@inline(__always)
@usableFromInline
func lrint(_ x: Float) -> Int {
    Int(lrintf(x))
}

@inline(__always)
@usableFromInline
func round(_ x: Float) -> Float {
    roundf(x)
}

@inline(__always)
@usableFromInline
func lround(_ x: Float) -> Int {
    Int(lroundf(x))
}

@inline(__always)
@usableFromInline
func llrint(_ x: Float) -> Int64 {
    llrintf(x)
}

@inline(__always)
@usableFromInline
func llround(_ x: Float) -> Int64 {
    llroundf(x)
}

@inline(__always)
@usableFromInline
func trunc(_ x: Float) -> Float {
    truncf(x)
}

@inline(__always)
@usableFromInline
func fmod(_ a: Float, _ b: Float) -> Float {
    fmodf(a, b)
}

@inline(__always)
@usableFromInline
func remainder(_ a: Float, _ b: Float) -> Float {
    remainderf(a, b)
}

@inline(__always)
@usableFromInline
func copysign(_ a: Float, _ b: Float) -> Float {
    copysignf(a, b)
}

@inline(__always)
@usableFromInline
func nan(_ x: UnsafePointer<CChar>!) -> Float {
    nanf(x)
}

@inline(__always)
@usableFromInline
func nextafter(_ a: Float, _ b: Float) -> Float {
    nextafterf(a, b)
}

#if os(Linux) && arch(x86_64)
@inline(__always)
@usableFromInline
func nexttoward(_ a: Float, _ b: Float80) -> Float {
    nexttowardf(a, b)
}
#endif

@inline(__always)
@usableFromInline
func fdim(_ a: Float, _ b: Float) -> Float {
    fdimf(a, b)
}

@inline(__always)
@usableFromInline
func fmax(_ a: Float, _ b: Float) -> Float {
    fmaxf(a, b)
}

@inline(__always)
@usableFromInline
func fmin(_ a: Float, _ b: Float) -> Float {
    fminf(a, b)
}

@inline(__always)
@usableFromInline
func fma(_ a: Float, _ b: Float, _ c: Float) -> Float {
    fmaf(a, b, c)
}
#endif
