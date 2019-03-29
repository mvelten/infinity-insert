width = 275 ;
length = 160;
height= 15;
magnet_radius=3.3;
magnet_height=2.2;
spacing=10;
base_thickness=5;

//intersection() {
difference(){
    
difference() {
//intersection() {

intersection() {
    difference() {
        // base plate
        cube([width, length,height]);
        
        // top magnet holes
        translate([spacing,spacing,height-magnet_height]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([width - spacing,spacing,height-magnet_height]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([spacing, length - spacing, height-magnet_height]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([width - spacing, length - spacing,height-magnet_height]) cylinder(r=magnet_radius, h=magnet_height+1);
        
        // bottom magnet holes
        translate([spacing,spacing,-1]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([width - spacing,spacing,-1]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([spacing, length - spacing, -1]) cylinder(r=magnet_radius, h=magnet_height+1);
        translate([width - spacing, length - spacing,-1]) cylinder(r=magnet_radius, h=magnet_height+1);
        
        // templates
//       intersection() {
 //               rotate([0,90,0])translate([-height/2,length/2,5]) cylinder(r1=66, r2=20, h=265);
//                %translate([0,0,base_thickness]) cube([width, length,height-1]);
 //       }
        // impact templates
       // round template     
       translate([67,67,base_thickness])cylinder(r=62, h=height);
       // teardrops
       translate([0,0,base_thickness])linear_extrude(height=height - base_thickness+1) {
           polygon(points=[ [ 60,5], [width-15, 5], [width-15,20], [120,95]]);
       }
       // movement template
       translate([0,0,height-3])linear_extrude(height=height - base_thickness+1) {
           polygon(points=[ [ 100,155], [width-15,155], [195,65], [130,97],[115,128],[100,135]]);
       }
    }
    
        // "round" corners
        translate([width/2,length/2,-1])cylinder(r=width/2+16, h=height*2);

    }
            // cut into two pieces to fit my printbed
   color([0,1,0]) 
           translate([-1,-1,-1])
           linear_extrude(height=height + 5) {
              polygon(points=[[0,0],[0,length+2],[width/2+2, length+2],[width/2-25, length-40],[width/2-25, length-60],[width/2, length-80],[width/2-25, length-100],[width/2-25, length-120],[width/2, length-150],[width/2 +2,0]]);
    }


}
   color([0,1,0]) 
           translate([-1,-1,-1])
           linear_extrude(height=height + 5) {
              polygon(points=[[0,0],[0,length/2],[width+2, length/2],[width +2,0]]);
    }
}