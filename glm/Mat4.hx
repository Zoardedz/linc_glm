package glm;

import cpp.Float32 as F32;
import cpp.Pointer;
import cpp.Reference;
import cpp.Star;
import glm.GLM;
import glm.Vec4;

class Mat4 {
    public var underlying:NativeMatrix4x4;

    private var columns:Array<Vec4> = [];

    public function new(overrid:Pointer<NativeMatrix4x4> = null, C0R0:F32 = 1, C1R0:F32 = 0, C2R0:F32 = 0, C3R0:F32 = 0,
                        C0R1:F32 = 0, C1R1:F32 = 1, C2R1:F32 = 0, C3R1:F32 = 0,
                        C0R2:F32 = 0, C1R2:F32 = 0, C2R2:F32 = 1, C3R2:F32 = 0,
                        C0R3:F32 = 0, C1R3:F32 = 0, C2R3:F32 = 0, C3R3:F32 = 1) {
         (overrid != null) ? underlying = untyped __cpp__('*{0}', overrid.ptr) : 
        underlying = NativeMatrix4x4.nativeMat4x4(C0R0, C1R0, C2R0, C3R0, C0R1, C1R1, C2R1, C3R1, C0R2, C1R2, C2R2, C3R2, C0R3, C1R3, C2R3, C3R3);
    
        for (i in 0...4){
            columns.push(new Vec4(1, 1, 1, Pointer.addressOf(underlying.columnAccess(i))));
        }
    }

    public function set(columnNum:Int, rowNum:Int, value:F32) {
        //sorry, didn't make it a variable just to make sure it updates the actual values
        switch(rowNum) {
            case 0:
                untyped __cpp__('{0}[{1}].x = {2}', underlying.columnArr, columnNum, value);
            case 1:
                untyped __cpp__('{0}[{1}].y = {2}', underlying.columnArr, columnNum, value);
            case 2:
                untyped __cpp__('{0}[{1}].z = {2}', underlying.columnArr, columnNum, value);
            case 3:
                untyped __cpp__('{0}[{1}].w = {2}', underlying.columnArr, columnNum, value);
        }

        columns[columnNum].syncVec4(Pointer.addressOf(untyped __cpp__('{0}[{1}]', underlying.columnArr, columnNum)));
    }

    public inline function multiplyByMat4(otherMatrix:Mat4) {
        untyped __cpp__('{0} *= {1}', underlying, otherMatrix.underlying);

        for (columnNum in 0...4) 
            columns[columnNum].syncVec4(Pointer.addressOf(untyped __cpp__('{0}[{1}]', underlying.columnArr, columnNum)));
    }

    public function getColumn(n:Int):Vec4 {
        if (n < 0) throw 'Cannot get column at position less than zero';
        
        return columns[n];
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

    @:native('value')
    var columnArr:Star<Vec4.NativeVec4>;
}