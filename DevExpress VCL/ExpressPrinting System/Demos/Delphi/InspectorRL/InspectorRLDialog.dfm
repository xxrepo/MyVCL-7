object InspectorRLDialogForm: TInspectorRLDialogForm
  Left = 647
  Top = 348
  BorderStyle = bsDialog
  Caption = 'Dialog window'
  ClientHeight = 156
  ClientWidth = 385
  Color = clBtnFace
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 14
    Top = 10
    Width = 38
    Height = 13
    Caption = 'Address'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 14
    Top = 36
    Width = 17
    Height = 13
    Caption = 'City'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 14
    Top = 62
    Width = 25
    Height = 13
    Caption = 'State'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 14
    Top = 88
    Width = 40
    Height = 13
    Caption = 'ZipCode'
    FocusControl = DBEdit11
  end
  object Bevel1: TBevel
    Left = 2
    Top = 116
    Width = 381
    Height = 9
    Shape = bsTopLine
  end
  object DBEdit8: TDBEdit
    Left = 72
    Top = 6
    Width = 304
    Height = 21
    DataField = 'Address'
    DataSource = InspectorRLMainForm.dsContacts
    TabOrder = 0
  end
  object DBEdit9: TDBEdit
    Left = 72
    Top = 32
    Width = 124
    Height = 21
    DataField = 'City'
    DataSource = InspectorRLMainForm.dsContacts
    TabOrder = 1
  end
  object DBEdit10: TDBEdit
    Left = 72
    Top = 58
    Width = 49
    Height = 21
    DataField = 'State'
    DataSource = InspectorRLMainForm.dsContacts
    TabOrder = 2
  end
  object DBEdit11: TDBEdit
    Left = 72
    Top = 84
    Width = 64
    Height = 21
    DataField = 'ZipCode'
    DataSource = InspectorRLMainForm.dsContacts
    TabOrder = 3
  end
  object Button1: TButton
    Left = 219
    Top = 126
    Width = 72
    Height = 22
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object Button2: TButton
    Left = 305
    Top = 126
    Width = 72
    Height = 22
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 5
  end
end
