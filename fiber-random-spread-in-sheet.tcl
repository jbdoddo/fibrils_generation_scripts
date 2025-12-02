menu main on
#load psf and pdb of duplicated monomers
mol new 60p.psf
mol addfile 60p.pdb

package require Orient
namespace import Orient::orient

#move everything to {x y z} {0 0 0} center of mass
set sel1 [atomselect top "residue 61"]
set cent1 [measure center $sel1]
set inverted_vec_1 [vecinvert $cent1]
$sel1 moveby $inverted_vec_1
set new_center_1 [measure center $sel1]

set sel2 [atomselect top "residue 0 to 59"]
set cent2 [measure center $sel2]
set inverted_vec_2 [vecinvert $cent2]
$sel2 moveby $inverted_vec_2
set new_center_2 [measure center $sel2]

#align to x and y axis
set I [draw principalaxes $sel1]
set A [orient $sel1 [lindex $I 2] {1 0 0}]
$sel1 move $A
set II [draw principalaxes $sel1]
set AA [orient $sel1 [lindex $II 2] {0 1 0}]
$sel1 move $AA

set I_2 [draw principalaxes $sel2]
set A_2 [orient $sel2 [lindex $I_2 2] {1 0 0}]
$sel2 move $A_2
set II_2 [draw principalaxes $sel2]
set AA_2 [orient $sel2 [lindex $II_2 2] {0 1 0}]
$sel2 move $AA_2

set first_x [transaxis x 3]
#$sel1 move $first_x

set second_x [transaxis x 180]
$sel1 move $second_x

set first_y [transaxis y 180]
$sel1 move $first_y

set first_z [transaxis z 0]
$sel1 move $first_z
#$se2 move $first_z

set second_y [transaxis y 45]
$sel1 move $second_y

set third_y [transaxis y 3]
$sel2 move $third_y

$sel1 moveby {0.56 -23.8 -0.40}

#check see if monomers are arranged correctly
set mono [atomselect top "residue 0 45"]
$mono writepsf monomer.psf
$mono writepdb monomer.pdb

set all [atomselect top all]
set all_residues [lsort -unique [$all get residue]]

# Generate two random lists of residue indices
set num_residues [llength $all_residues]
set num_selected [expr {int($num_residues / 2)}]
puts "Number selected: $num_selected"

set shuffled_indices [list]
while {[llength $shuffled_indices] < $num_selected} {
    set index [expr {int(rand() * $num_residues)}]
    puts "Index $index"
    if {$index ni $shuffled_indices} {
        lappend shuffled_indices $index
        puts "Shuffled indices: $shuffled_indices"
    }
}
set first_set $shuffled_indices
puts "First set: $first_set"

# Generate the second set as a shuffled version of the remaining indices
set remaining_indices [list]
for {set i 0} {$i < $num_residues} {incr i} {
    if {$i ni $first_set} {
        lappend remaining_indices $i
    }
}

set second_set [list]
while {[llength $remaining_indices] > 0} {
    set index [lindex $remaining_indices [expr {int(rand() * [llength $remaining_indices])}]]
    lappend second_set $index
    set remaining_indices [lreplace $remaining_indices [lsearch -exact $remaining_indices $index] [lsearch -exact $remaining_indices $index]]
}

puts "Second set (shuffled): $second_set"

# spread monomers to the first sheet 
set rot {}
set cumulative_displacement {0 0 0}

foreach residue $first_set {
    set res_atoms [atomselect top "residue $residue"]
    set cumulative_displacement [vecadd $cumulative_displacement {0 0 5}]
    $res_atoms moveby $cumulative_displacement
}

# spread the second sheet 
set cumulative_displacement_2 {9 0 0}

foreach residue $second_set {
    set res_atoms [atomselect top "residue $residue"]
    set y [transaxis y 180]
    set x [transaxis x 0]
    $res_atoms move $y
    $res_atoms move $x
    set cumulative_displacement_2 [vecadd $cumulative_displacement_2 {0 0 5}]
    $res_atoms moveby $cumulative_displacement_2
}

set mono_2 [atomselect top "residue 27 2 4 5 52 55 3 50 10 56 57 58"]
$mono_2 writepsf monomer-2.psf
$mono_2 writepdb monomer-2.pdb

# Initialize the rot list to store the desired values
set rot {}

# Populate the rot list with elements from the first and second sets
set first_set_index 0
set second_set_index 1 ; # Start with the second element from the second set

while {$first_set_index < [llength $first_set] || $second_set_index < [llength $second_set]} {
    if {$first_set_index < [llength $first_set]} {
        lappend rot [lindex $first_set $first_set_index]
        incr first_set_index 2
    }
    
    if {$second_set_index < [llength $second_set]} {
        lappend rot [lindex $second_set $second_set_index]
        incr second_set_index 2
    }
}

# Output the rot list
puts "Rot list: $rot"

# rotate every other monomer to make anti parallel
foreach residue_rot $rot {
	set clean_res_1 [atomselect top "residue $residue_rot"]
        set res_1 [measure center $clean_res_1]
        set inverted_res_1 [list 0 0 [expr {-[lindex $res_1 2]}]]
        $clean_res_1 moveby $inverted_res_1
        set clean_rot_1 [transaxis x 180]
        $clean_res_1 move $clean_rot_1
        set inverted_2_res_1 [list 0 0 [lindex $res_1 2]]
        $clean_res_1 moveby $inverted_2_res_1
	$clean_res_1 moveby {0 -45 0}
}


set a [atomselect top "residue 54"]
set b [atomselect top "residue 55 58"]
set c [atomselect top "residue 56 57 59"]
#$a moveby {0 -2 0}
#$b moveby {0 -2 0}
#$c moveby {0 2 0}

set peptide_rot_list {}

foreach peptide_rot $peptide_rot_list {
    set clean_res_2 [atomselect top "residue $peptide_rot and y < -45"]
    set pep_num_1 [$clean_res_2 num]
    if {$pep_num_1 > 0} {
	    #$clean_res_2 moveby {2 -6 0}
        set res_2 [measure center $clean_res_2]
        set inverted_res_2 [list 0 0 [expr {-[lindex $res_2 2]}]]
        $clean_res_2 moveby $inverted_res_2
        set clean_rot_2 [transaxis z -10]
        #$clean_res_2 move $clean_rot_2
        set inverted_2_res_2 [list 0 0 [lindex $res_2 2]]
        $clean_res_2 moveby $inverted_2_res_2

    }
}

set peptide_rot_list {}

foreach peptide_rot $peptide_rot_list {
    set clean_res_2 [atomselect top "residue $peptide_rot and y < -47"]
    set pep_num_1 [$clean_res_2 num]
    if {$pep_num_1 > 0} {
            #$clean_res_2 moveby {-3 -4 0}
        set res_2 [measure center $clean_res_2]
        set inverted_res_2 [list 0 0 [expr {-[lindex $res_2 2]}]]
        $clean_res_2 moveby $inverted_res_2
        set clean_rot_2 [transaxis z 10]
        #$clean_res_2 move $clean_rot_2
        set inverted_2_res_2 [list 0 0 [lindex $res_2 2]]
        $clean_res_2 moveby $inverted_2_res_2

    }
}


set peptide_rot_list_2 {}

foreach peptide_rot_2 $peptide_rot_list_2 {
    set clean_res_2_2 [atomselect top "residue $peptide_rot_2 and y > 4.05"]
    set pep_num_2 [$clean_res_2_2 num]
            $clean_res_2_2 moveby {0 6 -3}
        set res_2_2 [measure center $clean_res_2_2]
        set inverted_res_2_2 [list 0 0 [expr {-[lindex $res_2_2 2]}]]
        $clean_res_2_2 moveby $inverted_res_2_2
        set clean_rot_2_2 [transaxis z -15]
        $clean_res_2_2 move $clean_rot_2_2
        set inverted_2_res_2_2 [list 0 0 [lindex $res_2_2 2]]
        $clean_res_2_2 moveby $inverted_2_res_2_2
}

set peptide_rot_list_2 {}

foreach peptide_rot_2 $peptide_rot_list_2 {
    set clean_res_2_2 [atomselect top "residue $peptide_rot_2 and y > 2.7"]
    set pep_num_2 [$clean_res_2_2 num]
            #$clean_res_2_2 moveby {0 4 0}
        set res_2_2 [measure center $clean_res_2_2]
        set inverted_res_2_2 [list 0 0 [expr {-[lindex $res_2_2 2]}]]
        $clean_res_2_2 moveby $inverted_res_2_2
        set clean_rot_2_2 [transaxis z -30]
        #$clean_res_2_2 move $clean_rot_2_2
        set inverted_2_res_2_2 [list 0 0 [lindex $res_2_2 2]]
        $clean_res_2_2 moveby $inverted_2_res_2_2
}



[atomselect top all] writepsf randomly-arranged.psf
[atomselect top all] writepdb randomly-arranged.pdb


exit
