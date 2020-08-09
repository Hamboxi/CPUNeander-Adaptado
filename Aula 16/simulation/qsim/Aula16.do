onerror {quit -f}
vlib work
vlog -work work Aula16.vo
vlog -work work Aula16.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Projeto_vlg_vec_tst
vcd file -direction Aula16.msim.vcd
vcd add -internal Projeto_vlg_vec_tst/*
vcd add -internal Projeto_vlg_vec_tst/i1/*
add wave /*
run -all
