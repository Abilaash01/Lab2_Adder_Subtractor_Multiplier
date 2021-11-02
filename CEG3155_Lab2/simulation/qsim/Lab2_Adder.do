onerror {quit -f}
vlib work
vlog -work work Lab2_Adder.vo
vlog -work work Lab2_Adder.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.fourbitfulladder_vlg_vec_tst
vcd file -direction Lab2_Adder.msim.vcd
vcd add -internal fourbitfulladder_vlg_vec_tst/*
vcd add -internal fourbitfulladder_vlg_vec_tst/i1/*
add wave /*
run -all
