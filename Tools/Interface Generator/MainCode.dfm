object MainFrm: TMainFrm
  Left = 0
  Top = 0
  Caption = 
    'Delphi Interface Generator - Copyright(c) 2015 by Andrea Raimond' +
    'i'
  ClientHeight = 347
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 88
    ExplicitWidth = 185
    DesignSize = (
      544
      41)
    object txtInterfaceName: TLabeledEdit
      Left = 4
      Top = 16
      Width = 531
      Height = 21
      Anchors = [akLeft, akTop, akRight, akBottom]
      EditLabel.Width = 152
      EditLabel.Height = 13
      EditLabel.Caption = 'Interface name (without prefix)'
      TabOrder = 0
      ExplicitWidth = 517
    end
  end
  object grpProperties: TGroupBox
    Left = 0
    Top = 41
    Width = 241
    Height = 265
    Align = alLeft
    Caption = 'Properties'
    TabOrder = 1
    object grdProperties: TDBGrid
      Left = 2
      Top = 15
      Width = 237
      Height = 248
      Align = alClient
      DataSource = DMMain.DSProperties
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PROPERTY_NAME'
          Title.Caption = 'Name'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROPERTY_TYPE'
          Title.Caption = 'Type'
          Width = 115
          Visible = True
        end>
    end
  end
  object grpGeneratedInterface: TGroupBox
    Left = 241
    Top = 41
    Width = 303
    Height = 265
    Align = alClient
    Caption = 'Generated interface'
    TabOrder = 2
    ExplicitLeft = 0
    ExplicitTop = 104
    ExplicitWidth = 185
    ExplicitHeight = 105
    object txtGeneratedInterface: TSynEdit
      Left = 2
      Top = 15
      Width = 299
      Height = 248
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 0
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.Visible = False
      Gutter.Width = 0
      Highlighter = PascalSyntax
      FontSmoothing = fsmNone
      ExplicitLeft = 159
      ExplicitTop = -56
      ExplicitWidth = 200
      ExplicitHeight = 150
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 306
    Width = 544
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 312
    object GenerateBtn: TButton
      Left = 4
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Generate!'
      TabOrder = 0
      OnClick = GenerateBtnClick
    end
    object CloseBtn: TButton
      Left = 460
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = CloseBtnClick
    end
  end
  object PascalSyntax: TSynPasSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 264
    Top = 176
  end
end
