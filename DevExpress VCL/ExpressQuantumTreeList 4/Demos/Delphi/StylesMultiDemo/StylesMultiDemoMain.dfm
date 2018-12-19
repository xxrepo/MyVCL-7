inherited StylesMultiDemoMainForm: TStylesMultiDemoMainForm
  Left = 113
  Top = 108
  Width = 807
  Height = 566
  Caption = 'ExpressQuantumTreeList4 StylesMultiDemo'
  OldCreateOrder = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 799
    Height = 25
    AutoSize = False
    Caption = 
      'Experiment using StyleSheets. See Help/About for other things to' +
      ' try.'
  end
  object Splitter: TSplitter [1]
    Left = 217
    Top = 25
    Width = 2
    Height = 468
    MinSize = 4
  end
  inherited sbMain: TStatusBar
    Top = 493
    Width = 799
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      'In this demo you can:'
      ''
      
        '- switch between different style sheets (via the StyleSheets Tre' +
        'eView to the left of the mainform)'
      
        '- use a different pre-defined style sheets (just select any item' +
        ' in the Predefined Style Sheets branch of the Style Sheets TreeV' +
        'iew).'
      ''
      
        '- select a user defined style sheet via the combobox (just selec' +
        't any item in the User Defined Style Sheets branch of the Style ' +
        'Sheets TreeView).'
      '- modify one or more fonts and/or colors using the Edit button'
      
        '- load/save user defined style sheets from/to ini-files using op' +
        'enfile/savefile dialogs'
      ''
      
        '- NOTE: if you haven'#39't done so already, you might like to practi' +
        'ce by completing the tutorial version of this demo (see the tuto' +
        'rials folder)'
      '')
  end
  object pnlLeft: TPanel [4]
    Left = 0
    Top = 25
    Width = 217
    Height = 468
    Align = alLeft
    Anchors = [akLeft]
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 15451300
    Constraints.MinWidth = 215
    TabOrder = 0
    object gbUserDefined: TGroupBox
      Left = 1
      Top = 352
      Width = 215
      Height = 115
      Align = alBottom
      Caption = 'User Defined Style Sheets'
      TabOrder = 2
      TabStop = True
      object btnLoad: TcxButton
        Left = 11
        Top = 49
        Width = 193
        Height = 25
        Action = actLoadFromFile
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object btnSave: TcxButton
        Left = 11
        Top = 76
        Width = 193
        Height = 25
        Action = actSaveToFile
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 2
      end
      object btnEdit: TcxButton
        Left = 11
        Top = 22
        Width = 193
        Height = 25
        Action = actEditStyleSheet
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 0
      end
    end
    object gbPredefined: TGroupBox
      Left = 1
      Top = 36
      Width = 215
      Height = 316
      Align = alClient
      Caption = 'Predefined Style Sheets'
      TabOrder = 1
      TabStop = True
      object tlStyleSheets: TcxTreeList
        Left = 2
        Top = 15
        Width = 211
        Height = 299
        Styles.Background = StylesMultiDemoDataDM.styGroupNode
        Styles.OnGetContentStyle = tlStyleSheetsStylesGetContentStyle
        Styles.OnGetNodeIndentStyle = tlStyleSheetsStylesGetNodeIndentStyle
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band + 1'
            Width = 209
          end>
        BufferedPaint = False
        OptionsBehavior.AutomateLeftMostIndent = False
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandHorzSizing = False
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnCustomizing = False
        OptionsCustomizing.ColumnHorzSizing = False
        OptionsCustomizing.ColumnMoving = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideSelection = True
        OptionsSelection.InvertSelect = False
        OptionsView.CategorizedColumn = clnGroupName
        OptionsView.ColumnAutoWidth = True
        OptionsView.Headers = False
        OptionsView.PaintStyle = tlpsCategorized
        TabOrder = 0
        OnIsGroupNode = tlStyleSheetsIsGroupNode
        OnSelectionChanged = tlStyleSheetsSelectionChanged
        Data = {
          02000400D80000000F00000044617461436F6E74726F6C6C6572310200000012
          000000546378537472696E6756616C7565547970651200000054637853747269
          6E6756616C75655479706503000000000100040000004E6F6E65000100170000
          00507265646566696E6564207374796C65207368656574730001001900000055
          73657220646566696E6564207374796C65207368656574730300000000000000
          100000000000000000000000FFFFFFFF01000000100000000000000000000000
          FFFFFFFF02000000100000000000000000000000FFFFFFFF}
        object clnRadio: TcxTreeListColumn
          PropertiesClassName = 'TcxRadioGroupProperties'
          Properties.DefaultValue = False
          Properties.Items = <
            item
              Value = True
            end>
          Caption.AlignHorz = taRightJustify
          DataBinding.ValueType = 'String'
          Options.Customizing = False
          Options.Editing = False
          Options.IncSearch = False
          Options.Sorting = False
          Width = 54
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object clnGroupName: TcxTreeListColumn
          DataBinding.ValueType = 'String'
          Width = 155
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object pnlCurrentStyleSheet: TPanel
      Left = 1
      Top = 1
      Width = 215
      Height = 35
      Align = alTop
      BevelOuter = bvLowered
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object cxDBTreeList: TcxDBTreeList [5]
    Left = 219
    Top = 25
    Width = 580
    Height = 468
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Common department info'
        Width = 201
      end
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Detailed department info'
        Width = 220
      end
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Manager info'
        Width = 339
      end>
    BufferedPaint = True
    DataController.DataSource = StylesMultiDemoDataDM.dsDepartments
    DataController.ParentField = 'PARENTID'
    DataController.KeyField = 'ID'
    DragMode = dmAutomatic
    OptionsBehavior.AutomateLeftMostIndent = False
    OptionsData.Inserting = True
    OptionsView.CellAutoHeight = True
    OptionsView.Bands = True
    OptionsView.Footer = True
    OptionsView.GridLineColor = clGray
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.UseNodeColorForIndent = False
    Preview.Column = cxDBTreeListManagerAdress
    Preview.Visible = True
    RootValue = 255
    TabOrder = 3
    OnDragOver = cxDBTreeListDragOver
    OnInitInsertingRecord = cxDBTreeListInitInsertingRecord
    object cxDBTreeListID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'ID'
      DataBinding.FieldName = 'ID'
      Width = 63
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListPARENTID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'PARENTID'
      DataBinding.FieldName = 'PARENTID'
      Width = 62
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListNAME: TcxDBTreeListColumn
      PropertiesClassName = 'TcxMemoProperties'
      Caption.Text = 'NAME'
      DataBinding.FieldName = 'NAME'
      Options.Footer = True
      Width = 259
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Kind = skCount
    end
    object cxDBTreeListPHONE: TcxDBTreeListColumn
      Caption.Text = 'PHONE'
      DataBinding.FieldName = 'PHONE'
      Width = 167
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListFAX: TcxDBTreeListColumn
      Caption.Text = 'FAX'
      DataBinding.FieldName = 'FAX'
      Width = 90
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListBUDGET: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCalcEditProperties'
      Caption.Text = 'BUDGET'
      DataBinding.FieldName = 'BUDGET'
      Options.Footer = True
      Width = 86
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListVACANCY: TcxDBTreeListColumn
      Caption.Text = 'VACANCY'
      DataBinding.FieldName = 'VACANCY'
      Width = 77
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListManager: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = StylesMultiDemoDataDM.dsPersons
      Caption.Text = 'Manager'
      DataBinding.FieldName = 'MANAGERID'
      Width = 84
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object cxDBTreeListManagerPhone: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Phone'
        end>
      Properties.ListSource = StylesMultiDemoDataDM.dsPersons
      Properties.ReadOnly = False
      Caption.Text = 'Manager Phone'
      DataBinding.FieldName = 'MANAGERID'
      Width = 103
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object cxDBTreeListManagerEmail: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'EMAIL'
        end>
      Properties.ListSource = StylesMultiDemoDataDM.dsPersons
      Properties.ReadOnly = False
      Caption.Text = 'Manager Email'
      DataBinding.FieldName = 'MANAGERID'
      Width = 152
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object cxDBTreeListManagerAdress: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Address'
        end>
      Properties.ListSource = StylesMultiDemoDataDM.dsPersons
      DataBinding.FieldName = 'MANAGERID'
      Width = 67
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object miGridLookFeel: TMenuItem [0]
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            GroupIndex = 1
            Hint = 'Setting this option changes the demo appearance to Flat style'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miStandard: TMenuItem
            Tag = 1
            Caption = '&Standard'
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Standard styl' +
              'e'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miUltraFlat: TMenuItem
            Tag = 2
            Caption = '&Ultra Flat'
            Checked = True
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Ultra Flat st' +
              'yle'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object Office111: TMenuItem
            Tag = 3
            Caption = 'Office 11'
            GroupIndex = 1
            RadioItem = True
            OnClick = LookAndFeelChange
          end
        end
        object miNativeStyle: TMenuItem
          Tag = 4
          Caption = '&Native Style'
          Hint = 'Setting this option changes the demo appearance to Native style'
          OnClick = LookAndFeelChange
        end
      end
      object miSeparator2: TMenuItem [1]
        Caption = '-'
      end
    end
  end
  inherited alMain: TActionList
    Left = 432
    object actSaveToFile: TAction
      Category = 'Options'
      Caption = '&SaveToFile...'
      OnExecute = actSaveToFileExecute
    end
    object actLoadFromFile: TAction
      Category = 'Options'
      Caption = '&LoadFromFile...'
      OnExecute = actLoadFromFileExecute
    end
    object actEditStyleSheet: TAction
      Category = 'Options'
      Caption = '&Edit Style Sheet'
      OnExecute = actEditStyleSheetExecute
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 536
    Top = 8
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    Left = 568
    Top = 8
  end
end
