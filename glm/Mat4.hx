package glm;

import cpp.Float32 as F32;
import cpp.Pointer;
import glm.GLM;
import glm.Vec4;
import cpp.ConstStar;

class Mat4 {
    public var underlying:NativeMatrix4x4;

    public function new(C0R0:F32 = 1, C1R0:F32 = 0, C2R0:F32 = 0, C3R0:F32 = 0,
                        C0R1:F32 = 0, C1R1:F32 = 1, C2R1:F32 = 0, C3R1:F32 = 0,
                        C0R2:F32 = 0, C1R2:F32 = 0, C2R2:F32 = 1, C3R2:F32 = 0,
                        C0R3:F32 = 0, C1R3:F32 = 0, C2R3:F32 = 0, C3R3:F32 = 1) {
        underlying = NativeMatrix4x4.nativeMat4x4(C0R0, C1R0, C2R0, C3R0, C0R1, C1R1, C2R1, C3R1, C0R2, C1R2, C2R2, C3R2, C0R3, C1R3, C2R3, C3R3);
    }

    public function getColumn(n:Int):Vec4 {
        if (n < 0) throw 'Cannot get column less than one';
        
        return new Vec4(1, 1, 1, Pointer.addressOf(underlying.columnAccess(n)));
    }

    public function valPtr():Star<F32> 
        return untyped __cpp__('&{0}[0].x', underlying);
}

@:unreflective
@:keep
@:structAccess
@:include('glm.hpp')
@:native('glm::mat4')
extern class NativeMatrix4x4 {
    @:native('glm::mat4')
    // constructor
    static function nativeMat4x4(a:F32, b:F32, c:F32, d:F32, 
                                 aa:F32, bb:F32, cc:F32, dd:F32, 
                                 aaa:F32, bbb:F32, ccc:F32, ddd:F32, 
                                 aaaa:F32, bbbb:F32, cccc:F32, dddd:F32):NativeMatrix4x4;
    @:native('operator[]')
    function columnAccess(column:cpp.SizeT):Vec4.NativeVec4;
}