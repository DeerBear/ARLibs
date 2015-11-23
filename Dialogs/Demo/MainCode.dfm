object MainFrm: TMainFrm
  Left = 0
  Top = 0
  Caption = 'ARLibs Dialogs demo'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object OKDialogBtn: TButton
    Left = 32
    Top = 40
    Width = 75
    Height = 25
    Caption = 'OKDialog'
    TabOrder = 0
    OnClick = OKDialogBtnClick
  end
  object ConfirmDialogBtn: TButton
    Left = 32
    Top = 80
    Width = 75
    Height = 25
    Caption = 'ConfirmDialog'
    TabOrder = 1
    OnClick = ConfirmDialogBtnClick
  end
  object CustomDialogNoInjectionBtn: TButton
    Left = 184
    Top = 40
    Width = 233
    Height = 25
    Hint = 
      'If you press this button BEFORE pressing the one WITH injection,' +
      ' the code will fail'
    Caption = 'Custom Dialog (no injection)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = CustomDialogNoInjectionBtnClick
  end
  object CustomDialogWithInjectionBtn: TButton
    Left = 184
    Top = 64
    Width = 233
    Height = 25
    Caption = 'Custom Dialog (with Injection)'
    TabOrder = 3
    OnClick = CustomDialogWithInjectionBtnClick
  end
end
