inherited ConvertTreeList3DemoMainForm: TConvertTreeList3DemoMainForm
  Left = 199
  Top = 14
  Width = 722
  Height = 643
  Caption = 'ExpressQuantumTreeList4 ConvertTreeList3Demo'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 714
    Height = 25
    AutoSize = False
    Caption = 
      'Comparison of QuantumTreeList  3 && 4. See Help/About for more d' +
      'etails'
  end
  inherited sbMain: TStatusBar
    Top = 570
    Width = 714
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      
        'This demo compares the input and output of our QuantumTreeList /' +
        'QuantumTreeList 4 conversion component (for design time use).'
      ''
      
        'If you haven'#39't done so already, visit the tutorial version of th' +
        'is demo to see just how quick and easy it is to use (see the tut' +
        'orials folder)')
  end
  object pnlEQTL3Descrip: TPanel [3]
    Left = 0
    Top = 25
    Width = 714
    Height = 25
    Align = alTop
    Caption = 'Developer Express QuantumTreeList 3'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object pnlEQTL4Descrip: TPanel [4]
    Left = 0
    Top = 282
    Width = 714
    Height = 24
    Align = alTop
    Caption = 'Developer Express QuantumTreeList 4 '
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object dxDBTreeList: TdxDBTreeList [5]
    Left = 0
    Top = 50
    Width = 714
    Height = 232
    Bands = <
      item
        Width = 1000
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    ParentField = 'PARENTID'
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = ConvertTreeList3DemoDataDM.dsDepartments
    GridLineColor = 15916479
    GroupNodeColor = 16247513
    GroupNodeTextColor = clBlack
    HeaderColor = 15252642
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = 11032875
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = [fsBold]
    HideSelectionColor = 15451300
    LookAndFeel = lfUltraFlat
    OptionsDB = [etoCancelOnExit, etoCanDelete, etoCanNavigation, etoCheckHasChildren, etoConfirmDelete, etoLoadAllRecords]
    OptionsView = [etoBandHeaderWidth, etoIndicator, etoUseBitmap, etoUseImageIndexForSelected]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    PreviewLines = 1
    ShowFooter = True
    ShowGrid = True
    TreeLineColor = clGrayText
    object dxDBTreeListID: TdxDBTreeListMaskColumn
      Visible = False
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBTreeListPARENTID: TdxDBTreeListMaskColumn
      Visible = False
      Width = 162
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PARENTID'
    end
    object dxDBTreeListNAME: TdxDBTreeListColumn
      Sorted = csDown
      Width = 230
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBTreeListBUDGET: TdxDBTreeListCalcColumn
      Width = 105
      BandIndex = 0
      RowIndex = 0
      FieldName = 'BUDGET'
      SummaryFooterType = cstSum
      SummaryFooterField = 'BUDGET'
    end
    object dxDBTreeListPHONE: TdxDBTreeListColumn
      Width = 127
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PHONE'
    end
    object dxDBTreeListFAX: TdxDBTreeListColumn
      Width = 107
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FAX'
    end
    object dxDBTreeListEMAIL: TdxDBTreeListHyperLinkColumn
      Width = 159
      BandIndex = 0
      RowIndex = 0
      FieldName = 'EMAIL'
    end
    object dxDBTreeListVACANCY: TdxDBTreeListCheckColumn
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'VACANCY'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object pnlTreeList4Container: TPanel [6]
    Left = 0
    Top = 306
    Width = 714
    Height = 264
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlTreeList4Container'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object cxDBTreeList: TcxDBTreeList
      Left = 0
      Top = 0
      Width = 714
      Height = 264
      Styles.Background = cxStyle12
      Styles.Content = cxStyle6
      Styles.Inactive = cxStyle9
      Styles.ColumnHeader = cxStyle7
      Styles.Footer = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle8
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          MinWidth = 30
          Width = 1000
        end>
      BufferedPaint = True
      DataController.DataSource = ConvertTreeList3DemoDataDM.dsDepartments
      DataController.ParentField = 'PARENTID'
      DataController.KeyField = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookAndFeel.Kind = lfUltraFlat
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.AutoDragCopy = True
      OptionsBehavior.AutomateLeftMostIndent = False
      OptionsBehavior.DragCollapse = False
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.ShowHourGlass = False
      OptionsCustomizing.BandCustomizing = False
      OptionsCustomizing.BandVertSizing = False
      OptionsCustomizing.ColumnVertSizing = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.InvertSelect = False
      OptionsView.CellTextMaxLineCount = -1
      OptionsView.ShowEditButtons = ecsbFocused
      OptionsView.Footer = True
      OptionsView.GridLineColor = 15916479
      OptionsView.GridLines = tlglBoth
      OptionsView.Indicator = True
      ParentColor = False
      ParentFont = False
      Preview.AutoHeight = False
      Preview.MaxLineCount = 1
      RootValue = 255
      TabOrder = 0
      object cxDBTreeListID: TcxDBTreeListColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Caption.Text = 'ID'
        DataBinding.FieldName = 'ID'
        Options.Sorting = False
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
        Width = 45
      end
      object cxDBTreeListPARENTID: TcxDBTreeListColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Caption.Text = 'PARENTID'
        DataBinding.FieldName = 'PARENTID'
        Options.Sorting = False
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
        Width = 162
      end
      object cxDBTreeListNAME: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 50
        Properties.ReadOnly = False
        Caption.Text = 'NAME'
        DataBinding.FieldName = 'NAME'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
        Width = 290
      end
      object cxDBTreeListBUDGET: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = False
        Caption.Text = 'BUDGET'
        DataBinding.FieldName = 'BUDGET'
        Options.Footer = True
        Options.Sorting = False
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        SummaryFooter.Kind = skSum
        Width = 132
      end
      object cxDBTreeListPHONE: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 50
        Properties.ReadOnly = False
        Caption.Text = 'PHONE'
        DataBinding.FieldName = 'PHONE'
        Options.Sorting = False
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 161
      end
      object cxDBTreeListFAX: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 50
        Properties.ReadOnly = False
        Caption.Text = 'FAX'
        DataBinding.FieldName = 'FAX'
        Options.Sorting = False
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 135
      end
      object cxDBTreeListEMAIL: TcxDBTreeListColumn
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.ReadOnly = False
        Caption.Text = 'EMAIL'
        DataBinding.FieldName = 'EMAIL'
        Options.Sorting = False
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 200
      end
      object cxDBTreeListVACANCY: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssUnchecked
        Properties.ReadOnly = False
        Properties.ValueChecked = 'True'
        Properties.ValueGrayed = ''
        Properties.ValueUnchecked = 'False'
        Caption.Text = 'VACANCY'
        DataBinding.FieldName = 'VACANCY'
        MinWidth = 16
        Options.Sorting = False
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 82
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 24
    Top = 8
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clWindowText
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15252642
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 11032875
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 11032875
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clBtnText
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15252642
      TextColor = clWindowText
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 15252642
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 16247513
    end
  end
end
