package;

import glm.Mat4;
import glm.Vec4;
import glm.Vec3;

@:headerCode('#define GLM_ENABLE_EXPERIMENTAL')
@:headerInclude('gtx/string_cast.hpp')
class UnitTest {
    public function new() {
        //identity matrix
        var mat:Mat4 = new Mat4(1, 3, 0, 0,
                                0, 1, 0, 0,
                                0, 0, 1, 0,
                                0, 0, 0, 1);

        var mat2:Mat4 = new Mat4(1, 2, 0, 0,
                                 0, 1, 0, 0,
                                 0, 0, 1, 0,
                                 0, 0, 0, 1);
        mat *= mat2;
        
        untyped __cpp__('std::cout << glm::to_string(*{0}) << std::endl', mat);

        var vec3:Vec3 = new Vec3(1, 50, 30);
        var vec32:Vec3 = new Vec3(0, 20, 10);
        var res:Vec3;
        res = vec3 - vec32;
        trace(res.toString());
        res.x = 5;
        res.y = 3;
        res.z = 6;
        res.x = 3;
        res.x = 7;

        trace(res.toString());
    }
}

class Test {
    static function main() {
        new UnitTest();
    }
}