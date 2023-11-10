object futama: Tfutama
  Left = 264
  Top = 134
  Caption = 'SMK AL-MADANI KEPIL'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    912
    441)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 248
    Width = 537
    Height = 177
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 8
    Width = 217
    Height = 49
    Caption = 'Atur Waktu Alarm'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Matura MT Script Capitals'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = BitBtn2Click
  end
  object GroupBox1: TGroupBox
    Left = 568
    Top = 16
    Width = 329
    Height = 409
    Anchors = [akTop, akRight, akBottom]
    Caption = 'Sekarang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Algerian'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label4: TLabel
      Left = 26
      Top = 105
      Width = 44
      Height = 21
      Caption = 'Hari'
    end
    object Label5: TLabel
      Left = 26
      Top = 129
      Width = 86
      Height = 21
      Caption = 'Tanggal'
    end
    object Label7: TLabel
      Left = 121
      Top = 105
      Width = 69
      Height = 21
      Caption = 'Label7'
    end
    object Label8: TLabel
      Left = 121
      Top = 129
      Width = 69
      Height = 21
      Caption = 'Label8'
    end
    object Label9: TLabel
      Left = 16
      Top = 34
      Width = 297
      Height = 47
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label9'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -48
      Font.Name = 'Algerian'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 34
      Top = 194
      Width = 254
      Height = 21
      Caption = 'Waktu Alarm Berikutnya'
    end
    object Label3: TLabel
      Left = 32
      Top = 233
      Width = 265
      Height = 41
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -35
      Font.Name = 'Algerian'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 58
      Top = 220
      Width = 237
      Height = 16
      Date = 41729.907418900460000000
      Time = 41729.907418900460000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Algerian'
      Font.Style = []
      Kind = dtkTime
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 8
    Width = 217
    Height = 49
    Caption = 'Data Alarm'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Matura MT Script Capitals'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    WordWrap = True
    OnClick = BitBtn1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 792
    Top = 24
  end
  object koneksiA: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=db.mdb;Persist Secu' +
      'rity Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 880
    Top = 152
  end
  object ADODataSet1: TADODataSet
    Connection = koneksiA
    CursorType = ctStatic
    CommandText = 'select * from waktu'
    Parameters = <>
    Left = 16
    Top = 216
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 792
    Top = 56
  end
  object addscariA: TADODataSet
    Connection = koneksiA
    CursorType = ctStatic
    CommandText = 'select * from waktu'
    Parameters = <>
    Left = 880
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = addscariA
    Left = 48
    Top = 216
  end
end
