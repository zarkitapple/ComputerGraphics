#include "glass.inc"
#include "woods.inc"
#include "textures.inc"


#declare mikado = cylinder {
    <0, 0, 0>, <0, 4.5, 0>, 0.02 // center of one end, center of other end, radius
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
        color <1,1,1, 1>
    }
    finish {
        reflection 0.3
        phong 150
        roughness 0.1
    }
}

#declare glassCenterLiquid = cylinder {
    <0, -0.6, 0>, <0, -0.5, 0>, 0.38 // <x, y, z>, radius
    pigment {
        color <0.3, 0.8, 0.5, 0.8>
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
        }
        object {
            mikado
             pigment { 
        color Red // <red, green, blue, filter, transmit>
    }
            rotate z*14
            translate <0.36,0,0.1>
        }
        object {
            mikado
             pigment { 
        color Green // <red, green, blue, filter, transmit>
    }
            translate <-0.36,0,-0.1>
            rotate z*-14
        }
        object {
            mikado
             pigment { 
        color Yellow // <red, green, blue, filter, transmit>
    }
             translate <-0.1,0,-0.1>
            rotate z*-4
        }
      
      