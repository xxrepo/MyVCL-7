object TreeDemo1: TTreeDemo1
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <
    item
      Component = wcbBorderColors
    end
    item
      Component = wcbColors
    end>
  DesignerID = 1
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Height = 808
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 792
  object WebTreeView: TcxWebTreeView
    CustomEvents = <>
    StyleItem_Default = stTreeDef
    StyleItem_Hover = stTreeHover
    Left = 15
    Top = 81
    Height = 256
    Width = 272
    ZIndex = 0
    Images = ilImages
    Styles.Default = stTreeDef
    Styles.Hover = stTreeHover
    OnClick = WebTreeViewClick
    Items = {
      0D000000040000000000000000FFFFFFFF000000000000000000000000000000
      000D000000020000000000000000FFFFFFFF0D000000020000000000000001FF
      FFFFFF00000000060000004974656D5F310000000000000000000000000D0000
      00000000000000000000FFFFFFFF00000000080000004974656D5F315F310000
      000000000000000000000D000000000000000000000000FFFFFFFF0000000008
      0000004974656D5F315F320000000000000000000000000D0000000100000000
      00000001FFFFFFFF00000000060000004974656D5F3200000000000000000000
      00000D000000000000000000000000FFFFFFFF00000000080000004974656D5F
      325F310000000000000000000000000D000000020000000000000001FFFFFFFF
      00000000060000004974656D5F330000000000000000000000000D0000000000
      00000000000000FFFFFFFF00000000080000004974656D5F335F310000000000
      000000000000000D000000020000000000000001FFFFFFFF0000000008000000
      4974656D5F335F320000000000000000000000000D0000000000000000000000
      00FFFFFFFF000000000A0000004974656D5F335F325F31000000000000000000
      0000000D000000000000000000000000FFFFFFFF000000000A0000004974656D
      5F335F325F320000000000000000000000000D000000030000000000000001FF
      FFFFFF00000000060000004974656D5F340000000000000000000000000D0000
      00000000000000000000FFFFFFFF00000000080000004974656D5F345F310000
      000000000000000000000D000000000000000000000000FFFFFFFF0000000008
      0000004974656D5F345F320000000000000000000000000D0000000000000000
      00000000FFFFFFFF00000000080000004974656D5F345F330000000000000000
      00000000}
  end
  object StyleController: TcxWebStyleController
    Left = 37
    Top = 21
    object stTreeDef: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebCornflowerBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebNavy
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Shading.Color = clWebAliceBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stTreeHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebCornflowerBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebBlue
      Style.Font.Decoration = [wfdUnderline]
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Shading.Color = clWebAliceBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
  end
  object ilImages: TcxWebImageList
    Images = <
      item
        FileName = '001.gif'
        HorzSpace = 2
      end
      item
        FileName = '002.gif'
        HorzSpace = 2
      end
      item
        FileName = '003.gif'
        HorzSpace = 2
      end
      item
        FileName = '004.gif'
        HorzSpace = 2
      end
      item
        FileName = '005.gif'
        HorzSpace = 2
      end
      item
        FileName = '006.gif'
        HorzSpace = 2
      end
      item
        FileName = '007.gif'
        HorzSpace = 2
      end
      item
        FileName = '008.gif'
        HorzSpace = 2
      end
      item
        FileName = '009.gif'
        HorzSpace = 2
      end
      item
        FileName = '010.gif'
        HorzSpace = 2
      end
      item
        FileName = '011.gif'
        HorzSpace = 2
      end
      item
        FileName = '012.gif'
        HorzSpace = 2
      end
      item
        FileName = '013.gif'
        HorzSpace = 2
      end
      item
        FileName = '014.gif'
        HorzSpace = 2
      end
      item
        FileName = '015.gif'
        HorzSpace = 2
      end
      item
        FileName = '016.gif'
        HorzSpace = 2
      end
      item
        FileName = '017.gif'
        HorzSpace = 2
      end
      item
        FileName = '018.gif'
        HorzSpace = 2
      end
      item
        FileName = '019.gif'
        HorzSpace = 2
      end
      item
        FileName = '020.gif'
        HorzSpace = 2
      end>
    ImagesPath = '../Images/'
    Left = 135
    Top = 13
  end
  object wlblTitle: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader1
    Left = 193
    Top = 19
    Height = 32
    Width = 392
    ZIndex = 0
    AutoSize = False
    Styles.Default = stHeader1
    WordWrap = False
    Caption = 'WebTreeView Customize Demo'
  end
  object wlblItemProp: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader2
    Left = 320
    Top = 256
    Height = 18
    Width = 127
    ZIndex = 0
    AutoSize = False
    Styles.Default = stHeader2
    WordWrap = False
    Caption = 'Item Properties:'
  end
  object wlblImages: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader2
    Left = 24
    Top = 528
    Height = 18
    Width = 64
    ZIndex = 0
    AutoSize = False
    Styles.Default = stHeader2
    WordWrap = False
    Caption = 'Images:'
  end
  object wlblName: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 328
    Top = 285
    Height = 14
    Width = 39
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Name:'
  end
  object wlblText: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 328
    Top = 336
    Height = 14
    Width = 34
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Text:'
  end
  object wlblHint: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 328
    Top = 382
    Height = 14
    Width = 30
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Hint:'
  end
  object wlblURL: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 328
    Top = 309
    Height = 14
    Width = 29
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'URL:'
  end
  object wlblImIdx: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 328
    Top = 361
    Height = 14
    Width = 77
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Image Index:'
  end
  object wbtnAdd: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 16
    Top = 416
    Height = 26
    Width = 86
    ZIndex = 0
    Hint = 'Click to add a new item to the WebTreeView'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 0
    Caption = 'Add Item'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbtnAddClick
  end
  object wbtnAddCh: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 112
    Top = 416
    Height = 26
    Width = 86
    ZIndex = 0
    Hint = 'Click to add a child item to the selected item'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 1
    Caption = 'Add Child'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbtnAddChClick
  end
  object wbtnRemove: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 206
    Top = 416
    Height = 26
    Width = 86
    ZIndex = 0
    Hint = 'Click to delete the selected item'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 2
    Caption = 'Remove'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbtnRemoveClick
  end
  object wlblSelItem: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 23
    Top = 390
    Height = 14
    Width = 86
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Selected Item:'
  end
  object wedName: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 424
    Top = 280
    Height = 20
    Width = 193
    ZIndex = 0
    Enabled = False
    Styles.Default = stEditorDef
    TabOrder = 3
  end
  object wedText: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 424
    Top = 328
    Height = 20
    Width = 193
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 4
  end
  object wedURL: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 424
    Top = 304
    Height = 20
    Width = 193
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 5
  end
  object wedHint: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 424
    Top = 380
    Height = 20
    Width = 193
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 6
  end
  object wedImIdx: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 424
    Top = 353
    Height = 20
    Width = 32
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 7
  end
  object wlblVisProp: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader2
    Left = 320
    Top = 80
    Height = 18
    Width = 138
    ZIndex = 0
    AutoSize = False
    Styles.Default = stHeader2
    WordWrap = False
    Caption = 'Visual Properties:'
  end
  object wchbButtons: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 472
    Top = 160
    Height = 23
    Width = 137
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 8
    Caption = 'Show Buttons'
  end
  object wchbImages: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 472
    Top = 184
    Height = 23
    Width = 137
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 9
    Caption = 'Show Images'
  end
  object wlblColor: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 330
    Top = 113
    Height = 14
    Width = 35
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Color:'
  end
  object wlblBColor: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 330
    Top = 139
    Height = 14
    Width = 75
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Border Color:'
  end
  object wlblBWidth: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 330
    Top = 163
    Height = 14
    Width = 81
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Border Width:'
  end
  object wlblIndent: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 330
    Top = 185
    Height = 14
    Width = 45
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Indent:'
  end
  object wedIndent: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 420
    Top = 184
    Height = 20
    Width = 32
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 10
  end
  object wedBorderWidth: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 420
    Top = 160
    Height = 20
    Width = 32
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 11
  end
  object wcbBorderColors: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 420
    Top = 135
    Height = 19
    Width = 189
    ZIndex = 0
    Hint = 'Choose a color'
    Styles.Default = stEditorDef
    TabOrder = 12
    ItemIndex = -1
    Items = <>
  end
  object wcbColors: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 420
    Top = 110
    Height = 19
    Width = 189
    ZIndex = 0
    Hint = 'Choose a color'
    Styles.Default = stEditorDef
    TabOrder = 13
    ItemIndex = -1
    Items = <>
  end
  object wbtnVisApply: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 536
    Top = 224
    Height = 26
    Width = 80
    ZIndex = 0
    Hint = 'Click to apply changes to the WebTreeView'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 14
    Caption = 'Apply'
    GlyphPosition = gpBeforeText
    OnClick = wbtnVisApplyClick
  end
  object wbtnItemApply: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 536
    Top = 419
    Height = 26
    Width = 80
    ZIndex = 0
    Hint = 'Click to apply changes to the selected item'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 15
    Caption = 'Apply'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbtnItemApplyClick
  end
  object wlblHelp: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stTips
    Left = 15
    Top = 344
    Height = 33
    Width = 274
    ZIndex = 0
    Alignment = whalCenter
    AutoSize = False
    Styles.Default = stTips
    WordWrap = True
    Caption = 
      'Click a TreeView  Item if you want to customize or select its na' +
      'me below...'
  end
  object wbtnExpand: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 16
    Top = 448
    Height = 26
    Width = 132
    ZIndex = 0
    Hint = 'Click to expand all the items within the WebTreeView'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 16
    Caption = 'Expand All'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbtnExpandClick
  end
  object wbtnCollapse: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = stButtonDef
    StyleItem_Hover = stButtonHover
    Left = 160
    Top = 448
    Height = 26
    Width = 132
    ZIndex = 0
    Hint = 'Click to collapse all the items within the WebTreeView'
    Styles.Default = stButtonDef
    Styles.Hover = stButtonHover
    TabOrder = 17
    Caption = 'Collapse All'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbtnCollapseClick
  end
  object wlblBottomBevel: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLine2
    Left = 328
    Top = 408
    Height = 3
    Width = 297
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLine2
    WordWrap = False
  end
  object wlblTopBevel: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLine2
    Left = 327
    Top = 212
    Height = 3
    Width = 290
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLine2
    WordWrap = False
  end
  object wcbSelItem: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 129
    Top = 389
    Height = 19
    Width = 131
    ZIndex = 0
    Hint = 'Select Item name to customize'
    Styles.Default = stEditorDef
    TabOrder = 18
    OnChange = wcbSelItemChange
    ItemIndex = -1
    Items = <>
  end
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLine2
    Left = 16
    Top = 488
    Height = 3
    Width = 606
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLine2
    WordWrap = False
  end
  object scCommon: TcxWebStyleController
    Left = 296
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
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 24
    Top = 504
    Height = 14
    Width = 245
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Click an image to set the Image Index value'
  end
end
