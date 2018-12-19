object DataCtrlsDemo1: TDataCtrlsDemo1
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  Height = 618
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 807
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader1
    Left = 288
    Top = 8
    Height = 32
    Width = 255
    ZIndex = 0
    AutoSize = False
    Styles.Default = stHeader1
    WordWrap = False
    Caption = 'Data Controls Demo'
  end
  object cbLoadAllRecords: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 632
    Top = 72
    Height = 23
    Width = 171
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 0
    Caption = 'Load all records mode'
    OnClick = cbLoadAllRecordsClick
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'biolife.DB'
    Left = 16
    Top = 24
    object Table1SpeciesNo: TFloatField
      FieldName = 'Species No'
    end
    object Table1Category: TStringField
      FieldName = 'Category'
      Size = 15
    end
    object Table1Common_Name: TStringField
      FieldName = 'Common_Name'
      Size = 30
    end
    object Table1SpeciesName: TStringField
      FieldName = 'Species Name'
      Size = 40
    end
    object Table1Lengthcm: TFloatField
      FieldName = 'Length (cm)'
    end
    object Table1Length_In: TFloatField
      FieldName = 'Length_In'
    end
    object Table1Notes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 50
    end
    object Table1Graphic: TGraphicField
      FieldName = 'Graphic'
      BlobType = ftGraphic
    end
  end
  object dsBiolife: TcxWebDBDataSource
    CustomEvents = <>
    DataSet = Table1
    Left = 104
    Top = 24
  end
  object cxWebDBDataNavigator1: TcxWebDBDataNavigator
    CustomEvents = <>
    Left = 16
    Top = 64
    Height = 26
    Width = 390
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
        ImageIndex = 2
      end
      item
        ButtonType = nbRefresh
        Hint = 'Refresh'
        ImageIndex = 1
      end>
    PageSize = 5
    DataBinding.DataSource = dsBiolife
  end
  object cxWebDBGrid1: TcxWebDBGrid
    CustomEvents = <>
    Left = 16
    Top = 112
    Height = 250
    Width = 761
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    KeepPageSize = False
    PageSize = 6
    ReadOnly = False
    SelectedColor = clWebHighlight
    SelectedFontColor = clWebCaptionText
    ShowGroupedColumns = True
    DataBinding.DataSource = dsBiolife
    FirstVisibleRow = 0
    object cxWebDBGrid1Column1: TcxWebDBColumn
      Title = 'Species No'
      VAlignment = wvalCenter
      Width = 184
      DataBinding.FieldName = 'Species No'
    end
    object cxWebDBGrid1Column2: TcxWebDBColumn
      Title = 'Category'
      VAlignment = wvalCenter
      Width = 184
      DataBinding.FieldName = 'Category'
    end
    object cxWebDBGrid1Column3: TcxWebDBColumn
      Title = 'Common_Name'
      VAlignment = wvalCenter
      Width = 184
      DataBinding.FieldName = 'Common_Name'
    end
    object cxWebDBGrid1Column4: TcxWebDBColumn
      Title = 'Species Name'
      VAlignment = wvalCenter
      Width = 189
      DataBinding.FieldName = 'Species Name'
    end
  end
  object cxWebDBLabel1: TcxWebDBLabel
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 120
    Top = 392
    Height = 17
    Width = 305
    ZIndex = 0
    AutoSize = False
    Styles.Default = stEditorDef
    WordWrap = False
    DataBinding.DataSource = dsBiolife
    DataBinding.FieldName = 'Species No'
  end
  object cxWebDBEdit1: TcxWebDBEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 120
    Top = 440
    Height = 20
    Width = 305
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 1
    DataBinding.DataSource = dsBiolife
    DataBinding.FieldName = 'Common_Name'
  end
  object cxWebDBMemo1: TcxWebDBMemo
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 120
    Top = 512
    Height = 94
    Width = 305
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 2
    DataBinding.DataSource = dsBiolife
    DataBinding.FieldName = 'Notes'
  end
  object cxWebDBImage1: TcxWebDBImage
    CustomEvents = <>
    Left = 448
    Top = 416
    Height = 185
    Width = 281
    ZIndex = 0
    DisplayStyle = wdsStretch
    DataBinding.DataSource = dsBiolife
    DataBinding.FieldName = 'Graphic'
  end
  object cxWebDBEdit2: TcxWebDBEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 120
    Top = 464
    Height = 20
    Width = 305
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 3
    DataBinding.DataSource = dsBiolife
    DataBinding.FieldName = 'Length (cm)'
  end
  object cxWebDBEdit3: TcxWebDBEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 120
    Top = 488
    Height = 20
    Width = 305
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 4
    DataBinding.DataSource = dsBiolife
    DataBinding.FieldName = 'Length_In'
  end
  object cxWebDBComboBox1: TcxWebDBComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 120
    Top = 416
    Height = 19
    Width = 305
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 5
    DataBinding.DataSource = dsBiolife
    DataBinding.FieldName = 'Category'
    DataBinding.Store = sText
    Items = <
      item
        Selected = True
        Text = 'Triggerfish'
        Value = '0'
      end
      item
        Text = 'Snapper'
        Value = '1'
      end
      item
        Text = 'Wrasse'
        Value = '2'
      end
      item
        Text = 'Angelfish'
        Value = '3'
      end
      item
        Text = 'Cod'
        Value = '4'
      end
      item
        Text = 'Scorpionfish'
        Value = '5'
      end
      item
        Text = 'Butterflyfish'
        Value = '6'
      end
      item
        Text = 'Shark'
        Value = '7'
      end
      item
        Text = 'Ray'
        Value = '8'
      end
      item
        Text = 'Sculpin'
        Value = '9'
      end
      item
        Text = 'Spadefish'
        Value = '10'
      end
      item
        Text = 'Parrotfish'
        Value = '11'
      end
      item
        Text = 'Barracuda'
        Value = '12'
      end
      item
        Text = 'Grunt'
        Value = '13'
      end
      item
        Text = 'Grouper'
        Value = '14'
      end
      item
        Text = 'Jack'
        Value = '15'
      end
      item
        Text = 'Surfperch'
        Value = '16'
      end
      item
        Text = 'Croaker'
        Value = '17'
      end
      item
        Text = 'Greenling'
        Value = '18'
      end
      item
        Text = 'Smelt'
        Value = '19'
      end>
  end
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 16
    Top = 392
    Height = 17
    Width = 81
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Species No'
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 16
    Top = 416
    Height = 17
    Width = 73
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Category'
  end
  object cxWebLabel4: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 16
    Top = 440
    Height = 17
    Width = 97
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Common name'
  end
  object cxWebLabel5: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 16
    Top = 464
    Height = 17
    Width = 81
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Length (cm)'
  end
  object cxWebLabel6: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 16
    Top = 488
    Height = 17
    Width = 73
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Length (in)'
  end
  object cxWebLabel7: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 16
    Top = 512
    Height = 17
    Width = 65
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Notes'
  end
  object cxWebLabel8: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 448
    Top = 392
    Height = 17
    Width = 49
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Picture'
  end
  object scCommon: TcxWebStyleController
    Left = 304
    Top = 16
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
end
