object ColumnsShareDemoLookupCustomizeForm: TColumnsShareDemoLookupCustomizeForm
  Left = 270
  Top = 201
  BorderStyle = bsDialog
  Caption = 'Customize the Lookups of all Person columns'
  ClientHeight = 331
  ClientWidth = 362
  Color = 15451300
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescr: TLabel
    Left = 0
    Top = 0
    Width = 362
    Height = 33
    Align = alTop
    AutoSize = False
    Caption = 
      'Change the fields displayed and/or lookup properties of all '#39'per' +
      'son'#39' columns'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object btnClose: TcxButton
    Left = 280
    Top = 299
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    ModalResult = 1
    TabOrder = 0
    OnClick = btnCloseClick
    LookAndFeel.NativeStyle = True
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 40
    Width = 345
    Height = 257
    ActivePage = tsLookupListFields
    TabOrder = 1
    object tsLookupListFields: TTabSheet
      Caption = 'Lookup List Fields'
      object lbDescription: TLabel
        Left = 200
        Top = 8
        Width = 78
        Height = 13
        Caption = 'Lookup list fields'
      end
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Unlinked fields'
      end
      object Label1: TLabel
        Left = 0
        Top = 190
        Width = 337
        Height = 39
        Align = alBottom
        Caption = 
          'Move an unlinked field (e.g. COUNTRY or CITY) to the linked list' +
          ' and then see the affect on a column in the main form  (e.g. Cre' +
          'ator, Owner etc).'
        Color = 12937777
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        WordWrap = True
      end
      object btnAdd: TcxButton
        Left = 152
        Top = 56
        Width = 33
        Height = 25
        Caption = '>'
        TabOrder = 0
        OnClick = btnAddClick
        LookAndFeel.NativeStyle = True
      end
      object btnDelete: TcxButton
        Left = 152
        Top = 89
        Width = 33
        Height = 25
        Caption = '<'
        TabOrder = 1
        OnClick = btnDeleteClick
        LookAndFeel.NativeStyle = True
      end
      object lbUnlinkedColumns: TcxListBox
        Left = 8
        Top = 24
        Width = 130
        Height = 145
        ItemHeight = 13
        ParentColor = False
        Style.Color = 16247513
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 2
        OnDblClick = btnAddClick
        OnKeyPress = lbUnlinkedColumnsKeyPress
      end
      object lbListColumns: TcxListBox
        Left = 200
        Top = 24
        Width = 130
        Height = 145
        ItemHeight = 13
        ParentColor = False
        Style.Color = 16247513
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 3
        OnDblClick = btnDeleteClick
        OnKeyPress = lbListColumnsKeyPress
      end
    end
    object tsLookupProperties: TTabSheet
      Caption = 'Lookup Properties'
      Enabled = False
      ImageIndex = 1
      object Label5: TLabel
        Left = 192
        Top = 96
        Width = 66
        Height = 13
        Caption = 'List field index'
      end
      object Label4: TLabel
        Left = 192
        Top = 53
        Width = 79
        Height = 13
        Caption = 'DropDown rows:'
      end
      object Label2: TLabel
        Left = 192
        Top = 11
        Width = 93
        Height = 13
        Caption = 'DropDown list style:'
      end
      object chbHeaders: TcxCheckBox
        Left = 8
        Top = 86
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = 'Headers'
        Style.Color = 15451300
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 0
        OnClick = chbHeadersClick
      end
      object chbIncrementalFilltering: TcxCheckBox
        Left = 8
        Top = 60
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = 'Incremental Filltering'
        Style.Color = 15451300
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 1
        OnClick = chbIncrementalFillteringClick
      end
      object chbImmediateDropDown: TcxCheckBox
        Left = 8
        Top = 34
        Width = 129
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = 'Immediate Drop Down'
        Style.Color = 15451300
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 2
        OnClick = chbImmediateDropDownClick
      end
      object chbDropDownAutoSize: TcxCheckBox
        Left = 8
        Top = 8
        Width = 129
        Height = 21
        ParentColor = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = 'Drop Down Auto Size'
        Style.Color = 15451300
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 3
        OnClick = chbDropDownAutoSizeClick
      end
      object seListFieldIndex: TcxSpinEdit
        Left = 192
        Top = 108
        Width = 129
        Height = 21
        Properties.OnChange = seListFieldIndexPropertiesChange
        Style.Color = 16247513
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 4
      end
      object seDropDownRows: TcxSpinEdit
        Left = 192
        Top = 65
        Width = 129
        Height = 21
        Properties.OnChange = seDropDownRowsPropertiesChange
        Style.Color = 16247513
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 5
      end
      object cbDropDownListStyle: TcxComboBox
        Left = 192
        Top = 23
        Width = 129
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'lsEditFixedList'
          'lsEditList'
          'lsFixedList')
        Properties.OnChange = cbDropDownListStylePropertiesChange
        Style.Color = 16247513
        Style.LookAndFeel.NativeStyle = True
        TabOrder = 6
      end
    end
  end
end
