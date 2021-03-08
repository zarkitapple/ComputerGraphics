#include "glass.inc"

#declare bigSphere = sphere {
    <0, 0, 0>, 2
    pigment {
        color <1, 0.2, 0, 1> filter 0.95
    }
    texture {
        Glass
    }
    finish {
        ambient 0
	    diffuse 0
        reflection .08
		specular 10
		roughness 0.001
        
    }
    interior {
        ior 1.5
        caustics 10
    }
    
}

#macro drawSpheres()
    #local R = seed(0);
    #local dd = 300;

    #while (dd > 0 )
        #local dx =  rand(R) * 2 - 1;
        #local dy =  rand(R) * 2 - 1;
        #local dz =  rand(R) * 2 - 1;
        #local dr =  rand(R) * 0.1;
            sphere {
                <dx, dy, dz>, dr// <x, y, z>, radius
                pigment { 
                    color <1.0, 1.0, 1, 1> // <red, green, blue, filter, transmit>
                }
                finish {
            		specular 100
            		roughness 0.002
                }
            }
          
    #local dd=dd - 1;
    #end
#end

#declare glassSphere = 
    difference {
        object {
            bigSphere
            photons {
                target
                refraction on
                reflection on
            }
        }
        drawSpheres()
    }