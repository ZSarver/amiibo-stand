base_width = 70.0;
base_height = 10.0;

leg_height = 115.0;
leg_width = 7.0;
leg_placement = base_width / 2 - leg_width / 2;

support_length = sqrt(pow(base_width, 2) / 2.5);

// base shape
difference () {
    union () {
        // base
        translate([0, 0, base_height / 2]) {
            cube([base_width, base_width, base_height], true);
        }
        
        // legs
        translate([leg_placement, 0.0, leg_height / 2.0]) 
            { cube([leg_width, base_width, leg_height], true); };
        translate([-leg_placement, 0.0, leg_height / 2.0]) 
            { cube([leg_width, base_width, leg_height], true); };
    };

    translate([0, 0, (leg_height / 2) + base_height]) 
        { cube([base_width + leg_width + 1, base_width - 2 * leg_width, leg_height], true); };
};

// supports
translate([-leg_placement, -base_width / 4 + 1, support_length / 2 - 1]) {
    rotate(45, [1, 0, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};
translate([leg_placement, -base_width / 4 + 1, support_length / 2 - 1]) {
    rotate(45, [1, 0, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};

translate([-leg_placement, base_width / 4 - 1, support_length / 2 - 1]) {
    rotate(-45, [1, 0, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};
translate([leg_placement, base_width / 4 - 1, support_length / 2 - 1]) {
    rotate(-45, [1, 0, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};

translate([base_width / 4 - 1, leg_placement, support_length / 2 - 1]) {
    rotate(45, [0, 1, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};
translate([base_width / 4 - 1, -leg_placement, support_length / 2 - 1]) {
    rotate(45, [0, 1, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};

#translate([-base_width / 4 + 1, -leg_placement, support_length / 2 - 1]) {
    rotate(-45, [0, 1, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};
#translate([-base_width / 4 + 1, leg_placement, support_length / 2 - 1]) {
    rotate(-45, [0, 1, 0]) {
        cube([leg_width, leg_width, support_length], true);
    };
};