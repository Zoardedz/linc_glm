package glm;

import cpp.Float32 as F32;
import cpp.Pointer;
import glm.GLM;

class Vec3 {
    public var underlying:NativeVec3;

    public var x(get, set):F32;
    public function get_x():F32 return underlying.x;
    public function set_x(n:F32):F32 { 
        underlying.x = n;
        xSet();
        return underlying.x; 
    }

    public var y(get, set):F32;
    public function get_y():F32 return underlying.y;
    public function set_y(n:F32):F32 { 
        underlying.y = n;
        ySet();
        return underlying.y; 
    }

    public var z(get, set):F32;
    public function get_z():F32 return underlying.z;
    public function set_z(n:F32):F32 { 
        underlying.z = n;
        zSet();
        return underlying.z; 
    }

    public dynamic function xSet():Void {}
    public dynamic function ySet():Void {}
    public dynamic function zSet():Void {}

    public function new(x:F32 = 0.0, y:F32 = 0.0, z:F32 = 0.0, ?underlying:cpp.Pointer<NativeVec3> = null)
        underlying != null ? this.underlying = untyped __cpp__('*{0}', underlying.ptr) : this.underlying = NativeVec3.vec3Init(x, y, z);

    public inline function syncVec3(otherNative:Pointer<NativeVec3>):Void {
        this.x = otherNative.ptr.x;
        this.y = otherNative.ptr.y;
        this.z = otherNative.ptr.z;
    }
    
    public inline function multiplyScalar(n:F32):Vec3 
    {
        return new Vec3(x * n, y * n, z * n);
    }

    public inline function plusEqual(vec3:Vec3):Void {
        x += vec3.x;
        y += vec3.y;
        z += vec3.z;
    }

    public inline function minusEqual(vec3:Vec3):Void {
        x -= vec3.x;
        y -= vec3.y;
        z -= vec3.z;
    }

    public inline function plus(rhs:Vec3):Vec3 {
        return new Vec3(x + rhs.x, y + rhs.y, z + rhs.z);
    }

    //vec2 - vec1
    public static inline function difference(vec1:Vec3, vec2:Vec3):Vec3 
    {
        final ret:Vec3 = new Vec3();

        ret.x = vec2.x - vec1.x;
        ret.y = vec2.y - vec1.y;
        ret.z = vec2.z - vec1.z;

        return ret;
    }
    
    public inline function toString():String 
        return 'x: $x, y: $y, z: $z';
}

@:unreflective
@:keep
@:include('glm.hpp')
@:structAccess
@:native('glm::vec3')
extern class NativeVec3 {
    @:native('glm::vec3')
    static function vec3Init(x:F32, y:F32, z:F32):NativeVec3;

    @:native('x')
    var x:F32;
    @:native('y')
    var y:F32;
    @:native('z')
    var z:F32;
}