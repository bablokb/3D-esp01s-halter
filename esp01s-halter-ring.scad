// -----------------------------------------------------------------------------
// 3D-Model (OpenSCAD) für Tube-Ring
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/3D-esp01s-halter
//
// -----------------------------------------------------------------------------

include <BOSL2/std.scad>
include <dimensions.scad>

d_ring = d_innen + 2*w_glas;
h_ring = 0.6;
h_wall = 10;

module ring() {
  tube(od=d_ring,wall=w_glas+w06+w06,h=h_ring,anchor=BOTTOM+CENTER);
}

module wall() {
  tube(od=d_innen-2*w06,wall=w06,h=h_wall,anchor=BOTTOM+CENTER);
}
ring();
wall();