object DataSourceDemo: TDataSourceDemo
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  OnDeactivate = cxWebPageModuleDeactivate
  Left = 50
  Top = 50
  Height = 726
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 949
  object dsExtended: TcxWebDBDataSource
    CustomEvents = <>
    DataSet = ADOTable1
    Left = 456
    Top = 24
  end
  object dsStandard: TcxStdWebDataSource
    CustomEvents = <>
    DataSet = Table1
    Left = 352
    Top = 24
  end
  object cbType: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 128
    Top = 72
    Height = 19
    Width = 209
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 1
    OnChange = cbTypeChange
    ItemIndex = 0
    Items = <
      item
        Selected = True
        Text = 'WebDBDataSource'
        Value = '0'
      end
      item
        Text = 'WebStdDataSource'
        Value = '1'
      end
      item
        Text = 'WebDataSource (unbound)'
        Value = '2'
      end>
  end
  object cxWebDBGrid1: TcxWebDBGrid
    CustomEvents = <>
    Left = 16
    Top = 304
    Height = 276
    Width = 785
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    IndicatorWidth = 18
    KeepPageSize = False
    PageSize = 7
    ReadOnly = False
    RowHeight = 26
    SelectedColor = clWebHighlight
    SelectedFontColor = clWebCaptionText
    ShowGroupedColumns = True
    DataBinding.DataSource = dsExtended
    FirstVisibleRow = 0
    object cxWebDBGrid1Column1: TcxWebDBColumn
      CheckedValue = 'True'
      Title = 'Name'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 153
      DataBinding.FieldName = 'Name'
    end
    object cxWebDBGrid1Column2: TcxWebDBColumn
      CheckedValue = 'True'
      Title = 'Capital'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 153
      DataBinding.FieldName = 'Capital'
    end
    object cxWebDBGrid1Column3: TcxWebDBColumn
      CheckedValue = 'True'
      Title = 'Continent'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 153
      DataBinding.FieldName = 'Continent'
    end
    object cxWebDBGrid1Column4: TcxWebDBColumn
      CheckedValue = 'True'
      Title = 'Area'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 153
      DataBinding.FieldName = 'Area'
    end
    object cxWebDBGrid1Column5: TcxWebDBColumn
      CheckedValue = 'True'
      Title = 'Population'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 153
      DataBinding.FieldName = 'Population'
    end
  end
  object cxWebPanel1: TcxWebPanel
    CustomEvents = <>
    StyleItem_Default = stPanel
    Left = 16
    Top = 104
    Height = 185
    Width = 345
    ZIndex = 0
    Caption = 'DataSource properties'
    Styles.Default = stPanel
    TabOrder = 0
    object cbDataSet: TcxWebComboBox
      CustomEvents = <>
      StyleItem_Default = stEditorDef
      Left = 88
      Top = 22
      Height = 19
      Width = 97
      ZIndex = 0
      Styles.Default = stEditorDef
      TabOrder = 0
      ItemIndex = 0
      Items = <
        item
          Selected = True
          Text = 'ADOTable1'
          Value = '0'
        end
        item
          Text = 'Table1'
          Value = '1'
        end>
    end
    object wbApplyChanges: TcxWebButton
      CustomEvents = <>
      StyleItem_Default = stButtonDef
      StyleItem_Hover = stButtonHover
      Left = 201
      Top = 24
      Width = 121
      ZIndex = 0
      Styles.Default = stButtonDef
      Styles.Hover = stButtonHover
      TabOrder = 1
      Caption = 'Apply'
      GlyphIndex = 0
      GlyphPosition = gpBeforeText
      OnClick = wbApplyChangesClick
    end
    object wbCancelCanges: TcxWebButton
      CustomEvents = <>
      StyleItem_Default = stButtonDef
      StyleItem_Hover = stButtonHover
      Left = 201
      Top = 56
      Width = 121
      ZIndex = 0
      Styles.Default = stButtonDef
      Styles.Hover = stButtonHover
      TabOrder = 2
      Caption = 'Cancel'
      GlyphIndex = 0
      GlyphPosition = gpBeforeText
      OnClick = wbCancelCangesClick
    end
    object cxWebLabel1: TcxWebLabel
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 24
      Top = 24
      Height = 17
      Width = 57
      ZIndex = 0
      AutoSize = False
      Styles.Default = stLabelDef
      WordWrap = False
      Caption = 'DataSet'
    end
    object cbLoadAllRecords: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 19
      Top = 48
      Height = 23
      Width = 160
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 3
      Caption = 'Load all records mode'
    end
    object cbAllowEditing: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 19
      Top = 126
      Height = 23
      Width = 110
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 4
      Caption = 'Allow Editing'
      Checked = True
    end
    object cbAllowSorting: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 19
      Top = 74
      Height = 23
      Width = 110
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 5
      Caption = 'Allow Sorting'
      Checked = True
    end
    object cbAllowGrouping: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 19
      Top = 100
      Height = 23
      Width = 118
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 6
      Caption = 'Allow Grouping'
      Checked = True
    end
    object cbAllowExpanding: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 19
      Top = 152
      Height = 23
      Width = 134
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 7
      Caption = 'Allow Expanding'
      Checked = True
    end
    object wbLoad: TcxWebButton
      CustomEvents = <>
      StyleItem_Default = stButtonDef
      StyleItem_Hover = stButtonHover
      Left = 201
      Top = 88
      Width = 121
      ZIndex = 0
      Enabled = False
      Styles.Default = stButtonDef
      Styles.Hover = stButtonHover
      TabOrder = 8
      Caption = 'Load from stream'
      GlyphPosition = gpBeforeText
      OnClick = wbLoadClick
    end
    object wbSave: TcxWebButton
      CustomEvents = <>
      StyleItem_Default = stButtonDef
      StyleItem_Hover = stButtonHover
      Left = 201
      Top = 120
      Width = 121
      ZIndex = 0
      Enabled = False
      Styles.Default = stButtonDef
      Styles.Hover = stButtonHover
      TabOrder = 9
      Caption = 'Save to stream'
      GlyphPosition = gpBeforeText
      OnClick = wbSaveClick
    end
  end
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 32
    Top = 72
    Height = 17
    Width = 81
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'DataSource :'
  end
  object cxWebDBDataNavigator1: TcxWebDBDataNavigator
    CustomEvents = <>
    Left = 376
    Top = 112
    Height = 26
    Width = 420
    ZIndex = 0
    Buttons = <
      item
        ButtonType = nbFirst
        Hint = 'First record'
        ImageIndex = 0
      end
      item
        ButtonType = nbPrevPage
        Hint = 'Prior page'
        ImageIndex = 0
      end
      item
        ButtonType = nbPrev
        Hint = 'Prior record'
        ImageIndex = 0
      end
      item
        ButtonType = nbPageSize
        Hint = 'Page size'
        ImageIndex = 0
      end
      item
        ButtonType = nbApplyPageSize
        Hint = 'Apply page size'
        ImageIndex = 0
      end
      item
        ButtonType = nbNext
        Hint = 'Next record'
        ImageIndex = 0
      end
      item
        ButtonType = nbNextPage
        Hint = 'Next page'
        ImageIndex = 0
      end
      item
        ButtonType = nbLast
        Hint = 'Last record'
        ImageIndex = 0
      end
      item
        ButtonType = nbInsert
        Hint = 'Insert record'
        ImageIndex = 0
      end
      item
        ButtonType = nbEdit
        Hint = 'Edit record'
        ImageIndex = 0
      end
      item
        ButtonType = nbDelete
        Hint = 'Delete record'
        ImageIndex = 0
      end
      item
        ButtonType = nbPost
        Hint = 'Post changes'
        ImageIndex = 0
      end
      item
        ButtonType = nbCancel
        Hint = 'Cancel changes'
        ImageIndex = 0
      end
      item
        ButtonType = nbRefresh
        Hint = 'Refresh'
        ImageIndex = 0
      end>
    PageSize = 5
    DataBinding.DataSource = dsExtended
  end
  object dsUnbound: TcxWebDataSource
    CustomEvents = <>
    Fields = <
      item
        DisplayLabel = 'Product'
        Name = 'Product'
        Required = False
        GroupingIndex = -1
        SortingOrder = wsoNone
        ValueType = StringType
      end
      item
        DisplayLabel = 'Description'
        Name = 'Description'
        Required = False
        GroupingIndex = -1
        SortingOrder = wsoNone
        ValueType = StringType
      end
      item
        DisplayLabel = 'Price'
        Name = 'Price'
        Required = False
        GroupingIndex = -1
        SortingOrder = wsoNone
        ValueType = StringType
      end
      item
        DisplayLabel = 'Pucture URL'
        Name = 'Picture'
        Required = False
        GroupingIndex = -1
        SortingOrder = wsoNone
        ValueType = StringType
      end>
    RecordCount = 10
    Left = 248
    Top = 24
    Data = {
      0F00000044617461436F6E74726F6C6C65723104000000120000005463785374
      72696E6756616C75655479706512000000546378537472696E6756616C756554
      79706512000000546378537472696E6756616C75655479706512000000546378
      537472696E6756616C7565547970650A00000001010101010101010101}
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader1
    Left = 256
    Top = 8
    Height = 32
    Width = 255
    ZIndex = 0
    AutoSize = False
    Styles.Default = stHeader1
    WordWrap = False
    Caption = 'Data Sources Demo'
  end
  object scCommon: TcxWebStyleController
    Left = 576
    Top = 24
    object stHeader1: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Color = clWebPurple
      Style.Font.Name = 'Times New Roman'
      Style.Font.Names.Strings = (
        'Times New Roman')
      Style.Font.Size.Value = 22
      Style.Font.Weight = wfwBold
    end
    object stHeader2: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Decoration = [wfdUnderline]
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Font.Size.Value = 11
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwBold
    end
    object stPanel: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor]
      Style.Borders.Top.AssignedValues = [wbavColor]
      Style.Borders.Width = thin
      Style.Font.Color = clWebNavy
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 12
      Style.Font.Weight = wfwBold
    end
    object stButtonDef: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebAliceBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = clWebCornflowerBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stButtonHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebDarkBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebAliceBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebCornflowerBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stEditorDef: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebGainsboro
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stEditorHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebDarkBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stLabelDef: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Color = clWebNavy
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Font.Size.Value = 9
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
    end
    object stLabelHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Color = clWebCrimson
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Font.Size.Value = 9
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwBold
    end
    object stTips: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebSandyBrown
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Font.Size.Value = 8
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = 14811135
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stLine1: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = thin
      Style.Font.Name = 'Times New Roman'
      Style.Font.Names.Strings = (
        'Times New Roman')
      Style.Font.Size.Value = 12
      Style.Shading.Color = clWebDarkSlateBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stLine2: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebSandyBrown
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Font.Size.Value = 8
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = 14811135
      Style.Shading.AssignedValues = [wsavColor]
    end
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'country'
    Left = 64
    Top = 16
    object ADOTable1Name: TWideStringField
      FieldName = 'Name'
      Size = 24
    end
    object ADOTable1Capital: TWideStringField
      FieldName = 'Capital'
      Size = 24
    end
    object ADOTable1Continent: TWideStringField
      FieldName = 'Continent'
      Size = 24
    end
    object ADOTable1Area: TFloatField
      FieldName = 'Area'
    end
    object ADOTable1Population: TFloatField
      FieldName = 'Population'
    end
  end
  object wbFirst: TcxWebButton
    CustomEvents = <>
    Left = 376
    Top = 152
    Width = 65
    ZIndex = 0
    TabOrder = 2
    Caption = 'First'
    GlyphPosition = gpBeforeText
    OnClick = wbFirstClick
  end
  object wbPrevPage: TcxWebButton
    CustomEvents = <>
    Left = 448
    Top = 152
    Width = 65
    ZIndex = 0
    TabOrder = 3
    Caption = '-5'
    GlyphPosition = gpBeforeText
    OnClick = wbPrevPageClick
  end
  object wbPrev: TcxWebButton
    CustomEvents = <>
    Left = 520
    Top = 152
    Width = 65
    ZIndex = 0
    TabOrder = 4
    Caption = 'Prev'
    GlyphPosition = gpBeforeText
    OnClick = wbPrevClick
  end
  object wbNext: TcxWebButton
    CustomEvents = <>
    Left = 592
    Top = 152
    Width = 65
    ZIndex = 0
    TabOrder = 5
    Caption = 'Next'
    GlyphPosition = gpBeforeText
    OnClick = wbNextClick
  end
  object wbNextPage: TcxWebButton
    CustomEvents = <>
    Left = 664
    Top = 152
    Width = 65
    ZIndex = 0
    TabOrder = 6
    Caption = '+5'
    GlyphPosition = gpBeforeText
    OnClick = wbNextPageClick
  end
  object wbLast: TcxWebButton
    CustomEvents = <>
    Left = 736
    Top = 152
    Width = 65
    ZIndex = 0
    TabOrder = 7
    Caption = 'Last'
    GlyphPosition = gpBeforeText
    OnClick = wbLastClick
  end
  object wbInsert: TcxWebButton
    CustomEvents = <>
    Left = 376
    Top = 184
    Width = 65
    ZIndex = 0
    TabOrder = 8
    Caption = 'Insert'
    GlyphPosition = gpBeforeText
    OnClick = wbInsertClick
  end
  object wbEdit: TcxWebButton
    CustomEvents = <>
    Left = 448
    Top = 184
    Width = 65
    ZIndex = 0
    TabOrder = 9
    Caption = 'Edit'
    GlyphPosition = gpBeforeText
    OnClick = wbEditClick
  end
  object wbDelete: TcxWebButton
    CustomEvents = <>
    Left = 520
    Top = 184
    Width = 65
    ZIndex = 0
    TabOrder = 10
    Caption = 'Delete'
    GlyphPosition = gpBeforeText
    OnClick = wbDeleteClick
  end
  object wbPost: TcxWebButton
    CustomEvents = <>
    Left = 592
    Top = 184
    Width = 65
    ZIndex = 0
    TabOrder = 11
    Caption = 'Post'
    GlyphPosition = gpBeforeText
    OnClick = wbPostClick
  end
  object wbCancel: TcxWebButton
    CustomEvents = <>
    Left = 664
    Top = 184
    Width = 65
    ZIndex = 0
    TabOrder = 12
    Caption = 'Cancel'
    GlyphPosition = gpBeforeText
    OnClick = wbCancelClick
  end
  object wbRefresh: TcxWebButton
    CustomEvents = <>
    Left = 736
    Top = 184
    Width = 65
    ZIndex = 0
    TabOrder = 13
    Caption = 'Refresh'
    GlyphPosition = gpBeforeText
    OnClick = wbRefreshClick
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    FieldDefs = <
      item
        Name = 'Name'
        DataType = ftString
        Size = 24
      end
      item
        Name = 'Capital'
        DataType = ftString
        Size = 24
      end
      item
        Name = 'Continent'
        DataType = ftString
        Size = 24
      end
      item
        Name = 'Area'
        DataType = ftFloat
      end
      item
        Name = 'Population'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'Table1Index1'
        Fields = 'Name'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'country.db'
    Left = 128
    Top = 16
    object Table1Name: TStringField
      FieldName = 'Name'
      Size = 24
    end
    object Table1Capital: TStringField
      FieldName = 'Capital'
      Size = 24
    end
    object Table1Continent: TStringField
      FieldName = 'Continent'
      Size = 24
    end
    object Table1Area: TFloatField
      FieldName = 'Area'
    end
    object Table1Population: TFloatField
      FieldName = 'Population'
    end
  end
end
