object SummariesDemoEditSummaryForm: TSummariesDemoEditSummaryForm
  Left = 418
  Top = 192
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Insert/Delete Summaries'
  ClientHeight = 288
  ClientWidth = 254
  Color = clBtnFace
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 194
    Width = 254
    Height = 94
    Align = alBottom
    BevelOuter = bvNone
    Color = 15451300
    TabOrder = 0
    object gbSummaryFooter: TGroupBox
      Left = 0
      Top = 0
      Width = 254
      Height = 62
      Align = alClient
      Caption = 'Summary Footer'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 75
        Height = 13
        Caption = '&Calculated field:'
        FocusControl = cbCalculatedField
      end
      object Label3: TLabel
        Left = 8
        Top = 42
        Width = 69
        Height = 13
        Caption = 'Summary &kind:'
        FocusControl = cbSummaryKind
      end
      object cbCalculatedField: TcxComboBox
        Left = 112
        Top = 12
        Width = 121
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbCalculatedFieldPropertiesChange
        Style.Color = 16247513
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 0
      end
      object cbSummaryKind: TcxImageComboBox
        Left = 112
        Top = 34
        Width = 121
        Height = 21
        Properties.DefaultDescription = 'None'
        Properties.Images = SummariesDemoMainForm.ilMain
        Properties.Items = <>
        Properties.OnChange = cbSummaryKindPropertiesChange
        Style.Color = 16247513
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 62
      Width = 254
      Height = 32
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object btnExit: TcxButton
        Left = 174
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Close'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnExitClick
        LookAndFeel.NativeStyle = True
      end
    end
  end
  object gbSummaries: TGroupBox
    Left = 0
    Top = 0
    Width = 254
    Height = 194
    Align = alClient
    Caption = 'Columns'
    Color = 15451300
    ParentColor = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 15
      Width = 250
      Height = 177
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lbColumns: TcxListBox
        Left = 0
        Top = 0
        Width = 250
        Height = 177
        Align = alClient
        ItemHeight = 13
        ParentColor = False
        Style.Color = 16247513
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
        OnClick = lbColumnsClick
      end
    end
  end
end
