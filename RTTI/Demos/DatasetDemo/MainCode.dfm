object MainFrm: TMainFrm
  Left = 0
  Top = 0
  Caption = 'RTTI Dataset generation demo'
  ClientHeight = 355
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 24
    Width = 393
    Height = 257
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object CreateDatasetBtn: TButton
    Left = 448
    Top = 184
    Width = 89
    Height = 25
    Caption = 'Create dataset'
    TabOrder = 1
    OnClick = CreateDatasetBtnClick
  end
  object DataSource1: TDataSource
    Left = 480
    Top = 96
  end
end
