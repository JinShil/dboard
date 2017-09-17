$fn = 30;

thickness = 7;

module plate() {
    cube([297, 210, thickness]);
}

module key_cap() {
    translate([-9, -9, thickness - 2]) {
        cube([18, 18, 2]);
    }
}

module key_hole() {
    translate([-7, -7, 0]) {
        cube([14, 14, thickness]);
    }
    key_cap();
}

module left_hand() {
    translate([90, 50, 0]) {
        rotate(a=90 - 35, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([73.70, 60, 0]) {
        rotate(a=90 - 28, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([56.7, 67, 0]) {
        rotate(a=90 - 27, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([37.4, 70, 0]) {
        rotate(a=90 - 23, v=[0,0,1]) {
            key_hole();
        }
    }
    
    
    
    translate([100.6, 64.95, 0]) {
        rotate(a=90 - 36, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([82.25, 76.1, 0]) {
        rotate(a=90 - 28, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([65, 83.25, 0]) {
        rotate(a=90 - 27, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([44.5, 86.75, 0]) {
        rotate(a=90 - 23, v=[0,0,1]) {
            key_hole();
        }
    }
    
    
    
    translate([113.25, 79.8, 0]) {
        rotate(a=90 - 45, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([91, 92.25, 0]) {
        rotate(a=90 - 29, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([73, 100.2, 0]) {
        rotate(a=90 - 24, v=[0,0,1]) {
            key_hole();
        }
    }
    
    translate([51.1, 104.55, 0]) {
        rotate(a=90 - 18, v=[0,0,1]) {
            key_hole();
        }
    }
}

difference(){
    plate();
    translate([50, 50, 0]) {
        left_hand();
    }
}