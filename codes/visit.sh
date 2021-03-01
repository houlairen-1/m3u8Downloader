#!/bin/bash
# -*- coding:utf-8 -*-

data_dir='../data'
m3u8_list_path=$data_dir'/m3u8-list.csv'
log_path=$data_dir'/log.md'
m3u8_arr=($(cat $m3u8_list_path))

for (( id=0;id<${#m3u8_arr[@]}; id=id+1 ))
do
    #printf "%02d\n" "$id"
    printf "%0.s-_" {1..40}
    printf "\n\n"
    old_ifs=$IFS
    IFS=','
    # 关键步骤
    item_arr=(${m3u8_arr[id]})
    to_do=${item_arr[0]}
    fn_path=$data_dir'/'${item_arr[1]}'.mp4'
    m3u8=${item_arr[2]}
    #echo -e "to do is\t"$to_do

    fmt=$(date +"%Y-%m-%d  %H:%M")
    if [ $to_do -ne 1 ]; then
        echo -e "[${fmt}  Warning!]  ${fn_path}\t exists."
        continue
    fi
    ffmpeg -i $m3u8 $fn_path
    fmt=$(date +"%Y-%m-%d %H:%M")
    echo "[${fmt}  Info]  ffmpeg -i $m3u8 $fn_path" >> $log_path
    IFS=$old_ifs
    
done
