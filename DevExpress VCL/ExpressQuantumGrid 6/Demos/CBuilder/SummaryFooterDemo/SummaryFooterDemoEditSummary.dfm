object SummaryFooterDemoEditSummaryForm: TSummaryFooterDemoEditSummaryForm
  Left = 428
  Top = 215
  Width = 262
  Height = 322
  Caption = 'Insert/Delete Summaries'
  Color = clBtnFace
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 164
    Width = 254
    Height = 124
    Align = alBottom
    BevelOuter = bvNone
    Color = 15451300
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 42
      Width = 90
      Height = 13
      Caption = '&Calculated column:'
      FocusControl = cbCalculatedColumn
    end
    object Label2: TLabel
      Left = 8
      Top = 19
      Width = 114
      Height = 13
      Caption = '&Footer summary column:'
      FocusControl = cbFooterSummaryColumn
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 69
      Height = 13
      Caption = 'Summary &kind:'
      FocusControl = cbSummaryKind
    end
    object Bevel1: TBevel
      Left = 8
      Top = 80
      Width = 241
      Height = 9
      Shape = bsTopLine
    end
    object btnAdd: TcxButton
      Left = 8
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 3
      OnClick = btnAddClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object btnExit: TcxButton
      Left = 174
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 5
      LookAndFeel.NativeStyle = True
    end
    object btnDelete: TcxButton
      Left = 92
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 4
      OnClick = btnDeleteClick
      LookAndFeel.NativeStyle = True
    end
    object cbCalculatedColumn: TcxComboBox
      Left = 128
      Top = 34
      Width = 121
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cbCalculatedColumnPropertiesChange
      Style.Color = 16247513
      Style.LookAndFeel.NativeStyle = True
      TabOrder = 1
    end
    object cbFooterSummaryColumn: TcxComboBox
      Left = 128
      Top = 12
      Width = 121
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Revertable = True
      Properties.OnChange = cbFooterSummaryColumnPropertiesChange
      Style.Color = 16247513
      Style.LookAndFeel.NativeStyle = True
      TabOrder = 0
    end
    object cbSummaryKind: TcxImageComboBox
      Left = 128
      Top = 56
      Width = 121
      Height = 21
      Properties.DefaultDescription = 'None'
      Properties.Images = SummaryFooterDemoMainForm.ilMain
      Properties.Items = <>
      Style.Color = 16247513
      Style.LookAndFeel.NativeStyle = True
      TabOrder = 2
    end
  end
  object gbSummaries: TGroupBox
    Left = 0
    Top = 0
    Width = 254
    Height = 164
    Align = alClient
    Caption = 'Summaries'
    Color = 15451300
    ParentColor = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 15
      Width = 250
      Height = 147
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lbSummaries: TcxListBox
        Left = 0
        Top = 0
        Width = 250
        Height = 147
        Align = alClient
        Style.Color = 16247513
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
end
