package glm;

import cpp.Float32 as F32;
import cpp.Pointer;
import glm.GLM;
import cpp.Star;

@:forward
abstract Vec4(Star<NativeVec4>) from Star<NativeVec4> to Star<NativeVec4> {
    public var x(get, set):F32;
    public function get_x():F32 return this.x;
    public function set_x(n:F32):F32 return this.x = n;

    public var y(get, set):F32;
    public function get_y():F32 return this.y;
    public function set_y(n:F32):F32 return this.y = n;

    public var z(get, set):F32;
    public function get_z():F32 return this.z;
    public function set_z(n:F32):F32 return this.z = n;

    public var w(get, set):F32;
    public function get_w():F32 return this.w;
    public function set_w(n:F32):F32 return this.w = n;

    public function new(x:F32 = 0.0, y:F32 = 0.0, z:F32 = 0.0, w:F32 = 1.0, ?underlying:cpp.Pointer<NativeVec4> = null)
        underlying != null ? this = underlying.ptr : this = NativeVec4.ptrInit(x, y, z, w);
    
    public inline function toString():String 
        return 'x: $x, y: $y, z: $z, w: $w';
}

@:unreflective
@:keep
@:include('glm.hpp')
@:structAccess
@:native('glm::vec4')
extern class NativeVec4 {
    @:native('new glm::vec4')
    static function ptrInit(x:F32, y:F32, z:F32, w:F32):Star<NativeVec4>;
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