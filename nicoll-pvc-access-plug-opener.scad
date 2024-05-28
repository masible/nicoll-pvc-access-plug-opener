// From https://www.thingiverse.com/thing:109467
use <modules/pie.scad>;

// Change this to support other diameters of access plugs
diameter = 53.7;
radius = diameter/2;
height = 10;
num_dimples = 8;
thickness_dimple = 1.6;

module pipe_cap() {
    $fn=128;
    cylinder(height, r=radius);
    for ( i = [0 : num_dimples] ){
        pie(radius + thickness_dimple, 360/(num_dimples*2), height, i * 360 / num_dimples);
    }
}

module pipe_cap_negative_shape() {
    translate([0, 0, height + 3])
    rotate([0, 180, 0])
    difference() {
        cylinder(height + 3, r = radius + thickness_dimple + 3);
        translate([0, 0, -0.1])
        pipe_cap();
    }
}

difference() {
    union() {
        translate([0, 0, height])
        pipe_cap_negative_shape();
        cylinder(height, r=radius + thickness_dimple + 3);
    }

    translate([0, (radius + thickness_dimple + 6), 6])
    rotate([90, 0, 0])
    cylinder(d=9.75, h=2 * (radius + thickness_dimple + 6), $fn=6);
}