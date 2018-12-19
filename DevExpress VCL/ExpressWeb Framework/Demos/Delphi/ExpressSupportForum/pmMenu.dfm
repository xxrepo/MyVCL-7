object Menu: TMenu
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Left = 50
  Top = 50
  Height = 391
  HorizontalOffset = 170
  VerticalOffset = 145
  Width = 790
  object cxWebMainMenu1: TcxWebMainMenu
    CustomEvents = <>
    StyleItem_Default = Menu
    StyleItem_Hover = MenuHover
    Left = 10
    Top = 15
    Height = 20
    Width = 600
    ZIndex = 0
    Horizontal = True
    ImagesBackgroundColor = clWebSilver
    ItemHeight = 20
    SeparatorColor = clWebWindowFrame
    SeparatorWidth = 1
    Styles.Default = Menu
    Styles.Hover = MenuHover
    object miQuestions: TcxWebMenuItem
      Align = maLeft
      Caption = '<img src='#39'/dxforum/images/on.gif'#39'> QUESTIONS'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = -1
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'Questions'
      URL.Target = 'info'
      Visible = True
      Width = 80
    end
    object miNewQuestion: TcxWebMenuItem
      Align = maLeft
      Caption = '<img src='#39'/dxforum/images/on.gif'#39'> NEW&nbsp;QUESTION'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = -1
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'Newquest'
      URL.Target = 'info'
      Visible = True
      Width = 100
    end
    object miMyQuestions: TcxWebMenuItem
      Align = maLeft
      Caption = '<img src='#39'/dxforum/images/on.gif'#39'> MY&nbsp;QUESTIONS'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = -1
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'MyQuest'
      URL.Target = 'info'
      Visible = True
      Width = 100
    end
    object miBookmarks: TcxWebMenuItem
      Align = maLeft
      Caption = '<img src='#39'/dxforum/images/on.gif'#39'> BOOKMARKS'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = -1
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'Bookmarks'
      URL.Target = 'info'
      Visible = True
      Width = 100
    end
    object miAddBookmark: TcxWebMenuItem
      Align = maLeft
      Caption = '<img src='#39'/dxforum/images/on.gif'#39'> ADD&nbsp;BOOKMARK'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = -1
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'javascript:add_book()'
      Visible = True
      Width = 100
    end
    object miLogOut: TcxWebMenuItem
      Align = maLeft
      Caption = '<img src='#39'/dxforum/images/on.gif'#39'> LOG&nbsp;OUT'
      DisabledImageIndex = -1
      Enabled = True
      HiliteOver = True
      HorizOffset = 10
      ImageIndex = -1
      SelectedImageIndex = -1
      SubMenuWidth = 150
      VertOffset = 5
      URL.Href = 'javascript:home();'
      Visible = True
      Width = 150
    end
  end
  object StyleController: TcxWebStyleController
    Left = 152
    Top = 16
    object Menu: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWhite
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Units = wuPixels
      Style.Font.Size.Value = 9
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebBlack
      Style.Shading.AssignedValues = [wsavColor]
    end
    object MenuHover: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = 5555455
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Units = wuPixels
      Style.Font.Size.Value = 9
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebBlack
      Style.Shading.AssignedValues = [wsavColor]
    end
  end
end
