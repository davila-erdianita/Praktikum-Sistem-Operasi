#!/bin/bash

makanan(){	
	echo "+----Menu Makanan-----+"
	echo "> ayam goreng"
	echo "> iga bakar"
	echo "> bakso"
	echo "> soto ayam"
	echo "Silahkan ketik nama makanan yang diinginkan(gunakan huruf kecil dan lengkap):"
	read hitung
	echo -n "berapa porsi $hitung : "
	read makan
	echo "+---pilihan harga per porsi---+"
	echo "> Ayam goreng= 25000"
	echo "> iga bakar = 30000"
	echo "> Bakso = 20000"
	echo "> Soto ayam = 20000"
	echo -n "masukkan harga per porsi : "
	read harga
	let kali=$makan*$harga
	let totalharga+=$kali
	case "$hitung" in
	"ayam goreng")
	echo "$makan * $harga =$kali"
	;;
	"iga bakar")
	echo "$makan * $harga =$kali"
	;;
	"bakso")
	echo "$makan * $harga =$kali"
	;;
	"soto ayam")
	echo "$makan * $harga =$kali"
	;;
	*)
	echo "Maaf coba lagi"
	;;
	esac
	echo "total harga=$totalharga"
}

minuman(){
	echo "+----Menu Minuman-----+"
	echo "> es degan"
	echo "> kopi"
	echo "> es teh"
	echo "> es jeruk"
	echo "Silahkan ketik nama minuman yang diinginkan(gunakan huruf kecil dan lengkap):"
	read hitung
	echo -n "berapa gelas/botol $hitung : "
	read minum
	echo "+---pilihan harga per gelas/botol---+"
	echo "> Es degan= 5000"
	echo "> Kopi = 4000"
	echo "> Es teh = 3500"
	echo "> es jeruk = 5000"
	echo -n "masukkan harga per porsi : "
	read harga
	let kali=$minum*$harga
	let totalhargaminuman+=$kali
	case "$hitung" in
	"es degan")
	echo "$minum * $harga =$kali"
	;;
	"kopi")
	echo "$minum * $harga =$kali"
	;;
	"es teh")
	echo "$minum * $harga =$kali"
	;;
	"es jeruk")
	echo "$minum * $harga =$kali"
	;;
	*)
	echo "Maaf coba lagi"
	;;
	esac
	echo "total harga=$totalhargaminuman"
}

ruangan(){
	echo "+----Tipe Ruangan-----+"
	echo "> bisnis"
	echo "> acara"
	echo "> biasa"
	echo "> keluarga"
	echo "Silahkan ketik nama ruangan yang diinginkan(gunakan huruf kecil dan lengkap):"
	read ruang
	
	echo "Pengecekan tipe ruangan $ruang "
	echo "Harap menunggu, proses pengecekan akan selesai..."
	sleep 3s
	clear
	case "$ruang" in
	"bisnis")
	echo "Ruangan $ruang ditemukan"
	echo "Berapa meja yang dipesan di ruangan $ruang?"
	read meja
	clear
	conditional_statements	
	;;
	"acara")
	echo "Ruangan $ruang ditemukan"
	echo "Berapa meja yang dipesan di ruangan $ruang?"
	read meja
	clear
	conditional_statements	
	;;
	"biasa")
	echo "Ruangan $ruang ditemukan"
	echo "Berapa meja yang dipesan di ruangan $ruang?"
	read meja
	clear
	conditional_statements	
	;;
	"keluarga")
	echo "Ruangan $ruang ditemukan"
	echo "Berapa meja yang dipesan di ruangan $ruang?"
	read meja
	clear
	conditional_statements	
	;;
	*)
	echo "Maaf coba lagi"
	;;
	esac
	
}
conditional_statements(){
	
	
	if [ $meja == 0 ]
	then
	 	echo "Anda memilih membawa pulang pesanan. Silahkan menunggu, pesanan akan siap dalam 15 menit, tekan enter.... "
	elif [ $meja -gt 0 ]
	then
	 echo "Silahkan menunggu di ruangan $ruang yang telah dipesan. Kami akan mengantar pesanan ke meja anda. tekan enter"
	else
	 echo "Silahkan mencoba kembali"

	fi
}


echo "Nama Pegawai Kasir:"
read pegawai
clear
tes=y
while [ $tes == 'y' ]
do

echo "+------Program Pembayaran Restoran------+"
echo "1. menu makanan"
echo "2. menu minuman"
echo "3. menu ruangan"
echo "4. cetak nota"
echo "5. keluar"
echo "+----------------------+"
echo -n "Pilih Menu(1-5): "
read pilih

case $pilih in
	1)
	makanan
	read
	clear
	;;
	2)
	minuman
	read
	clear
	;;
	3)
	ruangan
	read
	clear
	;;
	4)
	let totalseluruh=$totalharga+$totalhargaminuman
	echo "++================Nota===================++"

	echo "> Pegawai Kasir	     = $pegawai	       "
	echo "> total harga makanan= $totalharga       "
	echo "> total harga minuman= $totalhargaminuman"
	echo "> Tipe Ruangan	     = $ruang       "
	echo "> Pesan tanggal      = `date`	       "
	echo "> total harga minum + makan = $totalseluruh "
	conditional_statements

	echo "++=======================================++"
	echo "||Pegawai kasir = $pegawai || total harga makanan = $totalharga || total harga minuman = $totalhargaminuman || Tipe ruangan = $ruang || Pesan tanggal = `date`||">> datapembeli.txt
	echo "proses pencetakan nota dan penyimpanan data"
	echo "Mohon menunggu 3 detik...."
	sleep 3s
	echo "Nota Berhasil disimpan dalam file datapembeli.txt"
	gedit datapembeli.txt
	read
	clear
	;;
	5)
	printf "\n"
	echo "===Terima Kasih==="
	exit 1

	esac
	done
