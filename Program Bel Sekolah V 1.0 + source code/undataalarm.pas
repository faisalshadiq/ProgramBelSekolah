unit undataalarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,nuest, DB, Grids, DBGrids, CRGrid,
  ADODB, ExtCtrls;

type
  Tfdataalaram = class(TForm)
    ADODataSet1: TADODataSet;
    CRDBGrid1: TCRDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    btsimpan: TBitBtn;
    btbtal: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btsimpanClick(Sender: TObject);
    procedure btbtalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fdataalaram: Tfdataalaram;

implementation

uses DateUtils, Unutama;

{$R *.dfm}

procedure Tfdataalaram.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
fdataalaram:=nil;
end;

procedure Tfdataalaram.btsimpanClick(Sender: TObject);
begin
{
if btsimpan.Caption='Simpan' then
    begin
    ProsesA('insert into waktu (hari,jam,bunyi)values('+
    QuotedStr(FloatToStr(ComboBox1.ItemIndex+1))+','+
    QuotedStr(FormatDateTime('hh:mm:ss',DateTimePicker1.DateTime))+','+
    QuotedStr(Edit2.Text)+')');
    ShowMessage('Proses Berhasil');
    end
    else
    begin
    end;
btbtal.Click;
}end;

procedure Tfdataalaram.btbtalClick(Sender: TObject);
begin
{//Edit1.Text:='';
Edit2.Text:='';
DateTimePicker1.DateTime:=now;
ComboBox1.ItemIndex:=DayOfTheWeek(date)-1;
}end;

end.
