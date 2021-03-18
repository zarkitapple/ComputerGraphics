#include "colors.inc" 
#include "porcelainCup.pov"
#include "woodenBoxPlant.pov"
#include "glassSphere.pov"
#include "glassStructure.pov"

#declare cameraTop = camera {
    location <0, 0, -10> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
    rotate <88,0,9>

}
#declare cameraFrontFront = camera {
    location <0, 1, -8> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}

#declare cameraFront = camera {
   location <0.5, 3.5, -8> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}


#declare lightBackTop =  light_source {
    <0.5, 4.5, 10> // <x, y, z>
   White // <red, green, blue>
   parallel
   photons {
        refraction on
        reflection on
   }
}

#declare lightLeft = light_source {
    <-5, 10, -10> // <x, y, z>
   White // <red, green, blue>
   photons {
        refraction on
        reflection on
   }
   
}
#declare lightRight = light_source {
    <10, 10, -10> // <x, y, z>
   White // <red, green, blue>
   photons {
        refraction on
        reflection on
   }
}

camera {
    cameraFront
}
light_source {
    lightBackTop
}

plane {
  y, 0 // perpendicular to axis, offset
    pigment {
         color White
    }
    finish {
        diffuse 1

    }
   
}

object {
    glassSphere
    scale 0.40
    translate <-1.7, 0.7, -1.6>
}

object {
    glassStructure
    scale 0.85
    translate <-1.5, 0, 1.7>
}

/* object {
    porcelainCup
    scale 0.45
    translate <1.2, 0, -2>
} */

object {
    woodenBoxPlant
    scale 0.9
    rotate y*275
    translate <0, 0.68, 0.25>
}   

