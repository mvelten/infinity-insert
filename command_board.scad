width = 275 ;
length = 160;
height= 6;
magnet_radius=3.3;
magnet_height=2.2;
spacing=10;

token_radius=13;
token_thickness=4.5;

d6_size=14;
wheel_radius=25;

//difference() {
intersection() {

intersection() {
    difference() {
        // base plate
        cube([width, length,height]);
        
        // bottom magnet holes
        translate([spacing,spacing,-1]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([width - spacing,spacing,-1]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([spacing, length - spacing, -1]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([width - spacing, length - spacing,-1]) cylinder(r=magnet_radius, h=magnet_height+1);
        
        // tokens
        // combat group 2
        for(x=[1:10]) 
            translate([-15 + (2*token_radius)*x,10,-1]) 
                cube([2*token_radius -4, token_thickness, height+2]);
        for(x=[1:10]) 
            translate([-17 + token_radius + (2*token_radius)*x,30,height - token_thickness]) 
                cylinder(r=token_radius, h=token_thickness+1);
        intersection() {
            for(x=[1:10]) 
                translate([-17 + (2*token_radius)*x,17,-1]) 
                    cube([2*token_radius, 7, height - token_thickness+2]);
            for(x=[1:10]) 
                translate([-17 + token_radius + (2*token_radius)*x,30,-1]) 
                    cylinder(r=token_radius, h=token_thickness+1);
        }  
        
        // combat group 1
        for(x=[1:10]) 
            translate([-15 + (2*token_radius)*x,50,-1]) 
                cube([2*token_radius -4, token_thickness, height+2]);
        for(x=[1:10]) 
            translate([-17 + token_radius + (2*token_radius)*x,70,height - token_thickness]) 
                cylinder(r=token_radius, h=token_thickness+1);
        intersection() {
            for(x=[1:10]) 
                translate([-17 + (2*token_radius)*x,57,-1]) 
                    cube([2*token_radius, 7, height - token_thickness+2]);
            for(x=[1:10]) 
                translate([-17 + token_radius + (2*token_radius)*x,70,-1]) 
                    cylinder(r=token_radius, h=token_thickness+1);
        }  
        
        // command token
        for(x=[1:5]) 
            translate([-15 + (2*token_radius)*x,90,-1]) 
                cube([2*token_radius -4, token_thickness, height+2]);
        for(x=[1:5]) 
            translate([-17 + token_radius + (2*token_radius)*x,110,height - token_thickness]) 
                cylinder(r=token_radius, h=token_thickness+1);
        intersection() {
            for(x=[1:5]) 
                translate([-17 + (2*token_radius)*x,97,-1]) 
                    cube([2*token_radius, 7, height - token_thickness+2]);
            for(x=[1:5]) 
                translate([-17 + token_radius + (2*token_radius)*x,110,-1]) 
                    cylinder(r=token_radius, h=token_thickness+1);
        }  
        
        // lieutenant order
        for(x=[1,3]) 
            translate([-15 + (2*token_radius)*x,125,-1]) 
                cube([2*token_radius -4, token_thickness, height+2]);
        for(x=[1,3]) 
            translate([-17 + token_radius + (2*token_radius)*x,145,height - token_thickness]) 
                cylinder(r=token_radius, h=token_thickness+1);
        intersection() {
            for(x=[1,3]) 
                translate([-17 + (2*token_radius)*x,133,-1]) 
                    cube([2*token_radius, 7, height - token_thickness+2]);
            for(x=[1,3]) 
                translate([-17 + token_radius + (2*token_radius)*x,145,-1]) 
                    cylinder(r=token_radius, h=token_thickness+1);
        }  
        
        // round count/d6
        translate([-15 + (2*token_radius)*5,135,height/2]) 
            cube([d6_size, d6_size,height/2+1]);
        
        // points counter wheels
        // enemy
        translate([240,120,height/2]) 
            cylinder(r=wheel_radius, h=height/2+1);
        translate([240,143,height/2])
            cube([3,10,height/2+1]);
        // self
        translate([180,120,height/2]) 
            cylinder(r=wheel_radius, h=height/2+1);
        translate([180,143,height/2])
            cube([3,10,height/2+1]);
    }
        // corners
        translate([width/2,length/2,-1])cylinder(r=width/2+16, h=height*2);
}
            // cut my board into pieces...
        color([0,1,0]) 
            translate([-1,-1,-1])
            linear_extrude(height=height + 5) {
                polygon(points=[[0,0],[0,length+2],[width/2+2, length+2],[width/2-25, length-40],[width/2-25, length-60],[width/2, length-80],[width/2-25, length-100],[width/2-25, length-120],[width/2, length-150],[width/2 +2,0]]);
        }    
}