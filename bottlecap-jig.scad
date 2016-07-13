/*
 *  Bottlecap mounting jig
 *
 * For mounting bottlecaps or similarly shaped discs to CNC or other machines
 *
 *   This model is designed so that the size and quantity of bottle caps is
 * configurable.
 *
 * @author Kenneth Barbour
 * @license GPLv3
 */

height = 4;         // Height (thickness) of the jig
size = [5,6];       // Array size of the jig (rows, columns)
radii = [10,14];    // top and bottom radius respectively
spacing = 3;        // distance between fixtures

epsilon = 0.001;    // openscad preview correction

bottlecap_jig(height,size,radii,spacing);

module bottlecap_jig(height=5,size=[1,1],radii=[5,5],spacing=2) {
    r = max(radii[0],radii[1]);
    d = 2*(r);
    totalWidth = size[0]*(d + spacing) + spacing;
    totalLength = size[1]*(d + spacing) + spacing;
    offset = r + spacing;

    difference() {
        cube([totalWidth,totalLength,height]);
        for ( x = [0 : abs(size[0])-1]) for ( y = [0 : abs(size[1])-1]) {
            translate([offset+x*(d+spacing),offset+y*(d+spacing),-epsilon])
                cylinder(r1=radii[0],r2=radii[1],h=height+2*epsilon);
        }
    }
}
