#include "colors.inc"    // The include files contain
  #include "stones.inc"    // pre-defined scene elements



#declare coordinateSphere =  <0, 0, 2>;

camera {
    location <0, 10, -10> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}
/* camera {
    location <0,0, -5>
    look_at  <0, 0,  0>
} */
light_source {
    <10, 10, -10> // <x, y, z>
    color White // <red, green, blue>
    
}


/* sky_sphere {
    pigment {
        gradient y
        color_map {
            [0 color White]
            [1 color Blue]
        }
        translate <0, -5, 0> // <x, y, z>
    }
} */

plane {
     
    y,-2  // perpendicular to axis, offset
     texture {
      T_Stone25 
    }
    
}
sphere {
    coordinateSphere, 2
    texture {
      pigment { color Yellow }
    }
   finish {
       phong 0.25
       reflection { 
           0.0 metallic 0.0
       }
   }
}
  

 /*   box {
    <-1, -40,   4>,  // Near lower left corner
    < 1, 0,  3>   // Far upper right corner
    texture {
      T_Stone25     // Pre-defined from stones.inc
      scale 4       // Scale by the same amount in all
                    // directions
    }
    //rotate y*20     // Equivalent to "rotate <0,20,0>"
  } */