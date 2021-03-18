#declare porcelainFinish = finish {
    ambient 0.2
    diffuse 0.8
    reflection 0.05
    phong 50
    phong_size 250
    roughness 0.6    
}


#declare sphereRed = sphere {
    <0, 2, 0>, 2 // <x, y, z>, radius
}

#declare boxSemiSphere = box {
        <-2, 1.668, -2>, <2, 4, 2>
}

#declare sphereBlue = sphere {
    <0, 2, 0>, 1.9 // <x, y, z>, radius
} 
#declare upperBorder = torus {
    1.921, 0.05 // major radius, minor radius
    translate <0,1.668,0>
}

#declare bottom = sphere {
    <0, -0.3, 0>, 1// <x, y, z>, radius
}

#declare boxBottomSemiSphere = box {
        <-2, -0.5, -2>, <2, -0.15, 2>
}

#declare porcelainCup = 
    blob {
        threshold 0.5
        sphere {
             <0, 2, 0>, 2, 1
                   pigment { 
            color Green // <red, green, blue, filter, transmit>
            }
        }
        sphere {
           <0, 0.3, 0>, 1, 1.3
           pigment { 
      color Red // <red, green, blue, filter, transmit>
        }
        }
        
     pigment { 
      color White // <red, green, blue, filter, transmit>
    }
    finish {
        porcelainFinish
    }
}