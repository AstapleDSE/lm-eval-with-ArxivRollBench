#!/bin/bash
######################################################################
#SYS_COPY --- 

# Author: Zi Liang <zi1415926.liang@connect.polyu.hk>
# Copyright © 2025, ZiLiang, all rights reserved.
# Created:  3 八月 2025
######################################################################

######################### Commentary ##################################
##  
######################################################################


export field_ls=("econ" "eess" "math" "physics" "q-bio" "q-fin" "stat")

for field in ${field_ls[*]}
    do
	cp robench-2025a-all-setcsSCP-s.yaml robench-2025a-all-set${field}SCP-s.yaml
	cp robench-2025a-all-setcsSCP-c.yaml robench-2025a-all-set${field}SCP-c.yaml
	cp robench-2025a-all-setcsSCP-p.yaml robench-2025a-all-set${field}SCP-p.yaml
    done



echo "RUNNING sys_copy.sh DONE."
# sys_copy.sh ends here
