#include "glass.inc"
#include "woods.inc"
#include "textures.inc"


#declare mikado = cylinder {
    <0, 0, 0>, <0, 4.5, 0>, 0.02 // center of one end, center of other end, radius
    pigment { 
        color Green // <red, green, blue, filter, transmit>
    }
    
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
        phong 250
        roughness 0.7
    }
}

#declare glassCenterLiquid = cylinder {
    <0, -0.6, 0>, <0, 0.6, 0>, 0.39 // <x, y, z>, radius
    pigment {
        color <1,1,1, 1>
    }
    finish {
        reflection 0.3
        phong 250
        roughness 0.7
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
        color <1,1,1, 1>
    }
    finish {
        ambient 0.1
        diffuse 0.1
        reflection 0.1
        phong 250
        roughness 0.7
    }
}
#declare inner = cylinder {
    <0, 0.6, 0>, <0, 0.72, 0>, 0.13 // center of one end, center of other end, radius
    open // remove end caps
    pigment {
        color <1,1,1, 1>
    }
    finish {
        ambient 0.1
        diffuse 0.1
        reflection 0.1
        phong 250
        roughness 0.7
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
        object {
            glassCenter
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
        
        }
      
      