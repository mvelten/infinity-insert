edge=30;
slot=1;
margin=2.5;

thickness=5;
height=80;

pillar_thickness=15;
pillar_height=height-3*thickness -slot;

magnet_radius=3.3;
magnet_thickness=2.6;

rotate([90,0,0]) {
    intersection() {
    union(){
        // base with slot for metal plate
        difference() {
            cube([edge,edge, 2 * thickness + slot]);
            translate([margin,margin,thickness]) cube([edge+2,edge+1,slot]);
            translate([18, 8.5, -1 ]) cylinder(r=magnet_radius, h=magnet_thickness+1);
        }
        
        // pillar
        translate([0, 0, 2*thickness+slot]) cube([pillar_thickness, pillar_thickness, pillar_height]);
        
        // top with magnet hole
        difference()  {
            translate([0,0,2*thickness+slot+pillar_height]) cube([edge,edge, thickness + slot]);
            translate([10, 10, height -magnet_thickness +1 ]) cylinder(r=magnet_radius, h=magnet_thickness+1);
        }
    }
    translate([120,90,-1])cylinder(r=142,h=2*height);
}
}