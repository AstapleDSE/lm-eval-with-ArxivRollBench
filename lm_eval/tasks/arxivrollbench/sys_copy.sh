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
export scp_type=("s" "c" "p")

# for field in ${field_ls[*]}
#     do
# 	cp robench-2025a-all-setcsSCP-s.yaml robench-2025a-all-set${field}SCP-s.yaml
# 	cp robench-2025a-all-setcsSCP-c.yaml robench-2025a-all-set${field}SCP-c.yaml
# 	cp robench-2025a-all-setcsSCP-p.yaml robench-2025a-all-set${field}SCP-p.yaml
#     done

# ==============================================================================================
## Automatically Replacement for SCP 50 samples

# export field_ls=("cs" "econ" "eess" "math" "physics" "q-bio" "q-fin" "stat")
export field_ls=("cs")
export scp_type=("s" "c" "p")

for field in ${field_ls[*]}
    do
	cp robench-2025a-all-set${field}SCP-s.yaml robench-2025a-all-set${field}SCP-s-50.yaml
	cp robench-2025a-all-set${field}SCP-c.yaml robench-2025a-all-set${field}SCP-c-50.yaml
	cp robench-2025a-all-set${field}SCP-p.yaml robench-2025a-all-set${field}SCP-p-50.yaml
    done



append_50_original() {
    local file=$1
    [[ -f $file ]] || return          # skip if file does not exist.
    local tmp
    tmp=$(mktemp "${file}.XXXXXX")
    trap 'rm -f "$tmp"' RETURN
    # only used for GNU seed
    sed -E 's@(robench2025a_all_set[^[:space:]]*SCP-[^[:space:]]*)@\1-50@g' "$file" > "$tmp"
    mv "$tmp" "$file"
    echo "Updated: $file"
}
append_50_liangzid() {
    local file=$1
    [[ -f $file ]] || return                 # skip if not exist 
    local tmp
    tmp=$(mktemp "${file}.XXXXXX")
    trap 'rm -f "$tmp"' RETURN
    sed -E 's@(liangzid/robench2025a_test_all_category_set[^[:space:]]*SCP-[^[:space:]]*)@\1-50@g' "$file" > "$tmp"
    mv "$tmp" "$file"
    echo "Updated: $file"
}

for field in "${field_ls[@]}"; do
    for typee in "${scp_type[@]}"; do
        filenamee="robench-2025a-all-set${field}SCP-${typee}-50.yaml"
        append_50_original "$filenamee"
        append_50_liangzid "$filenamee"
    done
done


echo "RUNNING sys_copy.sh DONE."
# sys_copy.sh ends here
