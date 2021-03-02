#include "colors.inc" 
#include "woods.inc"
#include "stones.inc"

#declare cameraCenter = camera {
    location <0, 0, -10> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}

#declare cameraRotatedLeft = camera {
    location <-4, 3, -10> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}

#declare lightLeft = light_source {
    <-5, 10, -10> // <x, y, z>
   White // <red, green, blue>
}
#declare lightRight = light_source {
    <10, 10, -10> // <x, y, z>
   White // <red, green, blue>
}

camera {
cameraRotatedLeft
}
light_source {
    lightLeft
}

//Ref

/* cylinder {
  <0, 0, 0>, <0, 0, 100>, 0.1
  pigment {color Red}
}
cylinder {
  <0, 0, 0>, <0, 100, 0>, 0.1
  pigment {color Blue}
}
cylinder {
  <0, 0, 0>, <100, 0, 0>, 0.1
  pigment {color Green}
} */

plane {
  y, 0 // perpendicular to axis, offset
    pigment {
        color Grey
    }
}

/* sphere {
    <0, 0, 0>, 5 // <x, y, z>, radius
    pigment {
        color White
    }
} */
light_source {
 <0, 0, -25>
 color rgb <1, 1, 1>
}

#declare porcelainFinish =   
        finish {
            ambient 0.1
            diffuse 0.9
            phong 1}


#declare sphereRed = sphere {
    <0, 2, 0>, 2 // <x, y, z>, radius
    pigment { 
      color White // <red, green, blue, filter, transmit>
    }
    finish {
        porcelainFinish
    }
}

#declare boxSemiSphere = box {
        <-2, 1.668, -2>, <2, 4, 2>
    pigment { 
       color White // <red, green, blue, filter, transmit>
    }
    finish {
        porcelainFinish
    }
  
}

#declare sphereBlue = sphere {
    <0, 2, 0>, 1.9 // <x, y, z>, radius
    pigment { 
      color  White // <red, green, blue, filter, transmit>
    }
    finish {
        porcelainFinish
    }
} 
#declare upperBorder = torus {
    1.921, 0.05 // major radius, minor radius
   pigment { 
      color  White // <red, green, blue, filter, transmit>
    }
    finish {
        porcelainFinish
    }
    translate <0,1.668,0>
}

#declare bottom = sphere {
    <0, -0.3, 0>, 1// <x, y, z>, radius
    pigment { 
      color  White // <red, green, blue, filter, transmit>
    }
    finish {
        porcelainFinish
    }
}

#declare boxBottomSemiSphere = box {
        <-2, 0, -2>, <2, 0.01, 2>
    pigment { 
       color White // <red, green, blue, filter, transmit>
    }
    finish {
        porcelainFinish
    }
  
}

#declare bowl = 
     union {
         difference {
            object {
                sphereRed
            }
            object {
                boxSemiSphere
            }
            object {
                sphereBlue
            }
        }
        object {
            upperBorder
        }
        difference {
            difference {
                object {
                    bottom
                }
                object {
                    boxBottomSemiSphere
                }
            }
            
            object {
                sphereBlue
            }
    }
    }
      
   
   
object {
    bowl
    translate <0,0.25,0>
}   



/* object {
boxSemiSphere
} */
/* object {
    sphereRed
    translate <3,0,0>
}
object {
    sphereBlue
} */

