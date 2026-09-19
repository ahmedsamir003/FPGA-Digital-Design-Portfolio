vlib work
vlog *.v
vsim -voptargs=+acc work.system_top_tb
do wave.do
run -all