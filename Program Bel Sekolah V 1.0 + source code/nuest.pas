{

Update terahir pada :
tanggal       : 30 Maret 2014
Lokasi        : madani v3.0
Created By    : Nuest Zone Corporation
              0000000000000000000000000000000000000000000000
              00000000000000||\000========||=====00000000000
              00000000000000||\\00========||00==000000000000
              00000000000000||0\\000000000||==00000000000000
              00000000000000||00\\0000000=||0000000000000000
              00000000000000||000\\0000==0||0000000000000000
              00000000000000||0000\\0==000||0000000000000000
              00000000000000||0000=\\00000||0000000000000000
              00000000000000||00==00\\0000||0000000000000000
              00000000000000||==00000\\000||0000000000000000
              0000000000000=||00000000\\00||0000000000000000
              00000000000===||=======00\\0||0000000000000000
              0000000000====||=======000\\||0000000000000000
              0000000000000000000000000000000000000000000000

=> 24 maret 2014  ====> menambah tampil otomatis tahun sekarang untuk tahun ajaran dg combo box
=> 18 Juni 2013  ====> menambah tampil oto dengan spliter dan jumlah digit untuk acces (in jaminan )
=> 11 Juni 2013  ====> Perbarui koneksi ke access (in jaminan )
=> 26 April 2013  ====> Update ClearF untuk format uang ke angka biasa (in BMT MARHAMAH)
=> 23 April 2013  ====> menambah tampil otomatis dengan tiga digit series angka plus tanggal
=> 21 April 2013  ====> menambah fungsi cekkosong untuk combobox
=> 15 April 2013  ====> update function hapus
=> 02 April 2013      ====> Menambah tampil otomatis dengan angka 'o' series untuk mySQL
=> 02 September 2012  ====> menambah format HP

}

unit nuest;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,registry, Buttons, ExtCtrls, CheckLst,  jpeg, DB, ADODB,
  ComCtrls,DBClient,MyAccess;

function  bulatkan(input:real):integer;
function  cariA(kriteria:string):integer;   overload;
function  cari(adone:TADODataSet;kriteria:string):integer;   overload;
function  caribatas(text:string;pemisah:char;indek:integer):string;
function  CekAngka(angka,pesan:string):Boolean;
function  cekKosong(nama,pesan:string):Boolean;  overload;
function  cekKosong(nama:TEdit;pesan:string):Boolean; overload;
function  cekKosong(nama:TComboBox;pesan:string):Boolean; overload;
function  cekNoHp(no,pesan:string):Boolean; overload;
function  cekNoHp(no:TEdit;pesan:string):Boolean; overload;
function  ceksama(nilai1,nilai2,pesan:string):Boolean;  overload;
function  ceksama(adone:TADODataSet;fieldKunci,nilai,pesantrue,pesanfalse:string):Boolean; overload;
function  ceksama(adone:TClientDataSet;fieldKunci,nilai,pesantrue,pesanfalse:string):Boolean; overload;
function  ceksama(tabel,field,nilai,pesan:string):Boolean;  overload;
function  ceksamaA(tabel,field,nilai,pesan:string):Boolean;   overload;
function  clearF(duit:string):string;
function  DeCrip(nStr:String):String;
function  EnCrip(nStr:String):String;
function  FormatUang(angka:string):string;
function  gabungteks(teks: string;pemisah:char): string;
function  hapus(adone:tadodataset;pesan:string):Boolean; overload;
procedure hapus(adone:TADOConnection;tabel,nmfil,pembanding:string); overload;
function  isikomboA(angka:tstrings;queryne,nmfield:string):Boolean;   overload;
function  konekDb(koneksi:TADOConnection;namaDatabase:string):boolean;   overload;
procedure prosesA(queryAkses:string);  overload;
procedure refreshAdo(adone:TADODataSet); overload;
function  regBaca(key:HKEY;rot,status,nama:string):string;
function  regbuat(key:HKEY;rot,status,nama,nilai:string):string;
function  regcekAda(key:HKEY;rot,nama:string):Boolean;
function  reghapus(key:HKEY;rot,nama:string):string;
procedure simpan(koneksi:TADOConnection; sintak:string);
function  TampilKarakter(teksnya,jenisKarakterDibuang:string;jmlHasilKarakter:integer):string; overload;
function  TampilOto(adone: TADODataSet; fieldKunci,perintah,mulai: string):string;  overload;
function  TampilOto(adone: TADODataSet; tabel,fieldKunci,mulai: string; tgl:TDate):string; overload;
function  TampilOto(adone: TADODataSet; split:char; panjang:integer; fieldKunci,perintah,mulai: string):string;     overload;
procedure tampilTahunAjaran(combo:tcombobox);

procedure tampilTab(page:TPageControl;status:Boolean);
function  terbilang(angka:integer):string;

// Ke SQL
function   cari(kriteria:string):integer;   overload;
function   cari(adone: TMyQuery; kriteria: String):integer;  overload;
function   cari(adone: TMyQuery; tabele,kriteria: String):integer; overload;
function   ceksama(adone:TMyQuery;nilai1,nilai2,pesantrue,pesanfalse:string):Boolean; overload;
function   hapus(adone:TMyQuery;pesan:string):Boolean;    overload;
function   hapus(tabel,fieldkunci,nilai,pesan:string):Boolean;    overload;
function   isikombo(angka:tstrings;queryne,nmfield:string):Boolean;   overload;
function   konekDb(port:integer;koneksi:TMyConnection;server,user,pass,db:string):boolean;   overload;
procedure  proses(kriteria:string); overload;
procedure  refreshAdo(adodataset:TMyQuery);  overload;
function   sum(tabele,nmfield,kriteria: String):string;
function   TampilOto(adone: TMyQuery; tabel,fieldKunci,mulai: string; tgl:TDate):string;  overload;
function   TampilOto(adone: TMyQuery; fieldKunci,perintah,mulai: string):string; overload;
function   TampilOto(adone: TMyQuery; fieldKunci,perintah,mulaiseries: string;jmldigit:integer):string;   overload;
function   TampilOto(adone: TMyQuery; fieldKunci,perintah,mulaiseries: string;tgl:TDate;jmldigit:integer):string;   overload;

var
reg:TRegistry;

    { Public declarations }


implementation
uses unutama, StrUtils;

procedure tampilTahunAjaran(combo:tcombobox);
var tahun:array [1..3]of string;
begin
tahun[1]:=FormatDateTime('yyyy',Date);
tahun[2]:=FloatToStr(StrToFloat(tahun[1])+1);
tahun[3]:=tahun[1]+'/'+tahun[2];
combo.Text:=tahun[3];

end;


function  cekNoHp(no,pesan:string):Boolean;
begin
if no='' then exit;
if (LeftStr(no,1)<>'0') or (LeftStr(no,1)<>'+') then
    begin
    if pesan<>'' then ShowMessage(pesan);
    //nama.SetFocus;
    Result:=false;
    end
    else
    begin
    Result:=true;
    end;
end;
function  cekNoHp(no:TEdit;pesan:string):Boolean;
begin
if no.Text='' then exit;
if (LeftStr(no.Text,1)='0') or (LeftStr(no.Text,1)='+') then
    begin
    Result:=true;
    end
    else
    begin
    Result:=False;
    if pesan<>'' then ShowMessage(pesan);
    no.SetFocus;
    end;
end;

function  terbilang(angka:integer):string;
begin
futama.ATTerbilang1.Number:=angka;
Result:='Terbilang = '+futama.ATTerbilang1.Terbilang+' rupiah ';
end;

function  TampilKarakter(teksnya,jenisKarakterDibuang:string;jmlHasilKarakter:integer):string; overload;
var
index:integer;
hasil:string;
begin
if length(teksnya)>=jmlHasilKarakter then
      begin
      index:=length(teksnya);
      repeat
      if LeftStr(teksnya,1)=jenisKarakterDibuang then
          begin
          index:=index-1;
          hasil:=RightStr(teksnya,index);
          end;
      until   (LeftStr(hasil,1)<>jenisKarakterDibuang) or (index=jmlHasilKarakter);
      Result:=RightStr(hasil,index);
      end;
end;

//fungsi SQL
function  TampilOto(adone: TMyQuery; fieldKunci,perintah,mulaiseries: string;tgl:TDate;jmldigit:integer):string;   overload;
var hasil,hasil2:string;
a,awal:string;
index:integer;
begin
a:=FormatDateTime('yyMMdd',tgl);
  adone.Close;
  adone.sql.clear;
  adone.SQL.Add(perintah);
  adone.Open;
  awal:=mulaiseries+a;
  Result:=awal+'-00000000000000'+IntToStr(adone.RecordCount+1);
  hasil2:= caribatas(Result,'-',1);
  if length(hasil2)>=jmldigit then
      begin
      index:=length(hasil2);
      repeat
      if LeftStr(hasil2,1)='0' then
          begin
          index:=index-1;
          hasil:=RightStr(hasil2,index);
          end;
      until   (LeftStr(hasil,1)<>'0') or (index=jmldigit);
      Result:=awal+'-'+RightStr(hasil,index);
      end;

      repeat
      if cari(perintah+ ' where '+ fieldKunci+' = '+QuotedStr(Result))>0 then
      Result:= Result+'C';
      until  cari(perintah+ ' where '+ fieldKunci+' = '+QuotedStr(Result))<=0;

end;

function  TampilOto(adone: TMyQuery; fieldKunci,perintah,mulaiseries: string;jmldigit:integer):string;   overload;
var hasil,hasil2:string;
index:integer;
begin
  adone.Close;
  adone.sql.clear;
  adone.SQL.Add(perintah);
  adone.Open;

  Result:=mulaiseries+'-00000000000000'+IntToStr(adone.RecordCount+1);
  hasil2:= caribatas(Result,'-',1);
  if length(hasil2)>=jmldigit then
      begin
      index:=length(hasil2);
      repeat
      if LeftStr(hasil2,1)='0' then
          begin
          index:=index-1;
          hasil:=RightStr(hasil2,index);
          end;
      until   (LeftStr(hasil,1)<>'0') or (index=jmldigit);
      Result:=mulaiseries+'-'+RightStr(hasil,index);
      end;

      repeat
      if cari(perintah+ ' where '+ fieldKunci+' = '+QuotedStr(Result))>0 then
      Result:= Result+'C';
      until  cari(perintah+ ' where '+ fieldKunci+' = '+QuotedStr(Result))<=0;

end;


function TampilOto(adone: TMyQuery; fieldKunci,perintah,mulai: string):string;
begin
  adone.Close;
  adone.sql.clear;
  adone.SQL.Add(perintah);
  adone.Open;
  Result:=mulai+IntToStr(adone.RecordCount+1);
  if adone.Locate(fieldKunci,Result,[loCaseInsensitive])=true then
      begin
      Result:=mulai+IntToStr(adone.RecordCount+1)+'c';
      end;
end;

function tampilOto(adone: TMyQuery; tabel,fieldKunci,mulai: string;tgl:TDate):string;
var
a:string;
begin
  a:=FormatDateTime('yyMMdd',tgl);
  adone.SQL.Clear;
  adone.SQL.Add( 'select * from '+tabel+' where '+ fieldKunci+' like'+
  QuotedStr(mulai+a+'%'));
  adone.Open;
  Result:=mulai+a+'-'+IntToStr(adone.RecordCount+1);
  if adone.Locate(fieldKunci,Result,[loCaseInsensitive])=true then
      begin
      Result:=mulai+a+'-'+IntToStr(adone.RecordCount+1)+'c';
      end;
end;

function hapus(tabel, fieldkunci,nilai,pesan: string): Boolean;
var kriteria:string;
begin
if fieldkunci<>'' then
kriteria:='where '+fieldkunci+'='+QuotedStr(nilai) else
kriteria:='';
if not(pesan='') then
        begin
        if Application.MessageBox(pchar(pesan),'Peringatan',MB_YESNO+MB_ICONWARNING)= mryes then
            begin
            proses('delete from '+tabel+' '+kriteria);
            Result:=true;
            end
            else Result:=false;
        end
        else
        begin
        proses('delete from '+tabel+' '+kriteria);
        Result:=true;
        end;

end;





function ceksama(adone:TMyQuery;nilai1,nilai2,pesantrue,pesanfalse:string):Boolean;
begin
if adone.Locate(nilai1,nilai2,[loCaseInsensitive])=true then
    begin
    if pesantrue<>'' then ShowMessage(pesantrue);
    Result:=true;
    end
    else
    begin
    if pesanfalse<>'' then ShowMessage(pesanfalse);
    Result:=false;
    end;
end;


function hapus(adone:TMyQuery;pesan:string):Boolean;
begin
if adone.RecordCount>0 then
    begin
    if not(pesan='') then
        begin
        if Application.MessageBox(pchar(pesan),'Peringatan',MB_YESNO+MB_ICONWARNING)= mryes then
        adone.Delete;
        end
        else
        begin
        adone.Delete;
        end;
    Result:=true;
    end
    else
    Result:=false;
end;


function chekKosong(varstr:tedit;pesan:string):Boolean;
begin
if varstr.text='' then
    begin
    if not(pesan='') then ShowMessage(pesan);
    varstr.SetFocus;
    Result:=true;
    end
    else
    Result:=false;
end;







{Kumpulan procedure cari}

function cari(kriteria:string):integer;
begin
futama.addscari.Close;
futama.addscari.SQL.Clear;
futama.addscari.SQL.Add(kriteria);
futama.addscari.Open;
if futama.addscari.RecordCount>0 then
Result:=futama.addscari.RecordCount else
Result:=0;
end;

function cari(adone: TMyQuery; kriteria: String):integer;
begin
adone.Close;
adone.SQL.Clear;
adone.SQL.Add(kriteria);
adone.Open;
if adone.RecordCount>0 then
Result:=adone.RecordCount
else
Result:=0;
end;

function cari(adone: TMyQuery; tabele,kriteria: String):integer;
begin
adone.Close;
adone.SQL.Clear;
adone.SQL.Add('select * from '+tabele+' '+kriteria);
adone.Open;
if adone.RecordCount>0 then
Result:=adone.RecordCount
else
Result:=0;
end;

function sum(tabele,nmfield,kriteria: String):string;
begin
cari('select sum('+nmfield+')as totale from '+tabele);
Result:=futama.ADdscari['totale'];
end;



procedure refreshAdo(adodataset: TMyQuery);
begin
adodataset.Close;
adodataset.Open;
end;


procedure proses(kriteria: string);
begin
futama.MyCommand1.SQL.Clear;
futama.MyCommand1.SQL.Add(kriteria);
futama.MyCommand1.Execute;
end;


function   konekDb(port:integer; koneksi:TMyConnection;server,user,pass,db:string):boolean;   overload;
begin
koneksi.Connected:=false;
koneksi.Server:=server;
koneksi.Username:=user;
koneksi.Password:=pass;
koneksi.Database:=db;
koneksi.Port:=port;
try
koneksi.Connect;
Except
ShowMessage('Tidak dapat terhubung ke server'+#13+'Periksa kembali pengaturan atau koneksinya');
end;
if koneksi.Connected=true then Result:=true else Result:=false;
end;

function  ceksama(tabel,field,nilai,pesan:string):Boolean;
begin
if cari('select * from '+tabel+' where '+field+'='+
    QuotedStr(nilai))>0  then
    begin
    if pesan<>'' then ShowMessage(pesan);
    Result:=true;
    end
    else
    begin

    Result:=false;
    end;
end;

function  isikombo(angka:tstrings;queryne,nmfield:string):Boolean;   overload;
var a:integer;
begin
angka.Clear;
if cari(queryne) >0 then
    begin
    for  a:=1 to futama.addscari.RecordCount do
        begin
        futama.addscari.RecNo:=a;
        angka.Add(futama.addscari[nmfield]);
        end;
    end;
end;



///////////////////////////////////////////////////////
//////////////////////////////////////////////////////
/////////////////////////////////////////////////////
// Fungsi pada Acces

///////////////////////////////////////////////////
function  konekDb(koneksi:TADOConnection;namaDatabase:string):boolean;
begin
if not(namaDatabase='') then
    begin
    koneksi.Close;
    koneksi.Connected:=false;
    koneksi.ConnectionString:=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+namaDatabase+
    ';Persist Security Info=False';
    try
    koneksi.Connected:=true;
    Result:=true;
    except
    Result:=false;
    end;
    end;
end;
procedure prosesA(queryAkses:string);
begin
futama.koneksiA.Execute(queryAkses);
end;

function  clearF(duit:string):string;
var i:integer;
a:char;
nilai:string;
begin
for i:=1 to length(duit) do
    begin
    a:=duit[i];
    //if not((a='.')or (a=',') or (a='R') or (a='P') or (a='r') or (a='$') or (a='p')) then
    if (a in ['0'..'9']) then
    nilai:=nilai+a;
    end;
    Result:=nilai;
end;

function  isikomboA(angka:tstrings;queryne,nmfield:string):Boolean;   overload;
var a:integer;
begin
angka.Clear;
if cariA(queryne) >0 then
    begin
    for  a:=1 to futama.addscariA.RecordCount do
        begin
        futama.addscariA.RecNo:=a;
        angka.Add(futama.addscariA[nmfield]);
        end;
    end;
end;

function gabungteks(teks: string;pemisah:char): string;
var sl: TStringList;
 i:integer;
hasil:string;
begin
  sl := TStringList.Create;
  sl.Delimiter :=pemisah;
  sl.DelimitedText := teks;
  for i:=0 to sl.Count-1 do
      begin
      hasil:=hasil+sl[i];
      end;
  Result:=hasil;
end;

function TampilOto(adone: TADODataSet; split:char; panjang:integer; fieldKunci,perintah,mulai: string):string;
var hasil,hasil2:string;
index:integer;
begin
  adone.Close;
  adone.CommandText:=perintah;
  adone.Open;
  Result:=split+'00000000000000'+IntToStr(adone.RecordCount+1);
  hasil2:= caribatas(Result,split,1);
  if length(hasil2)>=panjang then
      begin
      index:=length(hasil2);
      repeat
      if LeftStr(hasil2,1)='0' then
          begin
          index:=index-1;
          hasil:=RightStr(hasil2,index);
          end;
      until   (LeftStr(hasil,1)<>'0') or (index=panjang);
      Result:= mulai+split+RightStr(hasil,index);
      end;
  {if cariA(perintah+ ' where '+ fieldKunci+' = '+
      QuotedStr(Result))>0 then
      Result:= mulai+split+RightStr(hasil,index)+'c';    }
  if adone.Locate(fieldKunci,Result,[loCaseInsensitive])=true then
      begin
      Result:= mulai+split+RightStr(hasil,index)+'c';
      end;

end;
//;///////////////////////
function TampilOto(adone: TADODataSet; fieldKunci,perintah,mulai: string):string;
var hasil,hasil2:string;
index:integer;
begin
  adone.Close;
  adone.CommandText:=perintah;
  adone.Open;
  Result:=mulai+'-00000000000000'+IntToStr(adone.RecordCount+1);
  hasil2:= caribatas(Result,'-',1);
  if length(hasil2)>=3 then
      begin
      index:=length(hasil2);
      repeat
      if LeftStr(hasil2,1)='0' then
          begin
          index:=index-1;
          hasil:=RightStr(hasil2,index);
          end;
      until   (LeftStr(hasil,1)<>'0') or (index=3);
      Result:= mulai+'-'+RightStr(hasil,index);
      end;
  if cariA(perintah+ ' where '+ fieldKunci+' = '+
      QuotedStr(Result))>0 then
      Result:= mulai+'-'+RightStr(hasil,index)+'c';
 { if adone.Locate(fieldKunci,Result,[loCaseInsensitive])=true then
      begin
      Result:= mulai+'-'+RightStr(hasil,index)+'c';
      end; }
end;

function TampilOto(adone: TADODataSet; tabel,fieldKunci,mulai: string; tgl:TDate):string;
var
a:string;
begin
  a:=FormatDateTime('yyMMdd',tgl);
  adone.Close;
  adone.CommandText:='select * from '+tabel+' where '+ fieldKunci+' like'+
  QuotedStr(mulai+a+'%');
  adone.Open;
  Result:=mulai+a+'-'+IntToStr(adone.RecordCount+1);
  if adone.Locate(fieldKunci,Result,[loCaseInsensitive])=true then
      begin
      Result:=mulai+a+'-'+IntToStr(adone.RecordCount+1)+'c';
      end;
end;

function FormatUang(angka:string):string;
var
  hasil:string;
  len : integer;
begin
  len := length(angka);
  if(len>3)then
  begin
    repeat
      len := len-2;
      hasil := '.' + copy(angka, len, 3) + hasil;
      len := len-1;
    until(len<=3);
    hasil := copy(angka, 1, len) + hasil;
  end
  else
    hasil := angka;
  result:=hasil;
end;

function bulatkan(input:real):integer;
begin
  Result := round(input);
end;

function CekAngka(angka,pesan:string):Boolean;
var a:integer;
begin
try
a:=StrToInt(angka);
Result:=true;
except
if pesan<>'' then ShowMessage(pesan);
Result:=false;
end;
end;

procedure hapus(adone:TADOConnection;tabel,nmfil,pembanding:string);
begin
adone.Execute('delete * from '+tabel+' where '+nmfil+'='+QuotedStr(pembanding));
end;

procedure simpan(koneksi:TADOConnection; sintak:string);
begin
koneksi.Execute(sintak);
//ShowMessage('penyimpanan berhasil');
end;

function hapus(adone:tadodataset;pesan:string):Boolean;
begin
if adone.RecordCount>0 then
    begin
    if not(pesan='') then
        begin
        if Application.MessageBox(pchar(pesan),'Peringatan',MB_YESNO+MB_ICONWARNING)= mryes then
        adone.Delete;
        end
        else
        begin
        adone.Delete;
        end;
    Result:=true;
    end
    else
    Result:=false;
end;

procedure refreshAdo(adone:TADODataSet);
begin
adone.Close;
adone.Open;
end;

function cari(adone:TADODataSet;kriteria:string):integer;
begin
adone.Close;
adone.CommandText:=kriteria;
adone.Open;
if adone.RecordCount>0 then
Result:=adone.RecordCount
else
Result:=0;
end;

function caribatas(text:string;pemisah:char;indek:integer):string;
var sl: TStringList;
begin
  if text='' then exit;
  sl := TStringList.Create;
  sl.Delimiter :=pemisah;
  sl.DelimitedText := text;
  if sl.Count>0 then
  Result:=sl[indek];
end;

function cariA(kriteria:string):integer;
begin
futama.addscariA.Close;
futama.addscariA.CommandText:=kriteria;
futama.addscariA.Open;
if futama.addscariA.RecordCount>0 then
Result:=futama.addscariA.RecordCount else
Result:=0;
end;

function EnCrip(nStr:String):String;
var
  I:Integer;
  nSem:String;
  cSem:Char;
  nNum:Integer;
begin
  nSem:='';
  for I:=1 to length(nStr) do
  begin
    cSem:=nStr[I];
    nNum:=ord(cSem)+10;
    nSem:=nSem+chr(nNum);
  end;
  Result:=nSem;
end;

function DeCrip(nStr:String):String;
var
  I:Integer;
  nSem:String;
  cSem:Char;
  nNum:Integer;
begin
  for I:=1 to length(nStr) do
  begin
    cSem:=nStr[I];
    nNum:=ord(cSem)-10;
    nSem:=nSem+chr(nNum);
  end;
  Result:=nSem;
end;

function ceksama(nilai1,nilai2,pesan:string):Boolean;
begin
if nilai1=nilai2 then
    begin

    Result:=true;
    end
    else
    begin
    if pesan<>'' then ShowMessage(pesan);
    Result:=false;
    end;
end;

function  ceksamaA(tabel,field,nilai,pesan:string):Boolean;
begin
if cariA('select * from '+tabel+' where '+field+'='+
    QuotedStr(nilai))>0  then
    begin
    if pesan<>'' then ShowMessage(pesan);
    Result:=true;
    end
    else
    begin

    Result:=false;
    end;
end;

function ceksama(adone:TADODataSet;fieldKunci,nilai,pesantrue,pesanfalse:string):Boolean;
begin
if adone.Locate(fieldKunci,nilai,[loCaseInsensitive])=true then
    begin
    if pesantrue<>'' then ShowMessage(pesantrue);
    Result:=true;
    end
    else
    begin
    if pesanfalse<>'' then ShowMessage(pesanfalse);
    Result:=false;
    end;
end;
function ceksama(adone:TClientDataSet;fieldKunci,nilai,pesantrue,pesanfalse:string):Boolean;
begin
if adone.Locate(fieldKunci,nilai,[loCaseInsensitive])=true then
    begin
    if pesantrue<>'' then ShowMessage(pesantrue);
    Result:=true;
    end
    else
    begin
    if pesanfalse<>'' then ShowMessage(pesanfalse);
    Result:=false;
    end;
end;




procedure tampilTab(page:TPageControl;status:Boolean);
begin
if status=false then
    begin
    page.TabHeight:=1;
    page.TabWidth:=1;
    end
    else
    begin
    page.TabHeight:=0;
    page.TabWidth:=0;
    end;
end;
function cekKosong(nama,pesan:string):Boolean;
begin
if nama='' then
    begin
    if pesan<>'' then ShowMessage(pesan);
    Result:=true;
    end
    else
    begin
    Result:=false;
    end;
end;
function cekKosong(nama:TEdit;pesan:string):Boolean;
begin
if nama.Text='' then
    begin
    if pesan<>'' then ShowMessage(pesan);
    nama.SetFocus;
    Result:=true;
    end
    else
    begin
    Result:=false;
    end;
end;

function cekKosong(nama:TComboBox;pesan:string):Boolean;
begin
if nama.Text='' then
    begin
    if pesan<>'' then ShowMessage(pesan);
    nama.SetFocus;
    Result:=true;
    end
    else
    begin
    Result:=false;
    end;
end;


function regbuat(key:HKEY;rot,status,nama,nilai:string):string;
begin
reg:=TRegistry.Create;
reg.RootKey:=key;
reg.OpenKey(rot,true);
if status='str' then
    begin
    reg.WriteString(nama,nilai);
    end
    else
if status='bol' then
    begin
    reg.WriteBool(nama,strtobool(nilai));
    end
    else
if status='int' then
    begin
    reg.WriteFloat(nama,strtofloat(nilai));
    end
    else
if status='date' then
    begin
    reg.WriteDate(nama,StrToDate(nilai));
    end;
reg.CloseKey;
reg.Free;

end;

function regBaca(key:HKEY;rot,status,nama:string):string;
begin
reg:=TRegistry.Create;
reg.RootKey:=key;

reg.OpenKey(rot,false);
if status='str' then
    begin
    Result:=reg.ReadString(nama);
    end
    else
if status='bol' then
    begin

    Result:=BoolToStr(reg.ReadBool(nama));
    end
    else
if status='int' then
    begin
    Result:=FloatToStr(reg.ReadInteger(nama));
    end
    else
if status='date' then
    begin
    Result:=DateToStr(reg.ReadDate(nama));
    end;
reg.CloseKey;
reg.Free;

end;

function reghapus(key:HKEY;rot,nama:string):string;
begin
reg:=TRegistry.Create;
reg.RootKey:=key;
reg.OpenKey(rot,false);
reg.DeleteValue(nama) ;
reg.CloseKey;
reg.Free;
end;

function regcekAda(key:HKEY;rot,nama:string):Boolean;
begin
reg:=TRegistry.Create;
reg.RootKey:=key;
reg.OpenKey(rot,false);
if reg.ValueExists(nama)=true then
Result:=true else
Result:=false;
reg.CloseKey;
reg.Free;
end;

end.
