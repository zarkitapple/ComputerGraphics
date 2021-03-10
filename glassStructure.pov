#include "glass.inc"

#declare bigPrism = prism {
    0.00, 2.2, 5
    <.4, 0.00>,
    <-.4, 0.00>,
    <-0.1, 0.55>,
    <0.1, 0.55>,
    <.4, 0.00>
}

#declare bigPrismTranslated = 
    object {
        bigPrism
        translate <0, 0, 0.6928> 
    }


#declare smallPrism = prism {
    0.00, 2, 5
    <.4, 0.00>,
    <-.4, 0.00>,
    <-0.1, 0.55>,
    <0.1, 0.55>,
    <.4, 0.00>

}

#declare smallPrismTranslated = 
    object {
        smallPrism
        rotate(y*180)
        translate <0,0,-0.6928>
    }


#declare outerHexagon = prism {
    0.3, 1.6, 7
    <1, 0.00>,
    <0.5, -0.866>,
    <-0.5, -0.866>,
    <-1, 0>,
    <-0.5, 0.866>,
    <0.5, 0.866>,
    <1, 0.00>

}

#declare innerHexagon = 
    object {
        outerHexagon
        scale <0.8,1.2308,0.8>
        translate<0,0.15,0>
    }


#declare glassStructure = 
    union {
        object {
            bigPrismTranslated    
        }
        object {
            bigPrismTranslated
            rotate(y*120)
        }
        object {
            bigPrismTranslated
            rotate(y*240)
        }
        object {
            smallPrismTranslated    
        }
        object {
            smallPrismTranslated
            rotate(y*120)
        }
        object {
            smallPrismTranslated
            rotate(y*240)
        }
        difference {
            object {
                    outerHexagon
                    scale 1.1
                     color <1,0,0> 
                }
            object {
                innerHexagon
            }
        }
         pigment {
            color <1,1,1,0.95> filter 0.9
        }
         normal {
                bumps 0.4 scale 0.1
            }
        finish {
            ambient 0
            diffuse 0
            specular 5
            reflection {
                0.1, 1
                fresnel on
            }
            brilliance 10
            roughness 0.01
        }
        interior {
            ior 1.5
            dispersion 1.02
        }
        photons {
            target
            refraction on
            reflection on
        }
    }
