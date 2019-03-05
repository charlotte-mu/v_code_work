transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/v_code_work/work2 {D:/v_code_work/work2/seg7.v}
vlog -vlog01compat -work work +incdir+D:/v_code_work/work2 {D:/v_code_work/work2/CLK.v}
vlog -vlog01compat -work work +incdir+D:/v_code_work/work2 {D:/v_code_work/work2/top.v}
vlog -vlog01compat -work work +incdir+D:/v_code_work/work2 {D:/v_code_work/work2/butten.v}
vlog -vlog01compat -work work +incdir+D:/v_code_work/work2 {D:/v_code_work/work2/main.v}

vlog -vlog01compat -work work +incdir+D:/v_code_work/work2 {D:/v_code_work/work2/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
