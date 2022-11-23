// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD) für Tubus. Vasenmodus mit Loch am Boden.
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-esp01s-halter
//
// -----------------------------------------------------------------------------

include <BOSL2/std.scad>
include <dimensions.scad>


module tubus() {
  cylinder(d=d_innen,h=h_glas,anchor=BOTTOM+CENTER);
}

module cutout() {
  cylinder(d=d_led,h=h_led,anchor=CENTER);
  
}

difference() {
  tubus();
  cutout();
}
