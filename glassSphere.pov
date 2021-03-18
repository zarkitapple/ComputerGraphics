#include "glass.inc"

#declare bigSphere = sphere {
    <0, 0, 0>, 2
    pigment {
        color <0.4, 0.2, 0.15, 1> filter 0.95 
    }
    
    finish {
        ambient 0
	    diffuse 0.8
	    refraction 1
        reflection 0.05
        brilliance 100
		specular 10          
		roughness 0.001
        
    }
    interior {
        ior 1.5
        caustics 0.8
        dispersion 1.01
    }
    
}

#macro drawSpheres()
    #local R = seed(0);
    #local dd = 200;

    #while (dd > 0 )
        #local dx =  rand(R) * 2.2 - 1;
        #local dy =  rand(R) * 2.2 - 1;
        #local dz =  rand(R) * 2.2 - 1;
        #local dr =  rand(R) * 0.06;
            sphere {
                <dx, dy, dz>, dr// <x, y, z>, radius
                pigment { 
                    color <0.8, 0.4, 0.3, 1> transmit 0.9999
                }
                finish {
            		specular 100
            		ambient 0
            		diffuse 0
            		roughness 0.001
            		reflection {
                        0.2, 1
                        fresnel on
                    }
                    brilliance 20
                }
                interior {
                    ior 1.1
                    dispersion 1.01
                }
            }
          
    #local dd=dd - 1;
    #end
#end

#macro drawSpheresSmall()
    #local R = seed(0);
    #local dd = 400;

    #while (dd > 0 )
        #local dx =  rand(R) * 2.5 - 1;
        #local dy =  rand(R) * 2.5 - 1;
        #local dz =  rand(R) * 2.5 - 1;
        #local dr =  rand(R) * 0.02;
            sphere {
                <dx, dy, dz>, dr// <x, y, z>, radius
                pigment { 
                    color <0.8, 0.4, 0.30, 1> transmit 0.9999
                }
                finish {
            		specular 100
            		ambient 0
            		diffuse 0
            		roughness 0.001
            		reflection {
                        0.2, 1
                        fresnel on
                    }
                    brilliance 10
                }
                interior {
                    ior 1.1
                    dispersion 1.1
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
        drawSpheresSmall()
    }