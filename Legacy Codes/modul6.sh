#!/bin/bash
clear
tes=y

while [ $tes == 'y' ]
do
echo "==Program Nilai Terkecil Kedua di dalam Array =="
echo "1. Demo Program Array"
echo "2. Lihat Data Array"
echo "3. Rata-rata Array"
echo "4. Exit"
echo "Pilihan :"
read pil

case $pil in
    1)
    echo "Jumlah angka : "
    read input

    for((i=0;i<$input;i++))
    do
    printf "Index Array - $i : "
    read a[i]
    done

    terkecil_prtm=${a[0]}
    for((i=0;i<$input;i++))
    do
    if [[ $terkecil_prtm -gt ${a[i]} ]]
then
        let terkecil_prtm=${a[i]}
        let acuan=i
    fi
    done

    terkecil_kedua=99999
    index=0
    for((i=0;i<$input;i++))
    do
    if [[ $i -eq $acuan ]]
    then
        let i=i+1
        let i=i-1
    else
          if [[ $terkecil_kedua -gt ${a[i]} ]]
        then        
            let terkecil_kedua=${a[i]}
            let index=i
        fi
    fi
    done
    
    printf "\n"
    echo "Nilai terkecil kedua : $terkecil_kedua"
    echo "Array terkecil kedua Index ke : $index"
    read
    clear
    ;;

    2)
if [[ $input -eq 0 ]]
    then
    printf "Harap Isi Data \n"
    else
    echo ${a[@]}
    fi
    read
    clear
    ;;

    3)
    if [[ $input -eq 0 ]]
    then
    printf "\n"
    printf "0\n"
    else
    banyak_data=${#a[@]};
    flag=0
    for((i=0;i<$banyak_data;i++))
    do
        let flag=$(expr "$flag" + "${a[i]}")
    done

    let total=$flag/$banyak_data
    echo "Rata-rata data array : $total"
    fi
    read
    clear
    ;;

    4)
  printf "\n"
    echo "Keluar dari progrram......"
    exit 1

    esac
    done

