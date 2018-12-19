object MenuDemo1: TMenuDemo1
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 120
  Height = 524
  HorizontalOffset = 206
  VerticalOffset = 115
  Width = 776
  object StyleController: TcxWebStyleController
    Left = 32
    Top = 24
    object stAreas: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebDarkBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Decoration = [wfdUnderline]
      Style.Font.Name = 'Tahoma'
      Style.Font.Names.Strings = (
        'Tahoma')
      Style.Font.Size.Value = 11
      Style.Font.Style = wfsNormal
      Style.Font.Transform = wftNone
      Style.Font.Variant = wfvNormal
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebAliceBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object MenuDefaultStyleDevExpress: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebDeepSkyBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebLightBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebDarkBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object MenuHoverStyleDevExpress: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebDarkBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebGold
      Style.Shading.AssignedValues = [wsavColor]
    end
    object MenuDefaultStyleWheat: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebDarkRed
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 9
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebWheat
      Style.Shading.AssignedValues = [wsavColor]
    end
    object MenuHoverStyleWheat: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWheat
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 9
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebIndianRed
      Style.Shading.AssignedValues = [wsavColor]
    end
    object MenuDefaultStyleBright: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebDarkBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebBlack
      Style.Font.Name = 'Verdana'
      Style.Font.Names.Strings = (
        'Verdana')
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = clWebLightSkyBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object MenuHoverStyleBright: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWhite
      Style.Font.Name = 'Verdana'
      Style.Font.Names.Strings = (
        'Verdana')
      Style.Shading.Color = clWebCrimson
      Style.Shading.AssignedValues = [wsavColor]
    end
  end
  object wlblTitle: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader1
    Left = 208
    Top = 8
    Height = 32
    Width = 392
    ZIndex = 0
    Alignment = whalCenter
    AutoSize = False
    Styles.Default = stHeader1
    WordWrap = False
    Caption = 'WebMenu Customize Demo'
  end
  object cxWebMainMenu1: TcxWebMainMenu
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
      end>
    Left = 8
    Top = 288
    Height = 24
    Width = 727
    ZIndex = 0
    Horizontal = True
    Images = ilImages
    ImagesBackgroundColor = clWebSilver
    ItemHeight = 22
    SeparatorColor = clWebBlack
    SeparatorWidth = 1
    object cxWebMainMenu1Item1: TcxWebMenuItem
      Align = maLeft
      Caption = 'Home'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 0
      ImageIndex = -1
      PopupType = ptToRight
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 0
      URL.Href = 'Home'
      Visible = True
      Width = 145
      object cxWebMainMenu1Item13: TcxWebMenuItem
        Align = maLeft
        Caption = 'Support'
        DisabledImageIndex = -1
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 3
        PopupType = ptToRight
        SelectedImageIndex = -1
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'mailto:support@devexpress.com'
        Visible = True
        Width = 150
      end
      object cxWebMainMenu1Item14: TcxWebMenuItem
        Align = maLeft
        Caption = 'News Group'
        DisabledImageIndex = -1
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 3
        PopupType = ptToRight
        SelectedImageIndex = -1
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 
          'news://news.devexpress.com/devexpress.public.vcl.expresswebobjec' +
          'ts'
        Visible = True
        Width = 150
      end
    end
    object cxWebMainMenu1Item2: TcxWebMenuItem
      Align = maLeft
      Caption = 'Demos'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 0
      ImageIndex = -1
      PopupType = ptToRight
      SelectedImageIndex = -1
      SubMenuWidth = 250
      VertOffset = 0
      URL.Href = 'Demos'
      Visible = True
      Width = 145
      object miB2CDemo: TcxWebMenuItem
        Align = maLeft
        Caption = 'B2C Service Demo'
        DisabledImageIndex = 2
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 0
        PopupType = ptToRight
        SelectedImageIndex = 1
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'b2csd'
        Visible = True
        Width = 150
      end
      object miOrderFormDemo: TcxWebMenuItem
        Align = maLeft
        Caption = 'Order Form Demo'
        DisabledImageIndex = 3
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 3
        PopupType = ptToRight
        SelectedImageIndex = 3
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'OrderDemo'
        Visible = True
        Width = 150
      end
      object Item1: TcxWebMenuItem
        Align = maLeft
        Break = mbBreak
        Caption = 'Item1'
        DisabledImageIndex = -1
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = -1
        PopupType = ptToRight
        SelectedImageIndex = -1
        SubMenuWidth = 150
        VertOffset = 0
        Visible = True
        Width = 150
      end
      object miDataContolsDemo: TcxWebMenuItem
        Align = maLeft
        Caption = 'Data Controls Demo'
        DisabledImageIndex = 6
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 4
        PopupType = ptToRight
        SelectedImageIndex = 5
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'DataCtrlsDemo1'
        Visible = True
        Width = 150
      end
      object miWebGridDemo: TcxWebMenuItem
        Align = maLeft
        Caption = 'WebDBGrid Customize Demo'
        DisabledImageIndex = 9
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 7
        PopupType = ptToRight
        SelectedImageIndex = 8
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'GridDemo1'
        Visible = True
        Width = 150
      end
      object miWebTreeViewDemo: TcxWebMenuItem
        Align = maLeft
        Caption = 'WebTreeView Customize Demo'
        DisabledImageIndex = 12
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 10
        PopupType = ptToRight
        SelectedImageIndex = 11
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'TreeDemo1'
        Visible = True
        Width = 150
      end
      object miWebCalendarDemo: TcxWebMenuItem
        Align = maLeft
        Caption = 'WebCalendar Customize Demo'
        DisabledImageIndex = 15
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 13
        PopupType = ptToRight
        SelectedImageIndex = 14
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'CalendarDemo'
        Visible = True
        Width = 150
      end
      object miWebMenuDemo: TcxWebMenuItem
        Align = maLeft
        Caption = 'WebMenu Customize Demo'
        DisabledImageIndex = 18
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 16
        PopupType = ptToRight
        SelectedImageIndex = 17
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'MenuDemo1'
        Visible = True
        Width = 150
      end
    end
    object cxWebMainMenu1Item3: TcxWebMenuItem
      Align = maLeft
      Caption = 'Order'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 0
      ImageIndex = -1
      PopupType = ptToRight
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 0
      URL.Href = 'Order'
      Visible = True
      Width = 145
      object cxWebMainMenu1Item18: TcxWebMenuItem
        Align = maLeft
        Caption = 'Sales'
        DisabledImageIndex = -1
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 3
        PopupType = ptToRight
        SelectedImageIndex = -1
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'mailto:sales@devexpress.com'
        Visible = True
        Width = 150
      end
    end
    object cxWebMainMenu1Item4: TcxWebMenuItem
      Align = maLeft
      Caption = 'Links'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 0
      ImageIndex = -1
      PopupType = ptToRight
      SelectedImageIndex = -1
      SubMenuWidth = 190
      VertOffset = 0
      URL.Href = 'Links'
      Visible = True
      Width = 145
      object cxWebMainMenu1Item15: TcxWebMenuItem
        Align = maLeft
        Caption = 'Developer Express Inc'
        DisabledImageIndex = -1
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 3
        PopupType = ptToRight
        SelectedImageIndex = -1
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'http://www.devexpress.com'
        Visible = True
        Width = 150
      end
      object cxWebMainMenu1Item16: TcxWebMenuItem
        Align = maLeft
        Caption = 'Borland Inc'
        DisabledImageIndex = -1
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 3
        PopupType = ptToRight
        SelectedImageIndex = -1
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'http://www.borland.com'
        Visible = True
        Width = 150
      end
    end
    object cxWebMainMenu1Item5: TcxWebMenuItem
      Align = maLeft
      Caption = 'Contact'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 0
      ImageIndex = -1
      PopupType = ptToRight
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 0
      URL.Href = 'Contact'
      Visible = True
      Width = 145
      object cxWebMainMenu1Item17: TcxWebMenuItem
        Align = maLeft
        Caption = 'Info'
        DisabledImageIndex = -1
        Enabled = True
        HiliteOver = True
        HorizOffset = 0
        ImageIndex = 3
        PopupType = ptToRight
        SelectedImageIndex = -1
        SubMenuWidth = 150
        VertOffset = 0
        URL.Href = 'mailto:info@devexpress.com'
        Visible = True
        Width = 150
      end
    end
  end
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stAreas
    Left = 8
    Top = 520
    Height = 25
    Width = 729
    ZIndex = 0
    AutoSize = False
    PopupMenu = cxWebPopupMenu1
    PopupShowingType = stClick
    Styles.Default = stAreas
    WordWrap = False
    Caption = '  Click in this area to show popup menu'
  end
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stAreas
    Left = 8
    Top = 488
    Height = 25
    Width = 729
    ZIndex = 0
    AutoSize = False
    PopupMenu = cxWebPopupMenu1
    Styles.Default = stAreas
    WordWrap = False
    Caption = '  Move mouse over this area to show the popup menu'
  end
  object cxWebPopupMenu1: TcxWebPopupMenu
    CustomEvents = <>
    Images = ilImages
    ImagesBackgroundColor = clWebSilver
    ItemHeight = 20
    SeparatorColor = clWebBlack
    SeparatorWidth = 1
    Width = 250
    Left = 128
    Top = 24
    object pmiB2CDemo: TcxWebMenuItem
      Align = maLeft
      Caption = 'B2C Service Demo'
      DisabledImageIndex = 2
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = 0
      PopupType = ptToRight
      SelectedImageIndex = 1
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'b2csd'
      Visible = True
      Width = 250
    end
    object pmiOrderFormDemo: TcxWebMenuItem
      Align = maLeft
      Caption = 'Order Form Demo'
      DisabledImageIndex = 3
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = 3
      PopupType = ptToRight
      SelectedImageIndex = 3
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'OrderDemo'
      Visible = True
      Width = 250
    end
    object Item2: TcxWebMenuItem
      Align = maLeft
      Break = mbBreak
      Caption = 'Item2'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = -1
      PopupType = ptToRight
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 5
      Visible = True
      Width = 250
    end
    object pmiDataContolsDemo: TcxWebMenuItem
      Align = maLeft
      Caption = 'Data Controls Demo'
      DisabledImageIndex = 6
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = 4
      PopupType = ptToRight
      SelectedImageIndex = 5
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'DataCtrlsDemo1'
      Visible = True
      Width = 250
    end
    object pmiWebGridDemo: TcxWebMenuItem
      Align = maLeft
      Caption = 'WebDBGrid Customize Demo'
      DisabledImageIndex = 9
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = 7
      PopupType = ptToRight
      SelectedImageIndex = 8
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'GridDemo1'
      Visible = True
      Width = 250
    end
    object pmiWebTreeViewDemo: TcxWebMenuItem
      Align = maLeft
      Caption = 'WebTreeView Customize Demo'
      DisabledImageIndex = 12
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = 10
      PopupType = ptToRight
      SelectedImageIndex = 11
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'TreeDemo1'
      Visible = True
      Width = 250
    end
    object pmiWebCalendarDemo: TcxWebMenuItem
      Align = maLeft
      Caption = 'WebCalendar Customize Demo'
      DisabledImageIndex = 15
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = 13
      PopupType = ptToRight
      SelectedImageIndex = 14
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'CalendarDemo'
      Visible = True
      Width = 250
    end
    object pmiWebMenuDemo: TcxWebMenuItem
      Align = maLeft
      Caption = 'WebMenu Customize Demo'
      DisabledImageIndex = 18
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = 16
      PopupType = ptToRight
      SelectedImageIndex = 17
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'MenuDemo1'
      Visible = True
      Width = 250
    end
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 16
    Top = 72
    Height = 17
    Width = 73
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Menu Styles'
  end
  object cbMainMenuStyles: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 97
    Top = 72
    Height = 19
    Width = 120
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 2
    OnChange = cbMainMenuStylesChange
    ItemIndex = -1
    Items = <
      item
        Text = 'Not set'
        Value = '1'
      end
      item
        Text = 'DevExpress style'
        Value = '0'
      end
      item
        Text = 'Wheat Style'
        Value = '2'
      end
      item
        Text = 'Bright Style'
        Value = '3'
      end>
  end
  object cbHorizontal: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 8
    Top = 96
    Height = 23
    Width = 121
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 3
    Caption = 'Horizontal menu'
    OnClick = cbHorizontalClick
    Checked = True
  end
  object scCommon: TcxWebStyleController
    Left = 288
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
  object cxWebPanel1: TcxWebPanel
    CustomEvents = <>
    StyleItem_Default = stPanel
    Left = 240
    Top = 64
    Height = 201
    Width = 249
    ZIndex = 0
    Caption = 'Visible demo links'
    Styles.Default = stPanel
    TabOrder = 0
    object wcbB2CVisible: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 24
      Height = 23
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 0
      Caption = 'B2C Service Demo'
      OnClick = wcbB2CVisibleClick
      Checked = True
    end
    object wcbOrderFormVisible: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 47
      Height = 23
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 1
      Caption = 'Order Form Demo'
      OnClick = wcbOrderFormVisibleClick
      Checked = True
    end
    object wcbDataControlsVisible: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 70
      Height = 23
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 2
      Caption = 'Data Controls Demo'
      OnClick = wcbDataControlsVisibleClick
      Checked = True
    end
    object wcbWebGridVisible: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 93
      Height = 23
      Width = 203
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 3
      Caption = 'WebDBGrid Customize Demo'
      OnClick = wcbWebGridVisibleClick
      Checked = True
    end
    object wcbTreeViewVisible: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 116
      Height = 23
      Width = 217
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 4
      Caption = 'WebTreeView Customize Demo'
      OnClick = wcbTreeViewVisibleClick
      Checked = True
    end
    object wcbCalendarVisible: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 139
      Height = 23
      Width = 214
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 5
      Caption = 'WebCalendar Customize Demo'
      OnClick = wcbCalendarVisibleClick
      Checked = True
    end
    object wcbMenuVisible: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 162
      Height = 23
      Width = 209
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 6
      Caption = 'WebMenu Customize Demo'
      OnClick = wcbMenuVisibleClick
      Checked = True
    end
  end
  object cxWebPanel2: TcxWebPanel
    CustomEvents = <>
    StyleItem_Default = stPanel
    Left = 489
    Top = 64
    Height = 201
    Width = 249
    ZIndex = 0
    Caption = 'Enabled demo links'
    Styles.Default = stPanel
    TabOrder = 1
    object wcbWebMenuEnabled: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 162
      Height = 23
      Width = 209
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 0
      Caption = 'WebMenu Customize Demo'
      OnClick = wcbWebMenuEnabledClick
      Checked = True
    end
    object wcbCalendarEnabled: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 139
      Height = 23
      Width = 214
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 1
      Caption = 'WebCalendar Customize Demo'
      OnClick = wcbCalendarEnabledClick
      Checked = True
    end
    object wcbTreeViewEnabled: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 116
      Height = 23
      Width = 217
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 2
      Caption = 'WebTreeView Customize Demo'
      OnClick = wcbTreeViewEnabledClick
      Checked = True
    end
    object wcbWebGridEnabled: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 93
      Height = 23
      Width = 203
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 3
      Caption = 'WebDBGrid Customize Demo'
      OnClick = wcbWebGridEnabledClick
      Checked = True
    end
    object wcbDataControlsEnabled: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 70
      Height = 23
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 4
      Caption = 'Data Controls Demo'
      OnClick = wcbDataControlsEnabledClick
      Checked = True
    end
    object wcbOrderFormEnabled: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 47
      Height = 23
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 5
      Caption = 'Order Form Demo'
      OnClick = wcbOrderFormEnabledClick
      Checked = True
    end
    object wcbB2CEnabled: TcxWebCheckBox
      CustomEvents = <>
      StyleItem_Default = stLabelDef
      Left = 16
      Top = 24
      Height = 23
      ZIndex = 0
      Styles.Default = stLabelDef
      TabOrder = 6
      Caption = 'B2C Service Demo'
      OnClick = wcbB2CEnabledClick
      Checked = True
    end
  end
  object ilImages: TcxWebImageList
    Images = <
      item
        FileName = 'book.gif'
        HorzSpace = 2
      end
      item
        FileName = 'book_b.gif'
      end
      item
        FileName = 'book_d.gif'
      end
      item
        FileName = 'empty.gif'
      end
      item
        FileName = 'memo.gif'
      end
      item
        FileName = 'memo_b.gif'
      end
      item
        FileName = 'memo_d.gif'
      end
      item
        FileName = 'grid.gif'
      end
      item
        FileName = 'grid_b.gif'
      end
      item
        FileName = 'grid_d.gif'
      end
      item
        FileName = 'treeview.gif'
      end
      item
        FileName = 'treeview_b.gif'
      end
      item
        FileName = 'treeview_d.gif'
      end
      item
        FileName = 'calend.gif'
      end
      item
        FileName = 'calend_b.gif'
      end
      item
        FileName = 'calend_d.gif'
      end
      item
        FileName = 'menu.gif'
      end
      item
        FileName = 'menu_b.gif'
      end
      item
        FileName = 'menu_d.gif'
      end>
    ImagesPath = '../Images/'
    Left = 384
    Top = 16
  end
end
