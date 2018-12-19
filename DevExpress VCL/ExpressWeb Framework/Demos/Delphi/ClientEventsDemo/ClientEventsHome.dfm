object ClientEventsHomePage: TClientEventsHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  OnDeactivate = cxWebPageModuleDeactivate
  Left = 50
  Top = 50
  Height = 767
  HorizontalOffset = 222
  VerticalOffset = 118
  Width = 1011
  object scCommon: TcxWebStyleController
    Left = 144
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
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 72
    Top = 48
    Height = 18
    Width = 81
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Simple control'
  end
  object cxWebButton1: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'var Info = '#39'Event type:\t HTML OnClick\n'#39' + '
          '  '#39'event:\t\t HTML event object'#39';'
          'alert(Info);')
      end>
    Left = 0
    Top = 0
    Height = 39
    Width = 125
    ZIndex = 0
    TabOrder = 1
    Caption = 'Click me'
    GlyphPosition = gpBeforeText
  end
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 76
    Top = 173
    Height = 18
    Width = 106
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'WebDataNavigator'
  end
  object cxWebDBDataNavigator1: TcxWebDBDataNavigator
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataNavigator OnButtonClick\n'#39' + '
          '  '#39'Sender:\t\tDataNavigator script object\n'#39' + '
          '  '#39'Button:\t\t'#39' + Button + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 1
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataNavigator OnChangePageSize\n'#39' + '
          '  '#39'Sender:\t\tDataNavigator script object\n'#39' + '
          '  '#39'PageSize:\t'#39' + PageSize + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          '')
      end>
    Left = 241
    Top = 74
    Height = 26
    Width = 390
    ZIndex = 0
    Buttons = <
      item
        ButtonType = nbFirst
        Hint = 'First record'
      end
      item
        ButtonType = nbPrevPage
        Hint = 'Prior page'
      end
      item
        ButtonType = nbPrev
        Hint = 'Prior record'
      end
      item
        ButtonType = nbPageSize
        Hint = 'Page size'
      end
      item
        ButtonType = nbApplyPageSize
        Hint = 'Apply page size'
      end
      item
        ButtonType = nbNext
        Hint = 'Next record'
      end
      item
        ButtonType = nbNextPage
        Hint = 'Next page'
      end
      item
        ButtonType = nbLast
        Hint = 'Last record'
      end
      item
        ButtonType = nbInsert
        Hint = 'Insert record'
      end
      item
        ButtonType = nbEdit
        Hint = 'Edit record'
      end
      item
        ButtonType = nbDelete
        Hint = 'Delete record'
      end
      item
        ButtonType = nbPost
        Hint = 'Post changes'
      end
      item
        ButtonType = nbCancel
        Hint = 'Cancel changes'
      end
      item
        ButtonType = nbRefresh
        Hint = 'Refresh'
      end>
    PageSize = 5
    DataBinding.DataSource = cxWebDBDataSource1
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 57
    Top = 147
    Height = 18
    Width = 66
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'WebDBGrid'
  end
  object cxWebDBGrid1: TcxWebDBGrid
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebGrid OnRowClick\n'#39' + '
          '  '#39'Sender:\t\tWebGrid script object\n'#39' + '
          '  '#39'RowIndex\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'IsGroupedRow\t'#39' + IsGroupedRow + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 1
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebGrid OnHeaderClick\n'#39' + '
          '  '#39'Sender:\t\tWebGrid script object\n'#39' + '
          '  '#39'ColumnIndex\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebGrid OnStartDragHeader\n'#39' + '
          '  '#39'Sender:\t\tWebGrid script object\n'#39' + '
          '  '#39'ColumnIndex\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 3
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebGrid OnEndDragHeader\n'#39' + '
          '  '#39'Sender:\t\tWebGrid script object\n'#39' + '
          '  '#39'ColumnIndex\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          ''
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 4
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebGrid OnIndicatorClick\n'#39' + '
          '  '#39'Sender:\t\tWebGrid script object\n'#39' + '
          '  '#39'Reason\t\t'#39' + Reason + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          ''
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 5
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebGrid OnExpandButtonClick\n'#39' + '
          '  '#39'Sender:\t\tWebGrid script object\n'#39' + '
          '  '#39'RowIndex\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          ''
          '')
      end>
    Left = 0
    Top = 0
    Height = 198
    Width = 776
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    IndicatorWidth = 18
    KeepPageSize = False
    PageSize = 4
    ReadOnly = False
    RowHeight = 26
    SelectedColor = clWebHighlight
    SelectedFontColor = clWebCaptionText
    ShowGroupedColumns = True
    DataBinding.DataSource = cxWebDBDataSource1
    FirstVisibleRow = 0
    object cxWebDBGrid1Column1: TcxWebDBColumn
      CheckedValue = 'True'
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Name'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 151
      DataBinding.FieldName = 'Name'
    end
    object cxWebDBGrid1Column2: TcxWebDBColumn
      CheckedValue = 'True'
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Capital'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 151
      DataBinding.FieldName = 'Capital'
    end
    object cxWebDBGrid1Column3: TcxWebDBColumn
      CheckedValue = 'True'
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Continent'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 151
      DataBinding.FieldName = 'Continent'
    end
    object cxWebDBGrid1Column4: TcxWebDBColumn
      CheckedValue = 'True'
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Area'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'Area'
    end
    object cxWebDBGrid1Column5: TcxWebDBColumn
      CheckedValue = 'True'
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Population'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 153
      DataBinding.FieldName = 'Population'
    end
  end
  object cxWebDBDataSource1: TcxWebDBDataSource
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnAfterSort\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'ColumnIndex:\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 1
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnAfterGroup\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'ColumnIndex:\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'GroupIndex:\t'#39' + GroupIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnAfterUnGroup\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'ColumnIndex:\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 3
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnAfterExpand\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'RowIndex:\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 4
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnAfterMove\n'#39'+ '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'RowIndex:\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 5
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeSort\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'ColumnIndex:\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow sorting, Boolean'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 6
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeGroup\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'ColumnIndex:\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'GroupIndex:\t'#39' + GroupIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow grouping, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 7
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeUnGroup\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'ColumnIndex:\t'#39' + ColumnIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow ungrouping, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 8
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeExpand\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'RowIndex:\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow expanding, Boolean'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 9
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeMove\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'RowIndex:\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow moving, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 10
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeDelete\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'RowIndex:\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow deleting, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 11
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeInsert\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'RowIndex:\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow inserting, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 12
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeStartEdit\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'RowIndex:\t'#39' + RowIndex + '#39'\n'#39' + '
          '  '#39'Return value:\tAllow start edit, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 13
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforePostEdit\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'Return value:\tAllow post edit, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 14
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeCancelEdit\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'Return value:\tAllow cancel edit, Boolean'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 15
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDataSource OnBeforeRefresh\n'#39' + '
          '  '#39'Sender:\t\tDataController script object\n'#39' + '
          '  '#39'Return value:\tAllow refresh, Boolean'#39';'
          'alert(Info);'
          '')
      end>
    KeyFieldName = 'Name'
    DataSet = ADOTable1
    Left = 248
    Top = 16
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'country'
    Left = 376
    Top = 16
  end
  object cxWebLabel4: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 56
    Top = 374
    Height = 18
    Width = 76
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'WebCalendar'
  end
  object cxWebCalendar1: TcxWebCalendar
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebCalendar OnSelectDay\n'#39' + '
          '  '#39'Sender:\t\tCalendar script object\n'#39' + '
          '  '#39'ADate\t\t'#39' + ADate + '#39'\n'#39' + '
          '  '#39'Return value:\tBoolean, Allow select date'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 1
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebCalendar OnShiftMonth\n'#39' + '
          '  '#39'Sender:\t\tCalendar script object\n'#39' + '
          '  '#39'Offset\t\t'#39' + Offset + '#39'\n'#39' + '
          '  '#39'Return value:\tBoolean, Allow shift month'#39';'
          'alert(Info);'
          '')
      end>
    Left = 245
    Top = 377
    Height = 160
    Width = 200
    ZIndex = 0
    CellPadding = 0
    CellSpacing = 0
    DayHeaderAlignment = whalLeft
    FirstDayOfWeek = dowLocaleDefault
    NextMonthText = 'Next'
    PrevMonthText = 'Prev'
    ShowYear = True
    ShowMonthPictures = False
    ShowTodayLink = True
    SelectedDate = 37396.5208065857
  end
  object cxWebLabel5: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 61
    Top = 502
    Height = 18
    Width = 77
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'WebDateEdit'
  end
  object cxWebDateEdit1: TcxWebDateEdit
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDateEdit OnSelectDay\n'#39' + '
          '  '#39'Sender:\t\tDateEdit script object\n'#39' + '
          '  '#39'ADate\t\t'#39' + ADate + '#39'\n'#39' + '
          '  '#39'Return value:\tBoolean, Allow select date'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 1
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDateEdit OnShiftMonth\n'#39' + '
          '  '#39'Sender:\t\tDateEdit script object\n'#39' + '
          '  '#39'Offset\t\t'#39' + Offset + '#39'\n'#39' + '
          '  '#39'Return value:\tBoolean, Allow shift month'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebDateEdit OnValidateEditText\n'#39' + '
          '  '#39'Sender:\t\tDateEdit script object\n'#39' + '
          '  '#39'AText\t\t'#39' + AText + '#39'\n'#39' + '
          '  '#39'Return value:\tString, Valid date'#39';'
          'alert(Info);'
          '')
      end>
    Left = 194
    Top = 539
    Height = 22
    Width = 200
    ZIndex = 0
    CellPadding = 0
    CellSpacing = 0
    DayHeaderAlignment = whalLeft
    FirstDayOfWeek = dowLocaleDefault
    NextMonthText = 'Next'
    PrevMonthText = 'Prev'
    ShowYear = True
    ShowMonthPictures = False
    ShowTodayLink = False
    ButtonImageIndex = 0
    ButtonWidth = 18
    TabOrder = 0
    SelectedDate = 37396.5215680208
  end
  object cxWebLabel6: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 63
    Top = 530
    Height = 18
    Width = 61
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'WebTimer'
  end
  object cxWebTimer1: TcxWebTimer
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebTimer OnTimer\n'#39' + '
          '  '#39'Sender:\t\tTimer script object\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);')
      end>
    Enabled = False
    Interval = 5000
    Left = 472
    Top = 16
  end
  object cbTimerEnable: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 231
    Top = 500
    Height = 23
    Width = 76
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 2
    Caption = 'Enabled'
    OnClick = cbTimerEnableClick
  end
  object cxWebLabel7: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 81
    Top = 498
    Height = 18
    Width = 98
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'WebDataSources'
  end
  object cbLAL: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 97
    Top = 541
    Height = 23
    Width = 160
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 3
    Caption = 'Load all records mode'
    OnClick = cbLALClick
  end
  object cxWebLabel8: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 534
    Top = 815
    Height = 18
    Width = 83
    ZIndex = 0
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'WebTreeView'
  end
  object cxWebTreeView1: TcxWebTreeView
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 0
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebTreeView OnTreeItemClick\n'#39' + '
          '  '#39'Sender:\t\tWebTreeView script object\n'#39' + '
          '  '#39'ItemName\t'#39' + ItemName + '#39'\n'#39' + '
          '  '#39'Return value:\tHas no value'#39';'
          'alert(Info);'
          '')
      end
      item
        EventProcType = etProcedure
        EventType = 1
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebTreeView OnTreeItemCollapse\n'#39' + '
          '  '#39'Sender:\t\tWebTreeView script object\n'#39' + '
          '  '#39'ItemName\t'#39' + ItemName + '#39'\n'#39' + '
          '  '#39'Return value:\tBoolean, Allow collapse node'#39';'
          'alert(Info);')
      end
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'var Info = '#39'Event type:\tWebTreeView OnTreeItemExpand\n'#39' + '
          '  '#39'Sender:\t\tWebTreeView script object\n'#39' + '
          '  '#39'ItemName\t'#39' + ItemName + '#39'\n'#39' + '
          '  '#39'Return value:\tBoolean, Allow expand node'#39';'
          'alert(Info);')
      end>
    Left = 344
    Top = 463
    Height = 165
    Width = 198
    ZIndex = 0
    Items = {
      0D000000030000000000000001FFFFFFFF000000000000000000000000000000
      00000000000D000000020000000000000001FFFFFFFF00000000060000004974
      656D5F310000000000000000000000000D000000000000000000000000FFFFFF
      FF00000000080000004974656D5F315F310000000000000000000000000D0000
      00000000000000000000FFFFFFFF00000000080000004974656D5F315F320000
      000000000000000000000D000000020000000000000001FFFFFFFF0000000006
      0000004974656D5F320000000000000000000000000D00000000000000000000
      0000FFFFFFFF00000000080000004974656D5F325F3100000000000000000000
      00000D000000010000000000000001FFFFFFFF00000000080000004974656D5F
      325F320000000000000000000000000D000000000000000000000000FFFFFFFF
      000000000A0000004974656D5F325F325F310000000000000000000000000D00
      0000000000000000000000FFFFFFFF00000000060000004974656D5F33000000
      000000000000000000}
  end
end
