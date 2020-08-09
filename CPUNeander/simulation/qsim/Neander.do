onerror {quit -f}
vlib work
vlog -work work Neander.vo
vlog -work work Neander.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Neander_vlg_vec_tst
vcd file -direction Neander.msim.vcd
vcd add -internal Neander_vlg_vec_tst/*
vcd add -internal Neander_vlg_vec_tst/i1/*
add wave /*
run -all
