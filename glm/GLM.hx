package glm;

import glm.Mat4.NativeMatrix4x4;
import glm.Mat4;
import glm.Vec3.NativeVec3;
import glm.Vec3;
import cpp.Pointer;

@:keep
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('glm'))
#end
class GLM {
    public static function rotate(matrix:Mat4, angleInRadians:cpp.Float32, vec3:Vec3):Mat4 {
        return new Mat4(Pointer.addressOf(NativeGLMFunc.rotate(matrix.underlying, angleInRadians, vec3.underlying)));
    }

    public static function scale(mat:Mat4, scale:Vec3):Mat4 {
        return new Mat4(Pointer.addressOf(NativeGLMFunc.scale(mat.underlying, scale.underlying)));
    }

    public static function translate(mat:Mat4, directionAndMagnitude:Vec3):Mat4 {
        return new Mat4(Pointer.addressOf(NativeGLMFunc.translate(mat.underlying, directionAndMagnitude.underlying)));
    }

    public static function perspective(fov:cpp.Float32, aspectRatio:cpp.Float32, nearView:cpp.Float32, farView:cpp.Float32):Mat4 {
        return new Mat4(Pointer.addressOf(NativeGLMFunc.perspective(fov * Math.PI / 180, aspectRatio, nearView, farView)));
    }
}   

@:include('glm.hpp')
@:include('gtc/matrix_transform.hpp')
@:include('gtx/matrix_clip_space.hpp')
@:unreflective
@:keep
//not a native class in general
extern class NativeGLMFunc {
    @:native('glm::rotate')
    static function rotate(mat:NativeMatrix4x4, angle:cpp.Float32, vec3:NativeVec3):NativeMatrix4x4;

    @:native('glm::scale')
    static function scale(mat:NativeMatrix4x4, vec:NativeVec3):NativeMatrix4x4;

    @:native('glm::translate')
    static function translate(mat:NativeMatrix4x4, vec:NativeVec3):NativeMatrix4x4;

    @:native('glm::perspective')
    static function perspective(fov:cpp.Float32, aspectRatio:cpp.Float32, nearViewPlane:cpp.Float32, farViewPlane:cpp.Float32):NativeMatrix4x4;
}