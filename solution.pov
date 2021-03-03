#include "colors.inc" 
#include "porcelainCup.pov"
#include "woodenBoxPlant.pov"

#declare cameraTopDown = camera {
    location <0, 1, -5> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
    rotate x*45
}

#declare cameraRotatedLeft = camera {
    location <-4, 3, -5> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}

#declare cameraFront = camera {
    location <0, 1, -8> // <x, y, z>
    right     x*image_width/image_height // keep propotions regardless of aspect ratio
    look_at  <0, 0,  0> // <x, y, z>
}



#declare lightBackTop =  light_source {
    <0, 10, 30> // <x, y, z>
   White // <red, green, blue>
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
    cameraFront  
}
light_source {
    lightLeft
}
 global_settings { ambient_light White }
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



object {
    woodenBoxPlant
    translate <0,0.75,0>
    rotate y*-90
}   

