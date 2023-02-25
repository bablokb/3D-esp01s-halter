// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD) für Schirm. Vasenmodus mit Loch am Boden.
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-esp01s-halter
//
// -----------------------------------------------------------------------------

include <BOSL2/std.scad>
include <dimensions.scad>

h_base = 0.6;
h_schirm= 22;

module schirm() {
  cylinder(d=d_innen/3,h=h_base,anchor=BOTTOM+CENTER);
  cylinder(d1=d_led,d2=d_innen-2*w4,h=h_schirm,anchor=BOTTOM+CENTER);
}

module cutout() {
  cylinder(d=d_led,h=h_led,anchor=CENTER);
  
}

difference() {
  schirm();
  cutout();
}
