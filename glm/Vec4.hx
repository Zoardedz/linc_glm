package glm;

import cpp.Float32 as F32;
import cpp.Pointer;
import glm.GLM;

class Vec4 {
    public var underlying:NativeVec4;

    public var x(get, set):F32;
    public function get_x():F32 return underlying.x;
    public function set_x(n:F32):F32 return underlying.x = n;

    public var y(get, set):F32;
    public function get_y():F32 return underlying.y;
    public function set_y(n:F32):F32 return underlying.y = n;

    public var z(get, set):F32;
    public function get_z():F32 return underlying.z;
    public function set_z(n:F32):F32 return underlying.z = n;

    public var w(get, set):F32;
    public function get_w():F32 return underlying.w;
    public function set_w(n:F32):F32 return underlying.w = n;

    public function new(x:F32 = 0.0, y:F32 = 0.0, z:F32 = 0.0, w:F32 = 1.0, ?underlying:cpp.Pointer<NativeVec4> = null)
        underlying != null ? this.underlying = untyped __cpp__('*{0}', underlying.ptr) : this.underlying = NativeVec4.vec4Init(x, y, z, w);

    public inline function syncVec4(otherNative:Pointer<NativeVec4>):Void {
        this.x = otherNative.ptr.x;
        this.y = otherNative.ptr.y;
        this.z = otherNative.ptr.z;
        this.w = otherNative.ptr.w;
    }
    
    public inline function toString():String 
        return 'x: $x, y: $y, z: $z, w: $w';
}

@:unreflective
@:keep
@:include('glm.hpp')
@:structAccess
@:native('glm::vec4')
extern class NativeVec4 {
    @:native('glm::vec4')
    static function vec4Init(x:F32, y:F32, z:F32, w:F32):NativeVec4;

    @:native('x')
    var x:F32;
    @:native('y')
    var y:F32;
    @:native('z')
    var z:F32;
    @:native('w')
    var w:F32;
}