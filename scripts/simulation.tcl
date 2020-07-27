
project compileall
#it suppress also the warning for the non optimizezd simulation, in questa sim leads to an error
vsim -novopt -suppress 12110 work.tb_memories # for suppressiang the error on -novopt
vsim -vopt work.{} # tes bench  name
add waves *
run 1000ns 