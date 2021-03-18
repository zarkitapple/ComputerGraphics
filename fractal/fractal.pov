#include "colors.inc"

//General scene settings

camera {
    sky <0,0,1>         
    direction <-1,0,0>     
    right <-4/3,0,0>     
    location  <0,0,10>
    look_at   <0,0,0>
    angle 15
}

global_settings { 
    ambient_light White
}

light_source {
    <0,0,10> 
    color White
}

background {
    color Black
}

//Initiator
#declare sierpinski = 
    object{
        polygon { 
            4, <cos(90*pi/180),sin(90*pi/180),0>, <cos(210*pi/180),sin(210*pi/180),0>, <cos(330*pi/180),sin(330*pi/180),0>, <cos(90*pi/180),sin(90*pi/180),0>
        } 
        texture {
            pigment{Green}
        } 
    }

//Generator
#declare counter = 1;

#while (counter < 8)
     #declare sierpinski =
        union {
            object {
                sierpinski
                scale 0.5
                translate 0.5*<cos(90*pi/180),sin(90*pi/180),0>
            }
            object {
                sierpinski
                scale 0.5
                translate 0.5*<cos(210*pi/180),sin(210*pi/180),0>
            }
            object {
                sierpinski
                scale 0.5
                translate 0.5*<cos(330*pi/180),sin(330*pi/180),0>
            }
        }
    #declare counter = counter + 1;
#end

//Result

sierpinski
