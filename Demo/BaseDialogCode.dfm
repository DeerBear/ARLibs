object BaseDialogFrm: TBaseDialogFrm
  Left = 0
  Top = 0
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
  object pnlStatus: TFlowPanel
    Left = 0
    Top = 176
    Width = 447
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object OkBtn: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 75
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
