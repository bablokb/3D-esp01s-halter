// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD) für Halter für ESP-01S-Stripboard-Plantine
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-esp01s-halter
//
// -----------------------------------------------------------------------------

include <BOSL2/std.scad>
include <dimensions.scad>

d_base = d_innen + 2*w_glas;
h_base = 0.6;

module base() {
  cylinder(d=d_base,h=h_base,anchor=BOTTOM+CENTER);
  translate([0,0,h_base])
    tube(od=d_base,wall=w_glas,h=h_pcb+w2,anchor=BOTTOM+CENTER);
}

module halter() {
  translate([-(d_base-x_pcb)/2+w_glas,0,h_base]) 
      rect_tube(size=[x_pcb+2*w2,y_pcb+2*w2],
                h=h_pcb,wall=w2,anchor=BOTTOM+CENTER);
}

module fase(richt="POS") {
  if (richt == "POS") {
    xrot(-90) prismoid(size1=[x_pcb+2*w2,w2],
                       size2=[x_pcb+2*w2,0],
                       shift=[0,-w2/2], h=w2,anchor=BOTTOM+BACK);
    cuboid([x_pcb+2*w2,w2,w2],anchor=BOTTOM+BACK);
  } else {
    xrot(180) prismoid(size1=[x_pcb+2*w2,w2],
                       size2=[x_pcb+2*w2,0],
                       shift=[0,-w2/2], h=w2,anchor=TOP);
    cuboid([x_pcb+2*w2,w2,w2],anchor=BOTTOM+FRONT);
  }
}

difference() {
  union() {
    base();
    halter();
    translate([-(d_base-x_pcb)/2+w_glas,-(y_pcb)/2,h_base+h_pcb]) fase("POS");
    translate([-(d_base-x_pcb)/2+w_glas,+(y_pcb)/2,h_base+h_pcb]) fase("NEG");
  }
  translate([-d_base/2+w_glas/2,0,h_base]) cuboid([3*w_glas,y_pcb,h_pcb+w2+fuzz],anchor=BOTTOM+CENTER);
} 
