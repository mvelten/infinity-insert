  include <modules.scad>;

base_width = 275 ;
base_height = 160;
tray_height = 46;

// infinity specific sizes
token_size = 26;
s7=57; // size of a silhouette 7 base plus 2mm margin
card_height=96.2;


// switch between difference() and intersection() for the other half
//intersection(){
difference(){

intersection() {
    union() {
         // base plate
        color([1,0,0]) 
            translate([0,0,-BASETHICK])
                cube([base_width,base_height,BASETHICK]);

        // outer walls
        wall([-THICK,0], [base_height, tray_height], 90);        
        wall([-base_width,0], [base_height, tray_height], 90);        

        // silhouette boxes
        wall([-THICK - s7,-token_size+THICK], [2*THICK +base_height - 2*token_size + 2.5, tray_height], 90);
        wall([-THICK,-102], [s7, tray_height], 0);

        // ruler + cards
        wall([- THICK - s7,2*THICK - token_size - 2 -  card_height +5], [base_width - 2 *THICK - s7, tray_height], 0);     
         wall([-3*THICK -s7 -  2*75, THICK-token_size + 5], [card_height, tray_height-10], 90);
        // "grabbing hole"
        difference()  {  
         wall([-2*THICK -s7 - 75, THICK -token_size + 2], [card_height-1, tray_height-10], 90);
            translate([2*THICK  +s7 +  75, THICK+token_size + card_height/2,0]) cylinder(h=tray_height, r1=10, r2=25);
    }
        



        // token boxes
        // front
        translate([THICK, 0, 0]) {
            difference() {
                cube([base_width-2*THICK, token_size- THICK, tray_height]);
                // loop to insert token holes
                for(x=[1:9])
                translate([5+x*1.1*token_size - token_size/2,token_size/2 - 2*THICK,0])
                    cylinder(h=tray_height+1, r=token_size/2);
                
                // holes for magnets
                translate([base_width-9, 17, tray_height - 3]) cylinder(r=3.1, h=4);
                translate([4, 17, tray_height - 3]) cylinder(r=3.1, h=4);
            }
        }
        // back
            translate([THICK, THICK + base_height - token_size +2.5, 0]) {
            difference() {
                cube([base_width-2*THICK, token_size- THICK-2.5, tray_height]);
                
                // loop to insert token holes
                for(x=[1:9])
                translate([5+x*1.1*token_size - token_size/2,token_size/2 + 2*THICK-2.5,0])
                    cylinder(h=tray_height+1, r=token_size/2);
                
                 // holes for magnets
                translate([base_width-9, 6, tray_height - 3]) cylinder(r=3.1, h=4);
                translate([4, 6, tray_height - 3]) cylinder(r=3.1, h=4);
            }
        }

        
         // No holes across potential joins. 
        // Should be parametrized, its getting late...
         color([1,0,0]) translate([ s7,2*THICK + token_size - 10 +  card_height - 5]) cube([THICK, 10, tray_height]);
         color([1,0,0]) translate([ base_width-THICK,2*THICK + token_size - 10 +  card_height -5]) cube([THICK, 10, tray_height]);
        color([1,0,0]) translate([ s7,2*THICK + token_size - 25 +  card_height]) cube([THICK, 8, tray_height]);
        color([1,0,0]) translate([ 0,2*THICK + token_size - 27 +  card_height]) cube([THICK, 8, tray_height]);
        
         color([1,0,0]) translate([2*THICK +s7 + 70,token_size +  card_height -THICK -5]) cube([8, THICK, tray_height]);
         color([1,0,0]) translate([2*THICK +s7 + 147,token_size +  card_height -THICK -5]) cube([8, THICK, tray_height]);
    }
    
    // round corners
    translate([base_width/2,base_height/2,-20]) cylinder(r=base_width/2+16, h=tray_height+40);
    }
    
        // cut into two pieces to fit my printbed
    color([0,1,0]) 
           translate([-1,-1,-THICK-1])
           linear_extrude(height=tray_height + 5 + THICK) {
            polygon(points=[[0,0],[0,base_height+2], [140,base_height+2],[140,135],[120, 125],[120,90],[140,80],[120,60],[120,40],[140,15],[140,0]]);
    }
}
