package glm;

import cpp.Float32 as F32;
import cpp.Pointer;
import glm.GLM;
import cpp.Star;

@:forward
abstract Vec3(Star<NativeVec3>) to Star<NativeVec3> from Star<NativeVec3>
{
	//! gotta do this for callback
	public var x(get, set):F32;
	public function get_x():F32 return this.xx;
	public function set_x(n:F32):F32 {
		this.xx = n;
		untyped __cpp__('if ((*(this1)).xSetCallback == nullptr) return n;');
		this.xSet();
		return n;
	}
	
	public var y(get, set):F32;
	public function get_y():F32 return this.yy;
	public function set_y(n:F32):F32 {
		this.yy = n;
		untyped __cpp__('if ((*(this1)).ySetCallback == nullptr) return n;');
		this.ySet();
		return n;
	}
	
	public var z(get, set):F32;
	public function get_z():F32 return this.zz;
	public function set_z(n:F32):F32 {
		this.zz = n;
		untyped __cpp__('if ((*(this1)).zSetCallback == nullptr) return n;');
		this.zSet();
		return n;
	}
	
	public function new(x:F32 = 0.0, y:F32 = 0.0, z:F32 = 0.0, ?underlying:cpp.Pointer<NativeVec3> = null)
		this = underlying != null ? underlying.ptr : NativeVec3.heapInit(x, y, z);
		
	public inline function syncVec3(otherNative:Pointer<NativeVec3>):Void
	{
		final vec3:Vec3 = otherNative.ptr;	
		x = vec3.x;
		y = vec3.y;
		z = vec3.z;
	}
	
	public inline function toString():String
		return 'x: ${x}, y: ${y}, z: ${z}';
		
	@:op(A - B)
	public function subtract(rhs:Vec3):NativeVec3
	{
		return untyped __cpp__('(*{0}) - (*{1})', this, rhs);
	}
	
	@:to
	public inline function to():NativeVec3
		return this;
}

@:unreflective
@:keep
@:include('glm.hpp')
@:structAccess
@:native('glm::vec3')
extern class NativeVec3
{
	@:native('new glm::vec3')
	static function heapInit(x:F32, y:F32, z:F32):Star<NativeVec3>;
	@:native('glm::vec3')
	static function vec3Init(x:F32, y:F32, z:F32):NativeVec3;
	
	@:native('x')
	var xx:F32;
	@:native('y')
	var yy:F32;
	@:native('z')
	var zz:F32;

	@:native('xSetCallback')
	var xSet:Void->Void;
	@:native('ySetCallback')
	var ySet:Void->Void;
	@:native('zSetCallback')
	var zSet:Void->Void;
}