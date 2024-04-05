package glm;

import cpp.Float32 as F32;
import glm.GLM;

class Vec4 {
    public var underlying:NativeVec4;

    var x:F32 = 0;
    var y:F32 = 0;
    var z:F32 = 0;
    var w:F32 = 0;

    public function new(x:F32 = 0.0, y:F32 = 0.0, z:F32 = 0.0, w:F32 = 1.0, ?underlying:cpp.Pointer<NativeVec4> = null){

        this.underlying = NativeVec4.vec4Init(x, y, z, w);
        if (underlying != null)
            this.underlying = untyped __cpp__('*{0}', underlying.ptr);
        this.x = this.underlying.x;
        this.y = this.underlying.y;
        this.z = this.underlying.z;
        this.w = this.underlying.w;
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