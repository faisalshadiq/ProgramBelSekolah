object fdataalaram: Tfdataalaram
  Left = 485
  Top = 242
  Width = 693
  Height = 304
  Caption = 'fdataalaram'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 19
  object CRDBGrid1: TCRDBGrid
    Left = 0
    Top = 0
    Width = 677
    Height = 225
    OptionsEx = [dgeEnableSort, dgeLocalFilter, dgeLocalSorting, dgeRecordCount, dgeStretch]
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hari'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jam'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bunyi'
        Width = 279
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pesan'
        Width = 107
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 225
    Width = 677
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
    object btsimpan: TBitBtn
      Left = 96
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btsimpanClick
    end
    object btbtal: TBitBtn
      Left = 200
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Batal'
      TabOrder = 1
      OnClick = btbtalClick
    end
    object BitBtn3: TBitBtn
      Left = 345
      Top = 8
      Width = 144
      Height = 25
      Caption = 'Lihat Daftar Alaram'
      TabOrder = 2
    end
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = futama.koneksiA
    CursorType = ctStatic
    CommandText = 'select * from waktu'
    Parameters = <>
    Left = 440
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 472
    Top = 32
  end
end
