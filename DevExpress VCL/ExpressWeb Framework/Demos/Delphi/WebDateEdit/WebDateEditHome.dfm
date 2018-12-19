object WebDateEditHomePage: TWebDateEditHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  OnBeforeRender = cxWebPageModuleBeforeRender
  Height = 747
  HorizontalOffset = 241
  VerticalOffset = 158
  Width = 1022
  object WebCalendar: TcxWebCalendar
    CustomEvents = <>
    StyleItem_Default = stStrong
    Left = 408
    Top = 60
    Height = 160
    Width = 233
    ZIndex = 0
    CellPadding = 2
    CellSpacing = 2
    DayHeaderAlignment = whalCenter
    DayHeaderStyle.Default = stStrongDayHeader
    FirstDayOfWeek = dowLocaleDefault
    Images = ilImages
    NextMonthText = 'Next'
    OtherMonthDayStyle.Default = stStrongOtherMonth
    PrevMonthText = 'Prev'
    SelectedStyle.Default = stStrongSelected
    ShowYear = True
    ShowMonthPictures = True
    ShowTodayLink = False
    Styles.Default = stStrong
    TitleStyle.Default = stStrongTitle
    TodayPanelStyle.Default = stStrongTitle
    OnSelectDay = WebCalendarSelectDay
    SelectedDate = 37315.4802573032
  end
  object StyleController: TcxWebStyleController
    Left = 104
    Top = 32
    object stStandardTitle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebNavy
      Style.Font.Name = 'Times New Roman'
      Style.Font.Names.Strings = (
        'Times New Roman')
      Style.Font.Size.Value = 12
      Style.Shading.Color = clWebLightBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStandardOtherMonth: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebLightGrey
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStandardSelected: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebGold
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebPurple
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 14
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebLightYellow
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStandard: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebSteelBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebAliceBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStandardButton: TcxWebStyleItem
      Style.Borders.Bottom.Color = clWebNavy
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Left.Color = clWebAliceBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.Color = clWebNavy
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.Color = clWebNavy
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebLightBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStandardEditor: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebNavy
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebAliceBlue
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStandardDayHeader: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebGold
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebNavy
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stWheatTitle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebTeal
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 12
      Style.Shading.Color = clWebWheat
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stWheatOtherMonth: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWheat
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
    end
    object stWheatSelected: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebSienna
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebLightGoldenrodYellow
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebDarkOrange
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stWheat: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebSienna
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebLightGoldenrodYellow
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stWheatDayHeader: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWheat
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebTeal
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stWheatButton: TcxWebStyleItem
      Style.Borders.Bottom.Color = clWebDimGray
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Left.Color = clWebSilver
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.Color = clWebDimGray
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.Color = clWebSilver
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebWheat
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stWheatEditor: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Color = clWebTeal
      Style.Borders.Left.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebLightYellow
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStrongTitle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebBlack
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 12
      Style.Shading.Color = clWebOrange
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStrongOtherMonth: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebLightGrey
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
    end
    object stStrongSelected: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebCornsilk
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStrong: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebBlack
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStrongDayHeader: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWhite
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebGray
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStrongButton: TcxWebStyleItem
      Style.Borders.Bottom.Color = clWebBlack
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Left.Color = clWebWhite
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.Color = clWebBlack
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.Color = clWebBlack
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebLightGrey
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stStrongEditor: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
    end
  end
  object wlblTitle: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stHeader1
    Left = 0
    Top = 0
    Height = 44
    Width = 794
    ZIndex = 0
    AutoSize = False
    Styles.Default = stHeader1
    WordWrap = False
    Caption = 'WebCalendar/WebDateEdit Customize Demo'
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
    Left = 24
    Top = 40
  end
  object wcbShowDate: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 24
    Top = 24
    Height = 23
    Width = 113
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 1
    Caption = 'Show date'
    OnClick = wcbShowDateClick
    Checked = True
  end
  object cbClientScripts: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 24
    Top = 50
    Height = 23
    Width = 108
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 2
    Caption = 'Client scripts'
    OnClick = cbClientScriptsClick
    Checked = True
  end
  object cbShowImages: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 137
    Top = 24
    Height = 23
    Width = 164
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 3
    Caption = 'Show month images'
    OnClick = cbShowImagesClick
    Checked = True
  end
  object cbShowYear: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 140
    Top = 52
    Height = 23
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 4
    Caption = 'Show year'
    OnClick = cbShowYearClick
    Checked = True
  end
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 24
    Top = 88
    Height = 17
    Width = 105
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Style schema'
  end
  object wcbStartOfWeek: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 144
    Top = 112
    Height = 19
    Width = 145
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 5
    OnChange = wcbStartOfWeekChange
    ItemIndex = 7
    Items = <
      item
        Text = 'Sunday'
        Value = '1'
      end
      item
        Text = 'Monday'
        Value = '2'
      end
      item
        Text = 'Tuesday'
        Value = '3'
      end
      item
        Text = 'Wednesday'
        Value = '4'
      end
      item
        Text = 'Thursday'
        Value = '5'
      end
      item
        Text = 'Friday'
        Value = '6'
      end
      item
        Text = 'Saturday'
        Value = '7'
      end
      item
        Selected = True
        Text = 'Locale Default'
        Value = '0'
      end>
  end
  object wlbCalendarDateLb: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 25
    Top = 166
    Height = 17
    Width = 168
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Selected Calendar date is:'
  end
  object wcbStyle: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 144
    Top = 86
    Height = 19
    Width = 145
    ZIndex = 0
    Styles.Default = stEditorDef
    TabOrder = 6
    OnChange = wcbStyleChange
    ItemIndex = 3
    Items = <
      item
        Text = 'Default'
        Value = '0'
      end
      item
        Text = 'Standard'
        Value = '1'
      end
      item
        Text = 'Wheat'
        Value = '2'
      end
      item
        Selected = True
        Text = 'Strong'
        Value = '3'
      end>
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 24
    Top = 116
    Height = 17
    Width = 117
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Start day of week'
  end
  object scCommon: TcxWebStyleController
    Left = 272
    Top = 24
    object stHeader1: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Color = clWebBlue
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
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
  object WebDateEdit: TcxWebDateEdit
    CustomEvents = <>
    StyleItem_Default = stStrong
    Left = 408
    Top = 240
    Height = 22
    Width = 233
    ZIndex = 0
    CellPadding = 0
    CellSpacing = 0
    DayHeaderAlignment = whalLeft
    DayHeaderStyle.Default = stStrongDayHeader
    FirstDayOfWeek = dowLocaleDefault
    NextMonthText = 'Next'
    OtherMonthDayStyle.Default = stStrongOtherMonth
    PrevMonthText = 'Prev'
    SelectedStyle.Default = stStrongSelected
    ShowYear = True
    ShowMonthPictures = True
    ShowTodayLink = False
    Styles.Default = stStrong
    TitleStyle.Default = stStrongTitle
    TodayPanelStyle.Default = stStrongTitle
    OnSelectDay = WebDateEditSelectDay
    ButtonImageIndex = 0
    ButtonWidth = 22
    ButtonStyles.Default = stStrongButton
    EditorStyles.Default = stStrongEditor
    TabOrder = 0
    SelectedDate = 37365.0386746296
  end
  object cxWebLabel4: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 26
    Top = 165
    Height = 17
    Width = 114
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Web Calendar'
  end
  object cxWebLabel5: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 25
    Top = 371
    Height = 17
    Width = 119
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Web DateEdit'
  end
  object wlbCalendarDate: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 239
    Top = 189
    Height = 17
    Width = 144
    ZIndex = 0
    AutoSize = False
    Styles.Default = stEditorDef
    WordWrap = False
  end
  object cbTodayLink: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 56
    Top = 131
    Height = 23
    ZIndex = 0
    Styles.Default = stLabelDef
    TabOrder = 7
    Caption = 'Show Today link'
    OnClick = cbTodayLinkClick
  end
  object wlbDateEditDateLb: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabelDef
    Left = 25
    Top = 166
    Height = 17
    Width = 168
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabelDef
    WordWrap = False
    Caption = 'Selected Dateedit date is:'
  end
  object wlbDateEditDate: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stEditorDef
    Left = 239
    Top = 189
    Height = 17
    Width = 144
    ZIndex = 0
    AutoSize = False
    Styles.Default = stEditorDef
    WordWrap = False
  end
end
