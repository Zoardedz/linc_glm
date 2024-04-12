package;

import glm.Mat4;
import glm.Vec4;
import glm.Vec3;

class Test {
    static function main() {
        //identity matrix
        var mat:Mat4 = new Mat4();
        var vec4:Vec4 = new Vec4(1, 50, 30);
        mat.set(0, 0, 1);
        mat.set(0, 1, 2);
        var mat2:Mat4 = new Mat4();
        mat2.set(0, 1, 3);
        mat.multiplyByMat4(mat2);

        trace(vec4.toString());
        
        for( i in 0...4){
           trace( mat.getColumn(i).toString() );
        }

        var vec31:Vec3 = new Vec3(1, 10, 10);
        var vec32:Vec3 = new Vec3(1, 30, 20);
        trace(vec32.multiplyScalar(0.5).toString());
        vec32.plusEqual(vec31);
        trace(vec32.toString());
    }
}