#include "glass.inc"
#include "woods.inc"
#include "textures.inc"


#declare mikado = cylinder {
    <0, 0, 0>, <0, 4, 0>, 0.022 // center of one end, center of other end, radius
}


#declare glassTopHole = cylinder {
    <0, 0.59, 0>, <0, 0.76, 0>, 0.2 // <x, y, z>, radius
    texture {
        EMBWood1
        scale 0.15
    }
}

#declare glassCenterHole = cylinder {
    <0, -0.61 , 0>, <0, 0.61, 0>, 0.4 // <x, y, z>, radius
    texture {
        EMBWood1
        scale 0.15
    }
}

#declare glassCenter = cylinder {
    <0, -0.6, 0>, <0, 0.6, 0>, 0.39 // <x, y, z>, radius
    pigment {
        color <0.9,0.9,0.9, 0.99> filter 0.95
    }
    finish {
        reflection 0.05
        phong 20
        specular 1
    }
    interior {
        ior 1.5
        dispersion 1.01
        caustics 
        
    }
     photons {
        target
        refraction on
        reflection on
    }
}

#declare glassCenterLiquid = cylinder {
    <0, -0.6, 0>, <0, -0.45, 0>, 0.38 // <x, y, z>, radius
    pigment {
        color <0.05, 0.2, 0.05>
    }
    finish {
        reflection 1.01
    }
}

#declare centerHole = cylinder {
    <-0.51, 0, -0>, <0.51, 0, 0>, 0.50 // center of one end, center of other end, radius
    texture {
        EMBWood1
        scale 0.15
    }
}

#declare containerWood = box {
    <-0.50, -0.75, -0.75>, <0.50, 0.75, 0.75> // <x, y, z> near lower left corner, <x, y, z> far upper right corner

    texture {
        EMBWood1
        scale 0.15
    }
}

#declare outer = cylinder {
    <0,  0.6, 0>, <0, 0.72, 0>, 0.19 // center of one end, center of other end, radius
    pigment {
        color <0.3,0.3,0.3, 0.95>
    }
    finish {
        ambient 1
        diffuse 1
        reflection 0.1
        phong 150
        roughness 0.1
    }
}
#declare inner = cylinder {
    <0, 0.6, 0>, <0, 0.72, 0>, 0.13 // center of one end, center of other end, radius
    open // remove end caps
    pigment {
        color <0.3,0.3,0.3, 0.95>
    }
    finish {
        ambient 1
        diffuse 1
        reflection 0.1
        phong 150
        roughness 0.1
    }
}


#declare topOpening = 
    difference {
            object {
                outer
            }
            object {
                inner
            }
    }

#declare glassContainer = 
    union {
        union {
            object {
                glassCenter
            }
            object {
                glassCenterLiquid
            }
        }
        
        object {
            topOpening
        }
    }

#declare woodenBoxPlant = 
    union {
        difference {
            object {
                containerWood
            } 
            object {
                centerHole
            }
            object {
                glassCenterHole
            }
            object {
                glassTopHole
            }    
        }
        object {
            glassContainer
        }
        object {
            mikado
            pigment { 
                color <0.33, 0.43, 0.24> // <red, green, blue, filter, transmit>
            }
            rotate z*-9
            rotate x*-10
            
            translate <-0.2, -0.5, 0.1>
           
        }
        object {
            mikado
            pigment { 
                color <0.33, 0.43, 0.24> // <red, green, blue, filter, transmit>
            }
            
            translate <-0.25, -0.5, -0.13>
            rotate z*-13
            rotate x*12
        }
        object {
            mikado
            pigment { 
                color <0.33, 0.43, 0.24> // <red, green, blue, filter, transmit>
            }
            rotate z*12
            rotate x*14
            translate <0.20, -0.5, -0.22>
            
        }
    }
      
      