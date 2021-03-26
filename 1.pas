Program Travelike;
uses crt;

const password=2727;

type
    tiket = record
    harga : longint;
    tujuan : string;
    jam : string;
end;

type
    Arrtiket = array [1..100] of tiket;

type
    simpan = record
    nama : string;
    noktp : string;
    alamat : string;
    notlp : string;
end;

type
    Arrsimpan = array [1..100] of simpan;

type
    transaksi = Record
    total : real;
    subtotal : real;
end;

type
    Arrtransaksi = array [1..100] of transaksi;

var
    Pesan : Arrsimpan;
    Bayar : Arrtransaksi;
    Ticket : Arrtiket;
    Mesen : array [1..100] of real;
    i, j, penumpang1, pas, pilihan, pil1, pil2, pilih1,pilih2 : integer;
    pendapatan : real;

procedure customer(var P: Arrsimpan ; var T: Arrtiket ; var B: Arrtransaksi ; penumpang: integer);
begin
    i := 1;
    clrscr;
    while i <= penumpang do
    begin
        writeln(' =============================================================== ');
        writeln('|                JADWAL KEBERANGKATAN TRAVELIKE                 |');
        writeln('|                   JURUSAN BANDUNG, JAKARTA                    |');
        writeln(' =============================================================== ');
        writeln(' ===================    JAM KEBERANGKATAN    =================== ');
        writeln('|   1. BANDUNG - JAKARTA = Rp 120.000 / Orang                   |');
        writeln('|      1. 07.00 - 09.00                                         |');
        writeln('|      2. 13.00 - 15.00                                         |');
        writeln('|      3. 17.00 - 19.00                                         |');
        writeln('|                                                               |');
        writeln('|   2. JAKARTA - BANDUNG = Rp 100.000 / Orang                   |');
        writeln('|      1. 08.00 - 10.00                                         |');
        writeln('|      2. 14.00 - 16.00                                         |');
        writeln('|      3. 18.00 - 20.00                                         |');
        writeln(' =============================================================== ');
        writeln();
        write('    MASUKKAN TUJUAN PENUMPANG KE-',i,'    : ');readln(pilih1);
        case pilih1 of
        1   :begin
              T[i].tujuan:='BDG - JKT';
              T[i].harga:=120000;
                write('    MASUKKAN JAM KEBERANGKATAN KE-',i,'   : '); readln(pilih2);
                case pilih2 of
                1     :begin
                          T[i].jam := '07.00 - 09.00';
                       end;
                2     :begin
                          T[i].jam := '13.00 - 15.00';
                       end;
                3     :begin
                          T[i].jam := '17.00 - 19.00';
                       end;
                end;
             end;
        2   :begin
               T[i].tujuan:='JKT - BDG';
               T[i].harga :=100000;
                write('    MASUKKAN JAM KEBERANGKATAN KE-',i,'   : '); readln(pilih2);
                case pilih2 of
                1     :begin
                         T[i].jam := '08.00 - 10.00';
                       end;
                2     :begin
                         T[i].jam := '14.00 - 16.00';
                       end;
                3     :begin
                         T[i].jam := '18.00 - 20.00';
                       end;
                end;
             end;
        end;
        writeln();
        writeln();
        i := i + 1;
end;

    clrscr;
    Mesen[1] := 0;
    for i := 1 to penumpang do
    begin
                writeln(' =============================================================== ');
                writeln('|                         TRAVELIKE                             |');
                writeln('|                   JURUSAN BANDUNG, JAKARTA                    |');
                writeln(' =============================================================== ');
                writeln('                        MASUKKAN DATA                            ');
                writeln();
                write('   1. NAMA PENUMPANG KE-',i,'    : ');readln(P[i].nama);
                write('   2. NO KTP                 : ');readln(P[i].noktp);
                write('   3. ALAMAT                 : ');readln(P[i].alamat);
                write('   4. NO TELEPON             : ');readln(P[i].notlp);
                writeln(' =============================================================== ');
                writeln();
                writeln;
                Mesen[1] := Mesen[1] + T[i].harga;
    end;
end;

procedure totalPembayaran(var P: Arrsimpan ; var T: Arrtiket ; var B: Arrtransaksi ; penumpang: integer);
begin
        clrscr;
        pendapatan := 0;
        writeln(' =========================================================================== ');
        writeln('|                 PROGRAM BOOKING TIKET TRAVEL                              |');
        writeln('|                   JURUSAN BANDUNG, JAKARTA                                |');
        writeln(' =========================================================================== ');
        writeln('|No.       | NAMA       | TUJUAN              | SUB           | JAM         |');
        writeln('|          |            |                     | TOTAL         |KEBERANGKATAN|');
        writeln(' =========================================================================== ');
        for i:=1 to penumpang do
        begin
                writeln('|  ',i:3,'  ',P[i].nama:10,' ',T[i].tujuan:20,'       ',T[i].harga:10,'',T[i].jam:20,'|');
        end;
        writeln(' =========================================================================== ');
        pendapatan := pendapatan + Mesen[1];
        writeln('   TOTAL     : ',Mesen[1]:2:0);
        writeln(' =========================================================================== ');
        writeln('   Tekan ENTER Untuk Keluar');
        readln;
end;

procedure admin;
var
        pas : integer;
begin
        clrscr;
        writeln();
        writeln();
        write('          MASUKKAN PASSWORD : ');
        readln(pas);
        while (pas<>password) do
        begin
                clrscr;
                writeln();
                writeln('          MAAF PASSWORD YANG ANDA MASUKKAN SALAH');
                writeln;
                writeln('             Tekan ENTER Untuk Login Kembali ');
                readln;
                clrscr;
                writeln;
                write('          MASUKKAN PASSWORD : ');
                readln(pas);
        end;
end;

function pemasukan(var B: Arrtransaksi ; penumpang: integer) : real;
begin
        clrscr;
        writeln(' ===================================================== ');
        writeln('|           DATA PENDAPATAN BOOKING TIKET TRAVEL      |');
        writeln('|                 JURUSAN BANDUNG, JAKARTA            |');
        writeln(' ===================================================== ');
        if (pendapatan = 0) then
        begin
                writeln;
                writeln('  BELUM ADA PEMASUKAN HARI INI');
                writeln();
                write('  Tekan ENTER Untuk Keluar');
        end
        else if (pendapatan > 0) then
        begin
                for j := 1 to penumpang do
                begin
                        B[j].total := pendapatan;
                end;
                writeln;
                writeln('    TOTAL PENDAPATAN          : Rp.',B[j].total:2:0);
                writeln(' ===================================================== ');
                write('  Tekan ENTER Untuk Keluar');
        end;
        readln;
end;

procedure search(var P: Arrsimpan ; penumpang: integer);
var
        X : string;
        found : boolean;
begin
        clrscr;
        write('   MASUKKAN NO KTP YANG AKAN DICARI: ');
        readln(X);
        i := 1;
        found := false;
        while (i<=penumpang) and (NOT found) do
        begin
                if (P[i].noktp) = X then
                        found := true
        else
                i := i + 1;
        end;
        if (found) then
        begin
                writeln();
                writeln();
                write('   1. NAMA PENUMPANG         : ');
                writeln(P[i].nama);
                write('   2. NO KTP                 : ');
                writeln(P[i].noktp);
                write('   3. ALAMAT                 : ');
                writeln(P[i].alamat);
                write('   4. NO TELEPON             : ');
                writeln(P[i].notlp);
        end
        else
                writeln('DATA TIDAK DITEMUKAN');
        writeln();
        writeln('Tekan ENTER Untuk Keluar');
        readln;
end;

procedure sort(var P: Arrsimpan ; penumpang: integer);
var
        i, j, iMin: integer;
        Temp_nama, temp_noktp : string;
        Temp_alamat, temp_notlp : string;
begin
        clrscr;
        for i := penumpang downto 1 do
        begin
                for j := 2 to i do
                if (P[j-1].noktp) > (P[j].noktp) then
                begin
                     Temp_nama := P[j-1].Nama;
                     P[j-1].Nama := P[j].Nama;
                     P[j].Nama := Temp_nama;

                     Temp_noktp := P[j-1].noktp;
                     P[j-1].noktp := P[j].noktp;
                     P[j].noktp := Temp_noktp;

                     Temp_alamat := P[j-1].alamat;
                     P[j-1].alamat := P[j].alamat;
                     P[j].alamat := Temp_alamat;

                     Temp_notlp := P[j-1].notlp;
                     P[j-1].notlp := P[j].notlp;
                     P[j].notlp := Temp_notlp;
                end;
        end;
        writeln();
        writeln();
        writeln('    Pengurutan Data Sedang Diproses, Untuk Melihat Hasil Pengurutan Silahkan Tekan ENTER dan Pilih Menu Tampilkan Data');
        readln;
end;

procedure CetakData (P : Arrsimpan; penumpang : integer);
var
        i : integer;
begin
        clrscr;
        writeln;
        i := 1;
        while (i <= penumpang) do
        begin
                write('   1. NAMA PENUMPANG         : ');
                writeln(P[i].nama);
                write('   2. NO KTP                 : ');
                writeln(P[i].noktp);
                write('   3. ALAMAT                 : ');
                writeln(P[i].alamat);
                write('   4. NO TELEPON             : ');
                writeln(P[i].notlp);
                writeln();
                writeln();
           i := i + 1;
        end;
        writeln('Tekan ENTER Untuk Keluar');
        readln;
end;


begin
   clrscr;
   writeln();
   write('   MASUKKAN JUMLAH PENUMPANG    : ');readln(penumpang1);
   repeat
        clrscr;
        writeln(' ============================================================== ');
        writeln('|                 PROGRAM BOOKING TIKET TRAVEL                 |');
        writeln('|                   JURUSAN BANDUNG, JAKARTA                   |');
        writeln(' ============================================================== ');
        writeln('|                 SELAMAT DATANG DI TRAVELIKE                  |');
        writeln(' ============================================================== ');
        writeln('|                            MENU                              |');
        writeln('|                                                              |');
        writeln('|                   1. COSTUMER                                |');
        writeln('|                   2. ADMIN                                   |');
        writeln('|                   3. KELUAR                                  |');
        writeln(' ===============================================================');
        writeln();
        write(' MASUKKAN PILIHAN ANDA  : ');readln(pilihan);
        case (pilihan) of
        1 : begin
                repeat
                        clrscr;
                        writeln(' ============================================================== ');
                        writeln('|                 PROGRAM BOOKING TIKET TRAVEL                 |');
                        writeln('|                   JURUSAN BANDUNG, JAKARTA                   |');
                        writeln(' ============================================================== ');
                        writeln('|                 SELAMAT DATANG DI TRAVELIKE                  |');
                        writeln(' ============================================================== ');
                        writeln('|                                                              |');
                        writeln('|                   1. INPUT DATA PENUMPANG                    |');
                        writeln('|                   2. LIHAT TOTAL PEMBAYARAN                  |');
                        writeln('|                   3. KELUAR                                  |');
                        writeln(' ===============================================================');
                        writeln();
                        write(' MASUKKAN PILIHAN ANDA  : ');readln(pil1);
                        case (pil1) of
                        1 : begin
                                customer(Pesan,Ticket,Bayar,penumpang1);
                            end;
                        2 : begin
                                totalPembayaran(Pesan,Ticket,Bayar,penumpang1);
                            end;
                        end;
                until (pil1 = 3);
                write('Tekan ENTER Untuk Keluar');
            end;

        2 : begin
                admin;
            repeat
                        clrscr;
                        writeln(' ============================================================== ');
                        writeln('|                 PROGRAM BOOKING TIKET TRAVEL                 |');
                        writeln('|                   JURUSAN BANDUNG, JAKARTA                   |');
                        writeln(' ============================================================== ');
                        writeln('|                 SELAMAT DATANG DI TRAVELIKE                  |');
                        writeln(' ============================================================== ');
                        writeln('|                            MENU                              |');
                        writeln('|                                                              |');
                        writeln('|                   1. PENDAPATAN                              |');
                        writeln('|                   2. CARI DATA PENUMPANG                     |');
                        writeln('|                   3. SORTING                                 |');
                        writeln('|                   4. TAMPILKAN DATA                          |');
                        writeln('|                   5. KELUAR                                  |');
                        writeln(' ===============================================================');
                        writeln();
                        write('                    MASUKKAN PILIHAN ANDA : ');readln(pil2);
                        case (pil2) of
                        1 : begin
                                write(pemasukan(Bayar,penumpang1));
                            end;
                        2 : begin
                                search(Pesan,penumpang1);
                            end;
                        3 : begin
                                sort(Pesan,penumpang1);
                            end;
                        4 : begin
                                cetakData(pesan,penumpang1);
                            end;
                        end;
                until (pil2 = 5);
                write('Tekan ENTER Untuk Keluar');
            end;
        end;
   until (pilihan = 3);
   clrscr;
   writeln();
   writeln();
   writeln('                               TRAVELIKE                 ');
   writeln('       KAMI SIAP MENGANTAR ANDA SAMPAI TUJUAN DENGAN SEPENUH HATI ');
   writeln();
   writeln();
end.
