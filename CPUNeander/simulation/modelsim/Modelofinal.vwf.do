vlog -work work C:/Users/Flavio/Documents/UFABC/2019.2/Sistemas/Neander/CPUNeander/simulation/modelsim/Modelofinal.vwf.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Neander_vlg_vec_tst
onerror {resume}
add wave {Neander_vlg_vec_tst/i1/CargaRDM}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[15]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[14]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[13]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[12]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[11]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[10]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[9]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[8]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[7]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[6]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[5]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[4]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[3]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[2]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[1]}
add wave {Neander_vlg_vec_tst/i1/CargaRDM[0]}
add wave {Neander_vlg_vec_tst/i1/CargaREM}
add wave {Neander_vlg_vec_tst/i1/CargaREM[3]}
add wave {Neander_vlg_vec_tst/i1/CargaREM[2]}
add wave {Neander_vlg_vec_tst/i1/CargaREM[1]}
add wave {Neander_vlg_vec_tst/i1/CargaREM[0]}
add wave {Neander_vlg_vec_tst/i1/CLK}
add wave {Neander_vlg_vec_tst/i1/Encerra}
add wave {Neander_vlg_vec_tst/i1/Gravar}
add wave {Neander_vlg_vec_tst/i1/Saida}
add wave {Neander_vlg_vec_tst/i1/Saida[7]}
add wave {Neander_vlg_vec_tst/i1/Saida[6]}
add wave {Neander_vlg_vec_tst/i1/Saida[5]}
add wave {Neander_vlg_vec_tst/i1/Saida[4]}
add wave {Neander_vlg_vec_tst/i1/Saida[3]}
add wave {Neander_vlg_vec_tst/i1/Saida[2]}
add wave {Neander_vlg_vec_tst/i1/Saida[1]}
add wave {Neander_vlg_vec_tst/i1/Saida[0]}
run -all
