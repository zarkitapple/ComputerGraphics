#include "colors.inc" 
#include "porcelainCup.pov"
#include "woodenBoxPlant.pov"
#include "glassSphere.pov"
#include "glassStructure.pov"
#declare cameraTopDown = camera {
    location <0, 0, -7> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
    rotate x*50
}

#declare cameraRotatedLeft = camera {
    location <-4, 6, -7> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}

#declare cameraFront = camera {
    location <0, 1, -8> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}



#declare lightBackTop =  light_source {
    <2, 10, 10> // <x, y, z>
   White // <red, green, blue>
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
    cameraTopDown
}
light_source {
    lightBackTop
}
 //global_settings { ambient_light White }
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
  glassStructure
    translate <0,0,0>
}  
