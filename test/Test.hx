package;

import glm.Mat4;
import glm.Vec4;

class Test {
    static function main() {
        //identity matrix
        var mat:Mat4 = new Mat4();
        var vec4:Vec4 = new Vec4(1, 50, 30);
        trace(vec4.toString());
        for( i in 0...4){
           trace( mat.getColumn(i).toString() );
        }
    }
}