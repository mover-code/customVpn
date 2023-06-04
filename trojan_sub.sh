#!/bin/bash
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH

config_file=/data/shell/clash_config.yaml
gen_file=/data/shell/sub
count=`cat $config_file | grep RANDOM_PORT | wc -l`

cat ${config_file} >${gen_file}

for i in `seq ${count}`;do 
  rand_port=$((RANDOM % 1000 + 30000 ))
  sed -i "s/RANDOM_PORT$i/$rand_port/g"  $gen_file
  echo "port is $rand_port , $i"
done

echo "Generated path: $gen_file"