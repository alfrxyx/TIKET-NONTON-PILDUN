.MODEL SMALL
.CODE

ORG 100h

JMP Mulai

;Variabel
nama    DB 0dh, 0ah, 0dh, 0ah, "Masukan Nama Anda : ", '$'
id      DB 0dh, 0ah, "Masukan NIK Anda : ", '$'
beli1   DB "APLIKASI PENJUALAN TIKET NONTON PIALA DUNIA", 0dh, 0ah, "--------------------------------------------", '$' 
beli2   DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat Datang Di Outlet Pembelian Tiket Nonton Piala Dunia #ALFRXYX# ...", '$' 
beli3   DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Paket Yang Tersedia : ", 0dh, 0ah 
        DB "====================================", 0dh, 0ah
        DB "=  1. Paket VIP Rp. 2.000.000,00   =", 0dh, 0ah
        DB "=  2. Paket Regular Rp. 750.000,00 =", 0dh, 0ah
        DB "====================================", 0dh, 0ah
        DB 0dh, 0ah, "Paket Mana Yang Ingin Anda Beli ? ", '$'

beli4   DB 0dh, 0ah, "Pembelian Berhasil...", '$'
beli5   DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "========================= PEMBELIAN SELESAI =====================", 0dh, 0ah
        DB "Silahkan aktifkan paket anda", 0dh, 0ah, "dan selamat menonton piala dunia", '$'

beli6   DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Ingin Meminjam Barang Lain ? (Y, N)", '$'
beli7   DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Terimakasih Telah Menggunkan Aplikasi Ini..", '$'
error   DB 0dh, 0ah, "Masukan Kode Dengan Benar", '$'
msg1    DB 0dh, 0ah, 0dh, 0ah, "====== PaketVIP ======", 0dh, 0ah, "Harga 1 Tiket VIP Rp.2.000.000,00", 0dh, 0ah, "Harap Lakukan Pembayaran Segera!!!" , '$'
msg2    DB 0dh, 0ah, 0dh, 0ah, "====== PaketReg ======", 0dh, 0ah, "Harga 1 Tiket Regular Rp.750.000,00", 0dh, 0ah, "Harap Lakukan Pembayaran Segera!!!" , '$'
msg5    DB 0dh, 0ah, 0dh, 0ah, "Ketik 'E' Untuk Mencetak Bukti dan Keluar dari program.... ", '$'

tampung_nama DB 30, ?, 30 dup(?)
tampung_id DB 30, ?, 30 dup(?)
        
        
Mulai:
    MOV ah, 09
    LEA dx, beli1
    INT 21h
    
    MOV ah, 09
    LEA dx, nama
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_nama
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, id
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_id
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, beli2
    INT 21h
    
Mulai2:
    MOV ah, 09
    LEA dx, beli3
    INT 21h
    
Proses:
    MOV ah, 01
    INT 21h
    
    CMP al, '1'
    JE barang_1
    
    CMP al, '2'
    JE barang_2
    
    JNE psn_error
    
Proses2:
    MOV ah, 09
    LEA dx, beli6
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'Y'
    JE pinjam_lagi
    
    CMP al, 'y'
    JE pinjam_lagi
    
    CMP al, 'N'
    JE pinjam_selesai
    
    CMP al, 'n'
    JE pinjam_selesai
    
    JNE psn_error2

barang_1:
     MOV ah, 09
     LEA dx, beli4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg1
     INT 21h   
     
     JMP Proses2
     
barang_2:
     MOV ah, 09
     LEA dx, beli4
     INT 21h
     
     MOV ah, 09
     LEA dx, msg2
     INT 21h   
     
     JMP Proses2

pinjam_lagi:
    JMP Mulai2

pinjam_selesai:
    MOV ah, 09
    LEA dx, beli5
    INT 21h
    JMP Konfirmasi

psn_error:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Mulai2

psn_error2:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Proses2

Konfirmasi:
    MOV ah, 09
    LEA dx, msg5
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'E'
    JE Exit
    
    CMP al, 'e'
    JE Exit
    
    JNE psn_error
    
 

JMP Exit

Exit:
    MOV ah, 09
    LEA dx, beli7
    INT 21h 
    
    INT 20h
     
RET
    
    
    
    
        
        