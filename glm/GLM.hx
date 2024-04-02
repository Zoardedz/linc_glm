package glm;

@:keep
@:include('glm.hpp')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('glm'))
#end
class GLM {
    
}   