object EBarMDIDemoMainForm: TEBarMDIDemoMainForm
  Left = 305
  Top = 169
  Width = 703
  Height = 513
  Caption = 'ExpressBars MDI Demo'
  Color = clBtnFace
  FormStyle = fsMDIForm
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 476
    Width = 695
    Height = 3
    Align = dalBottom
    AllowDocking = False
    BarManager = BarManager
    SunkenBorder = False
    UseOwnSunkenBorder = True
  end
  object dxStatusBar: TdxStatusBar
    Left = 0
    Top = 457
    Width = 695
    Height = 19
    Images = ilStatusBarImages
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 130
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
        Width = 435
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 130
      end>
    PaintStyle = stpsXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Main Menu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 43
        FloatTop = 96
        FloatClientWidth = 132
        FloatClientHeight = 38
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarSubItemFile
            Visible = True
          end
          item
            Item = dxBarSubItemEdit
            Visible = True
          end
          item
            Item = dxBarSubItemFormat
            Visible = True
          end
          item
            Item = dxBarSubItemWindow
            Visible = True
          end
          item
            Item = dxBarSubItemHelp
            Visible = True
          end>
        MultiLine = True
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'Standard'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 122
        FloatTop = 175
        FloatClientWidth = 150
        FloatClientHeight = 50
        ItemLinks = <
          item
            Item = dxBarButtonNew
            Visible = True
          end
          item
            Item = dxBarButtonOpen
            Visible = True
          end
          item
            Item = dxBarButtonSave
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButtonPrint
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButtonCut
            Visible = True
          end
          item
            Item = dxBarButtonCopy
            Visible = True
          end
          item
            Item = dxBarButtonPaste
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButtonUndo
            Visible = True
          end>
        OneOnRow = False
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Format'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 63
        DockingStyle = dsTop
        FloatLeft = 225
        FloatTop = 262
        FloatClientWidth = 248
        FloatClientHeight = 47
        ItemLinks = <
          item
            Item = dxBarButtonBold
            Visible = True
          end
          item
            Item = dxBarButtonItalic
            Visible = True
          end
          item
            Item = dxBarButtonUnderline
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButtonAlignLeft
            Visible = True
          end
          item
            Item = dxBarButtonCenter
            Visible = True
          end
          item
            Item = dxBarButtonAlignRight
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButtonBullets
            Visible = True
          end>
        Name = 'Format'
        OneOnRow = True
        Row = 2
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Bars Style'
        DockedDockingStyle = dsTop
        DockedLeft = 383
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 646
        FloatTop = 370
        FloatClientWidth = 123
        FloatClientHeight = 72
        Hidden = True
        ItemLinks = <
          item
            Item = dxBarButtonStdStyle
            Visible = True
          end
          item
            Item = dxBarButtonEnhancedStyle
            Visible = True
          end
          item
            Item = dxBarButtonFlatStyle
            Visible = True
          end
          item
            Item = dxBarButtonXPStyle
            Visible = True
          end
          item
            Item = dxBarButtonOffice11Style
            Visible = True
          end>
        Name = 'Style'
        OneOnRow = False
        Row = 1
        UseOwnFont = False
        UseRecentItems = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Font and Colors'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 103
        DockingStyle = dsTop
        FloatLeft = 585
        FloatTop = 329
        FloatClientWidth = 160
        FloatClientHeight = 60
        ItemLinks = <
          item
            Item = dxBarComboFontSize
            Visible = True
          end
          item
            Item = dxBarComboFontColor
            Visible = True
          end
          item
            Item = dxBarComboFontName
            Visible = True
          end>
        Name = 'Font and Colors'
        OneOnRow = True
        Row = 3
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'File'
      'Edit'
      'Format'
      'Window and Help'
      'Menus'
      'Help'
      'Style')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      False)
    HotImages = ilHotImages
    Images = Images
    DisabledLargeImages = ilDisabledImages
    LargeImages = Images
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 14
    Top = 148
    DockControlHeights = (
      0
      0
      127
      0)
    object dxBarButtonNew: TdxBarLargeButton
      Caption = '&New'
      Category = 0
      Hint = 'New'
      Visible = ivAlways
      OnClick = dxBarButtonNewClick
      HotImageIndex = 26
      LargeImageIndex = 26
    end
    object dxBarButtonOpen: TdxBarLargeButton
      Caption = '&Open...'
      Category = 0
      Hint = 'Open'
      Visible = ivAlways
      ShortCut = 16463
      OnClick = dxBarButtonOpenClick
      HotImageIndex = 24
      LargeImageIndex = 24
    end
    object dxBarButtonClose: TdxBarLargeButton
      Caption = '&Close'
      Category = 0
      Hint = 'Close'
      Visible = ivAlways
      OnClick = dxBarButtonCloseClick
      HotImageIndex = 35
      LargeImageIndex = 35
    end
    object dxBarButtonSave: TdxBarLargeButton
      Caption = '&Save'
      Category = 0
      Hint = 'Save'
      Visible = ivAlways
      ShortCut = 16467
      OnClick = dxBarButtonSaveClick
      HotImageIndex = 5
      LargeImageIndex = 5
    end
    object dxBarButtonSaveAs: TdxBarLargeButton
      Caption = 'Save &As...'
      Category = 0
      Hint = 'Save As'
      Visible = ivAlways
      OnClick = dxBarButtonSaveAsClick
      HotImageIndex = 36
      LargeImageIndex = 36
    end
    object dxBarSubItemFile: TdxBarSubItem
      Caption = '&File'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButtonNew
          Visible = True
        end
        item
          Item = dxBarButtonOpen
          Visible = True
        end
        item
          Item = dxBarButtonClose
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonSave
          Visible = True
        end
        item
          Item = dxBarButtonSaveAs
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonPrint
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarMRUFiles
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonExit
          Visible = True
        end>
    end
    object dxBarSubItemEdit: TdxBarSubItem
      Caption = '&Edit'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButtonUndo
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonCut
          Visible = True
        end
        item
          Item = dxBarButtonCopy
          Visible = True
        end
        item
          Item = dxBarButtonPaste
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonClear
          Visible = True
        end
        item
          Item = dxBarButtonSelectAll
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonFind
          Visible = True
        end
        item
          Item = dxBarButtonReplace
          Visible = True
        end>
    end
    object dxBarSubItemFormat: TdxBarSubItem
      Caption = 'F&ormat'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButtonFont
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonBullets
          Visible = True
        end
        item
          Item = dxBarButtonProtected
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarComboFontColor
          Visible = True
        end>
    end
    object dxBarSubItemWindow: TdxBarSubItem
      Caption = '&Window'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButtonNewWindow
          Visible = True
        end
        item
          Item = dxBarButtonArrangeAll
          Visible = True
        end
        item
          Item = dxBarListWindows
          Visible = True
        end>
    end
    object dxBarButtonPrint: TdxBarLargeButton
      Caption = '&Print...'
      Category = 0
      Hint = 'Print'
      Visible = ivAlways
      OnClick = dxBarButtonPrintClick
      HotImageIndex = 6
      LargeImageIndex = 6
    end
    object dxBarButtonExit: TdxBarLargeButton
      Caption = 'E&xit'
      Category = 0
      Hint = 'Exit'
      Visible = ivAlways
      ShortCut = 32856
      OnClick = dxBarButtonExitClick
      HotImageIndex = 28
      LargeImageIndex = 28
    end
    object dxBarButtonUndo: TdxBarLargeButton
      Caption = '&Undo'
      Category = 1
      Hint = 'Undo'
      Visible = ivAlways
      ShortCut = 16474
      OnClick = dxBarButtonUndoClick
      HotImageIndex = 7
      LargeImageIndex = 7
    end
    object dxBarButtonCut: TdxBarLargeButton
      Caption = 'Cu&t'
      Category = 1
      Hint = 'Cut'
      Visible = ivAlways
      ShortCut = 16472
      OnClick = dxBarButtonCutClick
      HotImageIndex = 8
      LargeImageIndex = 8
    end
    object dxBarButtonCopy: TdxBarLargeButton
      Caption = '&Copy'
      Category = 1
      Hint = 'Copy'
      Visible = ivAlways
      ShortCut = 16451
      OnClick = dxBarButtonCopyClick
      HotImageIndex = 9
      LargeImageIndex = 9
    end
    object dxBarButtonPaste: TdxBarLargeButton
      Caption = '&Paste'
      Category = 1
      Hint = 'Paste'
      Visible = ivAlways
      ShortCut = 16470
      OnClick = dxBarButtonPasteClick
      HotImageIndex = 10
      LargeImageIndex = 10
    end
    object dxBarButtonClear: TdxBarLargeButton
      Caption = 'Cle&ar'
      Category = 1
      Hint = 'Clear'
      Visible = ivAlways
      OnClick = dxBarButtonClearClick
      HotImageIndex = 34
      LargeImageIndex = 34
    end
    object dxBarButtonSelectAll: TdxBarLargeButton
      Caption = 'Select A&ll'
      Category = 1
      Hint = 'Select All'
      Visible = ivAlways
      ShortCut = 16449
      OnClick = dxBarButtonSelectAllClick
      HotImageIndex = 33
      LargeImageIndex = 33
    end
    object dxBarButtonFind: TdxBarLargeButton
      Caption = '&Find...'
      Category = 1
      Hint = 'Find'
      Visible = ivAlways
      ShortCut = 16454
      OnClick = dxBarButtonFindClick
      HotImageIndex = 12
      LargeImageIndex = 12
    end
    object dxBarButtonReplace: TdxBarLargeButton
      Caption = 'R&eplace...'
      Category = 1
      Hint = 'Replace'
      Visible = ivAlways
      ShortCut = 16456
      OnClick = dxBarButtonReplaceClick
      HotImageIndex = 13
      LargeImageIndex = 13
    end
    object dxBarComboFontSize: TdxBarCombo
      Caption = '&Size:'
      Category = 2
      Hint = 'Font Size'
      Visible = ivAlways
      OnChange = dxBarComboFontSizeChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777770000777700000707780777777008
        7000770077778007770777800000008777077770077800777707777808700877
        7707777700800777770777778000877777077777700077777000777778087777
        7707777777808080808777777777777777777777777777777777}
      Width = 50
      OnClick = dxBarButtonFontClick
      DropDownCount = 12
      Items.Strings = (
        '8'
        '9'
        '10'
        '11'
        '12'
        '14'
        '16'
        '18'
        '20'
        '22'
        '24'
        '26'
        '28'
        '36'
        '48'
        '72')
      ItemIndex = -1
    end
    object dxBarButtonBold: TdxBarLargeButton
      Caption = '&Bold'
      Category = 2
      Hint = 'Bold'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonBoldClick
      HotImageIndex = 14
      LargeImageIndex = 14
    end
    object dxBarButtonItalic: TdxBarLargeButton
      Caption = '&Italic'
      Category = 2
      Hint = 'Italic'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonItalicClick
      HotImageIndex = 15
      LargeImageIndex = 15
    end
    object dxBarButtonUnderline: TdxBarLargeButton
      Caption = '&Underline'
      Category = 2
      Hint = 'Underline'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonUnderlineClick
      HotImageIndex = 16
      LargeImageIndex = 16
    end
    object dxBarButtonBullets: TdxBarLargeButton
      Caption = '&Bullets'
      Category = 2
      Hint = 'Bullets'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonBulletsClick
      HotImageIndex = 17
      LargeImageIndex = 17
    end
    object dxBarButtonAlignLeft: TdxBarLargeButton
      Caption = 'Align &Left'
      Category = 2
      Hint = 'Align Left'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ShortCut = 16460
      OnClick = dxBarButtonAlignClick
      HotImageIndex = 18
      LargeImageIndex = 18
    end
    object dxBarButtonCenter: TdxBarLargeButton
      Tag = 2
      Caption = '&Center'
      Category = 2
      Hint = 'Center'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ShortCut = 16453
      OnClick = dxBarButtonAlignClick
      HotImageIndex = 19
      LargeImageIndex = 19
    end
    object dxBarButtonAlignRight: TdxBarLargeButton
      Tag = 1
      Caption = 'Align &Right'
      Category = 2
      Hint = 'Align Right'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ShortCut = 16466
      OnClick = dxBarButtonAlignClick
      HotImageIndex = 20
      LargeImageIndex = 20
    end
    object dxBarButtonProtected: TdxBarLargeButton
      Caption = 'P&rotected'
      Category = 2
      Hint = 'Protected'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonProtectedClick
      HotImageIndex = 32
      LargeImageIndex = 32
    end
    object dxBarButtonNewWindow: TdxBarLargeButton
      Caption = '&New Window'
      Category = 3
      Hint = 'New Window'
      Visible = ivAlways
      OnClick = dxBarButtonNewClick
      HotImageIndex = 31
      LargeImageIndex = 31
    end
    object dxBarButtonArrangeAll: TdxBarLargeButton
      Caption = '&Arrange All'
      Category = 3
      Hint = 'Arrange All'
      Visible = ivAlways
      OnClick = dxBarButtonArrangeAllClick
      HotImageIndex = 30
      LargeImageIndex = 30
    end
    object dxBarButtonNextWindow: TdxBarLargeButton
      Caption = 'Ne&xt Window'
      Category = 3
      Hint = 'Next Window'
      Visible = ivAlways
      ShortCut = 16501
      OnClick = dxBarButtonNextWindowClick
    end
    object dxBarButtonPreviousWindow: TdxBarLargeButton
      Caption = '&Previous Window'
      Category = 3
      Hint = 'Previous Window'
      Visible = ivAlways
      ShortCut = 24693
      OnClick = dxBarButtonPreviousWindowClick
    end
    object dxBarSubItemHelp: TdxBarSubItem
      Caption = '&Help'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton7
          Visible = True
        end
        item
          Item = dxBarLargeButton1
          Visible = True
        end
        item
          Item = dxBarButton5
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarLargeButton2
          Visible = True
        end
        item
          Item = dxBarButton2
          Visible = True
        end
        item
          Item = dxBarButton3
          Visible = True
        end
        item
          Item = dxBarButton4
          Visible = True
        end
        item
          Item = dxBarButton6
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButton1
          Visible = True
        end>
    end
    object dxBarListWindows: TdxBarListItem
      Caption = 'List of Current Windows'
      Category = 3
      Visible = ivAlways
      OnClick = dxBarListWindowsClick
      OnGetData = dxBarListWindowsGetData
      ShowCheck = True
    end
    object dxBarButtonFont: TdxBarLargeButton
      Caption = '&Font...'
      Category = 2
      Hint = 'Font'
      Visible = ivAlways
      OnClick = dxBarButtonFontClick
      HotImageIndex = 21
      LargeImageIndex = 21
    end
    object dxBarButtonEnhancedStyle: TdxBarLargeButton
      Caption = 'Enhanced'
      Category = 6
      Hint = 'Enhanced Style'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaption
      UnclickAfterDoing = False
      OnClick = dxBarButtonEnhancedStyleClick
      HotImageIndex = 38
      LargeImageIndex = 38
    end
    object dxBarButtonFlatStyle: TdxBarLargeButton
      Caption = 'Flat'
      Category = 6
      Hint = 'Flat Style'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaption
      UnclickAfterDoing = False
      OnClick = dxBarButtonFlatStyleClick
      HotImageIndex = 39
      LargeImageIndex = 39
    end
    object dxBarButtonStdStyle: TdxBarLargeButton
      Caption = 'Standard'
      Category = 6
      Hint = 'Standard Style'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaption
      UnclickAfterDoing = False
      OnClick = dxBarButtonStdStyleClick
      HotImageIndex = 37
      LargeImageIndex = 37
    end
    object dxBarMRUFiles: TdxBarMRUListItem
      Caption = 'List of Recently Used Files'
      Category = 0
      Visible = ivAlways
      OnClick = dxBarMRUFilesClick
      RemoveItemOnClick = True
    end
    object dxBarComboFontColor: TdxBarColorCombo
      Caption = 'Font Color'
      Category = 2
      Hint = 'Font Color'
      Visible = ivAlways
      OnChange = dxBarComboFontColorChange
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF000101A6
        000202B4000404E4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000101A6
        000202B4000404E4FFFFFFFF5201F9075202FA075204FC07FFFFFFFF070056FF
        070072FF0700D2FFFFFFFFFFFF5207FFFF5207FFFF5207FFFFFF}
      Width = 100
      ShowEditor = True
      Color = clBlack
      ShowCustomColorButton = True
    end
    object dxBarButtonXPStyle: TdxBarLargeButton
      Caption = 'XP'
      Category = 6
      Hint = 'XP'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      Down = True
      PaintStyle = psCaption
      UnclickAfterDoing = False
      OnClick = dxBarButtonXPStyleClick
      HotImageIndex = 40
      LargeImageIndex = 40
    end
    object dxBarButton1: TdxBarLargeButton
      Action = dmCommonData.actAbout
      Category = 5
      HotImageIndex = 29
    end
    object dxBarButton2: TdxBarLargeButton
      Action = dmCommonData.actDownloads
      Category = 5
      HotImageIndex = 2
    end
    object dxBarButton3: TdxBarLargeButton
      Action = dmCommonData.actDXOnTheWeb
      Category = 5
      HotImageIndex = 3
    end
    object dxBarButton4: TdxBarLargeButton
      Action = dmCommonData.actSupport
      Category = 5
      HotImageIndex = 2
    end
    object dxBarButton5: TdxBarLargeButton
      Action = dmCommonData.actRateDemo
      Category = 5
      HotImageIndex = 1
    end
    object dxBarButton6: TdxBarLargeButton
      Action = dmCommonData.actProducts
      Category = 5
      HotImageIndex = 2
    end
    object dxBarButton7: TdxBarLargeButton
      Action = dmCommonData.actBarsHelp
      Category = 5
      HotImageIndex = 0
    end
    object dxBarButtonOffice11Style: TdxBarLargeButton
      Caption = 'Office11'
      Category = 6
      Hint = 'Office11'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      PaintStyle = psCaption
      UnclickAfterDoing = False
      OnClick = dxBarButtonOffice11StyleClick
      HotImageIndex = 41
      LargeImageIndex = 41
    end
    object dxBarComboFontName: TdxBarFontNameCombo
      Caption = 'FontName'
      Category = 2
      Hint = 'FontName'
      Visible = ivAlways
      OnChange = dxBarComboFontNameChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888444488844444488887488888744
        7888888448888744888888874888844788888888444444488888888874884478
        8888888884484488888888888744478888888888884448888888888888747888
        8888888888848888888888888888888888888888888888888888}
      Width = 160
      DropDownCount = 12
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = dmCommonData.actDockingHelp
      Category = 5
      HotImageIndex = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = dmCommonData.actMyDX
      Category = 5
      HotImageIndex = 2
    end
    object dxBarGroup1: TdxBarGroup
      Items = (
        'dxBarButtonClose'
        'dxBarButtonSave'
        'dxBarButtonSaveAs'
        'dxBarButtonPrint'
        'dxBarButtonUndo'
        'dxBarButtonCut'
        'dxBarButtonCopy'
        'dxBarButtonPaste'
        'dxBarButtonClear'
        'dxBarButtonSelectAll'
        'dxBarButtonFind'
        'dxBarButtonReplace'
        'dxBarComboFontSize'
        'dxBarButtonBold'
        'dxBarButtonItalic'
        'dxBarButtonUnderline'
        'dxBarButtonBullets'
        'dxBarButtonAlignLeft'
        'dxBarButtonCenter'
        'dxBarButtonAlignRight'
        'dxBarButtonProtected'
        'dxBarButtonFont'
        'dxBarComboFontColor'
        'dxBarButtonArrangeAll'
        'dxBarButtonNextWindow'
        'dxBarButtonPreviousWindow'
        'dxBarComboFontName')
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'RTF'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Left = 48
    Top = 148
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'RTF'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist]
    Left = 84
    Top = 148
  end
  object PrintDialog: TPrintDialog
    Left = 116
    Top = 148
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 148
    Top = 149
  end
  object dxBarPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = dxBarButtonCut
        Visible = True
      end
      item
        Item = dxBarButtonCopy
        Visible = True
      end
      item
        Item = dxBarButtonPaste
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarButtonFont
        Visible = True
      end
      item
        Item = dxBarButtonBullets
        Visible = True
      end>
    UseOwnFont = False
    Left = 14
    Top = 180
  end
  object Images: TImageList
    Left = 264
    Top = 152
    Bitmap = {
      494C01012A002C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000313131003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      18001818180018181800181818001818180000000000C6C6C6006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00313131003131310031313100525252005A5A
      5A00636363006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D60018181800A5A5A500A5A5A500181818009494
      9400B5B5B500CECECE00D6D6D600D6D6D600C6C6C600B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B50031313100ADADAD00ADADAD00313131008484
      84009C9C9C00ADADAD00B5B5B500B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00A5A5A50018181800DEDE
      DE00DEDEDE00D6D6D6008484840084848400A5A5A500A5A5A500181818004242
      42004A4A4A004A4A4A005252520052525200BDBDBD00FFFFFF00FFFFFF00BDBD
      BD00BDBDBD0042424200424242008C8C8C00ADADAD00ADADAD00313131003939
      3900393939004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00CECECE00A5A5A500DEDE
      DE00DEDEDE0094949400A5A5A500ADADAD0084848400A5A5A500A5A5A5001818
      18007B7B7B009C9C9C00ADADAD00B5B5B500BDBDBD004A4A4A00FFFFFF00BDBD
      BD00BDBDBD0042424200ADADAD00A5A5A5008C8C8C00ADADAD00ADADAD003131
      31007B7B7B0094949400A5A5A500ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0094949400BDBDBD00C6C6C60084848400A5A5A500A5A5A5001818
      18008484840094949400B5B5B500C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60042424200ADADAD00ADADAD008C8C8C00ADADAD00ADADAD003131
      31007B7B7B008C8C8C009C9C9C00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00A5A5A50018181800DEDE
      DE00DEDEDE009C9C9C00DEDEDE00DEDEDE00D6D6D60084848400A5A5A500A5A5
      A5001818180094949400B5B5B500CECECE00CECECE00FFFFFF00FFFFFF00CECE
      CE00CECECE0042424200B5B5B500B5B5B500B5B5B5008C8C8C00ADADAD00ADAD
      AD0031313100848484009C9C9C00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00CECECE00A5A5A500DEDE
      DE00DEDEDE009C9C9C00DEDEDE00E7E7E700E7E7E70084848400A5A5A500A5A5
      A500181818008C8C8C00ADADAD00CECECE00D6D6D6004A4A4A00FFFFFF00D6D6
      D600D6D6D60042424200BDBDBD00BDBDBD00BDBDBD008C8C8C00ADADAD00ADAD
      AD00313131008484840094949400ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A500DEDEDE00E7E7E700EFEFEF00E7E7E70084848400A5A5
      A500A5A5A500181818009C9C9C00C6C6C600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0042424200C6C6C600C6C6C600BDBDBD00BDBDBD008C8C8C00ADAD
      AD00ADADAD00313131008C8C8C00A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00A5A5A50018181800DEDE
      DE00DEDEDE00A5A5A500D6D6D600E7E7E700EFEFEF00F7F7F70084848400A5A5
      A500A5A5A500181818009C9C9C00B5B5B500E7E7E700FFFFFF00FFFFFF00E7E7
      E700E7E7E70042424200C6C6C600C6C6C600C6C6C600C6C6C6008C8C8C00ADAD
      AD00ADADAD00313131008C8C8C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00CECECE00A5A5A500DEDE
      DE00DEDEDE00DEDEDE00A5A5A500A5A5A500A5A5A500A5A5A5009C9C9C008484
      8400A5A5A500A5A5A500181818006B6B6B00E7E7E7004A4A4A00FFFFFF00E7E7
      E700E7E7E7004242420042424200424242004242420042424200424242008C8C
      8C00ADADAD00ADADAD0031313100393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D6008484
      8400A5A5A500181818001818180084848400C6C6C600EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008C8C
      8C00ADADAD0031313100313131009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      940084848400E7E7E700E7E7E7001818180000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F7008C8C8C00DEDEDE00DEDEDE00313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E700E7E7E700181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C00DEDEDE00DEDEDE00313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D422F006D42
      2F006D422F006D422F006D422F006D422F006D422F006D422F006D422F006D42
      2F006D422F006D422F006D422F006D422F000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      00000000000000000000000000000000000000000000CE726F00D1979200CB8E
      8A00715A4800C0B2AB00C4BCB800CAC1BC00CAC1BC00CAC1BC00CAC1BC008C76
      67009443400094434000944340006D422F000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      00000000000000000000000000000000000000000000CE726F00D79F9B00D197
      9200715A48002E1F18005F504600FFFFFF00FFFFFF00FFFFFF00F0E4DE008C76
      67009747440094434000944340006D422F001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      18001818180018181800181818001818180000000000CE726F00DDA8A300D79F
      9B00715A48000000000036241B00FFFFFF00F7F1EE00F0E4DE00E1CABD008C76
      67009E504D0097474400944340006D422F00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600CECECE00181818009C9C9C009C9C9C00181818008C8C
      8C00ADADAD00C6C6C600D6D6D600D6D6D600FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600CECECE00181818009C9C9C009C9C9C00181818008C8C
      8C00ADADAD00C6C6C600D6D6D600D6D6D60094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00181818009C9C9C009C9C9C0018181800A5A5
      A500C6C6C600DEDEDE00EFEFEF00EFEFEF0000000000CE726F00E3B0AB00DDA8
      A300715A4800715A4800715A4800715A4800715A4800715A4800715A4800715A
      4800A45956009E504D00974744006D422F00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600848484009C9C9C009C9C9C00181818001818
      180018181800181818001818180018181800FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D60018181800848484009C9C9C009C9C9C00181818001818
      18001818180018181800181818001818180094949400EFEFEF00181818001818
      180018181800EFEFEF0018181800848484009C9C9C009C9C9C00181818001818
      18001818180018181800181818001818180000000000CE726F00EDBDB800E7B5
      B000E0ACA700DAA49F00D49B9700CB8E8A00C8635C00B19291009E504D00B26B
      6800AB625F00A45956009E504D006D422F00FFFFFF00D6D6D600181818001818
      18001818180018181800D6D6D600FFFFFF00848484009C9C9C009C9C9C001818
      18008C8C8C00ADADAD00C6C6C600D6D6D600FFFFFF00D6D6D600181818001818
      180018181800D6D6D600FFFFFF00CECECE00848484009C9C9C009C9C9C001818
      18008C8C8C00ADADAD00C6C6C600D6D6D60094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF008C8C8C00E7E7E700848484009C9C9C009C9C9C001818
      1800A5A5A500C6C6C600DEDEDE00EFEFEF0000000000CE726F00F0C1BC00EDBD
      B800E7B5B000E0ACA700DAA49F00D49B9700C8635C00D5B5A4009E504D00BC79
      7500B26B6800AB625F00A45956006D422F00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00848484009C9C9C009C9C9C001818
      1800848484009C9C9C00BDBDBD00CECECE00FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600848484009C9C9C009C9C9C001818
      1800848484009C9C9C00BDBDBD00CECECE0094949400EFEFEF00181818001818
      180018181800EFEFEF008C8C8C00EFEFEF00848484009C9C9C009C9C9C001818
      180094949400B5B5B500D6D6D600E7E7E70000000000CE726F00F0C1BC00F0C1
      BC00D49B9700C8635C00C8635C00C8635C00B78C7F00D6BAA800D5B5A4009E50
      4D009E504D00B5706C00AE6763006D422F00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00CECECE00848484009C9C9C009C9C
      9C00181818008C8C8C00ADADAD00C6C6C600FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600CECECE00848484009C9C9C009C9C
      9C00181818008C8C8C00ADADAD00C6C6C60094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0094949400EFEFEF00E7E7E700848484009C9C9C009C9C
      9C0018181800A5A5A500C6C6C600DEDEDE0000000000CE726F00F0C1BC00C9B9
      B400C5897D00D9BFAC00E1CEB800E3D2BA00485BDD009D97C100D7BAA800D5B5
      A400A47164009E504D00B5706C006D422F00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00D6D6D600848484009C9C9C009C9C
      9C0018181800848484009C9C9C00BDBDBD00FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600D6D6D600848484009C9C9C009C9C
      9C0018181800848484009C9C9C00BDBDBD0094949400EFEFEF00181818001818
      180018181800EFEFEF0094949400EFEFEF00EFEFEF00848484009C9C9C009C9C
      9C001818180094949400B5B5B500D6D6D60000000000CE726F00F0C1BC00C589
      7D00E8DCC300ECE3CA00EBE2C800E8DAC200B2ACC700CCBAB900DABFAC00D5B5
      A400CAA192009E6B64009E504D006D422F00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00D6D6D600CECECE00848484009C9C
      9C009C9C9C00181818008C8C8C00ADADAD00FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600D6D6D600CECECE00848484009C9C
      9C009C9C9C00181818008C8C8C00ADADAD0094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0094949400EFEFEF00EFEFEF00E7E7E700848484009C9C
      9C009C9C9C0018181800A5A5A500C6C6C60000000000CE726F00C5897D00E1CE
      B900EFE9CF00F1EDD200EFE8CE00EADFC6009295D1008B8CCA00D8BFAF00D6B8
      A600D0AD9D00BB8B81009E504D006D422F00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00D6D6D600D6D6D600848484009C9C
      9C009C9C9C0018181800848484009C9C9C00FFFFFF00D6D6D600FFFFFF00FFFF
      FF0018181800D6D6D600FFFFFF00D6D6D600D6D6D600D6D6D600848484009C9C
      9C009C9C9C0018181800848484009C9C9C0094949400EFEFEF00181818001818
      180018181800EFEFEF0094949400EFEFEF00EFEFEF00EFEFEF00848484009C9C
      9C009C9C9C001818180094949400ADADAD0000000000CE726F00C5897D00E3D2
      BC00F0EBD000F2F0D400EFE9CF00EADFC700CFC5C2003248E500B5A6B800D6B8
      A600D0AD9D00BC8B81009E504D006D422F00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84009C9C9C009C9C9C0018181800ADADAD00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84009C9C9C009C9C9C0018181800ADADAD0094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF009494940094949400949494008C8C8C008C8C8C008484
      84009C9C9C009C9C9C00181818006363630000000000CE726F00F0C1BC00C589
      7D00EBE1C700EEE6CC00CECCCF001A3BED00CCC2C1001C36ED009F94BF00D5B7
      A500C9A09100AB716B009E504D006D422F00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D6008484
      84009C9C9C00181818001818180084848400FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D6008484
      84009C9C9C0018181800181818008484840094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008484
      84009C9C9C0018181800181818009494940000000000CE726F00F0C1BC00E7D8
      D400C5897D00DCC3B000D9C9BB007B83D2005865DA006A6FCB00C3A7A400C89F
      9300B17968009E504D00000000006D422F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400E7E7E700E7E7E70018181800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400DEDEDE00DEDEDE00181818009494940094949400949494009494
      94009494940094949400949494009494940094949400949494008C8C8C008C8C
      8C0084848400E7E7E700E7E7E7001818180000000000CE726F00F0C1BC00C863
      5C00E2C8C000C5897D00C5988900C69A8900C5978700C2918200C1928600C8A4
      9A009E504D00C8635C00C88A86006D422F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E700E7E7E700181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400DEDEDE00DEDEDE00181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E700E7E7E7001818180000000000CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006090000060
      9000006090000060900000609000006090000060900000609000006090000060
      90000060900000000000000000000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300000FB600B7A29300694731000000000000000000000000000000
      0000A78E7B00856C5900856C5900603030006030300060303000603030006030
      3000603030006030300060303000000000000000000085929900006090000060
      9000006090000060900000609000006090000060900000609000006090000060
      900000609000006090000060900000000000000000000090C80098D8F8000090
      C8000090C8000090C8000090C8000090C8000090C8000090C8000090C8000090
      C8000090C80000609000000000000000000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC1000018C800B7A29300694731000000000000000000A78E7B00A78E
      7B00B7A29300B7A29300B7A29300A78E7B006030300000000000000000000000
      00000000000000000000000000000000000000000000859299008CF1F8000691
      CD000691CD000691CD000691CD000691CD000691CD000691CD000691CD000691
      CD000691CD000691CD000060900000000000000000000090C800D7EFFD007ACE
      F70074CCF6006EC9F5005494A8004040400045879B004EBBF10046B7EF0042B5
      EF000090C80000609000000000000000000000000000C3AE9F00FAF8F6009830
      000098300000F2ECE8009830000098300000EAE0DA0098300000983000000030
      F800002CF0000022DC000018C8000014C00000000000A78E7B00B7A29300B7A2
      9300DBD0C900DBD0C900FCF9F700B7A29300A78E7B0060303000000000000000
      000000000000000000000000000000000000000000008592990092F4F8008CF1
      F80086EEF70080EAF6007AE7F60074E3F5006EE0F50068DDF50061D9F4005AD5
      F30054D1F3000691CD000060900000000000000000000090C800D7EFFD0083D2
      F8007DD0F70077CDF60071CAF5004040400063C5F4005AC1F30052BDF1004AB9
      F0000090C80000609000000000000000000000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7
      D00098300000002CF000B7A293006947310000000000B7A29300DBD0C900F1EC
      E900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A29300A78E7B00603030000000
      000000000000000000000000000000000000000000008592990092F4F80092F4
      F8008CF1F80086EEF70080EAF6007AE7F60074E3F5006EE0F50068DDF50061D9
      F4005AD5F3000691CD000060900000000000000000000090C800D7EFFD0089D5
      F90083D2F8007DD0F70040404000404040004040400063C5F4005AC1F30052BD
      F1000090C80000609000000000000000000000000000C3AE9F00FFFFFF009830
      0000FCFAF900E4CBBF00A2451A0098300000B16440009830000098300000E7DB
      D500E4D7D0000030F800B7A293006947310000000000B7A29300FFFFFF00F8F5
      F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A29300A78E7B006030
      300000000000000000000000000000000000000000008592990092F4F80092F4
      F80092F4F8008CF1F80086EEF70080EAF6007AE7F60074E3F5006EE0F50068DD
      F50061D9F4000691CD000060900000000000000000000090C800D7EFFD008FD8
      FA0089D5F90083D2F80062AABE004040400062AABE006BC8F50063C5F4005AC1
      F3000090C80000609000000000000000000000000000C3AE9F00FFFFFF009830
      0000FEFEFD00B66C4A0098300000EBDAD200E4CEC3009830000098300000EBE2
      DD0098300000E4D7D000B7A29300694731000000000000000000B7A29300FFFF
      FF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A29300A78E
      7B0060303000000000000000000000000000000000008592990092F4F80092F4
      F80092F4F80092F4F8008CF1F80086EEF70080EAF6007AE7F60074E3F5006EE0
      F50068DDF5000691CD000060900000000000000000000090C800D7EFFD0095DB
      FB008FD8FA0089D5F90083D2F8007DD0F70077CDF60071CAF5006BC8F50063C5
      F4000090C80000609000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00BD7A5B0098300000D8B2A100F0E7E1009830000098300000EEE6
      E10098300000E9DED800B7A2930069473100000000000000000000000000B7A2
      9300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A2
      9300A78E7B00603030000000000000000000000000008592990092F4F80092F4
      F80092F4F80092F4F80092F4F8008FF3F80089F0F80080EAF6007AE7F60074E3
      F5006EE0F5000691CD000060900000000000000000000090C80098D8F800D7EF
      FD00D7EFFD00D7EFFD00D7EFFD00D7EFFD00D7EFFD00D7EFFD00D7EFFD00D7EF
      FD0098D8F80000609000000000000000000000000000C3AE9F00FFFFFF009830
      0000FFFFFF00F6ECE800C2846700A85027009B3608009830000098300000F1EA
      E600EEE6E100EBE2DD00B7A29300694731000000000000000000000000000000
      0000B7A29300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFF
      FF00B7A29300A78E7B006947310000000000000000008592990092F4F80092F4
      F80092F4F80092F4F80092F4F80092F4F8008FF3F80089F0F80083ECF7007DE9
      F60077E5F5000691CD00006090000000000000000000000000000090C8000090
      C8000090C8000090C8000090C8000090C8000090C8000090C8000090C8000090
      C8000090C80000000000000000000000000000000000C3AE9F00FFFFFF009830
      0000FFFFFF00FFFFFF00FFFFFF00FEFEFD00EAD5CB00983000009F3F1300F3EE
      EA0098300000EEE6E100B7A29300694731000000000000000000000000000000
      000000000000B7A29300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0
      C900FFFFFF00B7A29300856C590000000000000000008592990092F4F80092F4
      F80092F4F80092F4F80092F4F80092F4F80092F4F8008FF3F80089F0F80083EC
      F7007DE9F60077E5F50000609000000000000000000000000000000000000090
      C800D7EFFD00006090000000000000000000000000000090C80060C8F8000060
      90000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A3471C009830000098300000A8502700DBB9A800F6F2
      EF0098300000F1EAE600B7A29300694731000000000000000000000000000000
      00000000000000000000B7A29300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9
      D300DBD0C900FFFFFF00856C5900000000000000000085929900859299008592
      9900859299008592990085929900859299008592990098300000983000009830
      0000983000008592990085929900000000000000000000000000000000000090
      C800D7EFFD00006090000000000000000000000000000090C80060C8F8000060
      90000000000000000000000000000000000000000000C3AE9F00FFFFFF009830
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A29300694731000000000000000000000000000000
      0000000000000000000000000000B7A29300FFFFFF00FCFAF900F5F1EF00EDE7
      E400FDFBFA00DBD0C900A78E7B0000000000000000008592990094F5F80094F5
      F80094F5F80094F5F80085929900000000000000000098300000E4A582009830
      0000000000000000000000000000000000000000000000000000000000000090
      C800D7EFFD0098D8F80000609000006090000060900060C8F80060C8F8000060
      90000000000000000000000000000000000000000000C3AE9F00FFFFFF009830
      0000FFFFFF009830000098300000FFFFFF009830000098300000FFFFFF009830
      000098300000F7F4F100B7A29300694731000000000000000000000000000000
      000000000000000000000000000000000000B7A29300FFFFFF00FCFAF900FCFB
      FA00DBD0C900A78E7B0000000000000000000000000000000000859299008592
      990085929900859299000000000000000000000000009830000098300000BE71
      3C00000000000000000000000000000000000000000000000000000000000000
      00000090C800D7EFFD00D7EFFD00D7EFFD00D7EFFD0060C8F800006090000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F100694731000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300B7A29300B7A2
      9300B7A293000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098300000000000009830
      0000BE713C0000000000BE713C00983000000000000000000000000000000000
      0000000000000090C8000090C8000090C8000090C8000090C800000000000000
      0000000000000000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000983000009830000098300000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A605D0068303000683030006830300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000694731006947310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C06614008E4019008E4019008E4019008E4019008E4019008E40
      19008E4019008E4019008E4019008E4019000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000906060006830
      300068303000A3565100A95B5500A45B54006830300068303000683030006830
      3000683030006830300068303000683030000000000000000000000000000000
      0000000000000000000069473100F2ECE900F2ECE90069473100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0661400FFFFFF00B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293008E40190000000000C06614008E4019008E40
      19008E4019008E4019008E4019008E4019008E4019008E4019008E4019008E40
      19008E4019008E4019008E4019008E4019000000000090606000A2545000BB65
      5F00BA645E00B6625D00B2605A00A65C550068303000F0919000F0919000F091
      9000F0919000F0919000F0919000683030000000000000000000000000000000
      00000000000069473100F2ECE9009830000098300000F2ECE900694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0661400FFFFFF00FFFFFF00FFFFFF00FAF7F600F5F0ED00EFE8
      E400EBE0DB00E5D8D100B7A293008E40190000000000C0661400F9F5F400B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293008E4019000000000090606000C5696500C368
      6300BF666100BB645F00B7625D00A85D560068303000004B0000004B0000004B
      0000004E0100285C1700F0919000683030000000000000000000000000000000
      000069473100F2ECE90098300000F6865000F57C430098300000F2ECE9006947
      310000000000000000000000000000000000000000000000000000000000C066
      14008E401900C0661400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAF7F600F5F0
      ED00EFE8E400EBE0DB00B7A293008E40190000000000C0661400FCFAFA00F9F5
      F400F5F0EE00F2EBE800EEE6E200ECE2DC00E9DED700E5D9D100E2D4CC00DFD0
      C700DFD0C700DCCBC100B7A293008E4019000000000090606000C96B6700C76A
      6600C1686300B4615C00B05E5900A95D56006830300000510200004B0000004B
      000005650D002C6C2100F0919000683030000000000000000000000000006947
      3100F2ECE90098300000C4937500C4937500C4937500C493750098300000F2EC
      E90069473100000000000000000000000000000000000000000000000000C066
      1400FFFFFF00C0661400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAF7
      F600F5F0ED00EFE8E400B7A293008E40190000000000C0661400FFFFFF00FCFA
      FA00F9F5F400F5F0EE00F2EBE800EEE6E200ECE2DC00E9DED700E5D9D100E2D4
      CC00E2D4CC00DFD0C700B7A293008E4019000000000090606000CC6D6900CB6C
      6800C4706D00DFB4B2009C5F5C00A059530068303000025A060000510200045F
      0A000C801E002F772800F091900068303000000000000000000069473100F2EE
      EA0098300000F79B6C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AA6644009830
      0000F2ECE900694731000000000000000000000000000000000000000000C066
      1400FFFFFF00C0661400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAF7F600F5F0ED00EFE8E4008E40190000000000C0661400FFFFFF00FFFF
      FF00FCFAFA00F9F5F400F5F0EE00F2EBE800EEE6E200ECE2DC00E9DED700E5D9
      D100E5D9D100E2D4CC00B7A293008E4019000000000090606000D06F6B00CE6D
      6A00DFB4B200FDF1F100DFB4B200A35A54006830300004640C00125B07002871
      1400118B260034722400F0919000683030000000000069473100F2ECE9009830
      0000F9B18700F9AC8100F79B6C00FFFFFF00FFFFFF00AA664400F6865000F57C
      430098300000F2ECE900694731000000000000000000C06614008E401900C066
      1400FFFFFF00C06614008E4019008E4019008E4019008E4019008E4019008E40
      19008E4019008E4019008E4019008E40190000000000C0661400FFFFFF00FFFF
      FF00FFFFFF00FCFAFA00F9F5F400F5F0EE00F2EBE800EEE6E200ECE2DC00E9DE
      D700E9DED700E5D9D100B7A293008E4019000000000090606000D5726E00D370
      6C00D0736E00DFB4B200C5716D00AF615B006830300011690F008C812400D3A4
      410035741600D3A44100F09190006830300098300000F9F6F400C8600000FBC3
      9F00FABA9300F9B18700F9AC8100FFFFFF00FFFFFF00AA664400F68D5900F686
      5000F57C430098300000F2ECE9006947310000000000C0661400FFFFFF00C066
      1400FFFFFF00CE630000ED973300ED973300ED973300ED973300F6CA9A00ED97
      3300F6CA9A00ED973300306DF9008E40190000000000C0661400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFDFD00FBF8F700F7F3F100F2EBE800EEE6E200ECE2
      DC00ECE2DC00E9DED700B7A293008E4019000000000090606000DA747100D773
      6F00D3716C00D06F6B00CC6D6900B3635D006830300070802900F8C08000F8C0
      8000F8C08000F8C08000F09190006830300098300000FEFEFE00C8600000FBC3
      9F00FBC39F00FABA9300F9B18700FFFFFF00FFFFFF00AA664400F7926000F68D
      5900F686500098300000F2ECE9006947310000000000C0661400FFFFFF00C066
      1400FFFFFF00FFFFFF00C0661400C0661400C0661400C0661400C0661400C066
      1400C0661400C0661400C06614000000000000000000C0661400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFDFD00FBF8F700F7F3F100F4EEEB00F0E9
      E500F0E9E500EDE4DF00B7A293008E4019000000000090606000DD767400DB75
      7200D8736F00D4716D00D06F6B00B4645D0068303000F8C08000F8C08000F8C0
      8000F8C08000F8C08000F0919000683030000000000098300000FDFAF800C860
      0000FBC39F00FBC39F00FFFFFF00FFFFFF00FFFFFF00AA664400F79B6C00F792
      600098300000F2ECE900694731000000000000000000C0661400FFFFFF00C066
      14008E4019008E4019008E4019008E4019008E4019008E4019008E4019008E40
      19008E4019008E401900000000000000000000000000C0661400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFD00FBF8F700F7F3F100F4EE
      EB00F4EEEB00F0E9E500B7A293008E4019000000000090606000E3787600DF76
      7400DC757200D8736F00D4716D00B7655E0068303000F8C08000F8C08000F8C0
      8000B1B1A20029A5F800F091900068303000000000000000000098300000FEFE
      FE00C8600000FBC39F00FBC39F00C4937500C4937500F9AC8100F79B6C009830
      0000F2ECE90069473100000000000000000000000000C0661400FFFFFF00CE63
      0000ED973300ED973300ED973300ED973300F6CA9A00ED973300F6CA9A00ED97
      3300306DF9008E401900000000000000000000000000C0661400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFD00FBF8F700F7F3
      F100F7F3F100F4EEEB00B7A293008E4019000000000090606000E67A7900E479
      7700E0777500DD767300D9747100B966600068303000F8C08000F8C08000B1B1
      A20022B8F70029A5F800F0919000683030000000000000000000000000009830
      0000FFFFFF00C8600000FBC39F00FFFFFF00FFFFFF00AA66440098300000F2EC
      E9006947310000000000000000000000000000000000C0661400FFFFFF00FFFF
      FF00C0661400C0661400C0661400C0661400C0661400C0661400C0661400C066
      1400C06614000000000000000000000000000030F8009AEBF9000030F8009AEB
      F9000030F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFD00FBF8
      F700FBF8F700F7F3F100F4EEEB008E4019000000000090606000E0787600E479
      7800E4797700E0777500DD757300BB67610068303000F8C08000B1B1A2001CC4
      F8001CC4F80022B8F700F0919000683030000000000000000000000000000000
      000098300000FEFEFE00C8600000FFFFFF00FFFFFF0098300000F2ECE9006947
      31000000000000000000000000000000000000000000C06614008E4019008E40
      19008E4019008E4019008E4019008E4019008E4019008E4019008E4019008E40
      1900000000000000000000000000000000009AEBF9004878F80000F8F8004878
      F8009AEBF9008E4019008E4019008E4019008E4019008E4019008E4019008E40
      19008E4019008E4019008E4019008E4019000000000000000000B07068009060
      6000C76D6A00C76D6A00D4727000B96661006830300090606000906060009060
      6000906060009060600090606000906060000000000000000000000000000000
      00000000000098300000FDFAF800C8600000C8600000F2EDEA00694731000000
      00000000000000000000000000000000000000000000CE630000ED973300ED97
      3300ED973300ED973300F6CA9A00ED973300F6CA9A00ED973300306DF9008E40
      1900000000000000000000000000000000000030F80000F8F800FBFEFE0000F8
      F8000030F800ED973300ED973300ED973300ED973300F6CA9A00ED973300F6CA
      9A00ED973300306DF900ED973300C06614000000000000000000000000000000
      0000B070680090606000C76D6A00C76D6A006830300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000FEFEFE00F9F6F40069473100000000000000
      0000000000000000000000000000000000000000000000000000C0661400C066
      1400C0661400C0661400C0661400C0661400C0661400C0661400C06614000000
      0000000000000000000000000000000000009AEBF9004878F80000F8F8004878
      F8009AEBF900C0661400C0661400C0661400C0661400C0661400C0661400C066
      1400C0661400C0661400C0661400000000000000000000000000000000000000
      00000000000000000000B0706800906060009060600000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000983000009830000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000030F8009AEBF9000030F8009AEB
      F9000030F8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7A293006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7A29300EEE6
      E100B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A293006947310000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000008592990000609000006090000060
      9000006090000060900000609000006090000060900000609000006090000060
      9000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000B7A29300F1EA
      E600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1C900DDCDC400DBC9
      BF00DBC9BF00B7A293006947310000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000859299008592990026A1D1000691
      CD000691CD000691CD000691CD000691CD000691CD000691CD000691CD000060
      9000000000000000000000000000000000000000000080808000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000B7A29300F4EE
      EB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1C900DDCD
      C400DBC9BF00B7A293006947310000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00C0C0C0000000000000000000859299008592990078BFD10061DA
      F7005AD5F50054D1F3004CCBF00044C7EE003DC2ED0037BEEB0030B9E9000691
      CD00006090000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000B7A29300F6F2
      F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1
      C900DDCDC400B7A293006947310000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00C0C0C00000000000000000008592990064DBF800859299006ED4
      ED0063DAF7005DD7F60055D1F3004DCDF10046C8EF003FC4ED0037BFEB0029B5
      E700006090000000000000000000000000000000000080808000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000B7A29300F9F6
      F500F6F2F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9D300E3D5
      CE00E0D1C900B7A293006947310000000000000000000000000080808000FFFF
      FF0000FFFF00C0C0C00080000000FF000000800000008000000000000000C0C0
      C00000FFFF00C0C0C0000000000000000000859299007CE8F8008592990074C2
      D50067DDF90065DCF8005DD6F60055D1F3004ECDF10046C8EF003FC4ED0037BF
      EB000691CD000060900000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000B7A29300FCFB
      FA00F9F6F500F6F2F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9
      D300E3D5CE00B7A293006947310000000000000000000000000080808000FFFF
      FF00FFFFFF0080808000FF000000FF00000000800000FF000000800000008000
      0000FFFFFF00C0C0C00000000000000000008592990086EEF80064DBF8008592
      99006FD4ED0067DDF90064DBF8005DD6F60055D1F3004DCDF10046C8EF003FC4
      ED0030B6E5000060900000000000000000000000000080808000FFFFFF008080
      800080808000FFFFFF000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000B7A29300FFFF
      FF00FCFBFA00F9F6F500F6F2F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DE
      D800E6D9D300B7A293006947310000000000000000000000000080808000FFFF
      FF0000FFFF0080800000C0C0C000808080000080000080800000FF0000008000
      000000FFFF00C0C0C00000000000000000008592990090F4F80086EEF8008592
      990073C4D80067DCF80067DDF90065DCF8005ED7F60056D2F4004ECDF10047C9
      EF003AC1EB000691CD0000609000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FDFDFD00FBF9F800F8F4F300F5F0EE00F2ECE900EFE8E400EDE4
      DF00EAE0DA00B7A293006947310000000000000000000000000080808000FFFF
      FF00FFFFFF0080800000FFFFFF00C0C0C0000080000080000000FF0000008000
      0000FFFFFF00C0C0C00000000000000000008592990094F5F80090F4F80064DB
      F800859299008592990085929900859299008592990085929900859299008592
      9900859299008592990085929900000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00808080008000000080000000FFFF
      FF000000800000008000C0C0C000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300F5F0EE00F2ECE900EFE8
      E400EDE4DF00B7A293006947310000000000000000000000000080808000FFFF
      FF0000FFFF0080800000C0C0C00080800000FF00000080800000008000008080
      800000FFFF00C0C0C00000000000000000008592990094F5F80094F5F80090F4
      F80064DBF80064DBF80064DBF80064DBF80064DBF80064DBF80064DBF80064DB
      F800859299000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000800000008000C0C0C000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300F5F0EE00F2EC
      E900B7A29300B7A293006947310000000000000000000000000080808000FFFF
      FF00FFFFFF00C0C0C0008080000080808000808000000080000080800000C0C0
      C000FFFFFF00C0C0C00000000000000000008592990094F5F80094F5F80094F5
      F80090F4F80064DBF80085929900859299008592990085929900859299008592
      9900983000009830000098300000983000000000000000000000000000000000
      000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300B7A2
      930069473100694731006947310000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00C0C0C000808000008080000080800000C0C0C000FFFF
      FF0000FFFF00C0C0C00000000000000000008592990094F5F80094F5F80094F5
      F80094F5F8008592990000000000000000000000000000000000000000000000
      00000000000098300000E4A58200983000000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800B7A2
      9300F3EBE600DBC9BF006947310000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000085929900859299008592
      9900859299000000000000000000000000000000000000000000000000000000
      000000000000BE713C0098300000983000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00B7A2
      9300DBC9BF00694731000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098300000BE713C000000
      0000BE713C009830000000000000983000000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7A2
      930069473100000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000983000009830
      0000983000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000B7A29300B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300694731000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A29300694731000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00983000009830000098300000EAE0DA00E7DBD500983000009830
      000098300000DCCBC100B7A29300694731000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000C3AE9F00FDFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCFC600B7A293006947310000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F5F0ED0098300000EFE8E300EDE4DF00EAE0DA00E7DBD5009830
      0000E2D3CB00DFCFC600B7A29300694731000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400F6F2EF00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00209E20000090
      0000209D1F00F9F6F4005DB55A00983000009830000098300000983000009830
      0000E4D7D000E2D3CB00B7A29300694731008080000080800000808000008080
      0000808000008080000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD000000000000000000000000000000000000000000000000000000
      000000000000E4D7D000B7A293006947310000000000C3AE9F00D4ECD4000893
      0800EFF8EE00FCFAF900F9F6F4001B9B1A0098300000B2D2AA00EEE6E1009830
      0000E7DBD500E4D7D000B7A293006947310080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF0070C1
      7000A0D6A000FEFEFD00C2E1BF000090000042AA400098300000F1EAE6009830
      0000EBE2DD00E9DED800B7A293006947310080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000FFFFFF008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000C3AE9F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF00D8EE
      D80000900000009000000090000000900000A0D29D00F6F2EF00983000009830
      0000EEE6E100EBE2DD00B7A293006947310080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080800000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF0040AC4000D0EBD000109710000C950C00F1F5EE00F9F6F400F6F2EF009830
      0000F1EAE600EEE6E100B7A29300694731008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00ACDBAC0030A530000090000060BA6000FEFEFD00FCFAF900F9F6F400F6F2
      EF00F3EEEA00F1EAE600B7A293006947310080800000FFFFFF00808000008080
      0000808000008080000080800000808000008080000080800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FCFEFC00189A180000900000C0E4C000FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A29300694731008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF0078C478001C9C1C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A29300694731000000000000000000000000000000
      00000000000080800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F1006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F100694731000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000FFFFFF008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000000000000000
      00000000000080800000FFFFFF00808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      31006947310069473100694731000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300694731000000000098300000603030000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A2930069473100C8600000F8980000D08000006030
      30000000000000000000000000009176630091766300917663008A6E5A007D5E
      4A006947310000000000000000000000000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100983000009830000098300000983000009830000098300000983000009830
      000098300000DCCBC100B7A2930069473100BE713C00F8C89000F89800009830
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7
      D000E2D3CB00DFCFC600B7A293006947310000000000BE713C00C86000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FDFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCFC600B7A293006947310000000000C3AE9F00FDFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCFC600B7A293006947310000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900ECDBD300B7704F009E3C0F00983000009D3B0E00B7725200E0CC
      C200E4D7D000E2D3CB00B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400F6F2EF00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400F6F2EF00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD00A850270098300000C7917800EFE6E000EDE2DC00BF836600AE5F
      3B00E7DBD500E4D7D000B7A29300694731000000000098300000603030000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000EBE2
      DD00E7DBD500E4D7D000B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD00000000000000000000000000000000000000000000000000EBE2
      DD00E7DBD500E4D7D000B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000F6F1ED00F6F2EF00F3EEEA00ECDFD8009830
      0000EBE2DD00E9DED800B7A2930069473100C8600000F8980000D08000006030
      30000000000000000000000000009176630091766300917663008A6E5A007D5E
      4A006947310000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FCFAF900F9F6F400F6F2EF00F3EEEA009830
      0000EEE6E100EBE2DD00B7A2930069473100BE713C00F8C89000F89800009830
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FEFEFD00FCFAF900F9F6F400F6F2EF009830
      0000F1EAE600EEE6E100B7A293006947310000000000BE713C00C86000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FFFFFF00FEFEFD00FCFAF900F9F6F4009830
      0000F3EEEA00F1EAE600B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000F6F2
      EF00F3EEEA00F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000F6F2
      EF00F3EEEA00F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00F9F3F0009830000098300000F7F0EC00FFFFFF00FEFEFD00F6EEEA009830
      0000EFE4DD00F3EEEA00B7A29300694731000000000098300000603030000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF0098300000983000009830000098300000FFFFFF00FFFFFF00983000009830
      000098300000F7F4F100B7A2930069473100C8600000F8980000D08000006030
      30000000000000000000000000009176630091766300917663008A6E5A007D5E
      4A006947310000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F10069473100BE713C00F8C89000F89800009830
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F1006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F100694731000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F000000000000000000BE713C00C86000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      310069473100694731006947310000000000AB7E6200A4775A00955F3F008E57
      39007E4020007E402000000000000000000000000000AB7E6200A4775A00955F
      3F008E5739007E4020007E402000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006E0000006E00000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A2930069473100AB7E6200FCFAFA00E3C8B800CDA3
      8C00AC7655007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00AC7655007E402000000000000000000000000000000000000000
      0000983000000000000000000000000000000000000000000000000000000000
      0000006E00000000000000000000006E000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A2930069473100AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E402000000000000000000000000000983000009830
      0000983000009830000000000000000000000000000000000000000000000000
      0000006E000000000000000000000000000000000000C3AE9F00FAF8F600F7F4
      F100983000009830000098300000983000009830000099330300B56F4E00DBC4
      B900DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100E1C7BA0098300000983000009830000098300000DBC1B400E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A2930069473100AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E402000000000000000000098300000D76733000000
      0000983000000000000000000000000000000000000000000000000000000000
      0000006E00000000000000000000006E000000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F1009830000098300000EADDD600EDE4DF00CFA79300983000009A35
      0700E2D3CB00DFCFC600B7A293006947310000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F0E5DF00AA562F0098300000DBBDAF00EAE0DA00E7DBD500E4D7
      D000E2D3CB00DFCFC600B7A2930069473100AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E402000000000000000000098300000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006E0000006E00000000000000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF9009830000098300000F2ECE800EFE8E300EDE4DF00983000009830
      0000E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400C3886D0098300000CDA18B00EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A2930069473100AB7E62009F6B4E009F6B4E009153
      3100915331007E4020007E4020006F432400AB7E62009F6B4E009F6B4E009153
      3100915331007E4020007E402000000000000000000098300000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD009830000098300000F6F2EF00F3EEEA00DAB9AA0098300000B165
      4200E7DBD500E4D7D000B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD00FCFAF900D6AF9D0098300000BC7B5C00F1EAE600EEE6E100EBE2
      DD00E7DBD500E4D7D000B7A2930069473100DDC5A900AB7E6200ECD8CD00ECD8
      CD00CAA08900AC7655007E4020009F6B4E00AB7E6200ECD8CD00ECD8CD00CAA0
      8900AC7655007E40200090606000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000983000009830000098300000BB795A00E8D8
      D000EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00EAD5CB0098300000A8512900F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A293006947310000000000AB7E6200FFFFFF00F1E8
      E500EED2C100AC7655007E402000C8989000AB7E6200FFFFFF00F1E8E500EED2
      C100AC7655009060600000000000000000000000000000000000000000000000
      0000000000000000000044444400646464006464640064646400000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FCFAF900EFE1DA00BE7F61009B360700CD9F
      8900EEE6E100EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBF8F6009830000098300000F2EAE500F3EEEA00F1EA
      E600EEE6E100EBE2DD00B7A29300694731000000000000000000AB7E62009F6B
      4E00955F3F007E4020007E4020009F6B4E00AB7E62009F6B4E00955F3F007E40
      20007E4020000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000646464000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FEFEFD00FCFAF900F8F4F100983000009B36
      0700F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA542C0098300000E0C2B400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A29300694731000000000000000000AB7E6200FCFA
      FA00DEC3B100AC7655007E40200000000000AB7E6200FCFAFA00DEC3B100AC76
      55007E4020000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000646464000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FFFFFF00FEFEFD00DBB8A800983000009B36
      0700F3EEEA00F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC98800098300000BE7C5E00F8F4F100F6F2
      EF00F3EEEA00F1EAE600B7A29300694731000000000000000000AB7E62009F6B
      4E00955F3F007E4020009F6B4E0000000000AB7E62009F6B4E00955F3F007E40
      20009F6B4E000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000646464000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF0098300000983000009830000098300000983000009A330400BE7C5E00F0E4
      DE00F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D9B2A000983000009830000098300000A5491F00F9F6
      F400F6F2EF00F3EEEA00B7A2930069473100000000000000000000000000AB7E
      6200FCFAFA007E402000000000000000000000000000AB7E6200FCFAFA007E40
      2000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400646464006464640064646400000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A2930069473100000000000000000000000000AB7E
      6200AB7E62009F6B4E00000000000000000000000000AB7E6200AB7E62009F6B
      4E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F1006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F100694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004444440044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CA53130098300000983000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B009144130091441300914413009144
      1300914413009144130091441300914413000000000000000000000000000000
      00000000000000000000D1ACA700694731006947310069473100694731006947
      3100694731006947310069473100694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EB814100CA531300CA531300CA5313009830000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00F7E6DA00F5E0D100F3DAC800F1D3
      BE00EFCDB500EDC7AC00EDC7AC00914413000000000000000000000000000000
      00000000000000000000D1ACA700EFE7E300C2AC9D00C2AC9D00C2AC9D00C2AC
      9D00C2AC9D00C2AC9D00C2AC9D00694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EB814100CA531300EB814100F0A17600983000000000000000000000CA53
      1300CA531300A34B110000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00F9EDE500F7E6DA00F5E0D100F3DA
      C800F2D6C300F0D0BA00EECAB000914413000000000000436E0000436E000043
      6E0000436E0000436E00D1ACA700F4EEEB00EFE7E300EBE1DC00E7DBD500E5D8
      D100E1D2CA00DDCCC200C2AC9D00694731000000000080808000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EB814100CA53130000000000F0A176009830000000000000CA531300CA53
      1300A34B1100A34B1100A34B1100000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00FCF5F000D3835700D3835700D383
      5700D3835700D3835700F0D0BA00914413000090C8007AD8EF000290C9000290
      C9000290C9000290C900D1ACA700F9F5F300D8984000D8984000D8984000D898
      4000D8984000E1D2CA00C2AC9D00694731000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EB814100F0A17600A34B1100A34B11009830000000000000CA531300EB81
      4100F0A17600A34B110098300000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00FFFFFF00FDF8F500FAF1EA00F8EA
      DF00F6E3D500F4DDCC00F2D6C300914413000090C80083DEF2007AD8EF0072D3
      ED0069CDEA0060C9E700D1ACA700FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4
      DF00E9DED800E5D8D100C2AC9D00694731000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EB814100F0A17600A34B11009830000098300000CA5313000000
      0000EB814100A34B11009830000000000000CEB8AA007A5A46007A5A46007A5A
      46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D3835700D3835700D383
      5700D3835700D3835700F4DDCC00914413000090C8008CE3F50083DEF2007AD8
      EF0072D3ED0069CDEA00D1ACA700FFFFFF00D8984000D8984000D8984000D898
      4000D8984000E9DED800C2AC9D0069473100000000008080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EB8141009E410D00A14E220098300000CA531300A34B
      110098300000983000000000000000000000CEB8AA00EFE7E300EBE1DC00E7DB
      D500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFFFF00FFFFFF00FDF8
      F500FAF1EA00F8EADF00F6E3D500914413000090C80095E8F8008CE3F50083DE
      F2007AD8EF0072D3ED00D1ACA700FFFFFF00FFFFFF00FFFFFF00FBF8F700F6F1
      EF00F1EAE700EDE4DF00C2AC9D0069473100000000000000000000000000C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000072625500B7A29300A55E3900983000009830
      0000CA531300000000000000000000000000CEB8AA00F4EEEB00EFE7E300EBE1
      DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D3835700D3835700FFFF
      FF00E0A98B00AB542800AB542800AB5428000090C80095E8F80095E8F8008CE3
      F50083DEF2007AD8EF00D1ACA700FFFFFF00D8984000D8984000D8984000FBF8
      F700F6F1EF00CEA8A70069473100694731000000000000000000000000000000
      0000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000072625500D2C5BC00C8B3A40072625500000000000000
      000000000000000000000000000000000000CEB8AA00F9F5F300DFA98300DFA9
      8300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E0A98B00F3EBE600AB542800000000000090C80095E8F80095E8F80095E8
      F8008CE3F50083DEF200D1ACA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBF8F700CEA8A700FFFFFF00694731000000000000000000000000000000
      000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      0000808080008080800080808000000000000000000000000000000000000000
      00000000000072625500DBD0C90072625500DBC9BF0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00FBF8F700F6F1
      EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E8A98B00C56A310000000000000000000090C80095E8F80095E8F80095E8
      F80095E8F8008CE3F500D1ACA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEA8A70069473100000000000000000000000000000000000000
      00000000000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00000000008080800000000000000000000000000000000000000000000000
      000072625500EDE4DF0072625500AB938100E8DBD60072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00DFA98300DFA9
      8300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A98B00E0A98B00E0A9
      8B00E0A98B000000000000000000000000000090C80095E8F80095E8F80095E8
      F80095E8F80095E8F800D1ACA700D1ACA700D1ACA700D1ACA700D1ACA700D1AC
      A700D1ACA700D1ACA70000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00808080000000000000000000000000000000000000000000AB93
      8100FFFFFF007262550000000000AB938100EDE4DF0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FBF8F700F6F1EF00F1EAE700EDE4DF006947310000000000000000000000
      0000000000000000000000000000000000000090C80095E8F80095E8F8000060
      980000436E0000436E0000436E0000436E0000436E0000436E0000436E000290
      C90000436E000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000C0C0C0000000000000000000000000000000000000000000AB93
      8100726255000000000000000000AB938100F4EEEC0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00DFA98300DFA9
      8300FFFFFF00CEB8AA0069473100694731006947310000000000000000000000
      0000000000000000000000000000000000000090C80095E8F80095E8F8000060
      980095E8F8006ED0EC0000436E006ED0EC004EBDE3000B95CC0000436E000290
      C90000436E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      000000000000808080008080800000000000000000000000000000000000AB93
      8100000000000000000000000000AB938100FFFFFF0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEB8AA00F3EBE600694731000000000000000000000000000000
      0000000000000000000000000000000000000090C80095E8F80095E8F80095E8
      F8000060980095E8F80000436E0000436E006ED0EC0000436E0065CBE90065CB
      E90000436E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AB9381007262550000000000000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEB8AA0069473100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000090C8000090C8000090
      C8000090C8000060980095E8F80095E8F80000436E000090C8000090C8000090
      C800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AB9381000000000000000000000000000000
      000000000000000000000000000000000000CEB8AA00CEB8AA00CEB8AA00CEB8
      AA00CEB8AA00CEB8AA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000060980000609800006098000060980000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D422F006D42
      2F006D422F006D422F006D422F006D422F006D422F006D422F006D422F006D42
      2F006D422F006D422F006D422F006D422F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE726F00D1979200CB8E
      8A00715A4800C0B2AB00C4BCB800CAC1BC00CAC1BC00CAC1BC00CAC1BC008C76
      67009443400094434000944340006D422F000000000086624D0086624D008662
      4D0086624D0086624D0086624D0086624D0086624D0086624D0086624D008662
      4D00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7552A00C8420000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000CE726F00D79F9B00D197
      9200715A48002E1F18005F504600FFFFFF00FFFFFF00FFFFFF00F0E4DE008C76
      67009747440094434000944340006D422F00A08C7D00FFFFFF00B9A59600B9A5
      9600B9A59600B9A59600B9A59600B9A59600B9A59600B9A59600B9A59600B9A5
      960086624D000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF5C3200D7663200C84200000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000CE726F00DDA8A300D79F
      9B00715A48000000000036241B00FFFFFF00F7F1EE00F0E4DE00E1CABD008C76
      67009E504D0097474400944340006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FCF7F300F9EEE600F6E6D900F4DECD00F2D6C200203D5C00EDC8AC00B9A5
      960086624D0086624D0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF5C3200D7673300C842
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000CE726F00E3B0AB00DDA8
      A300715A4800715A4800715A4800715A4800715A4800715A4800715A4800715A
      4800A45956009E504D00974744006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCF7F300F9EEE600F6E6D900F4DECD0040AD4A00EFCFB700B9A5
      9600A08C7D00A77D620086624D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AF5C3200D766
      3200C84200000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000CE726F00EDBDB800E7B5
      B000E0ACA700DAA49F00D49B9700CB8E8A00C5868200BF7E7900B9757100B26B
      6800AB625F00A45956009E504D006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FCF7F300F9EEE600F6E6D900F4DECD00F2D6C200EFCF
      B700A08C7D00B991760086624D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DC744300EE8A
      5800CE5F2D00CE5F2D0000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000CE726F00F0C1BC00EDBD
      B800E7B5B000E0ACA700DAA49F00D49B9700CE938E00C88A8600C2827E00BC79
      7500B26B6800AB625F00A45956006D422F00A08C7D00A08C7D00A08C7D00A08C
      7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D0086624D008662
      4D00A08C7D00C59E840086624D00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF5C
      3200EE8A5800C842000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000CE726F00F0C1BC00F0C1
      BC00C8635C00C8635C00C8635C00C8635C00C8635C00C8635C00C8635C00C863
      5C00C8635C00B5706C00AE6763006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF7F300F9EEE600F6E6D900F4DE
      CD00A08C7D00D4AF950086624D000000000000000000C56A3100983000009830
      000098300000983000009830000098300000000000000000000000000000AF5C
      3200EE8A5800DC744300D1704300000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000CE726F00F0C1BC00C863
      5C00FAF5F300F6EEEA00F2E7E200EEE2DA00EBDCD300E7D6CB00E4D0C400E1CA
      BD00E1CABD00C8635C00B5706C006D422F0000000000A08C7D00A08C7D00A08C
      7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C
      7D00DAB69C009482740086624D000000000000000000C56A3100EE8A5800EE8A
      5800EE8A5800EE8A58009830000000000000000000000000000000000000AF5C
      3200EE8A5800DC744300C8420000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000000000000000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4DE00ECDFD600E9D9CF00E6D3
      C800E2CDC000C8635C00BC7975006D422F0000000000D0A8A800D0A8A800FFFF
      FF00FFFFFF00FDFCFB00FAF8F600F7F4F100F5F1EE00F3EEEA00F1EAE6008662
      4D00A8918100DAB69C0086624D000000000000000000C56A3100EE8A5800E68F
      6300E58B5E00E28556009830000000000000000000000000000000000000AF5C
      3200EE8A5800DC744300C842000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000008000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4DE00ECDFD600E9D9
      CF00E6D3C800C8635C00C2827E006D422F00000000000000000000000000D0A8
      A800FFFFFF00D2B9AB00D2B9AB00D2B9AB00D2B9AB00D2B9AB00F3EEEA008662
      4D0086624D0086624D0086624D000000000000000000C56A3100EE8A5800F6B1
      9000E68F6300E58B5E00D170430098300000000000000000000098300000F6B1
      9000EE8A5800DC744300CE5F2D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4DE00ECDF
      D600E9D9CF00C8635C00C88A86006D422F00000000000000000000000000D0A8
      A800FFFFFF00FFFFFF00FFFFFF00FDFCFB00FAF8F600F7F4F100F5F1EE00F3EE
      EA0086624D0000000000000000000000000000000000C56A3100F6B19000C56A
      3100F6B19000E68F6400E58C5F00D27044009830000098300000F6B19000EE8A
      5800EE8A5800DC744300D1704300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000000000000800000000000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4
      DE00ECDFD600C8635C00D19792006D422F000000000000000000000000000000
      0000D0A8A800FFFFFF00D2B9AB00D2B9AB00D2B9AB00D2B9AB00D2B9AB00F5F1
      EE0086624D0086624D00000000000000000000000000C56A3100C56A31000000
      0000C56A3100F6B19000E6906400E58C5F00E3875A00E1825400E1805100EE8A
      5800DC744300CE5F2D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000080000000000000000000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EA
      E600F0E4DE00C8635C00000000006D422F000000000000000000000000000000
      000000000000D0A8A800FFFFFF00FFFFFF00FFFFFF00FDFCFB00FAF8F600F7F4
      F100F5F1EE0086624D00000000000000000000000000C56A3100000000000000
      000000000000C56A3100F6B19000F6B19000F6B19000F6B19000EE8A5800CE5F
      2D00D17043000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000080000000800000000000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1
      EE00F4EAE600C8635C00C88A86006D422F000000000000000000000000000000
      000000000000D0A8A800D0A8A800D0A8A800D0A8A800D0A8A800D0A8A800D0A8
      A800D0A8A800D0A8A80000000000000000000000000000000000000000000000
      00000000000000000000F56F2D00C56A3100C56A3100C56A3100F56F2D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000800080008000800080808000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000000000FFFFFF0000000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000000000000000000008080
      800080808000FF000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C0C0C000808080000000000000000000000000000000
      0000000000008000800080008000FFFFFF00FFFFFF00C0C0C000808080000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000FFFFFF0000FFFF00000000000000000000000000FF000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00080808000000000000000000080808000FF00
      0000FF000000FF000000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000000000000000000008000
      800080008000FFFFFF00FFFFFF000000000000000000C0C0C000C0C0C0008080
      80000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF0000FFFF00FFFFFF000000000000000000FF000000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0000FFFF0080808000808080008080
      8000C0C0C000FFFFFF00C0C0C00080808000808080008000800080008000FFFF
      FF00FFFFFF000000000000000000800080008000800000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000FFFF000000000080808000FF000000808080008080
      8000FF000000FF000000FF000000FF00000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0080808000FF000000FF000000FF00
      000080808000FFFFFF00C0C0C000808080008080800080008000FFFFFF000000
      000000000000800080008000800080008000800080008000800000000000C0C0
      C000C0C0C00080808000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000808080008080800080808000FF00
      0000FF000000C0C0C000C0C0C00080808000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0080808000C0C0C00080808000FF00
      000080808000FFFFFF00C0C0C000808080008080800000000000000000008000
      800080008000800080000080800000FFFF008000800080008000800080000000
      0000C0C0C000C0C0C00080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000080808000C0C0C00080808000FF00
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000FF00
      00008080800080808000C0C0C000FFFFFF0080808000FFFFFF00C0C0C0008080
      800080808000FFFFFF00C0C0C000808080008080800080008000800080008000
      8000800080008000800080008000008080008000800080008000800080008000
      800000000000C0C0C000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080800000FFFF00FF00
      0000FF000000FF000000FF000000FF000000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF0000008080
      80008080800080808000C0C0C000FFFFFF0000FFFF0080808000808080008080
      8000C0C0C000FFFFFF00C0C0C000808080000000000080008000FFFFFF008000
      80008000800080008000800080008000800000FFFF0000FFFF00800080008000
      80008000800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000000000008080800000FF
      FF00FF000000FFFFFF00FFFFFF0080808000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF0000008080
      80008080800080808000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0080808000808080008080800080808000000000000000000080008000FFFF
      FF0080008000800080008000800080008000800080000080800000FFFF0000FF
      FF00800080008000800000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FF00
      0000FF000000FFFFFF0000000000000000000000000000000000000000008080
      800000FFFF00FF000000FF000000FF00000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000C0C0
      C0008080800080808000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000000000008000
      8000FFFFFF00800080008000800080008000008080008000800000FFFF0000FF
      FF0080008000800080008000800000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF0000000000000000000000000000000000000000000000C0C0
      C000FF000000FF000000FF00000080808000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800000000000C0C0C000FF000000FF00
      0000FFFFFF00C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000080008000FFFFFF00800080008000800000FFFF0000FFFF0000FFFF008000
      8000800080008000800000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF000000FF00000000000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF008080800080808000808080008080800000000000C0C0C000FF000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      00000000000080008000FFFFFF00800080008000800080008000800080008000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FF000000FF000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000C0C0C000FF00
      0000FF000000C0C0C000FFFFFF00C0C0C0008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000080008000FFFFFF008000800080008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FF000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000C0C0C0000000000000000000000000000000000000000000C0C0
      C000C0C0C000FF000000FF000000FFFFFF00C0C0C00080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF00FEFFFEFF00000000FE7FFE7F00000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      FFF0FFF000000000FFF9FFF900000000C000FEFFFEFFFEFF8000FE7FFE7FFE7F
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000FFF0FFF0FFF08000FFF9FFF9FFF9FFFFC001FFFFFFFFC0078000F0018001
      80038000C07F800180038000803F800180038000801F800180038000800F8001
      80038000C007800180038000E003800180038000F0018001C0078000F8018001
      E38F8000FC018001E38F8000FE01818FE00F8000FF03C38FF01F8000FF87FFA4
      F83FC001FFFFFFF1FFFFFFFFFFFFFFFFF87FFE7FF800FFFFC000FC3FF8008000
      8000F81FF80080008000F00FE00080008000E007E00080008000C003E0008000
      8000800180008000800000008000800080000000800180008000800180038000
      8000C003800380008000E007800700008000F00F800F0000C000F81F800F0000
      F07FFC3FC01F0001FC7FFE7FFFFF07FFFFFFFFFFC001C001FFFF803FC001C001
      000F803FC001C001000F803FC001C00100078000C001C00100078000C001C001
      00038000C001C00100038000C001C00100018000C001C00100018000C001C001
      00078000C001C0010000F000C001C00103F8F801C001C00187F8FC03C003C003
      FF92FE07C007C007FFC7FF0FC00FC00FC001C001FFFFFFFF80008000FC00FFFF
      80008000FC00800380008000FC00800380008000FC0080038000800000008003
      8000800000008003800080000000800380008000003F80038000800000018003
      8000800000018003800080000001800380008000F801800380008000F8018003
      C001C001F8018003FFFFFFFFF801FFFFC001FFFFC001C00180009C0380008000
      80000C038000800080000C038000800080009FFF800080008000FFFF80008000
      80009C038000800080000C038000800080000C038000800080009FFF80008000
      8000FFFF8000800080009C038000800080000C038000800080000C0380008000
      C0019FFFC001C001FFFFFFFFFFFFFFFFFFFFFFFFC001C0010381FE0980008000
      0381F6D6800080000381C31780008000038196D6800080000381BF1980008000
      0001BFFF800080000001FFFF800080008003803F80008000C007B5DF80008000
      C107C5DF80008000C107B5DF80008000E38FC43F80008000E38FFDFF80008000
      FFFFFDFFC001C001FFFFF9FFFFFFFFFFF8FFFE00FC00FFFFF07FFE00FC00FFFF
      F063FE008000807FF241FE000000803FF041FE000000801FF81100000000800F
      FC0300000000C007FE0700000000E003FC3F00010000F001F83F00030001F801
      F03F00070003FC01E23F007F0007FE01E63F007F0007FF01EE3F00FF0007FFFF
      FE7F01FF800FFFFFFEFF03FFF87FFFFFFFFFC000FFFFFFFF80038000800FFF3F
      800380000007FF1F800380000003FF8F800380000001FFC7800380000001FFC3
      800380000001FFE380038000000180E180038000800181E180038000800181E1
      C1FE8000E00180C1E3FE8000E0078001FFF58000F0039003FFF38000F803B807
      FFF18000F803FC1FFFFF8000FFFFFFFFFFFF8001E000FC00FE3F0000E000F800
      F81F0000E000E000E00F0000C000C00080070000800080000003000000008000
      00010000000000000000000000000000000100008000000080010000C0000000
      C0018001E0000001E000C003E0008003F000E001E0008003F803F00CE001C007
      FC0FF81EE003E00FFE3FFC3FE007F83F00000000000000000000000000000000
      000000000000}
  end
  object ilHotImages: TImageList
    Left = 328
    Top = 152
    Bitmap = {
      494C01012A002C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000311000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A3118000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000311000003110000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A3118004A31180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003110000031100000311000003110
      0000311000003110000031100000311000003110000031100000311000003110
      00003110000031100000311000003110000000000000EFBD94009C6339009C63
      39009C6339009C6339009C6339004A3118004A3118004A3118007B4A31008452
      3100945A39009C6339009C6339009C6339000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7CEC6003110000042FFFF0042FFFF0031100000A58C
      7B00C6AD9C00DEC6BD00E7D6C600E7D6CE00EFBD9400E7AD8400E7AD8400E7AD
      8400E7AD8400E7AD8400DEAD84004A3118005AEFFF005AEFFF004A311800AD7B
      6300C6947300D6A57B00DEAD8400E7AD84000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00C69C840031100000E7D6
      CE00E7D6CE00E7D6CE009C7B6B00A5846B0042FFFF0042FFFF00311000006339
      2900634229006B4229006B4A31006B4A3100E7B58C00FFFFFF00FFFFFF00E7B5
      8C00E7B58C007B0000007B000000A58C7B005AEFFF005AEFFF004A3118006B10
      0800731008007B0800007B000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00DEC6BD00C69C8C00E7D6
      CE00E7D6CE00A58C7B00BDA58C00BDA59400A5846B0042FFFF0042FFFF003110
      0000947B6300AD948400C6AD9C00CEB5A500E7BD9C0073422900FFFFFF00E7BD
      9C00E7BD9C00840000005A9CFF005A94F700A58C7B005AEFFF005AEFFF004A31
      18005273AD005284CE005A94EF005A94FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00AD948400D6BDAD00D6BDB500A5846B0042FFFF0042FFFF003110
      0000947B6B00AD948400C6ADA500D6BDB500EFC6A500EFC6A500EFC6A500EFC6
      A500EFC6A5008400000063A5FF0063A5FF00A58C7B005AEFFF005AEFFF004A31
      18005A739C005A84BD006394DE0063A5F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00C69C840031100000E7D6
      CE00E7D6CE00B5948400EFD6CE00EFD6CE00E7D6C600A5846B0042FFFF0042FF
      FF0031100000AD948400C6B5A500DECEBD00EFCEAD00FFFFFF00FFFFFF00EFCE
      AD00EFCEAD00840000006BB5FF006BB5FF006BADF700A58C7B005AEFFF005AEF
      FF004A3118006384AD006B94CE006BA5EF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00DEC6BD00C69C8C00E7D6
      CE00E7D6CE00B59C8C00EFDED600EFE7DE00EFDED600A5846B0042FFFF0042FF
      FF0031100000A58C7B00BDA59400D6C6BD00F7D6BD0073422900FFFFFF00F7D6
      BD00F7D6BD00840000007BBDFF007BBDFF007BBDFF00A58C7B005AEFFF005AEF
      FF004A3118006B849C006B94BD0073ADDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00B59C8C00E7DECE00F7E7DE00F7E7E700EFE7DE00A5846B0042FF
      FF0042FFFF0031100000B59C8C00CEBDB500F7DEC600F7DEC600F7DEC600F7DE
      C600F7DEC6008400000084CEFF0084C6FF0084C6FF0084C6F700A58C7B005AEF
      FF005AEFFF004A3118007394AD007BADCE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00C69C840031100000E7D6
      CE00E7D6CE00B59C8C00E7D6CE00EFDEDE00F7EFE700FFEFEF00A5846B0042FF
      FF0042FFFF0031100000AD948C00BDADA500F7DECE00FFFFFF00FFFFFF00F7DE
      CE00F7DECE00840000008CCEFF008CCEFF008CCEFF008CCEFF00A58C7B005AEF
      FF005AEFFF004A311800738C9C007B9CBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00DEC6BD00C69C8C00E7D6
      CE00E7D6CE00E7D6CE00B59C8C00B59C8C00B59C8C00B59C8C00B59C8C00A584
      6B0042FFFF0042FFFF00311000008C6B5200FFE7D60073422900FFFFFF00FFE7
      D600FFE7D60084000000840000008400000084000000840000007B000000A58C
      7B005AEFFF005AEFFF004A3118006B1008000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7D6CE00E7D6CE00E7D6CE00E7D6
      CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6CE00E7D6C600A584
      6B0042FFFF0031100000311000009C7B7300EFBD9400FFEFDE00FFEFDE00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFE7DE00A58C
      7B005AEFFF004A3118004A311800B59C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD948400AD948400AD948400AD94
      8400AD948400AD948400AD948400AD948400AD948400AD948400AD948400AD94
      8400A5846B00EFE7DE00EFE7DE003110000000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700A58C7B00E7D6D600E7D6D6004A3118000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5846B00EFE7DE00EFE7DE00311000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A58C7B00E7D6D600E7D6D6004A3118000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5846B00A5846B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A58C7B00A58C7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B000000000000000000000000000000
      0000000000000000000000000000310800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000310800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000310800000000000000000000000000000000
      00000000000000000000000000000000000000000000C0575400C47F7900BC75
      700056402F00AF9E9600B4AAA500BBB0AA00BBB0AA00BBB0AA00BBB0AA00735B
      4C007B2B28007B2B28007B2B2800522A1B000000000000000000000000000000
      0000000000000000000000000000310800003108000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000310800003108000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000310800003108000000000000000000000000
      00000000000000000000000000000000000000000000C0575400CB888300C47F
      790056402F001A0F0B0044362D00FFFFFF00FFFFFF00FFFFFF00EBDCD400735B
      4C007F2E2C007B2B28007B2B2800522A1B003108000031080000310800003108
      0000310800003108000031080000310800003108000031080000310800003108
      0000310800003108000031080000310800003108000031080000310800003108
      0000310800003108000031080000310800003108000031080000310800003108
      0000310800003108000031080000310800003108000031080000310800003108
      0000310800003108000031080000310800003108000031080000310800003108
      00003108000031080000310800003108000000000000C0575400D3928C00CB88
      830056402F000000000020130D00FFFFFF00F4EDE900EBDCD400D8BBAB00735B
      4C00873634007F2E2C007B2B2800522A1B00FFFFFF00E7D6C600E7D6C600E7D6
      C600E7D6C600E7CEC600DECEBD003108000042F7FF0042F7FF0031080000A58C
      7B00BDA59C00D6C6B500E7CEC600E7CEC600FFFFFF00E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600DECEBD003108000042F7FF0042F7FF0031080000A58C
      7B00BDA59C00D6C6B500DECEC600E7CEC600A58C7B00FFEFE700FFEFE700FFEF
      E700FFEFE700FFEFE700F7E7DE003108000042F7FF0042F7FF0031080000B59C
      8C00D6BDB500EFDED600F7E7E700FFEFE70000000000C0575400DA9C9600D392
      8C0056402F0056402F0056402F0056402F0056402F0056402F0056402F005640
      2F008E3F3C00873634007F2E2C00522A1B00FFFFFF00E7D6C600E7D6C600E7D6
      C600E7D6C600E7CEC600E7CEC6009C7B6B0042F7FF0042F7FF00310800003108
      000031080000310800003108000031080000FFFFFF00E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600310800009C7B6B0042F7FF0042F7FF00310800003108
      000031080000310800003108000031080000A58C7B00FFEFE700310800003108
      000031080000FFEFE700310800009C846B0042F7FF0042F7FF00310800003108
      00003108000031080000310800003108000000000000C0575400E7ABA500E0A1
      9C00D7979100CF8E8800C7837F00BC757000B84841009D797800873634009E50
      4D00964744008E3F3C0087363400522A1B00FFFFFF00E7D6C600310800003108
      00003108000031080000E7CEC600FFFFFF009C7B6B0042F7FF0042F7FF003108
      0000A58C7B00BDA59C00D6C6B500E7CEC600FFFFFF00E7CEC600310800003108
      000031080000E7CEC600FFFFFF00DEC6BD009C7B6B0042F7FF0042F7FF003108
      0000A58C7B00BDA59C00D6C6B500DECEC600A58C7B00FFEFE700FFEFE700FFEF
      E700FFEFE700FFEFE700A58C7B00F7E7DE009C846B0042F7FF0042F7FF003108
      0000B59C8C00D6BDB500EFDED600F7E7E70000000000C0575400EBB0AA00E7AB
      A500E0A19C00D7979100CF8E8800C7837F00B8484100C9A18E0087363400AA5E
      5A009E504D00964744008E3F3C00522A1B00FFFFFF00E7D6C600FFFFFF003108
      0000FFFFFF0031080000E7CEC600FFFFFF009C7B6B0042F7FF0042F7FF003108
      00009C7B6B00B5948C00CEB5AD00DECEBD00FFFFFF00E7CEC600FFFFFF00E7CE
      C60031080000E7CEC600FFFFFF00DECEC6009C7B6B0042F7FF0042F7FF003108
      0000947B6B00AD948C00CEB5AD00DEC6BD00A58C7B00FFEFE700310800003108
      000031080000FFEFE700A58C7B00F7E7E7009C846B0042F7FF0042F7FF003108
      0000A58C8400C6AD9C00DECEC600F7E7DE0000000000C0575400EBB0AA00EBB0
      AA00C7837F00B8484100B8484100B8484100A4736500CAA79200C9A18E008736
      340087363400A1555100994C4800522A1B00FFFFFF00E7D6C600FFFFFF003108
      0000FFFFFF0031080000E7D6C600FFFFFF00DECEBD009C7B6B0042F7FF0042F7
      FF0031080000A58C7B00BDA59C00D6C6B500FFFFFF00E7CEC600FFFFFF00E7CE
      C60031080000E7CEC600FFFFFF00E7CEC600DEC6BD009C7B6B0042F7FF0042F7
      FF0031080000A58C7B00BDA59C00D6C6B500A58C7B00FFEFE700FFEFE700FFEF
      E700FFEFE700FFEFE700A58C7B00FFEFE700F7E7DE009C846B0042F7FF0042F7
      FF0031080000B59C8C00D6BDB500EFDED60000000000C0575400EBB0AA00BAA6
      A000B56F6300CEAD9700D8C0A500DAC5A7002F41D300867FB000CBA79200C9A1
      8E008E56490087363400A1555100522A1B00FFFFFF00E7D6C600FFFFFF003108
      0000FFFFFF0031080000E7D6C600FFFFFF00E7CEC6009C7B6B0042F7FF0042F7
      FF00310800009C7B6B00B5948C00CEB5AD00FFFFFF00E7CEC600FFFFFF00E7CE
      C60031080000E7CEC600FFFFFF00E7CEC600DECEC6009C7B6B0042F7FF0042F7
      FF0031080000947B6B00AD948C00CEB5AD00A58C7B00FFEFE700310800003108
      000031080000FFEFE700A58C7B00FFEFE700F7E7E7009C846B0042F7FF0042F7
      FF0031080000A58C8400C6AD9C00DECEC60000000000C0575400EBB0AA00B56F
      6300E1D1B200E6DABB00E5D9B800E1CFB1009E97B700BDA7A600CFAD9700C9A1
      8E00BB8A79008750490087363400522A1B00FFFFFF00E7D6C600FFFFFF003108
      0000FFFFFF0031080000E7D6C600FFFFFF00E7CEC600DECEBD009C7B6B0042F7
      FF0042F7FF0031080000A58C7B00BDA59C00FFFFFF00E7CEC600FFFFFF00E7CE
      C60031080000E7CEC600FFFFFF00E7CEC600E7CEC600DEC6BD009C7B6B0042F7
      FF0042F7FF0031080000A58C7B00BDA59C00A58C7B00FFEFE700FFEFE700FFEF
      E700FFEFE700FFEFE700A58C7B00FFEFE700FFEFE700F7E7DE009C846B0042F7
      FF0042F7FF0031080000B59C8C00D6BDB50000000000C0575400B56F6300D8C0
      A600EAE2C100EDE7C500EAE1C000E3D5B600797DC4007273BB00CCAD9A00CAA5
      9000C2988600A972670087363400522A1B00FFFFFF00E7D6C600FFFFFF003108
      0000FFFFFF0031080000E7D6C600FFFFFF00E7CEC600E7CEC6009C7B6B0042F7
      FF0042F7FF00310800009C7B6B00AD948C00FFFFFF00E7CEC600FFFFFF00FFFF
      FF0031080000E7CEC600FFFFFF00E7CEC600E7CEC600DECEC6009C7B6B0042F7
      FF0042F7FF00310800009C7B6B00AD948C00A58C7B00FFEFE700310800003108
      000031080000FFEFE700A58C7B00FFEFE700FFEFE700F7E7E7009C846B0042F7
      FF0042F7FF0031080000AD8C8400BDAD9C0000000000C0575400B56F6300DAC5
      AA00EBE5C200EEEBC700EAE2C100E3D5B700C1B5B1001D2FDD00A190A500CAA5
      9000C2988600AA72670087363400522A1B00FFFFFF00E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF009C7B
      6B0042F7FF0042F7FF0031080000BDADA500FFFFFF00E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C7B
      6B0042F7FF0042F7FF0031080000BDADA500A58C7B00FFEFE700FFEFE700FFEF
      E700FFEFE700FFEFE700A58C7B00A58C7B00A58C7B00A58C7B00A58473009C84
      6B0042F7FF0042F7FF00310800007B5A4A0000000000C0575400EBB0AA00B56F
      6300E5D8B700E9DEBD00C0BDC1000C24E700BDB1B0000D20E700887BAD00C9A4
      8F00BA8978009656500087363400522A1B00FFFFFF00E7D6C600E7D6C600E7D6
      C600E7D6C600E7D6C600E7D6C600E7D6C600E7D6C600E7CEC600E7CEC6009C7B
      6B0042F7FF003108000031080000947B6B00FFFFFF00E7CEC600E7CEC600E7CE
      C600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600E7CEC600DECEC6009C7B
      6B0042F7FF003108000031080000947B6B00A58C7B00FFEFE700FFEFE700FFEF
      E700FFEFE700FFEFE700FFEFE700FFEFE700FFEFE700FFEFE700F7E7E7009C84
      6B0042F7FF003108000031080000A58C7B0000000000C0575400EBB0AA00E0CC
      C700B56F6300D1B29C00CEBAA9006069C5003E4ACF004F54BC00B2918E00B888
      7A009D5E4D008736340000000000522A1B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C7B6B00EFDED600EFDED60031080000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C7B6B00EFDED600EFDED60031080000A58C7B00A58C7B00A58C7B00A58C
      7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A584
      73009C846B00EFDEDE00EFDEDE003108000000000000C0575400EBB0AA00B848
      4100D9B8AF00B56F6300B5806F00B6826F00B57F6D00B1786800B0796C00B88E
      820087363400B8484100B8706C00522A1B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C7B6B00EFDED600EFDED600310800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C7B6B00EFDED600EFDED600310800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C846B00EFDEDE00EFDEDE003108000000000000C0575400C0575400C057
      5400C0575400C0575400C0575400C0575400C0575400C0575400C0575400C057
      5400C0575400C0575400C0575400C05754000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C7B6B009C7B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C7B6B009C7B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C846B009C846B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004577000045
      7700004577000045770000457700004577000045770000457700004577000045
      77000045770000000000000000000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A000006A300A48B7A004E2E1C000000000000000000000000000000
      0000917560006B513F006B513F00451C1C00451C1C00451C1C00451C1C00451C
      1C00451C1C00451C1C00451C1C0000000000000000006B798100004577000045
      7700004577000045770000457700004577000045770000457700004577000045
      770000457700004577000045770000000000000000000077B80080CCF6000077
      B8000077B8000077B8000077B8000077B8000077B8000077B8000077B8000077
      B8000077B80000457700000000000000000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000000BB800A48B7A004E2E1C000000000000000000917560009175
      6000A48B7A00A48B7A00A48B7A0091756000451C1C0000000000000000000000
      000000000000000000000000000000000000000000006B79810073EDF6000278
      BF000278BF000278BF000278BF000278BF000278BF000278BF000278BF000278
      BF000278BF000278BF000045770000000000000000000077B800CBEAFC005FC0
      F40059BDF30053BAF2003A7B9200282828002D6D830035A9ED002DA4EA002AA1
      EA000077B80000457700000000000000000000000000B2998800F8F6F300801C
      0000801C0000EEE6E100801C0000801C0000E3D7CF00801C0000801C0000001C
      F6000018EB000011D100000BB8000009AF000000000091756000A48B7A00A48B
      7A00D0C2BA00D0C2BA00FBF7F400A48B7A0091756000451C1C00000000000000
      000000000000000000000000000000000000000000006B79810079F0F60073ED
      F6006CE9F40066E3F3005FE0F30059DAF20053D7F2004DD3F20046CEF00040C9
      EF003AC4EF000278BF000045770000000000000000000077B800CBEAFC0069C5
      F60063C2F4005CBFF30056BBF2002828280048B5F00040B0EF0038ABED0031A6
      EB000077B80000457700000000000000000000000000B2998800FCFBFA00F8F6
      F300F4F0ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCB
      C200801C00000018EB00A48B7A004E2E1C0000000000A48B7A00D0C2BA00EDE6
      E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B7A0091756000451C1C000000
      000000000000000000000000000000000000000000006B79810079F0F60079F0
      F60073EDF6006CE9F40066E3F3005FE0F30059DAF20053D7F2004DD3F20046CE
      F00040C9EF000278BF000045770000000000000000000077B800CBEAFC006FC9
      F70069C5F60063C2F40028282800282828002828280048B5F00040B0EF0038AB
      ED000077B80000457700000000000000000000000000B2998800FFFFFF00801C
      0000FBF8F700DCBCAD008B2D0C00801C00009D492800801C0000801C0000E0D0
      C900DCCBC200001CF600A48B7A004E2E1C0000000000A48B7A00FFFFFF00F6F2
      F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B7A0091756000451C
      1C0000000000000000000000000000000000000000006B79810079F0F60079F0
      F60079F0F60073EDF6006CE9F40066E3F3005FE0F30059DAF20053D7F2004DD3
      F20046CEF0000278BF000045770000000000000000000077B800CBEAFC0076CC
      F8006FC9F70069C5F6004795AC00282828004795AC0050B8F20048B5F00040B0
      EF000077B80000457700000000000000000000000000B2998800FFFFFF00801C
      0000FEFEFC00A3513100801C0000E5CFC500DCC0B200801C0000801C0000E5D9
      D300801C0000DCCBC200A48B7A004E2E1C000000000000000000A48B7A00FFFF
      FF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B7A009175
      6000451C1C00000000000000000000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60073EDF6006CE9F40066E3F3005FE0F30059DAF20053D7
      F2004DD3F2000278BF000045770000000000000000000077B800CBEAFC007DD0
      FA0076CCF8006FC9F70069C5F60063C2F4005CBFF30056BBF20050B8F20048B5
      F0000077B80000457700000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00AB5F4100801C0000CC9E8A00EBE0D800801C0000801C0000E9DE
      D800801C0000E2D4CC00A48B7A004E2E1C00000000000000000000000000A48B
      7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B
      7A0091756000451C1C000000000000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60079F0F60076EFF6006FEBF60066E3F3005FE0F30059DA
      F20053D7F2000278BF000045770000000000000000000077B80080CCF600CBEA
      FC00CBEAFC00CBEAFC00CBEAFC00CBEAFC00CBEAFC00CBEAFC00CBEAFC00CBEA
      FC0080CCF60000457700000000000000000000000000B2998800FFFFFF00801C
      0000FFFFFF00F3E6E100B16A4C009236150083200300801C0000801C0000EDE3
      DE00E9DED800E5D9D300A48B7A004E2E1C000000000000000000000000000000
      0000A48B7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFF
      FF00A48B7A00917560004E2E1C0000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60079F0F60079F0F60076EFF6006FEBF60069E6F40063E2
      F3005CDDF2000278BF00004577000000000000000000000000000077B8000077
      B8000077B8000077B8000077B8000077B8000077B8000077B8000077B8000077
      B8000077B80000000000000000000000000000000000B2998800FFFFFF00801C
      0000FFFFFF00FFFFFF00FFFFFF00FEFEFC00E3C9BC00801C000088280800EFE9
      E300801C0000E9DED800A48B7A004E2E1C000000000000000000000000000000
      000000000000A48B7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2
      BA00FFFFFF00A48B7A006B513F0000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60079F0F60079F0F60079F0F60076EFF6006FEBF60069E6
      F40063E2F3005CDDF20000457700000000000000000000000000000000000077
      B800CBEAFC00004577000000000000000000000000000077B80045B8F6000045
      77000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C2E0D00801C0000801C000092361500D0A69200F3EE
      EA00801C0000EDE3DE00A48B7A004E2E1C000000000000000000000000000000
      00000000000000000000A48B7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CE
      C600D0C2BA00FFFFFF006B513F0000000000000000006B7981006B7981006B79
      81006B7981006B7981006B7981006B7981006B798100801C0000801C0000801C
      0000801C00006B7981006B798100000000000000000000000000000000000077
      B800CBEAFC00004577000000000000000000000000000077B80045B8F6000045
      77000000000000000000000000000000000000000000B2998800FFFFFF00801C
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000A48B7A00FFFFFF00FBF8F700F2EDEA00E7E0
      DC00FCFAF800D0C2BA009175600000000000000000006B7981007BF2F6007BF2
      F6007BF2F6007BF2F6006B7981000000000000000000801C0000DC8F6800801C
      0000000000000000000000000000000000000000000000000000000000000077
      B800CBEAFC0080CCF60000457700004577000045770045B8F60045B8F6000045
      77000000000000000000000000000000000000000000B2998800FFFFFF00801C
      0000FFFFFF00801C0000801C0000FFFFFF00801C0000801C0000FFFFFF00801C
      0000801C0000F4F0ED00A48B7A004E2E1C000000000000000000000000000000
      000000000000000000000000000000000000A48B7A00FFFFFF00FBF8F700FBFA
      F800D0C2BA0091756000000000000000000000000000000000006B7981006B79
      81006B7981006B798100000000000000000000000000801C0000801C0000AC56
      2500000000000000000000000000000000000000000000000000000000000000
      00000077B800CBEAFC00CBEAFC00CBEAFC00CBEAFC0045B8F600004577000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C000000000000000000000000000000
      00000000000000000000000000000000000000000000A48B7A00A48B7A00A48B
      7A00A48B7A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000801C000000000000801C
      0000AC56250000000000AC562500801C00000000000000000000000000000000
      0000000000000077B8000077B8000077B8000077B8000077B800000000000000
      0000000000000000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000801C0000801C0000801C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824542004D1C1C004D1C1C004D1C1C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E2E1C004E2E1C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AF4B090075280C0075280C0075280C0075280C0075280C007528
      0C0075280C0075280C0075280C0075280C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000774545004D1C
      1C004D1C1C008C3C370093413B008E413A004D1C1C004D1C1C004D1C1C004D1C
      1C004D1C1C004D1C1C004D1C1C004D1C1C000000000000000000000000000000
      000000000000000000004E2E1C00EEE6E200EEE6E2004E2E1C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AF4B0900FFFFFF00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A0075280C0000000000AF4B090075280C007528
      0C0075280C0075280C0075280C0075280C0075280C0075280C0075280C007528
      0C0075280C0075280C0075280C0075280C0000000000774545008B3A3600A94A
      4400A7494300A34742009E45400090413B004D1C1C00EB787700EB787700EB78
      7700EB787700EB787700EB7877004D1C1C000000000000000000000000000000
      0000000000004E2E1C00EEE6E200801C0000801C0000EEE6E2004E2E1C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AF4B0900FFFFFF00FFFFFF00FFFFFF00F8F4F300F2EBE700EAE1
      DC00E5D7D000DDCCC400A48B7A0075280C0000000000AF4B0900F7F2F000A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A0075280C000000000077454500B54E4A00B24D
      4800AD4B4600A9494400A447420092423C004D1C1C0000320000003200000032
      00000035000016410A00EB7877004D1C1C000000000000000000000000000000
      00004E2E1C00EEE6E200801C0000F36C3600F2622B00801C0000EEE6E2004E2E
      1C0000000000000000000000000000000000000000000000000000000000AF4B
      090075280C00AF4B0900FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F4F300F2EB
      E700EAE1DC00E5D7D000A48B7A0075280C0000000000AF4B0900FBF8F800F7F2
      F000F2EBE900EEE5E100E9DED900E6D9D100E2D4CB00DDCEC400D9C7BD00D5C2
      B700D5C2B700D1BCB000A48B7A0075280C000000000077454500BA504C00B74F
      4B00B04D4800A04641009C433F0093423C004D1C1C0000370000003200000032
      0000014A050018511100EB7877004D1C1C000000000000000000000000004E2E
      1C00EEE6E200801C0000B47A5A00B47A5A00B47A5A00B47A5A00801C0000EEE6
      E2004E2E1C00000000000000000000000000000000000000000000000000AF4B
      0900FFFFFF00AF4B0900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F4
      F300F2EBE700EAE1DC00A48B7A0075280C0000000000AF4B0900FFFFFF00FBF8
      F800F7F2F000F2EBE900EEE5E100E9DED900E6D9D100E2D4CB00DDCEC400D9C7
      BD00D9C7BD00D5C2B700A48B7A0075280C000000000077454500BD524E00BC51
      4D00B4555200D5A09E0084444100893F39004D1C1C0000400200003700000144
      030004660F001B5C1600EB7877004D1C1C0000000000000000004E2E1C00EEE9
      E300801C0000F4835100FFFFFF00FFFFFF00FFFFFF00FFFFFF00954B2C00801C
      0000EEE6E2004E2E1C000000000000000000000000000000000000000000AF4B
      0900FFFFFF00AF4B0900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F4F300F2EBE700EAE1DC0075280C0000000000AF4B0900FFFFFF00FFFF
      FF00FBF8F800F7F2F000F2EBE900EEE5E100E9DED900E6D9D100E2D4CB00DDCE
      C400DDCEC400D9C7BD00A48B7A0075280C000000000077454500C2545000C052
      4F00D5A09E00FCEDED00D5A09E008C403A004D1C1C0001490400074102001656
      0900077214001F571300EB7877004D1C1C00000000004E2E1C00EEE6E200801C
      0000F79D6D00F7976700F4835100FFFFFF00FFFFFF00954B2C00F36C3600F262
      2B00801C0000EEE6E2004E2E1C000000000000000000AF4B090075280C00AF4B
      0900FFFFFF00AF4B090075280C0075280C0075280C0075280C0075280C007528
      0C0075280C0075280C0075280C0075280C0000000000AF4B0900FFFFFF00FFFF
      FF00FFFFFF00FBF8F800F7F2F000F2EBE900EEE5E100E9DED900E6D9D100E2D4
      CB00E2D4CB00DDCEC400A48B7A0075280C000000000077454500C9575300C655
      5100C2585300D5A09E00B55652009A4641004D1C1C00074E060073671300C68E
      29001F590A00C68E2900EB7877004D1C1C00801C0000F7F3F000B8450000FAB2
      8800F8A77A00F79D6D00F7976700FFFFFF00FFFFFF00954B2C00F3743F00F36C
      3600F2622B00801C0000EEE6E2004E2E1C0000000000AF4B0900FFFFFF00AF4B
      0900FFFFFF00C0480000E77F1E00E77F1E00E77F1E00E77F1E00F3BB8200E77F
      1E00F3BB8200E77F1E001C52F70075280C0000000000AF4B0900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFCFC00FAF6F400F4EFED00EEE5E100E9DED900E6D9
      D100E6D9D100E2D4CB00A48B7A0075280C000000000077454500CF595600CB58
      5400C6565100C2545000BD524E009F4842004D1C1C0055661600F6AF6600F6AF
      6600F6AF6600F6AF6600EB7877004D1C1C00801C0000FEFEFE00B8450000FAB2
      8800FAB28800F8A77A00F79D6D00FFFFFF00FFFFFF00954B2C00F4794500F374
      3F00F36C3600801C0000EEE6E2004E2E1C0000000000AF4B0900FFFFFF00AF4B
      0900FFFFFF00FFFFFF00AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B
      0900AF4B0900AF4B0900AF4B09000000000000000000AF4B0900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFCFC00FAF6F400F4EFED00F0E9E500EBE2
      DD00EBE2DD00E7DCD500A48B7A0075280C000000000077454500D35B5900D05A
      5700CC585400C7565200C2545000A04942004D1C1C00F6AF6600F6AF6600F6AF
      6600F6AF6600F6AF6600EB7877004D1C1C0000000000801C0000FCF8F600B845
      0000FAB28800FAB28800FFFFFF00FFFFFF00FFFFFF00954B2C00F4835100F479
      4500801C0000EEE6E2004E2E1C000000000000000000AF4B0900FFFFFF00AF4B
      090075280C0075280C0075280C0075280C0075280C0075280C0075280C007528
      0C0075280C0075280C00000000000000000000000000AF4B0900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFC00FAF6F400F4EFED00F0E9
      E500F0E9E500EBE2DD00A48B7A0075280C000000000077454500DA5D5B00D55B
      5900D15A5700CC585400C7565200A44A43004D1C1C00F6AF6600F6AF6600F6AF
      66009D9D8B00168FF600EB7877004D1C1C000000000000000000801C0000FEFE
      FE00B8450000FAB28800FAB28800B47A5A00B47A5A00F7976700F4835100801C
      0000EEE6E2004E2E1C00000000000000000000000000AF4B0900FFFFFF00C048
      0000E77F1E00E77F1E00E77F1E00E77F1E00F3BB8200E77F1E00F3BB8200E77F
      1E001C52F70075280C00000000000000000000000000AF4B0900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFC00FAF6F400F4EF
      ED00F4EFED00F0E9E500A48B7A0075280C000000000077454500DE5F5E00DC5E
      5C00D75C5A00D35B5800CE595600A64B45004D1C1C00F6AF6600F6AF66009D9D
      8B0011A5F400168FF600EB7877004D1C1C00000000000000000000000000801C
      0000FFFFFF00B8450000FAB28800FFFFFF00FFFFFF00954B2C00801C0000EEE6
      E2004E2E1C0000000000000000000000000000000000AF4B0900FFFFFF00FFFF
      FF00AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B
      0900AF4B0900000000000000000000000000001CF60082E5F700001CF60082E5
      F700001CF600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFC00FAF6
      F400FAF6F400F4EFED00F0E9E50075280C000000000077454500D75D5B00DC5E
      5D00DC5E5C00D75C5A00D35A5800A94C46004D1C1C00F6AF66009D9D8B000DB4
      F6000DB4F60011A5F400EB7877004D1C1C000000000000000000000000000000
      0000801C0000FEFEFE00B8450000FFFFFF00FFFFFF00801C0000EEE6E2004E2E
      1C000000000000000000000000000000000000000000AF4B090075280C007528
      0C0075280C0075280C0075280C0075280C0075280C0075280C0075280C007528
      0C000000000000000000000000000000000082E5F7002F5DF60000F6F6002F5D
      F60082E5F70075280C0075280C0075280C0075280C0075280C0075280C007528
      0C0075280C0075280C0075280C0075280C0000000000000000009C554D007745
      4500B7524F00B7524F00C7575500A64B46004D1C1C0077454500774545007745
      4500774545007745450077454500774545000000000000000000000000000000
      000000000000801C0000FCF8F600B8450000B8450000EEE7E3004E2E1C000000
      00000000000000000000000000000000000000000000C0480000E77F1E00E77F
      1E00E77F1E00E77F1E00F3BB8200E77F1E00F3BB8200E77F1E001C52F7007528
      0C0000000000000000000000000000000000001CF60000F6F600FAFEFE0000F6
      F600001CF600E77F1E00E77F1E00E77F1E00E77F1E00F3BB8200E77F1E00F3BB
      8200E77F1E001C52F700E77F1E00AF4B09000000000000000000000000000000
      00009C554D0077454500B7524F00B7524F004D1C1C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000801C0000FEFEFE00F7F3F0004E2E1C00000000000000
      0000000000000000000000000000000000000000000000000000AF4B0900AF4B
      0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B09000000
      00000000000000000000000000000000000082E5F7002F5DF60000F6F6002F5D
      F60082E5F700AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B0900AF4B
      0900AF4B0900AF4B0900AF4B0900000000000000000000000000000000000000
      000000000000000000009C554D00774545007745450000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000801C0000801C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001CF60082E5F700001CF60082E5
      F700001CF6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A48B7A004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A48B7A00E9DE
      D800A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A004E2E1C0000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000006B79810000457700004577000045
      7700004577000045770000457700004577000045770000457700004577000045
      7700000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000A48B7A00EDE3
      DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4BA00D3BFB400D0BA
      AD00D0BAAD00A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00FFFFFF00C0C0C00000000000000000006B7981006B798100148AC4000278
      BF000278BF000278BF000278BF000278BF000278BF000278BF000278BF000045
      7700000000000000000000000000000000000000000080808000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000A48B7A00F0E9
      E500EDE3DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4BA00D3BF
      B400D0BAAD00A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00C0C0C00000000000000000006B7981006B7981005DADC40046CF
      F40040C9F2003AC4EF0033BCEB002CB7E90026B1E70021ACE5001CA6E2000278
      BF00004577000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000A48B7A00F3EE
      EB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4
      BA00D3BFB400A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00C0C0C00000000000000000006B79810049D0F6006B79810053C7
      E70048CFF40042CBF3003BC4EF0034BFED002DB8EA0028B4E70021ADE50016A1
      E000004577000000000000000000000000000000000080808000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000A48B7A00F7F3
      F200F3EEEB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9
      C000D7C4BA00A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF0000FFFF00C0C0C00080000000FF000000800000008000000000000000C0C0
      C00000FFFF00C0C0C00000000000000000006B79810062E1F6006B79810059B1
      C9004CD3F7004AD1F60042CAF3003BC4EF0035BFED002DB8EA0028B4E70021AD
      E5000278BF000045770000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000A48B7A00FBFA
      F800F7F3F200F3EEEB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4CC00DECE
      C600DAC9C000A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF00FFFFFF0080808000FF000000FF00000000800000FF000000800000008000
      0000FFFFFF00C0C0C00000000000000000006B7981006CE9F60049D0F6006B79
      810054C7E7004CD3F70049D0F60042CAF3003BC4EF0034BFED002DB8EA0028B4
      E7001CA3DD000045770000000000000000000000000080808000FFFFFF008080
      800080808000FFFFFF000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000A48B7A00FFFF
      FF00FBFAF800F7F3F200F3EEEB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4
      CC00DECEC600A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF0000FFFF0080800000C0C0C000808080000080000080800000FF0000008000
      000000FFFF00C0C0C00000000000000000006B79810077F0F6006CE9F6006B79
      810058B4CC004CD1F6004CD3F7004AD1F60043CBF3003CC5F00035BFED002EBA
      EA0023B0E5000278BF0000457700000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FCFCFC00FAF7F600F6F0EF00F2EBE900EEE6E200EAE1DC00E7DC
      D500E3D7CF00A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF00FFFFFF0080800000FFFFFF00C0C0C0000080000080000000FF0000008000
      0000FFFFFF00C0C0C00000000000000000006B7981007BF2F60077F0F60049D0
      F6006B7981006B7981006B7981006B7981006B7981006B7981006B7981006B79
      81006B7981006B7981006B798100000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00808080008000000080000000FFFF
      FF000000800000008000C0C0C000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00F2EBE900EEE6E200EAE1
      DC00E7DCD500A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF0000FFFF0080800000C0C0C00080800000FF00000080800000008000008080
      800000FFFF00C0C0C00000000000000000006B7981007BF2F6007BF2F60077F0
      F60049D0F60049D0F60049D0F60049D0F60049D0F60049D0F60049D0F60049D0
      F6006B7981000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000800000008000C0C0C000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00F2EBE900EEE6
      E200A48B7A00A48B7A004E2E1C0000000000000000000000000080808000FFFF
      FF00FFFFFF00C0C0C0008080000080808000808000000080000080800000C0C0
      C000FFFFFF00C0C0C00000000000000000006B7981007BF2F6007BF2F6007BF2
      F60077F0F60049D0F6006B7981006B7981006B7981006B7981006B7981006B79
      8100801C0000801C0000801C0000801C00000000000000000000000000000000
      000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00A48B
      7A004E2E1C004E2E1C004E2E1C0000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00C0C0C000808000008080000080800000C0C0C000FFFF
      FF0000FFFF00C0C0C00000000000000000006B7981007BF2F6007BF2F6007BF2
      F6007BF2F6006B79810000000000000000000000000000000000000000000000
      000000000000801C0000DC8F6800801C00000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600A48B
      7A00EFE5DE00D0BAAD004E2E1C0000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF000000
      000000000000000000000000000000000000000000006B7981006B7981006B79
      81006B7981000000000000000000000000000000000000000000000000000000
      000000000000AC562500801C0000801C00000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00A48B
      7A00D0BAAD004E2E1C000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000801C0000AC5625000000
      0000AC562500801C000000000000801C00000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A48B
      7A004E2E1C00000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000801C0000801C
      0000801C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000B2998800F8F6F300F4F0
      ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00F2EBE700801C0000801C0000801C0000E3D7CF00E0D0C900801C0000801C
      0000801C0000D1BCB000A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000B2998800FCFBFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5C1B600A48B7A004E2E1C0000000000B2998800FCFBFA00F8F6
      F300F4F0ED00F2EBE700801C0000EAE1DA00E7DCD500E3D7CF00E0D0C900801C
      0000D9C6BC00D5C1B600A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000F3EEEA00EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800108710000077
      000010860F00F7F3F00042A14000801C0000801C0000801C0000801C0000801C
      0000DCCBC200D9C6BC00A48B7A004E2E1C008080000080800000808000008080
      0000808000008080000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FEFEFC000000000000000000000000000000000000000000000000000000
      000000000000DCCBC200A48B7A004E2E1C0000000000B2998800C7E6C700037A
      0300EAF6E900FBF8F700F7F3F0000D830C00801C00009EC59500E9DED800801C
      0000E0D0C900DCCBC200A48B7A004E2E1C0080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF0055B0
      550089CA8900FEFEFC00B1D8AD00007700002A952800801C0000EDE3DE00801C
      0000E5D9D300E2D4CC00A48B7A004E2E1C0080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000FFFFFF008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000B2998800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF00CCE9
      CC000077000000770000007700000077000089C58600F3EEEA00801C0000801C
      0000E9DED800E5D9D300A48B7A004E2E1C0080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080800000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF0028972800C2E5C200067F0600047D0400EDF2E900F7F3F000F3EEEA00801C
      0000EDE3DE00E9DED800A48B7A004E2E1C008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF0097D097001C8F1C000077000045A74500FEFEFC00FBF8F700F7F3F000F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C0080800000FFFFFF00808000008080
      0000808000008080000080800000808000008080000080800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FBFEFB000B820B0000770000AFDCAF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF005DB45D000D840D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C000000000000000000000000000000
      00000000000080800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000FFFFFF008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000000000000000
      00000000000080800000FFFFFF00808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000801C0000451C1C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C00B8450000F6800000C2660000451C
      1C00000000000000000000000000785B4800785B4800785B4800705340006343
      31004E2E1C0000000000000000000000000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00801C0000801C0000801C0000801C0000801C0000801C0000801C0000801C
      0000801C0000D1BCB000A48B7A004E2E1C00AC562500F6B87700F6800000801C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800F8F6F300F4F0
      ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800FCFBFA00F8F6
      F300F4F0ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCB
      C200D9C6BC00D5C1B600A48B7A004E2E1C0000000000AC562500B84500000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FCFBFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5C1B600A48B7A004E2E1C0000000000B2998800FCFBFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5C1B600A48B7A004E2E1C0000000000B2998800FFFFFF00FEFE
      FC00FBF8F700E6D0C600A455350087250600801C000086240500A4573800D7BD
      B100DCCBC200D9C6BC00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000F3EEEA00EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000F3EEEA00EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FEFEFC0092361500801C0000B7785D00EADED700E7D9D100AD694B009944
      2400E0D0C900DCCBC200A48B7A004E2E1C0000000000801C0000451C1C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000E5D9
      D300E0D0C900DCCBC200A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FEFEFC00000000000000000000000000000000000000000000000000E5D9
      D300E0D0C900DCCBC200A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000F3EDE700F3EEEA00EFE9E300E6D5CC00801C
      0000E5D9D300E2D4CC00A48B7A004E2E1C00B8450000F6800000C2660000451C
      1C00000000000000000000000000785B4800785B4800785B4800705340006343
      31004E2E1C0000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FBF8F700F7F3F000F3EEEA00EFE9E300801C
      0000E9DED800E5D9D300A48B7A004E2E1C00AC562500F6B87700F6800000801C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FEFEFC00FBF8F700F7F3F000F3EEEA00801C
      0000EDE3DE00E9DED800A48B7A004E2E1C0000000000AC562500B84500000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FFFFFF00FEFEFC00FBF8F700F7F3F000801C
      0000EFE9E300EDE3DE00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00F7EFEB00801C0000801C0000F4EBE600FFFFFF00FEFEFC00F3E9E300801C
      0000EADCD300EFE9E300A48B7A004E2E1C0000000000801C0000451C1C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00801C0000801C0000801C0000801C0000FFFFFF00FFFFFF00801C0000801C
      0000801C0000F4F0ED00A48B7A004E2E1C00B8450000F6800000C2660000451C
      1C00000000000000000000000000785B4800785B4800785B4800705340006343
      31004E2E1C0000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C00AC562500F6B87700F6800000801C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B29988000000000000000000AC562500B84500000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C0000000000966447008E5C40007D442800753D
      23006428100064281000000000000000000000000000966447008E5C40007D44
      2800753D23006428100064281000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000530000005300000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0096644700FBF8F800DAB8A500BF8C
      7300975B3B006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300975B3B0064281000000000000000000000000000000000000000
      0000801C00000000000000000000000000000000000000000000000000000000
      00000053000000000000000000000053000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0096644700FBF8F800DAB8A500BF8C
      7300A66644006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300A666440064281000000000000000000000000000801C0000801C
      0000801C0000801C000000000000000000000000000000000000000000000000
      00000053000000000000000000000000000000000000B2998800F8F6F300F4F0
      ED00801C0000801C0000801C0000801C0000801C0000811E0100A1543500D0B4
      A600D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00D8B7A700801C0000801C0000801C0000801C0000D0B0A000DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C0096644700FBF8F800DAB8A500BF8C
      7300A66644006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300A6664400642810000000000000000000801C0000CB4C1E000000
      0000801C00000000000000000000000000000000000000000000000000000000
      00000053000000000000000000000053000000000000B2998800FCFBFA00F8F6
      F300F4F0ED00801C0000801C0000E3D3CA00E7DCD500C1917A00801C0000821F
      0200D9C6BC00D5C1B600A48B7A004E2E1C0000000000B2998800FCFBFA00F8F6
      F300F4F0ED00EBDDD500953C1B00801C0000D0AB9A00E3D7CF00E0D0C900DCCB
      C200D9C6BC00D5C1B600A48B7A004E2E1C0096644700FBF8F800DAB8A500BF8C
      7300A66644006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300A6664400642810000000000000000000801C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000530000005300000000000000000000B2998800FFFFFF00FEFE
      FC00FBF8F700801C0000801C0000EEE6E100EAE1DA00E7DCD500801C0000801C
      0000DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000B26E5200801C0000BF8A7200E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C009664470088503500885035007839
      1C0078391C006428100064281000542B13009664470088503500885035007839
      1C0078391C0064281000642810000000000000000000801C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FEFEFC00801C0000801C0000F3EEEA00EFE9E300CFA69500801C00009D4A
      2A00E0D0C900DCCBC200A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FEFEFC00FBF8F700CA9A8600801C0000AA604100EDE3DE00E9DED800E5D9
      D300E0D0C900DCCBC200A48B7A004E2E1C00D3B5930096644700E6CCBF00E6CC
      BF00BB896F00975B3B00642810008850350096644700E6CCBF00E6CCBF00BB89
      6F00975B3B006428100077454500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000801C0000801C0000801C0000A95E4000E1CC
      C200E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00E3C9BC00801C000092371600EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C000000000096644700FFFFFF00EDE1
      DD00E9C5B000975B3B0064281000B880770096644700FFFFFF00EDE1DD00E9C5
      B000975B3B007745450000000000000000000000000000000000000000000000
      000000000000000000002C2C2C00494949004949490049494900000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FBF8F700EAD8CF00AC65460083200200BF88
      6F00E9DED800E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAF6F300801C0000801C0000EEE3DD00EFE9E300EDE3
      DE00E9DED800E5D9D300A48B7A004E2E1C000000000000000000966447008850
      35007D44280064281000642810008850350096644700885035007D4428006428
      1000642810000000000000000000000000000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000494949000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FEFEFC00FBF8F700F6F0ED00801C00008320
      0200EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00953A1800801C0000D7B1A000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C00000000000000000096644700FBF8
      F800D4B29D00975B3B00642810000000000096644700FBF8F800D4B29D00975B
      3B00642810000000000000000000000000000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000494949000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FFFFFF00FEFEFC00D0A59200801C00008320
      0200EFE9E300EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BD806600801C0000AC624300F6F0ED00F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C000000000000000000966447008850
      35007D44280064281000885035000000000096644700885035007D4428006428
      1000885035000000000000000000000000000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000494949000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00801C0000801C0000801C0000801C0000801C0000821E0100AC624300EBDC
      D400F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CE9E8900801C0000801C0000801C00008F300F00F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C000000000000000000000000009664
      4700FBF8F8006428100000000000000000000000000096644700FBF8F8006428
      1000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C2C2C00494949004949490049494900000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C000000000000000000000000009664
      4700966447008850350000000000000000000000000096644700966447008850
      3500000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002C2C2C002C2C2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BB390800801C0000801C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7937200782C0800782C0800782C0800782C
      0800782C0800782C0800782C0800782C08000000000000000000000000000000
      00000000000000000000C49791004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5672900BB390800BB390800BB390800801C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7937200F4DECF00F2D7C400EFCFB800EDC6
      AC00EABFA100E7B79700E7B79700782C08000000000000000000000000000000
      00000000000000000000C4979100EAE0DA00B1978600B1978600B1978600B197
      8600B1978600B1978600B19786004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5672900BB390800E5672900EB8A5B00801C00000000000000000000BB39
      0800BB3908008C32070000000000000000000000000000000000000000000000
      0000000000000000000000000000D7937200F7E7DD00F4DECF00F2D7C400EFCF
      B800EECAB200EBC2A700E9BB9C00782C080000000000002B5300002B5300002B
      5300002B5300002B5300C4979100F0E9E500EAE0DA00E5D8D100E0D0C900DDCC
      C400D8C5BB00D3BDB100B19786004E2E1C000000000080808000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5672900BB39080000000000EB8A5B00801C000000000000BB390800BB39
      08008C3207008C3207008C320700000000000000000000000000000000000000
      0000000000000000000000000000D7937200FBF2EB00C6693D00C6693D00C669
      3D00C6693D00C6693D00EBC2A700782C08000077B8005FCCEA000077BA000077
      BA000077BA000077BA00C4979100F7F2EF00CC802800CC802800CC802800CC80
      2800CC802800D8C5BB00B19786004E2E1C000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5672900EB8A5B008C3207008C320700801C000000000000BB390800E567
      2900EB8A5B008C320700801C0000000000000000000000000000000000000000
      0000000000000000000000000000D7937200FFFFFF00FCF6F200F8EDE300F6E3
      D500F3DAC900F0D3BD00EECAB200782C08000077B80069D4EE005FCCEA0057C6
      E7004EBFE30045BAE000C4979100FFFFFF00FAF6F400F3EDEA00EDE3E000E7DC
      D500E2D4CC00DDCCC400B19786004E2E1C000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5672900EB8A5B008C320700801C0000801C0000BB3908000000
      0000E56729008C320700801C000000000000C0A595005F402D005F402D005F40
      2D005F402D005F402D005F402D00D7937200FFFFFF00C6693D00C6693D00C669
      3D00C6693D00C6693D00F0D3BD00782C08000077B80073DAF20069D4EE005FCC
      EA0057C6E7004EBFE300C4979100FFFFFF00CC802800CC802800CC802800CC80
      2800CC802800E2D4CC00B19786004E2E1C00000000008080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E5672900872905008A351100801C0000BB3908008C32
      0700801C0000801C00000000000000000000C0A59500EAE0DA00E5D8D100E0D0
      C900DAC9BF00D5C1B600D0BAAD00D7937200FFFFFF00FFFFFF00FFFFFF00FCF6
      F200F8EDE300F6E3D500F3DAC900782C08000077B8007DE1F60073DAF20069D4
      EE005FCCEA0057C6E700C4979100FFFFFF00FFFFFF00FFFFFF00FAF6F400F3ED
      EA00EDE3E000E7DCD500B19786004E2E1C00000000000000000000000000C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000057473B00A48B7A008F432300801C0000801C
      0000BB390800000000000000000000000000C0A59500F0E9E500EAE0DA00E5D8
      D100E0D0C900DDCCC400D8C5BB00D7937200FFFFFF00C6693D00C6693D00FFFF
      FF00D7937200963A1600963A1600963A16000077B8007DE1F6007DE1F60073DA
      F20069D4EE005FCCEA00C4979100FFFFFF00CC802800CC802800CC802800FAF6
      F400F3EDEA00C09291004E2E1C004E2E1C000000000000000000000000000000
      0000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000057473B00C5B5AA00B89F8E0057473B00000000000000
      000000000000000000000000000000000000C0A59500F7F2EF00D5936900D593
      6900D5936900D5936900D5936900D7937200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7937200EFE5DE00963A1600000000000077B8007DE1F6007DE1F6007DE1
      F60073DAF20069D4EE00C4979100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAF6F400C0929100FFFFFF004E2E1C000000000000000000000000000000
      000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      0000808080008080800080808000000000000000000000000000000000000000
      00000000000057473B00D0C2BA0057473B00D0BAAD0057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00FAF6F400F3ED
      EA00EDE3E000E7DCD500E2D4CC00D7937200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E1937200B54F1C0000000000000000000077B8007DE1F6007DE1F6007DE1
      F6007DE1F60073DAF200C4979100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C09291004E2E1C00000000000000000000000000000000000000
      00000000000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00000000008080800000000000000000000000000000000000000000000000
      000057473B00E7DCD50057473B00967A6700E1D0CA0057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00D5936900D593
      6900D5936900D5936900D5936900D7937200D7937200D7937200D7937200D793
      7200D79372000000000000000000000000000077B8007DE1F6007DE1F6007DE1
      F6007DE1F6007DE1F600C4979100C4979100C4979100C4979100C4979100C497
      9100C4979100C497910000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00808080000000000000000000000000000000000000000000967A
      6700FFFFFF0057473B0000000000967A6700E7DCD50057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00FFFFFF00FFFF
      FF00FAF6F400F3EDEA00EDE3E000E7DCD5004E2E1C0000000000000000000000
      0000000000000000000000000000000000000077B8007DE1F6007DE1F6000045
      8000002B5300002B5300002B5300002B5300002B5300002B5300002B53000077
      BA00002B53000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000C0C0C0000000000000000000000000000000000000000000967A
      670057473B000000000000000000967A6700F0E9E60057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00D5936900D593
      6900FFFFFF00C0A595004E2E1C004E2E1C004E2E1C0000000000000000000000
      0000000000000000000000000000000000000077B8007DE1F6007DE1F6000045
      80007DE1F60053C2E600002B530053C2E60035ABDA00047DBD00002B53000077
      BA00002B53000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      000000000000808080008080800000000000000000000000000000000000967A
      6700000000000000000000000000967A6700FFFFFF0057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A59500EFE5DE004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000077B8007DE1F6007DE1F6007DE1
      F600004580007DE1F600002B5300002B530053C2E600002B53004ABCE2004ABC
      E200002B53000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000967A670057473B0000000000000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A595004E2E1C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000077B8000077B8000077
      B8000077B800004580007DE1F6007DE1F600002B53000077B8000077B8000077
      B800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000967A67000000000000000000000000000000
      000000000000000000000000000000000000C0A59500C0A59500C0A59500C0A5
      9500C0A59500C0A5950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000045800000458000004580000045800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0575400C47F7900BC75
      700056402F00AF9E9600B4AAA500BBB0AA00BBB0AA00BBB0AA00BBB0AA00735B
      4C007B2B28007B2B28007B2B2800522A1B00000000006C4734006C4734006C47
      34006C4734006C4734006C4734006C4734006C4734006C4734006C4734006C47
      3400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A43B1700B82A0000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000C0575400CB888300C47F
      790056402F001A0F0B0044362D00FFFFFF00FFFFFF00FFFFFF00EBDCD400735B
      4C007F2E2C007B2B28007B2B2800522A1B0089736300FFFFFF00A68F7E00A68F
      7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F
      7E006C4734000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A411D00CB4B1D00B82A00000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000C0575400D3928C00CB88
      830056402F000000000020130D00FFFFFF00F4EDE900EBDCD400D8BBAB00735B
      4C00873634007F2E2C007B2B2800522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FBF4EF00F7E9DE00F3DECE00F0D4BF00EECAB10010264100E7B89700A68F
      7E006C4734006C47340000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A411D00CB4C1E00B82A
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000C0575400DA9C9600D392
      8C0056402F0056402F0056402F0056402F0056402F0056402F0056402F005640
      2F008E3F3C00873634007F2E2C00522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBF4EF00F7E9DE00F3DECE00F0D4BF0028983100EAC1A400A68F
      7E0089736300916347006C473400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A411D00CB4B
      1D00B82A00000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000C0575400E7ABA500E0A1
      9C00D7979100CF8E8800C7837F00BC757000B56C6800AD645E00A65A56009E50
      4D00964744008E3F3C0087363400522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBF4EF00F7E9DE00F3DECE00F0D4BF00EECAB100EAC1
      A40089736300A6785B006C473400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1592B00E970
      3E00C0441900C044190000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000C0575400EBB0AA00E7AB
      A500E0A19C00D7979100CF8E8800C7837F00C07A7500B8706C00B1686400AA5E
      5A009E504D00964744008E3F3C00522A1B008973630089736300897363008973
      63008973630089736300897363008973630089736300897363006C4734006C47
      340089736300B5876A006C473400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009A41
      1D00E9703E00B82A000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000C0575400EBB0AA00EBB0
      AA00B8484100B8484100B8484100B8484100B8484100B8484100B8484100B848
      4100B8484100A1555100994C4800522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF4EF00F7E9DE00F3DECE00F0D4
      BF0089736300C79A7D006C4734000000000000000000B54F1C00801C0000801C
      0000801C0000801C0000801C0000801C00000000000000000000000000009A41
      1D00E9703E00D1592B00C4552B00000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000C0575400EBB0AA00B848
      4100F8F2EF00F3E9E300EEE0D900E9D9CF00E5D1C600E0CABC00DCC2B400D8BB
      AB00D8BBAB00B8484100A1555100522A1B000000000089736300897363008973
      6300897363008973630089736300897363008973630089736300897363008973
      6300CFA384007B6859006C4734000000000000000000B54F1C00E9703E00E970
      3E00E9703E00E9703E00801C0000000000000000000000000000000000009A41
      1D00E9703E00D1592B00B82A0000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000000000000000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FBF6F400F6EDE900F0E3DE00EBDCD400E6D5CA00E2CEC100DEC6
      B800D9BFAF00B8484100AA5E5A00522A1B0000000000C2929200C2929200FFFF
      FF00FFFFFF00FCFBFA00F8F6F300F4F0ED00F2EDE900EFE9E300EDE3DE006C47
      340092786700CFA384006C4734000000000000000000B54F1C00E9703E00DE76
      4800DD724300D96B3C00801C0000000000000000000000000000000000009A41
      1D00E9703E00D1592B00B82A000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000008000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3DE00EBDCD400E6D5CA00E2CE
      C100DEC6B800B8484100B1686400522A1B00000000000000000000000000C292
      9200FFFFFF00C5A69600C5A69600C5A69600C5A69600C5A69600EFE9E3006C47
      34006C4734006C4734006C4734000000000000000000B54F1C00E9703E00F39D
      7700DE764800DD724300C4552B00801C00000000000000000000801C0000F39D
      7700E9703E00D1592B00C0441900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3DE00EBDCD400E6D5
      CA00E2CEC100B8484100B8706C00522A1B00000000000000000000000000C292
      9200FFFFFF00FFFFFF00FFFFFF00FCFBFA00F8F6F300F4F0ED00F2EDE900EFE9
      E3006C47340000000000000000000000000000000000B54F1C00F39D7700B54F
      1C00F39D7700DE764900DD734400C5552C00801C0000801C0000F39D7700E970
      3E00E9703E00D1592B00C4552B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000000000000800000000000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3DE00EBDC
      D400E6D5CA00B8484100C47F7900522A1B000000000000000000000000000000
      0000C2929200FFFFFF00C5A69600C5A69600C5A69600C5A69600C5A69600F2ED
      E9006C4734006C473400000000000000000000000000B54F1C00B54F1C000000
      0000B54F1C00F39D7700DE774900DD734400DA6D4000D8683A00D8663700E970
      3E00D1592B00C044190000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000080000000000000000000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3
      DE00EBDCD400B848410000000000522A1B000000000000000000000000000000
      000000000000C2929200FFFFFF00FFFFFF00FFFFFF00FCFBFA00F8F6F300F4F0
      ED00F2EDE9006C473400000000000000000000000000B54F1C00000000000000
      000000000000B54F1C00F39D7700F39D7700F39D7700F39D7700E9703E00C044
      1900C4552B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000080000000800000000000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF6F400F6ED
      E900F0E3DE00B8484100B8706C00522A1B000000000000000000000000000000
      000000000000C2929200C2929200C2929200C2929200C2929200C2929200C292
      9200C2929200C292920000000000000000000000000000000000000000000000
      00000000000000000000F2541900B54F1C00B54F1C00B54F1C00F25419000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0575400C0575400C057
      5400C0575400C0575400C0575400C0575400C0575400C0575400C0575400C057
      5400C0575400C0575400C0575400C05754000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000800080008000800080808000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000000000FFFFFF0000000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000000000000000000008080
      800080808000FF000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C0C0C000808080000000000000000000000000000000
      0000000000008000800080008000FFFFFF00FFFFFF00C0C0C000808080000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000FFFFFF0000FFFF00000000000000000000000000FF000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00080808000000000000000000080808000FF00
      0000FF000000FF000000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000000000000000000008000
      800080008000FFFFFF00FFFFFF000000000000000000C0C0C000C0C0C0008080
      80000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF0000FFFF00FFFFFF000000000000000000FF000000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0000FFFF0080808000808080008080
      8000C0C0C000FFFFFF00C0C0C00080808000808080008000800080008000FFFF
      FF00FFFFFF000000000000000000800080008000800000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000FFFF000000000080808000FF000000808080008080
      8000FF000000FF000000FF000000FF00000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0080808000FF000000FF000000FF00
      000080808000FFFFFF00C0C0C000808080008080800080008000FFFFFF000000
      000000000000800080008000800080008000800080008000800000000000C0C0
      C000C0C0C00080808000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000808080008080800080808000FF00
      0000FF000000C0C0C000C0C0C00080808000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0080808000C0C0C00080808000FF00
      000080808000FFFFFF00C0C0C000808080008080800000000000000000008000
      800080008000800080000080800000FFFF008000800080008000800080000000
      0000C0C0C000C0C0C00080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000080808000C0C0C00080808000FF00
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000FF00
      00008080800080808000C0C0C000FFFFFF0080808000FFFFFF00C0C0C0008080
      800080808000FFFFFF00C0C0C000808080008080800080008000800080008000
      8000800080008000800080008000008080008000800080008000800080008000
      800000000000C0C0C000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080800000FFFF00FF00
      0000FF000000FF000000FF000000FF000000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF0000008080
      80008080800080808000C0C0C000FFFFFF0000FFFF0080808000808080008080
      8000C0C0C000FFFFFF00C0C0C000808080000000000080008000FFFFFF008000
      80008000800080008000800080008000800000FFFF0000FFFF00800080008000
      80008000800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000000000008080800000FF
      FF00FF000000FFFFFF00FFFFFF0080808000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF0000008080
      80008080800080808000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0080808000808080008080800080808000000000000000000080008000FFFF
      FF0080008000800080008000800080008000800080000080800000FFFF0000FF
      FF00800080008000800000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FF00
      0000FF000000FFFFFF0000000000000000000000000000000000000000008080
      800000FFFF00FF000000FF000000FF00000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000C0C0
      C0008080800080808000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000000000008000
      8000FFFFFF00800080008000800080008000008080008000800000FFFF0000FF
      FF0080008000800080008000800000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF0000000000000000000000000000000000000000000000C0C0
      C000FF000000FF000000FF00000080808000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800000000000C0C0C000FF000000FF00
      0000FFFFFF00C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000080008000FFFFFF00800080008000800000FFFF0000FFFF0000FFFF008000
      8000800080008000800000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF000000FF00000000000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF008080800080808000808080008080800000000000C0C0C000FF000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      00000000000080008000FFFFFF00800080008000800080008000800080008000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FF000000FF000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000C0C0C000FF00
      0000FF000000C0C0C000FFFFFF00C0C0C0008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000080008000FFFFFF008000800080008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FF000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000C0C0C0000000000000000000000000000000000000000000C0C0
      C000C0C0C000FF000000FF000000FFFFFF00C0C0C00080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF00FEFFFEFF00000000FE7FFE7F00000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      FFF0FFF000000000FFF9FFF900000000C000FEFFFEFFFEFF8000FE7FFE7FFE7F
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000FFF0FFF0FFF08000FFF9FFF9FFF9FFFFC001FFFFFFFFC0078000F0018001
      80038000C07F800180038000803F800180038000801F800180038000800F8001
      80038000C007800180038000E003800180038000F0018001C0078000F8018001
      E38F8000FC018001E38F8000FE01818FE00F8000FF03C38FF01F8000FF87FFA4
      F83FC001FFFFFFF1FFFFFFFFFFFFFFFFF87FFE7FF800FFFFC000FC3FF8008000
      8000F81FF80080008000F00FE00080008000E007E00080008000C003E0008000
      8000800180008000800000008000800080000000800180008000800180038000
      8000C003800380008000E007800700008000F00F800F0000C000F81F800F0000
      F07FFC3FC01F0001FC7FFE7FFFFF07FFFFFFFFFFC001C001FFFF803FC001C001
      000F803FC001C001000F803FC001C00100078000C001C00100078000C001C001
      00038000C001C00100038000C001C00100018000C001C00100018000C001C001
      00078000C001C0010000F000C001C00103F8F801C001C00187F8FC03C003C003
      FF92FE07C007C007FFC7FF0FC00FC00FC001C001FFFFFFFF80008000FC00FFFF
      80008000FC00800380008000FC00800380008000FC0080038000800000008003
      8000800000008003800080000000800380008000003F80038000800000018003
      8000800000018003800080000001800380008000F801800380008000F8018003
      C001C001F8018003FFFFFFFFF801FFFFC001FFFFC001C00180009C0380008000
      80000C038000800080000C038000800080009FFF800080008000FFFF80008000
      80009C038000800080000C038000800080000C038000800080009FFF80008000
      8000FFFF8000800080009C038000800080000C038000800080000C0380008000
      C0019FFFC001C001FFFFFFFFFFFFFFFFFFFFFFFFC001C0010381FE0980008000
      0381F6D6800080000381C31780008000038196D6800080000381BF1980008000
      0001BFFF800080000001FFFF800080008003803F80008000C007B5DF80008000
      C107C5DF80008000C107B5DF80008000E38FC43F80008000E38FFDFF80008000
      FFFFFDFFC001C001FFFFF9FFFFFFFFFFF8FFFE00FC00FFFFF07FFE00FC00FFFF
      F063FE008000807FF241FE000000803FF041FE000000801FF81100000000800F
      FC0300000000C007FE0700000000E003FC3F00010000F001F83F00030001F801
      F03F00070003FC01E23F007F0007FE01E63F007F0007FF01EE3F00FF0007FFFF
      FE7F01FF800FFFFFFEFF03FFF87FFFFFFFFFC000FFFFFFFF80038000800FFF3F
      800380000007FF1F800380000003FF8F800380000001FFC7800380000001FFC3
      800380000001FFE380038000000180E180038000800181E180038000800181E1
      C1FE8000E00180C1E3FE8000E0078001FFF58000F0039003FFF38000F803B807
      FFF18000F803FC1FFFFF8000FFFFFFFFFFFF8001E000FC00FE3F0000E000F800
      F81F0000E000E000E00F0000C000C00080070000800080000003000000008000
      00010000000000000000000000000000000100008000000080010000C0000000
      C0018001E0000001E000C003E0008003F000E001E0008003F803F00CE001C007
      FC0FF81EE003E00FFE3FFC3FE007F83F00000000000000000000000000000000
      000000000000}
  end
  object ilDisabledImages: TImageList
    Left = 299
    Top = 152
    Bitmap = {
      494C01012A002C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000313131003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      18001818180018181800181818001818180000000000C6C6C6006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00313131003131310031313100525252005A5A
      5A00636363006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D60018181800A5A5A500A5A5A500181818009494
      9400B5B5B500CECECE00D6D6D600D6D6D600C6C6C600B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B50031313100ADADAD00ADADAD00313131008484
      84009C9C9C00ADADAD00B5B5B500B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00A5A5A50018181800DEDE
      DE00DEDEDE00D6D6D6008484840084848400A5A5A500A5A5A500181818004242
      42004A4A4A004A4A4A005252520052525200BDBDBD00FFFFFF00FFFFFF00BDBD
      BD00BDBDBD0042424200424242008C8C8C00ADADAD00ADADAD00313131003939
      3900393939004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00CECECE00A5A5A500DEDE
      DE00DEDEDE0094949400A5A5A500ADADAD0084848400A5A5A500A5A5A5001818
      18007B7B7B009C9C9C00ADADAD00B5B5B500BDBDBD004A4A4A00FFFFFF00BDBD
      BD00BDBDBD0042424200ADADAD00A5A5A5008C8C8C00ADADAD00ADADAD003131
      31007B7B7B0094949400A5A5A500ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0094949400BDBDBD00C6C6C60084848400A5A5A500A5A5A5001818
      18008484840094949400B5B5B500C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60042424200ADADAD00ADADAD008C8C8C00ADADAD00ADADAD003131
      31007B7B7B008C8C8C009C9C9C00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00A5A5A50018181800DEDE
      DE00DEDEDE009C9C9C00DEDEDE00DEDEDE00D6D6D60084848400A5A5A500A5A5
      A5001818180094949400B5B5B500CECECE00CECECE00FFFFFF00FFFFFF00CECE
      CE00CECECE0042424200B5B5B500B5B5B500B5B5B5008C8C8C00ADADAD00ADAD
      AD0031313100848484009C9C9C00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00CECECE00A5A5A500DEDE
      DE00DEDEDE009C9C9C00DEDEDE00E7E7E700E7E7E70084848400A5A5A500A5A5
      A500181818008C8C8C00ADADAD00CECECE00D6D6D6004A4A4A00FFFFFF00D6D6
      D600D6D6D60042424200BDBDBD00BDBDBD00BDBDBD008C8C8C00ADADAD00ADAD
      AD00313131008484840094949400ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A500DEDEDE00E7E7E700EFEFEF00E7E7E70084848400A5A5
      A500A5A5A500181818009C9C9C00C6C6C600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0042424200C6C6C600C6C6C600BDBDBD00BDBDBD008C8C8C00ADAD
      AD00ADADAD00313131008C8C8C00A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00A5A5A50018181800DEDE
      DE00DEDEDE00A5A5A500D6D6D600E7E7E700EFEFEF00F7F7F70084848400A5A5
      A500A5A5A500181818009C9C9C00B5B5B500E7E7E700FFFFFF00FFFFFF00E7E7
      E700E7E7E70042424200C6C6C600C6C6C600C6C6C600C6C6C6008C8C8C00ADAD
      AD00ADADAD00313131008C8C8C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00CECECE00A5A5A500DEDE
      DE00DEDEDE00DEDEDE00A5A5A500A5A5A500A5A5A500A5A5A5009C9C9C008484
      8400A5A5A500A5A5A500181818006B6B6B00E7E7E7004A4A4A00FFFFFF00E7E7
      E700E7E7E7004242420042424200424242004242420042424200424242008C8C
      8C00ADADAD00ADADAD0031313100393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D6008484
      8400A5A5A500181818001818180084848400C6C6C600EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008C8C
      8C00ADADAD0031313100313131009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      940084848400E7E7E700E7E7E7001818180000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F7008C8C8C00DEDEDE00DEDEDE00313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E700E7E7E700181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C00DEDEDE00DEDEDE00313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00C5C5C500C0C0
      C00091919100D2D2D200D9D9D900DCDCDC00DCDCDC00DCDCDC00DCDCDC00A9A9
      A9008686860086868600868686007D7D7D000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00CACACA00C5C5
      C500919191005353530089898900FFFFFF00FFFFFF00FFFFFF00F0F0F000A9A9
      A9008A8A8A0086868600868686007D7D7D001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      18001818180018181800181818001818180000000000AEAEAE00CFCFCF00CACA
      CA00919191000000000059595900FFFFFF00F8F8F800F0F0F000E1E1E100A9A9
      A900929292008A8A8A00868686007D7D7D00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600CECECE00181818009C9C9C009C9C9C00181818008C8C
      8C00ADADAD00C6C6C600D6D6D600D6D6D600FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600CECECE00181818009C9C9C009C9C9C00181818008C8C
      8C00ADADAD00C6C6C600D6D6D600D6D6D60094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00181818009C9C9C009C9C9C0018181800A5A5
      A500C6C6C600DEDEDE00EFEFEF00EFEFEF0000000000AEAEAE00D5D5D500CFCF
      CF00919191009191910091919100919191009191910091919100919191009191
      910099999900929292008A8A8A007D7D7D00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600848484009C9C9C009C9C9C00181818001818
      180018181800181818001818180018181800FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D60018181800848484009C9C9C009C9C9C00181818001818
      18001818180018181800181818001818180094949400EFEFEF00181818001818
      180018181800EFEFEF0018181800848484009C9C9C009C9C9C00181818001818
      18001818180018181800181818001818180000000000AEAEAE00DCDCDC00D7D7
      D700D2D2D200CDCDCD00C8C8C800C0C0C000A3A3A300C0C0C00092929200A7A7
      A7009F9F9F0099999900929292007D7D7D00FFFFFF00D6D6D600181818001818
      18001818180018181800D6D6D600FFFFFF00848484009C9C9C009C9C9C001818
      18008C8C8C00ADADAD00C6C6C600D6D6D600FFFFFF00D6D6D600181818001818
      180018181800D6D6D600FFFFFF00CECECE00848484009C9C9C009C9C9C001818
      18008C8C8C00ADADAD00C6C6C600D6D6D60094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF008C8C8C00E7E7E700848484009C9C9C009C9C9C001818
      1800A5A5A500C6C6C600DEDEDE00EFEFEF0000000000AEAEAE00DFDFDF00DCDC
      DC00D7D7D700D2D2D200CDCDCD00C8C8C800A3A3A300D5D5D50092929200B1B1
      B100A7A7A7009F9F9F00999999007D7D7D00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00848484009C9C9C009C9C9C001818
      1800848484009C9C9C00BDBDBD00CECECE00FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600848484009C9C9C009C9C9C001818
      1800848484009C9C9C00BDBDBD00CECECE0094949400EFEFEF00181818001818
      180018181800EFEFEF008C8C8C00EFEFEF00848484009C9C9C009C9C9C001818
      180094949400B5B5B500D6D6D600E7E7E70000000000AEAEAE00DFDFDF00DFDF
      DF00C8C8C800A3A3A300A3A3A300A3A3A300BBBBBB00D7D7D700D5D5D5009292
      920092929200ABABAB00A4A4A4007D7D7D00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00CECECE00848484009C9C9C009C9C
      9C00181818008C8C8C00ADADAD00C6C6C600FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600CECECE00848484009C9C9C009C9C
      9C00181818008C8C8C00ADADAD00C6C6C60094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0094949400EFEFEF00E7E7E700848484009C9C9C009C9C
      9C0018181800A5A5A500C6C6C600DEDEDE0000000000AEAEAE00DFDFDF00D7D7
      D700BBBBBB00DADADA00E1E1E100E4E4E400ABABAB00C8C8C800D7D7D700D5D5
      D500A8A8A80092929200ABABAB007D7D7D00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00D6D6D600848484009C9C9C009C9C
      9C0018181800848484009C9C9C00BDBDBD00FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600D6D6D600848484009C9C9C009C9C
      9C0018181800848484009C9C9C00BDBDBD0094949400EFEFEF00181818001818
      180018181800EFEFEF0094949400EFEFEF00EFEFEF00848484009C9C9C009C9C
      9C001818180094949400B5B5B500D6D6D60000000000AEAEAE00DFDFDF00BBBB
      BB00E8E8E800EDEDED00ECECEC00E8E8E800D4D4D400D9D9D900DADADA00D5D5
      D500C8C8C800A4A4A400929292007D7D7D00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00D6D6D600CECECE00848484009C9C
      9C009C9C9C00181818008C8C8C00ADADAD00FFFFFF00D6D6D600FFFFFF00D6D6
      D60018181800D6D6D600FFFFFF00D6D6D600D6D6D600CECECE00848484009C9C
      9C009C9C9C00181818008C8C8C00ADADAD0094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF0094949400EFEFEF00EFEFEF00E7E7E700848484009C9C
      9C009C9C9C0018181800A5A5A500C6C6C60000000000AEAEAE00BBBBBB00E1E1
      E100EFEFEF00F2F2F200EFEFEF00EBEBEB00C9C9C900C3C3C300DADADA00D6D6
      D600CFCFCF00BCBCBC00929292007D7D7D00FFFFFF00D6D6D600FFFFFF001818
      1800FFFFFF0018181800D6D6D600FFFFFF00D6D6D600D6D6D600848484009C9C
      9C009C9C9C0018181800848484009C9C9C00FFFFFF00D6D6D600FFFFFF00FFFF
      FF0018181800D6D6D600FFFFFF00D6D6D600D6D6D600D6D6D600848484009C9C
      9C009C9C9C0018181800848484009C9C9C0094949400EFEFEF00181818001818
      180018181800EFEFEF0094949400EFEFEF00EFEFEF00EFEFEF00848484009C9C
      9C009C9C9C001818180094949400ADADAD0000000000AEAEAE00BBBBBB00E4E4
      E400F1F1F100F3F3F300EFEFEF00EBEBEB00DFDFDF00A2A2A200CFCFCF00D6D6
      D600CFCFCF00BCBCBC00929292007D7D7D00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84009C9C9C009C9C9C0018181800ADADAD00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84009C9C9C009C9C9C0018181800ADADAD0094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF009494940094949400949494008C8C8C008C8C8C008484
      84009C9C9C009C9C9C00181818006363630000000000AEAEAE00DFDFDF00BBBB
      BB00ECECEC00EFEFEF00E3E3E3009A9A9A00DDDDDD0099999900C7C7C700D5D5
      D500C8C8C800AAAAAA00929292007D7D7D00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D6008484
      84009C9C9C00181818001818180084848400FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D6008484
      84009C9C9C0018181800181818008484840094949400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF008484
      84009C9C9C0018181800181818009494940000000000AEAEAE00DFDFDF00EAEA
      EA00BBBBBB00DCDCDC00E0E0E000C0C0C000B1B1B100B4B4B400CDCDCD00C8C8
      C800ADADAD0092929200000000007D7D7D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400E7E7E700E7E7E70018181800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400DEDEDE00DEDEDE00181818009494940094949400949494009494
      94009494940094949400949494009494940094949400949494008C8C8C008C8C
      8C0084848400E7E7E700E7E7E7001818180000000000AEAEAE00DFDFDF00A3A3
      A300E1E1E100BBBBBB00C3C3C300C3C3C300C2C2C200BEBEBE00C0C0C000CBCB
      CB0092929200A3A3A300BCBCBC007D7D7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E700E7E7E700181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400DEDEDE00DEDEDE00181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E700E7E7E7001818180000000000AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000989898009898
      9800989898009898980098989800989898009898980098989800989898009898
      98009898980000000000000000000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C80071717100C8C8C800808080000000000000000000000000000000
      0000B9B9B9009F9F9F009F9F9F00707070007070700070707000707070007070
      70007070700070707000707070000000000000000000BDBDBD00989898009898
      9800989898009898980098989800989898009898980098989800989898009898
      98009898980098989800989898000000000000000000B9B9B900E9E9E900B9B9
      B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9
      B900B9B9B90098989800000000000000000000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E1007B7B7B00C8C8C800808080000000000000000000B9B9B900B9B9
      B900C8C8C800C8C8C800C8C8C800B9B9B9007070700000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00F1F1F100BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC00989898000000000000000000B9B9B900F7F7F700E4E4
      E400E2E2E200E1E1E100BCBCBC007A7A7A00B4B4B400D8D8D800D6D6D600D5D5
      D500B9B9B90098989800000000000000000000000000CFCFCF00FBFBFB006A6A
      6A006A6A6A00F5F5F5006A6A6A006A6A6A00EEEEEE006A6A6A006A6A6A009494
      940091919100868686007B7B7B007777770000000000B9B9B900C8C8C800C8C8
      C800E5E5E500E5E5E500FCFCFC00C8C8C800B9B9B90070707000000000000000
      00000000000000000000000000000000000000000000BDBDBD00F3F3F300F1F1
      F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7E700E5E5E500E3E3
      E300E1E1E100BCBCBC00989898000000000000000000B9B9B900F7F7F700E6E6
      E600E4E4E400E3E3E300E1E1E1007A7A7A00DEDEDE00DCDCDC00DADADA00D7D7
      D700B9B9B90098989800000000000000000000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8
      E8006A6A6A0091919100C8C8C8008080800000000000C8C8C800E5E5E500F5F5
      F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8C800B9B9B900707070000000
      00000000000000000000000000000000000000000000BDBDBD00F3F3F300F3F3
      F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7E700E5E5
      E500E3E3E300BCBCBC00989898000000000000000000B9B9B900F7F7F700E8E8
      E800E6E6E600E4E4E4007A7A7A007A7A7A007A7A7A00DEDEDE00DCDCDC00DADA
      DA00B9B9B90098989800000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FCFCFC00E1E1E100808080006A6A6A009C9C9C006A6A6A006A6A6A00EBEB
      EB00E8E8E80094949400C8C8C8008080800000000000C8C8C800FFFFFF00FAFA
      FA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8C800B9B9B9007070
      70000000000000000000000000000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7
      E700E5E5E500BCBCBC00989898000000000000000000B9B9B900F7F7F700E8E8
      E800E8E8E800E6E6E600CBCBCB007A7A7A00CBCBCB00E0E0E000DEDEDE00DCDC
      DC00B9B9B90098989800000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FEFEFE00A2A2A2006A6A6A00EBEBEB00E4E4E4006A6A6A006A6A6A00EFEF
      EF006A6A6A00E8E8E800C8C8C800808080000000000000000000C8C8C800FFFF
      FF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8C800B9B9
      B9007070700000000000000000000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8
      E800E7E7E700BCBCBC00989898000000000000000000B9B9B900F7F7F700EBEB
      EB00E8E8E800E8E8E800E6E6E600E4E4E400E3E3E300E1E1E100E0E0E000DEDE
      DE00B9B9B90098989800000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00ADADAD006A6A6A00D3D3D300F2F2F2006A6A6A006A6A6A00F1F1
      F1006A6A6A00EDEDED00C8C8C80080808000000000000000000000000000C8C8
      C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8
      C800B9B9B90070707000000000000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EEEEEE00ECECEC00EBEB
      EB00E8E8E800BCBCBC00989898000000000000000000B9B9B900E9E9E900F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700E9E9E90098989800000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF00F5F5F500B4B4B4008A8A8A00717171006A6A6A006A6A6A00F4F4
      F400F1F1F100EFEFEF00C8C8C800808080000000000000000000000000000000
      0000C8C8C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFF
      FF00C8C8C800B9B9B900808080000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EFEFEF00EDED
      ED00EBEBEB00BCBCBC0098989800000000000000000000000000B9B9B900B9B9
      B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9
      B900B9B9B90000000000000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E8E8E8006A6A6A007A7A7A00F6F6
      F6006A6A6A00F1F1F100C8C8C800808080000000000000000000000000000000
      000000000000C8C8C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5
      E500FFFFFF00C8C8C8009F9F9F000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EFEF
      EF00EDEDED00EBEBEB009898980000000000000000000000000000000000B9B9
      B900F7F7F70098989800000000000000000000000000B9B9B900DFDFDF009898
      98000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00828282006A6A6A006A6A6A008A8A8A00D7D7D700F8F8
      F8006A6A6A00F4F4F400C8C8C800808080000000000000000000000000000000
      00000000000000000000C8C8C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEA
      EA00E5E5E500FFFFFF009F9F9F000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD006A6A6A006A6A6A006A6A
      6A006A6A6A00BDBDBD00BDBDBD0000000000000000000000000000000000B9B9
      B900F7F7F70098989800000000000000000000000000B9B9B900DFDFDF009898
      98000000000000000000000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000C8C8C800FFFFFF00FCFCFC00F8F8F800F2F2
      F200FDFDFD00E5E5E500B9B9B9000000000000000000BDBDBD00F4F4F400F4F4
      F400F4F4F400F4F4F400BDBDBD0000000000000000006A6A6A00C9C9C9006A6A
      6A0000000000000000000000000000000000000000000000000000000000B9B9
      B900F7F7F700E9E9E900989898009898980098989800DFDFDF00DFDFDF009898
      98000000000000000000000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF006A6A6A006A6A6A00FFFFFF006A6A6A006A6A6A00FFFFFF006A6A
      6A006A6A6A00F9F9F900C8C8C800808080000000000000000000000000000000
      000000000000000000000000000000000000C8C8C800FFFFFF00FCFCFC00FDFD
      FD00E5E5E500B9B9B90000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD000000000000000000000000006A6A6A006A6A6A00A2A2
      A200000000000000000000000000000000000000000000000000000000000000
      0000B9B9B900F7F7F700F7F7F700F7F7F700F7F7F700DFDFDF00989898000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F900808080000000000000000000000000000000
      00000000000000000000000000000000000000000000C8C8C800C8C8C800C8C8
      C800C8C8C8000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006A6A6A00000000006A6A
      6A00A2A2A20000000000A2A2A2006A6A6A000000000000000000000000000000
      000000000000B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006A6A6A006A6A6A006A6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D0071717100717171007171710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000959595007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009D9D9D007171
      710071717100969696009A9A9A00999999007171710071717100717171007171
      7100717171007171710071717100717171000000000000000000000000000000
      0000000000000000000080808000F5F5F500F5F5F50080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000095959500FFFFFF00C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8007A7A7A0000000000959595007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A00000000009D9D9D0095959500A3A3
      A300A2A2A200A0A0A0009F9F9F009B9B9B0071717100C5C5C500C5C5C500C5C5
      C500C5C5C500C5C5C500C5C5C500717171000000000000000000000000000000
      00000000000080808000F5F5F5006A6A6A006A6A6A00F5F5F500808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000095959500FFFFFF00FFFFFF00FFFFFF00FBFBFB00F7F7F700F2F2
      F200EEEEEE00E9E9E900C8C8C8007A7A7A000000000095959500FAFAFA00C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8007A7A7A00000000009D9D9D00A8A8A800A6A6
      A600A4A4A400A3A3A300A0A0A0009C9C9C007171710068686800686868006868
      68006A6A6A007E7E7E00C5C5C500717171000000000000000000000000000000
      000080808000F5F5F5006A6A6A00B5B5B500AEAEAE006A6A6A00F5F5F5008080
      8000000000000000000000000000000000000000000000000000000000009595
      95007A7A7A0095959500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F7F7
      F700F2F2F200EEEEEE00C8C8C8007A7A7A000000000095959500FCFCFC00FAFA
      FA00F7F7F700F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E7E7E700E5E5
      E500E5E5E500E1E1E100C8C8C8007A7A7A00000000009D9D9D00A9A9A900A9A9
      A900A6A6A6009F9F9F009D9D9D009C9C9C00717171006C6C6C00686868006868
      68007D7D7D008A8A8A00C5C5C500717171000000000000000000000000008080
      8000F5F5F5006A6A6A00BDBDBD00BDBDBD00BDBDBD00BDBDBD006A6A6A00F5F5
      F500808080000000000000000000000000000000000000000000000000009595
      9500FFFFFF0095959500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00F7F7F700F2F2F200C8C8C8007A7A7A000000000095959500FFFFFF00FCFC
      FC00FAFAFA00F7F7F700F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E7E7
      E700E7E7E700E5E5E500C8C8C8007A7A7A00000000009D9D9D00ABABAB00AAAA
      AA00ACACAC00D7D7D7009D9D9D009898980071717100747474006C6C6C007878
      78009292920092929200C5C5C50071717100000000000000000080808000F6F6
      F6006A6A6A00C3C3C300FFFFFF00FFFFFF00FFFFFF00FFFFFF009D9D9D006A6A
      6A00F5F5F5008080800000000000000000000000000000000000000000009595
      9500FFFFFF0095959500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00F7F7F700F2F2F2007A7A7A000000000095959500FFFFFF00FFFF
      FF00FCFCFC00FAFAFA00F7F7F700F4F4F400F1F1F100EFEFEF00EDEDED00EAEA
      EA00EAEAEA00E7E7E700C8C8C8007A7A7A00000000009D9D9D00ACACAC00ABAB
      AB00D7D7D700F8F8F800D7D7D70099999900717171007C7C7C00777777008A8A
      8A009A9A9A0090909000C5C5C500717171000000000080808000F5F5F5006A6A
      6A00D2D2D200CECECE00C3C3C300FFFFFF00FFFFFF009D9D9D00B5B5B500AEAE
      AE006A6A6A00F5F5F500808080000000000000000000959595007A7A7A009595
      9500FFFFFF00959595007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A000000000095959500FFFFFF00FFFF
      FF00FFFFFF00FCFCFC00FAFAFA00F7F7F700F4F4F400F1F1F100EFEFEF00EDED
      ED00EDEDED00EAEAEA00C8C8C8007A7A7A00000000009D9D9D00AEAEAE00ADAD
      AD00AEAEAE00D7D7D700ADADAD009F9F9F007171710082828200A0A0A000BCBC
      BC008E8E8E00BCBCBC00C5C5C500717171006A6A6A00FAFAFA008E8E8E00DCDC
      DC00D6D6D600D2D2D200CECECE00FFFFFF00FFFFFF009D9D9D00BABABA00B5B5
      B500AEAEAE006A6A6A00F5F5F500808080000000000095959500FFFFFF009595
      9500FFFFFF0091919100B7B7B700B7B7B700B7B7B700B7B7B700DEDEDE00B7B7
      B700DEDEDE00B7B7B700B6B6B6007A7A7A000000000095959500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F8F8F800F4F4F400F1F1F100EFEF
      EF00EFEFEF00EDEDED00C8C8C8007A7A7A00000000009D9D9D00B1B1B100B0B0
      B000ADADAD00ACACAC00ABABAB00A1A1A100717171009E9E9E00D6D6D600D6D6
      D600D6D6D600D6D6D600C5C5C500717171006A6A6A00FEFEFE008E8E8E00DCDC
      DC00DCDCDC00D6D6D600D2D2D200FFFFFF00FFFFFF009D9D9D00BDBDBD00BABA
      BA00B5B5B5006A6A6A00F5F5F500808080000000000095959500FFFFFF009595
      9500FFFFFF00FFFFFF0095959500959595009595950095959500959595009595
      9500959595009595950095959500000000000000000095959500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F8F8F800F6F6F600F3F3
      F300F3F3F300F0F0F000C8C8C8007A7A7A00000000009D9D9D00B2B2B200B1B1
      B100B0B0B000ADADAD00ACACAC00A1A1A10071717100D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600C5C5C50071717100000000006A6A6A00FCFCFC008E8E
      8E00DCDCDC00DCDCDC00FFFFFF00FFFFFF00FFFFFF009D9D9D00C3C3C300BDBD
      BD006A6A6A00F5F5F50080808000000000000000000095959500FFFFFF009595
      95007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A0000000000000000000000000095959500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F8F8F800F6F6
      F600F6F6F600F3F3F300C8C8C8007A7A7A00000000009D9D9D00B4B4B400B3B3
      B300B1B1B100B0B0B000ADADAD00A3A3A30071717100D6D6D600D6D6D600D6D6
      D600CFCFCF00CDCDCD00C5C5C5007171710000000000000000006A6A6A00FEFE
      FE008E8E8E00DCDCDC00DCDCDC00BDBDBD00BDBDBD00CECECE00C3C3C3006A6A
      6A00F5F5F5008080800000000000000000000000000095959500FFFFFF009191
      9100B7B7B700B7B7B700B7B7B700B7B7B700DEDEDE00B7B7B700DEDEDE00B7B7
      B700B6B6B6007A7A7A0000000000000000000000000095959500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F8F8
      F800F8F8F800F6F6F600C8C8C8007A7A7A00000000009D9D9D00B5B5B500B5B5
      B500B4B4B400B2B2B200B1B1B100A4A4A40071717100D6D6D600D6D6D600CFCF
      CF00D5D5D500CDCDCD00C5C5C500717171000000000000000000000000006A6A
      6A00FFFFFF008E8E8E00DCDCDC00FFFFFF00FFFFFF009D9D9D006A6A6A00F5F5
      F500808080000000000000000000000000000000000095959500FFFFFF00FFFF
      FF00959595009595950095959500959595009595950095959500959595009595
      95009595950000000000000000000000000094949400F0F0F00094949400F0F0
      F00094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFB
      FB00FBFBFB00F8F8F800F6F6F6007A7A7A00000000009D9D9D00B4B4B400B5B5
      B500B5B5B500B4B4B400B2B2B200A4A4A40071717100D6D6D600CFCFCF00D9D9
      D900D9D9D900D5D5D500C5C5C500717171000000000000000000000000000000
      00006A6A6A00FEFEFE008E8E8E00FFFFFF00FFFFFF006A6A6A00F5F5F5008080
      80000000000000000000000000000000000000000000959595007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A0000000000000000000000000000000000F0F0F000BDBDBD00EAEAEA00BDBD
      BD00F0F0F0007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A000000000000000000A9A9A9009D9D
      9D00ABABAB00ABABAB00AFAFAF00A4A4A400717171009D9D9D009D9D9D009D9D
      9D009D9D9D009D9D9D009D9D9D009D9D9D000000000000000000000000000000
      0000000000006A6A6A00FCFCFC008E8E8E008E8E8E00F5F5F500808080000000
      0000000000000000000000000000000000000000000091919100B7B7B700B7B7
      B700B7B7B700B7B7B700DEDEDE00B7B7B700DEDEDE00B7B7B700B6B6B6007A7A
      7A000000000000000000000000000000000094949400EAEAEA00FEFEFE00EAEA
      EA0094949400B7B7B700B7B7B700B7B7B700B7B7B700DEDEDE00B7B7B700DEDE
      DE00B7B7B700B6B6B600B7B7B700959595000000000000000000000000000000
      0000A9A9A9009D9D9D00ABABAB00ABABAB007171710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00FEFEFE00FAFAFA0080808000000000000000
      0000000000000000000000000000000000000000000000000000959595009595
      9500959595009595950095959500959595009595950095959500959595000000
      000000000000000000000000000000000000F0F0F000BDBDBD00EAEAEA00BDBD
      BD00F0F0F0009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500000000000000000000000000000000000000
      00000000000000000000A9A9A9009D9D9D009D9D9D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006A6A6A006A6A6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400F0F0F00094949400F0F0
      F000949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C8008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800F1F1
      F100C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C8008080800000000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0000000000000000000BDBDBD0098989800989898009898
      9800989898009898980098989800989898009898980098989800989898009898
      9800000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800F4F4
      F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5E500E3E3E300E1E1
      E100E1E1E100C8C8C8008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00FFFFFF00C0C0C0000000000000000000BDBDBD00BDBDBD00C6C6C600BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC009898
      9800000000000000000000000000000000000000000080808000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800F6F6
      F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5E500E3E3
      E300E1E1E100C8C8C8008080800000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00C0C0C0000000000000000000BDBDBD00BDBDBD00D8D8D800E6E6
      E600E4E4E400E1E1E100DEDEDE00DBDBDB00D9D9D900D6D6D600D4D4D400BCBC
      BC00989898000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800F8F8
      F800F6F6F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5
      E500E3E3E300C8C8C8008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000C0C0C000FFFF
      FF00FFFFFF00C0C0C0000000000000000000BDBDBD00E6E6E600BDBDBD00E4E4
      E400E6E6E600E5E5E500E1E1E100DFDFDF00DCDCDC00DADADA00D7D7D700D2D2
      D200989898000000000000000000000000000000000080808000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000C8C8C800FAFA
      FA00F8F8F800F6F6F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8
      E800E5E5E500C8C8C8008080800000000000000000000000000080808000FFFF
      FF0000FFFF00C0C0C00080000000FF000000800000008000000000000000C0C0
      C00000FFFF00C0C0C0000000000000000000BDBDBD00EDEDED00BDBDBD00DADA
      DA00E8E8E800E7E7E700E4E4E400E1E1E100DFDFDF00DCDCDC00DADADA00D7D7
      D700BCBCBC009898980000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000C8C8C800FDFD
      FD00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEA
      EA00E8E8E800C8C8C8008080800000000000000000000000000080808000FFFF
      FF00FFFFFF0080808000FF000000FF00000000800000FF000000800000008000
      0000FFFFFF00C0C0C0000000000000000000BDBDBD00F0F0F000E6E6E600BDBD
      BD00E4E4E400E8E8E800E6E6E600E4E4E400E1E1E100DFDFDF00DCDCDC00DADA
      DA00D2D2D2009898980000000000000000000000000080808000FFFFFF008080
      800080808000FFFFFF000000000000000000000000000000000080000000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000C8C8C800FFFF
      FF00FDFDFD00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1F100EFEFEF00EDED
      ED00EAEAEA00C8C8C8008080800000000000000000000000000080808000FFFF
      FF0000FFFF0080800000C0C0C000808080000080000080800000FF0000008000
      000000FFFF00C0C0C0000000000000000000BDBDBD00F3F3F300F0F0F000BDBD
      BD00DADADA00E7E7E700E8E8E800E7E7E700E5E5E500E1E1E100DFDFDF00DCDC
      DC00D8D8D800BCBCBC0098989800000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F5F5F500F2F2F200F0F0
      F000EEEEEE00C8C8C8008080800000000000000000000000000080808000FFFF
      FF00FFFFFF0080800000FFFFFF00C0C0C0000080000080000000FF0000008000
      0000FFFFFF00C0C0C0000000000000000000BDBDBD00F4F4F400F3F3F300E6E6
      E600BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00808080008000000080000000FFFF
      FF000000800000008000C0C0C000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F5F5F500F2F2
      F200F0F0F000C8C8C8008080800000000000000000000000000080808000FFFF
      FF0000FFFF0080800000C0C0C00080800000FF00000080800000008000008080
      800000FFFF00C0C0C0000000000000000000BDBDBD00F4F4F400F4F4F400F3F3
      F300E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600BDBDBD000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000800000008000C0C0C000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F5F5
      F500C8C8C800C8C8C8008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00C0C0C0008080000080808000808000000080000080800000C0C0
      C000FFFFFF00C0C0C0000000000000000000BDBDBD00F4F4F400F4F4F400F4F4
      F400F3F3F300E6E6E600BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD006A6A6A006A6A6A006A6A6A006A6A6A000000000000000000000000000000
      000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900C8C8
      C80080808000808080008080800000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00C0C0C000808000008080000080800000C0C0C000FFFF
      FF0000FFFF00C0C0C0000000000000000000BDBDBD00F4F4F400F4F4F400F4F4
      F400F4F4F400BDBDBD0000000000000000000000000000000000000000000000
      0000000000006A6A6A00C9C9C9006A6A6A000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00C8C8
      C800F4F4F400E1E1E1008080800000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000A2A2A2006A6A6A006A6A6A000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00C8C8
      C800E1E1E100808080000000000000000000000000000000000080808000FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006A6A6A00A2A2A2000000
      0000A2A2A2006A6A6A00000000006A6A6A000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C8
      C80080808000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006A6A6A006A6A
      6A006A6A6A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800808080000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C800808080000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000CFCFCF00FBFBFB00F9F9
      F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00C6C6C6006A6A
      6A006A6A6A00B3B3B300F2F2F200F0F0F0006A6A6A006A6A6A006A6A6A00E6E6
      E6006A6A6A00E1E1E100C8C8C800808080000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000CFCFCF00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400C8C8C8008080800000000000CFCFCF00FCFCFC00D7D7
      D7008F8F8F00EDEDED00F5F5F500F2F2F200E5E5E5006A6A6A00EBEBEB006A6A
      6A006A6A6A006A6A6A00C8C8C800808080000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00F8F8F800F5F5F500F2F2F200F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00E0E0E00098989800F7F7F700F5F5F500F2F2F2006A6A6A00EEEEEE00EBEB
      EB006A6A6A00E6E6E600C8C8C800808080008080000080800000808000008080
      0000808000008080000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE00CBCBCB006A6A6A006A6A6A006A6A6A006A6A6A00F1F1F100EFEF
      EF006A6A6A00E8E8E800C8C8C8008080800080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00AEAEAE00CCCCCC00F8F8F8006A6A6A00F4F4F400F1F1
      F1006A6A6A00EDEDED00C8C8C8008080800080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080000000FFFFFF008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000CFCFCF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB0095959500E1E1E1006A6A6A00F6F6F600F4F4
      F4006A6A6A00EFEFEF00C8C8C8008080800080800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080800000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F4F4F400909090006A6A6A00F8F8F800F6F6
      F6006A6A6A00F1F1F100C8C8C800808080008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6E6E6006D6D6D00FAFAFA006A6A
      6A006A6A6A006A6A6A00C8C8C8008080800080800000FFFFFF00808000008080
      0000808000008080000080800000808000008080000080800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0D000FCFCFC00FAFA
      FA006A6A6A00F6F6F600C8C8C800808080008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C800808080000000000000000000000000000000
      00000000000080800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080800000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F9008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F900808080000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000FFFFFF008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000000000000000
      00000000000080800000FFFFFF00808000008080000080800000808000008080
      0000808000008080000080800000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C80080808000000000006A6A6A00707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C800808080008E8E8E00AFAFAF009F9F9F007070
      7000000000000000000000000000A9A9A900A9A9A900A9A9A900A2A2A2009595
      95008080800000000000000000000000000000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00FBFBFB00F9F9
      F9006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A00E1E1E100C8C8C80080808000A2A2A200DBDBDB00AFAFAF006A6A
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FBFBFB00F9F9
      F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00FBFBFB00F9F9
      F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8
      E800E6E6E600E4E4E400C8C8C8008080800000000000A2A2A2008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400C8C8C8008080800000000000CFCFCF00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00EBEBEB00A5A5A500777777006A6A6A0076767600A7A7A700E2E2
      E200E8E8E800E6E6E600C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00F8F8F800F5F5F500F2F2F200F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00F8F8F800F5F5F500F2F2F200F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE008A8A8A006A6A6A00BDBDBD00F1F1F100EFEFEF00B3B3B3009898
      9800EBEBEB00E8E8E800C8C8C80080808000000000006A6A6A00707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00EBEBEB00E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE00000000000000000000000000000000000000000000000000EFEF
      EF00EBEBEB00E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00F8F8F800F8F8F800F6F6F600EDEDED006A6A
      6A00EFEFEF00EDEDED00C8C8C800808080008E8E8E00AFAFAF009F9F9F007070
      7000000000000000000000000000A9A9A900A9A9A900A9A9A900A2A2A2009595
      95008080800000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FCFCFC00FAFAFA00F8F8F800F6F6F6006A6A
      6A00F1F1F100EFEFEF00C8C8C80080808000A2A2A200DBDBDB00AFAFAF006A6A
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FEFEFE00FCFCFC00FAFAFA00F8F8F8006A6A
      6A00F4F4F400F1F1F100C8C8C8008080800000000000A2A2A2008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FFFFFF00FEFEFE00FCFCFC00FAFAFA006A6A
      6A00F6F6F600F4F4F400C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800F6F6F600F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000F8F8
      F800F6F6F600F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00F8F8F8006A6A6A006A6A6A00F7F7F700FFFFFF00FEFEFE00F6F6F6006A6A
      6A00F0F0F000F6F6F600C8C8C80080808000000000006A6A6A00707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF006A6A6A006A6A6A006A6A6A006A6A6A00FFFFFF00FFFFFF006A6A6A006A6A
      6A006A6A6A00F9F9F900C8C8C800808080008E8E8E00AFAFAF009F9F9F007070
      7000000000000000000000000000A9A9A900A9A9A900A9A9A900A2A2A2009595
      95008080800000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F90080808000A2A2A200DBDBDB00AFAFAF006A6A
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F9008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F900808080000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF000000000000000000A2A2A2008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080008080800000000000AEAEAE00A9A9A900969696008F8F
      8F007A7A7A007A7A7A00000000000000000000000000AEAEAE00A9A9A9009696
      96008F8F8F007A7A7A007A7A7A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C80080808000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900A9A9A9007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900A9A9A9007A7A7A00000000000000000000000000000000000000
      00006A6A6A000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000007F7F7F0000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C80080808000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900B0B0B0007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900B0B0B0007A7A7A000000000000000000000000006A6A6A006A6A
      6A006A6A6A006A6A6A0000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000000000000000000000CFCFCF00FBFBFB00F9F9
      F9006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006D6D6D00A4A4A400DEDE
      DE00E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00FBFBFB00F9F9
      F900DFDFDF006A6A6A006A6A6A006A6A6A006A6A6A00DCDCDC00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C80080808000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900B0B0B0007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900B0B0B0007A7A7A0000000000000000006A6A6A009E9E9E000000
      00006A6A6A000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000007F7F7F0000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F9006A6A6A006A6A6A00ECECEC00F0F0F000CCCCCC006A6A6A007070
      7000E6E6E600E4E4E400C8C8C8008080800000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F900F1F1F100909090006A6A6A00DADADA00EEEEEE00EBEBEB00E8E8
      E800E6E6E600E4E4E400C8C8C80080808000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900B0B0B0007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900B0B0B0007A7A7A0000000000000000006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F000000000000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC006A6A6A006A6A6A00F5F5F500F2F2F200F0F0F0006A6A6A006A6A
      6A00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00B7B7B7006A6A6A00C8C8C800F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C80080808000AEAEAE009F9F9F009F9F9F008B8B
      8B008B8B8B007A7A7A007A7A7A007B7B7B00AEAEAE009F9F9F009F9F9F008B8B
      8B008B8B8B007A7A7A007A7A7A0000000000000000006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE006A6A6A006A6A6A00F8F8F800F6F6F600D7D7D7006A6A6A009D9D
      9D00EBEBEB00E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE00FCFCFC00D1D1D1006A6A6A00ADADAD00F4F4F400F1F1F100EFEF
      EF00EBEBEB00E8E8E800C8C8C80080808000DCDCDC00AEAEAE00E9E9E900E9E9
      E900C7C7C700A9A9A9007A7A7A009F9F9F00AEAEAE00E9E9E900E9E9E900C7C7
      C700A9A9A9007A7A7A009D9D9D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A00ACACAC00E9E9
      E900EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00E8E8E8006A6A6A008B8B8B00F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C8008080800000000000AEAEAE00FFFFFF00F2F2
      F200E5E5E500A9A9A9007A7A7A00C4C4C400AEAEAE00FFFFFF00F2F2F200E5E5
      E500A9A9A9009D9D9D0000000000000000000000000000000000000000000000
      000000000000000000007E7E7E009B9B9B009B9B9B009B9B9B00000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FCFCFC00EFEFEF00B0B0B00071717100C6C6
      C600F1F1F100EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB006A6A6A006A6A6A00F4F4F400F6F6F600F4F4
      F400F1F1F100EFEFEF00C8C8C800808080000000000000000000AEAEAE009F9F
      9F00969696007A7A7A007A7A7A009F9F9F00AEAEAE009F9F9F00969696007A7A
      7A007A7A7A000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E000000000000000000000000009B9B9B000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FEFEFE00FCFCFC00F9F9F9006A6A6A007171
      7100F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E8E8E006A6A6A00DCDCDC00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C800808080000000000000000000AEAEAE00FCFC
      FC00DCDCDC00A9A9A9007A7A7A0000000000AEAEAE00FCFCFC00DCDCDC00A9A9
      A9007A7A7A000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E000000000000000000000000009B9B9B000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FFFFFF00FEFEFE00D6D6D6006A6A6A007171
      7100F6F6F600F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2C2C2006A6A6A00AEAEAE00F9F9F900F8F8
      F800F6F6F600F4F4F400C8C8C800808080000000000000000000AEAEAE009F9F
      9F00969696007A7A7A009F9F9F0000000000AEAEAE009F9F9F00969696007A7A
      7A009F9F9F000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E000000000000000000000000009B9B9B000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006D6D6D00AEAEAE00F0F0
      F000F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D2D2D2006A6A6A006A6A6A006A6A6A0084848400FAFA
      FA00F8F8F800F6F6F600C8C8C80080808000000000000000000000000000AEAE
      AE00FCFCFC007A7A7A00000000000000000000000000AEAEAE00FCFCFC007A7A
      7A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E009B9B9B009B9B9B009B9B9B00000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C80080808000000000000000000000000000AEAE
      AE00AEAEAE009F9F9F00000000000000000000000000AEAEAE00AEAEAE009F9F
      9F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F9008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F900808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7E007E7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8B006A6A6A006A6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      00000000000000000000D1D1D100808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF008B8B8B008B8B8B008B8B8B006A6A6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00F1F1F100EDEDED00EAEAEA00E6E6
      E600E1E1E100DEDEDE00DEDEDE007B7B7B000000000000000000000000000000
      00000000000000000000D1D1D100F2F2F200CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF008B8B8B00AFAFAF00C7C7C7006A6A6A0000000000000000008B8B
      8B008B8B8B008282820000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00F5F5F500F1F1F100EDEDED00EAEA
      EA00E8E8E800E4E4E400E0E0E0007B7B7B00000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00D1D1D100F6F6F600F2F2F200EFEFEF00EBEBEB00E9E9
      E900E6E6E600E2E2E200CECECE00808080000000000080808000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF008B8B8B0000000000C7C7C7006A6A6A00000000008B8B8B008B8B
      8B00828282008282820082828200000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00FAFAFA00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200E4E4E4007B7B7B00B9B9B900E6E6E600BABABA00BABA
      BA00BABABA00BABABA00D1D1D100FAFAFA00B8B8B800B8B8B800B8B8B800B8B8
      B800B8B8B800E6E6E600CECECE00808080000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF00C7C7C70082828200828282006A6A6A00000000008B8B8B00AFAF
      AF00C7C7C700828282006A6A6A00000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00FFFFFF00FBFBFB00F7F7F700F3F3
      F300EFEFEF00ECECEC00E8E8E8007B7B7B00B9B9B900E9E9E900E6E6E600E3E3
      E300E0E0E000DDDDDD00D1D1D100FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0
      F000EDEDED00E9E9E900CECECE00808080000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AFAFAF00C7C7C700828282006A6A6A006A6A6A008B8B8B000000
      0000AFAFAF00828282006A6A6A0000000000D6D6D60092929200929292009292
      9200929292009292920092929200CCCCCC00FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200ECECEC007B7B7B00B9B9B900ECECEC00E9E9E900E6E6
      E600E3E3E300E0E0E000D1D1D100FFFFFF00B8B8B800B8B8B800B8B8B800B8B8
      B800B8B8B800EDEDED00CECECE0080808000000000008080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AFAFAF007A7A7A00878787006A6A6A008B8B8B008282
      82006A6A6A006A6A6A000000000000000000D6D6D600F2F2F200EFEFEF00EBEB
      EB00E8E8E800E4E4E400E1E1E100CCCCCC00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00F7F7F700F3F3F300EFEFEF007B7B7B00B9B9B900EFEFEF00ECECEC00E9E9
      E900E6E6E600E3E3E300D1D1D100FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8
      F800F4F4F400F0F0F000CECECE0080808000000000000000000000000000C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF0000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099999900C8C8C800969696006A6A6A006A6A
      6A008B8B8B00000000000000000000000000D6D6D600F6F6F600F2F2F200EFEF
      EF00EBEBEB00E9E9E900E6E6E600CCCCCC00FFFFFF00B2B2B200B2B2B200FFFF
      FF00CCCCCC008D8D8D008D8D8D008D8D8D00B9B9B900EFEFEF00EFEFEF00ECEC
      EC00E9E9E900E6E6E600D1D1D100FFFFFF00B8B8B800B8B8B800B8B8B800FBFB
      FB00F8F8F800CFCFCF0080808000808080000000000000000000000000000000
      0000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900DEDEDE00D2D2D20099999900000000000000
      000000000000000000000000000000000000D6D6D600FAFAFA00CBCBCB00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CCCCCC00F4F4F4008D8D8D0000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF00ECECEC00E9E9E900D1D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00CFCFCF00FFFFFF00808080000000000000000000000000000000
      000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      0000808080008080800080808000000000000000000000000000000000000000
      00000000000099999900E5E5E50099999900E1E1E10099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00FBFBFB00F8F8
      F800F4F4F400F0F0F000EDEDED00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CCCCCC009D9D9D000000000000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00ECECEC00D1D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CFCFCF0080808000000000000000000000000000000000000000
      00000000000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00000000008080800000000000000000000000000000000000000000000000
      000099999900F0F0F00099999900BDBDBD00EBEBEB0099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00CBCBCB00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00000000000000000000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00D1D1D100D1D1D100D1D1D100D1D1D100D1D1D100D1D1
      D100D1D1D100D1D1D10000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00808080000000000000000000000000000000000000000000BDBD
      BD00FFFFFF009999990000000000BDBDBD00F0F0F00099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00F8F8F800F4F4F400F0F0F0008080800000000000000000000000
      000000000000000000000000000000000000B9B9B900EFEFEF00EFEFEF009999
      99007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00BABA
      BA007F7F7F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000C0C0C0000000000000000000000000000000000000000000BDBD
      BD00999999000000000000000000BDBDBD00F6F6F60099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00CBCBCB00CBCB
      CB00FFFFFF00D6D6D60080808000808080008080800000000000000000000000
      000000000000000000000000000000000000B9B9B900EFEFEF00EFEFEF009999
      9900EFEFEF00E1E1E1007F7F7F00E1E1E100D7D7D700BDBDBD007F7F7F00BABA
      BA007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      000000000000808080008080800000000000000000000000000000000000BDBD
      BD00000000000000000000000000BDBDBD00FFFFFF0099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6D6D600F4F4F400808080000000000000000000000000000000
      000000000000000000000000000000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF0099999900EFEFEF007F7F7F007F7F7F00E1E1E1007F7F7F00DFDFDF00DFDF
      DF007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD009999990000000000000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6D6D60080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9B9B900B9B9B900B9B9
      B900B9B9B90099999900EFEFEF00EFEFEF007F7F7F00B9B9B900B9B9B900B9B9
      B900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00C5C5C500C0C0
      C00091919100D2D2D200D9D9D900DCDCDC00DCDCDC00DCDCDC00DCDCDC00A9A9
      A9008686860086868600868686007D7D7D000000000099999900999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000909090007C7C7C00000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000AEAEAE00CACACA00C5C5
      C500919191005353530089898900FFFFFF00FFFFFF00FFFFFF00F0F0F000A9A9
      A9008A8A8A0086868600868686007D7D7D00B9B9B900FFFFFF00C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900999999000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949494009D9D9D007C7C7C000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000AEAEAE00CFCFCF00CACA
      CA00919191000000000059595900FFFFFF00F8F8F800F0F0F000E1E1E100A9A9
      A900929292008A8A8A00868686007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00F5F5F500F1F1F100ECECEC00E8E8E8007B7B7B00DFDFDF00C9C9
      C900999999009999990000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000949494009E9E9E007C7C
      7C00000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000AEAEAE00D5D5D500CFCF
      CF00919191009191910091919100919191009191910091919100919191009191
      910099999900929292008A8A8A007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB00F5F5F500F1F1F100ECECEC00B5B5B500E3E3E300C9C9
      C900B9B9B900ADADAD0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009D9D
      9D007C7C7C000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000AEAEAE00DCDCDC00D7D7
      D700D2D2D200CDCDCD00C8C8C800C0C0C000BABABA00B4B4B400AEAEAE00A7A7
      A7009F9F9F0099999900929292007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB00F5F5F500F1F1F100ECECEC00E8E8E800E3E3
      E300B9B9B900BCBCBC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A9A9A900B8B8
      B800989898009898980000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000AEAEAE00DFDFDF00DCDC
      DC00D7D7D700D2D2D200CDCDCD00C8C8C800C2C2C200BCBCBC00B7B7B700B1B1
      B100A7A7A7009F9F9F00999999007D7D7D00B9B9B900B9B9B900B9B9B900B9B9
      B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900999999009999
      9900B9B9B900C4C4C40099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B8B8B8007C7C7C0000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000AEAEAE00DFDFDF00DFDF
      DF00A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300ABABAB00A4A4A4007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F5F5F500F1F1F100ECEC
      EC00B9B9B900CFCFCF009999990000000000000000009D9D9D006A6A6A006A6A
      6A006A6A6A006A6A6A006A6A6A006A6A6A000000000000000000000000009494
      9400B8B8B800A9A9A900A5A5A500000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000AEAEAE00DFDFDF00A3A3
      A300FAFAFA00F6F6F600F2F2F200EFEFEF00ECECEC00E8E8E800E5E5E500E1E1
      E100E1E1E100A3A3A300ABABAB007D7D7D0000000000B9B9B900B9B9B900B9B9
      B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9
      B900D4D4D400B1B1B1009999990000000000000000009D9D9D00B8B8B800B8B8
      B800B8B8B800B8B8B8006A6A6A00000000000000000000000000000000009494
      9400B8B8B800A9A9A9007C7C7C00000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000000000000000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0F000EDEDED00EAEAEA00E6E6
      E600E2E2E200A3A3A300B1B1B1007D7D7D0000000000CFCFCF00CFCFCF00FFFF
      FF00FFFFFF00FEFEFE00FBFBFB00F9F9F900F8F8F800F6F6F600F4F4F4009999
      9900BCBCBC00D4D4D4009999990000000000000000009D9D9D00B8B8B800BCBC
      BC00B9B9B900B4B4B4006A6A6A00000000000000000000000000000000009494
      9400B8B8B800A9A9A9007C7C7C0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000008000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0F000EDEDED00EAEA
      EA00E6E6E600A3A3A300B7B7B7007D7D7D00000000000000000000000000CFCF
      CF00FFFFFF00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700F6F6F6009999
      990099999900999999009999990000000000000000009D9D9D00B8B8B800D2D2
      D200BCBCBC00B9B9B900A5A5A5006A6A6A0000000000000000006A6A6A00D2D2
      D200B8B8B800A9A9A90098989800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0F000EDED
      ED00EAEAEA00A3A3A300BCBCBC007D7D7D00000000000000000000000000CFCF
      CF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F9F9F900F8F8F800F6F6
      F60099999900000000000000000000000000000000009D9D9D00D2D2D2009D9D
      9D00D2D2D200BCBCBC00B9B9B900A5A5A5006A6A6A006A6A6A00D2D2D200B8B8
      B800B8B8B800A9A9A900A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000000000000800000000000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0
      F000EDEDED00A3A3A300C5C5C5007D7D7D000000000000000000000000000000
      0000CFCFCF00FFFFFF00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700F8F8
      F80099999900999999000000000000000000000000009D9D9D009D9D9D000000
      00009D9D9D00D2D2D200BCBCBC00B9B9B900B5B5B500B2B2B200B1B1B100B8B8
      B800A9A9A9009898980000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000080000000000000000000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4
      F400F0F0F000A3A3A300000000007D7D7D000000000000000000000000000000
      000000000000CFCFCF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F9F9
      F900F8F8F800999999000000000000000000000000009D9D9D00000000000000
      0000000000009D9D9D00D2D2D200D2D2D200D2D2D200D2D2D200B8B8B8009898
      9800A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008000000080000000800000000000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8
      F800F4F4F400A3A3A300BCBCBC007D7D7D000000000000000000000000000000
      000000000000CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF0000000000000000000000000000000000000000000000
      00000000000000000000A4A4A4009D9D9D009D9D9D009D9D9D00A4A4A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000800080008000800080808000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000000000FFFFFF0000000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000000000000000000008080
      800080808000FF000000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF00FFFFFF00C0C0C000808080000000000000000000000000000000
      0000000000008000800080008000FFFFFF00FFFFFF00C0C0C000808080000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000FFFFFF0000FFFF00000000000000000000000000FF000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00080808000000000000000000080808000FF00
      0000FF000000FF000000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000000000000000000008000
      800080008000FFFFFF00FFFFFF000000000000000000C0C0C000C0C0C0008080
      80000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF0000FFFF00FFFFFF000000000000000000FF000000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0000FFFF0080808000808080008080
      8000C0C0C000FFFFFF00C0C0C00080808000808080008000800080008000FFFF
      FF00FFFFFF000000000000000000800080008000800000000000C0C0C000C0C0
      C000808080000000000000000000000000000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000FFFF000000000080808000FF000000808080008080
      8000FF000000FF000000FF000000FF00000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000080808000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0080808000FF000000FF000000FF00
      000080808000FFFFFF00C0C0C000808080008080800080008000FFFFFF000000
      000000000000800080008000800080008000800080008000800000000000C0C0
      C000C0C0C00080808000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000808080008080800080808000FF00
      0000FF000000C0C0C000C0C0C00080808000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000FF00
      0000FF000000FF000000C0C0C000FFFFFF0080808000C0C0C00080808000FF00
      000080808000FFFFFF00C0C0C000808080008080800000000000000000008000
      800080008000800080000080800000FFFF008000800080008000800080000000
      0000C0C0C000C0C0C00080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000080808000C0C0C00080808000FF00
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000FF00
      00008080800080808000C0C0C000FFFFFF0080808000FFFFFF00C0C0C0008080
      800080808000FFFFFF00C0C0C000808080008080800080008000800080008000
      8000800080008000800080008000008080008000800080008000800080008000
      800000000000C0C0C000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080800000FFFF00FF00
      0000FF000000FF000000FF000000FF000000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF0000008080
      80008080800080808000C0C0C000FFFFFF0000FFFF0080808000808080008080
      8000C0C0C000FFFFFF00C0C0C000808080000000000080008000FFFFFF008000
      80008000800080008000800080008000800000FFFF0000FFFF00800080008000
      80008000800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000000000008080800000FF
      FF00FF000000FFFFFF00FFFFFF0080808000FF00000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF0000008080
      80008080800080808000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0080808000808080008080800080808000000000000000000080008000FFFF
      FF0080008000800080008000800080008000800080000080800000FFFF0000FF
      FF00800080008000800000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FF00
      0000FF000000FFFFFF0000000000000000000000000000000000000000008080
      800000FFFF00FF000000FF000000FF00000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FF000000FF000000C0C0
      C0008080800080808000C0C0C000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000000000008000
      8000FFFFFF00800080008000800080008000008080008000800000FFFF0000FF
      FF0080008000800080008000800000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF0000000000000000000000000000000000000000000000C0C0
      C000FF000000FF000000FF00000080808000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800000000000C0C0C000FF000000FF00
      0000FFFFFF00C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000080008000FFFFFF00800080008000800000FFFF0000FFFF0000FFFF008000
      8000800080008000800000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF000000FF00000000000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF008080800080808000808080008080800000000000C0C0C000FF000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      00000000000080008000FFFFFF00800080008000800080008000800080008000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FF000000FF000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000C0C0C000FF00
      0000FF000000C0C0C000FFFFFF00C0C0C0008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000080008000FFFFFF008000800080008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FF000000000000000000000000000000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000C0C0C0000000000000000000000000000000000000000000C0C0
      C000C0C0C000FF000000FF000000FFFFFF00C0C0C00080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF00FEFFFEFF00000000FE7FFE7F00000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      FFF0FFF000000000FFF9FFF900000000C000FEFFFEFFFEFF8000FE7FFE7FFE7F
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000FFF0FFF0FFF08000FFF9FFF9FFF9FFFFC001FFFFFFFFC0078000F0018001
      80038000C07F800180038000803F800180038000801F800180038000800F8001
      80038000C007800180038000E003800180038000F0018001C0078000F8018001
      E38F8000FC018001E38F8000FE01818FE00F8000FF03C38FF01F8000FF87FFA4
      F83FC001FFFFFFF1FFFFFFFFFFFFFFFFF87FFE7FF800FFFFC000FC3FF8008000
      8000F81FF80080008000F00FE00080008000E007E00080008000C003E0008000
      8000800180008000800000008000800080000000800180008000800180038000
      8000C003800380008000E007800700008000F00F800F0000C000F81F800F0000
      F07FFC3FC01F0001FC7FFE7FFFFF07FFFFFFFFFFC001C001FFFF803FC001C001
      000F803FC001C001000F803FC001C00100078000C001C00100078000C001C001
      00038000C001C00100038000C001C00100018000C001C00100018000C001C001
      00078000C001C0010000F000C001C00103F8F801C001C00187F8FC03C003C003
      FF92FE07C007C007FFC7FF0FC00FC00FC001C001FFFFFFFF80008000FC00FFFF
      80008000FC00800380008000FC00800380008000FC0080038000800000008003
      8000800000008003800080000000800380008000003F80038000800000018003
      8000800000018003800080000001800380008000F801800380008000F8018003
      C001C001F8018003FFFFFFFFF801FFFFC001FFFFC001C00180009C0380008000
      80000C038000800080000C038000800080009FFF800080008000FFFF80008000
      80009C038000800080000C038000800080000C038000800080009FFF80008000
      8000FFFF8000800080009C038000800080000C038000800080000C0380008000
      C0019FFFC001C001FFFFFFFFFFFFFFFFFFFFFFFFC001C0010381FE0980008000
      0381F6D6800080000381C31780008000038196D6800080000381BF1980008000
      0001BFFF800080000001FFFF800080008003803F80008000C007B5DF80008000
      C107C5DF80008000C107B5DF80008000E38FC43F80008000E38FFDFF80008000
      FFFFFDFFC001C001FFFFF9FFFFFFFFFFF8FFFE00FC00FFFFF07FFE00FC00FFFF
      F063FE008000807FF241FE000000803FF041FE000000801FF81100000000800F
      FC0300000000C007FE0700000000E003FC3F00010000F001F83F00030001F801
      F03F00070003FC01E23F007F0007FE01E63F007F0007FF01EE3F00FF0007FFFF
      FE7F01FF800FFFFFFEFF03FFF87FFFFFFFFFC000FFFFFFFF80038000800FFF3F
      800380000007FF1F800380000003FF8F800380000001FFC7800380000001FFC3
      800380000001FFE380038000000180E180038000800181E180038000800181E1
      C1FE8000E00180C1E3FE8000E0078001FFF58000F0039003FFF38000F803B807
      FFF18000F803FC1FFFFF8000FFFFFFFFFFFF8001E000FC00FE3F0000E000F800
      F81F0000E000E000E00F0000C000C00080070000800080000003000000008000
      00010000000000000000000000000000000100008000000080010000C0000000
      C0018001E0000001E000C003E0008003F000E001E0008003F803F00CE001C007
      FC0FF81EE003E00FFE3FFC3FE007F83F00000000000000000000000000000000
      000000000000}
  end
  object ilStatusBarImages: TImageList
    Left = 264
    Top = 184
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B9B9B900808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A006A6A6A006A6A6A006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900E3E3E3009D9D9D009D9D9D0080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A008E8E8E00AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900FFFFFF00DFDFDF00CCCCCC009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A0091919100AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900FFFFFF00E1E1E100CFCFCF009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A0096969600AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900FFFFFF00E1E1E100CFCFCF009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A009A9A9A00AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B900C6C6C600C6C6C600C6C6C6009D9D9D00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A009F9F9F00AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8B8B800D3D3D300DADADA00E0E0E000CECECE00C1C1C100B8B8B8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A4A4A400AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B800E5E5E500ECECEC00DADADA00EBEBEB00D9D9D900E8E8E800E5E5E500B8B8
      B800000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A006A6A6A008E8E8E006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00DEDE
      DE00EFEFEF00EEEEEE00DEDEDE00ECECEC00E5E5E500E1E1E100E8E8E800DCDC
      DC00CACACA000000000000000000000000000000000000000000000000000000
      000000000000C9C9C90098989800989898009898980098989800989898000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCBCBC00F1F1
      F100F1F1F100F0F0F000DFDFDF00ECECEC00E7E7E700DFDFDF00E8E8E800E8E8
      E800BCBCBC00000000000000000000000000000000006C6C6C006C6C6C006C6C
      6C0000000000C9C9C900EDEDED00EDEDED00EDEDED00EDEDED00989898000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F5F5
      F500F2F2F200F2F2F200EFEFEF00E8E8E800ECECEC00EAEAEA00EBEBEB00E8E8
      E800B8B8B8000000000000000000000000000000000000000000000000000000
      000000000000C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCBCBC00F6F6
      F600FCFCFC00FFFFFF00FEFEFE00F5F5F500EFEFEF00EDEDED00ECECEC00EAEA
      EA00BCBCBC000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00EBEB
      EB00FFFFFF00FFFFFF00FFFFFF00FCFCFC00EFEFEF00EEEEEE00ECECEC00E3E3
      E300CACACA000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B800F5F5F500FFFFFF00FEFEFE00F8F8F800F1F1F100EFEFEF00E3E3E300B8B8
      B800000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8B8B800EBEBEB00F7F7F700F4F4F400F2F2F200EBEBEB00B8B8B8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00A5A5A500AFAFAF006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CACACA00BCBCBC00B8B8B800BCBCBC00CACACA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A006A6A6A006A6A6A006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010151000101510001015
      1000101510001015100010151000101510001015100010151000101510001015
      1000101510001015100010151000000000000000000000000000000000000000
      00000000000000000000A08C7D00694731006947310069473100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000983000009830000098300000000000000000
      0000000000000000000000000000000000000000000040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000000000005593560099D6A8003D6F3E003D6F
      3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F3E003D6F
      3E003D6F3E003D6F3E003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00D5CDC800856757008567570069473100694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000C8600000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00DDDDDD00959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009595950095959500959595004040400055935600A2D9AE0099D6A80090D3
      A10087D09A007ECE940074CB8D006BC8860061C57F0058C278004EBF71004ABE
      6D0040BB66003CBA63003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00FFFFFF00D7C3C300C2A6A40085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000CC640000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00DFDFDF00DDDDDD00DADA
      DA00D7D7D700D5D5D500D2D2D200CFCFCF00CCCCCC00C8C8C800C5C5C500C3C3
      C300C0C0C000C0C0C000959595004040400055935600ABDCB500A2D9AE00B7A2
      9300694731006947310069473100694731006947310069473100694731006947
      31004ABE6D0040BB66003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00FFFFFF00DAC6C600C4A9A80085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000D26C0000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E2E2E200DFDFDF00C8C8
      C800808080008080800080808000808080008080800080808000808080008080
      8000C3C3C300C0C0C000959595004040400055935600B4DFBC00ABDCB500B7A2
      9300FFF0E900FFECE300FFE9DE00FFE5D800FFE1D200FFDECD00FFDECD006947
      310053C174004ABE6D003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00FFFFFF00DAC6C600C4A9A80085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000D8730000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E5E5E500E2E2E200C8C8
      C800F7F7F700F5F5F500F3F3F300F1F1F100EFEFEF00EDEDED00EDEDED008080
      8000C7C7C700C3C3C300959595004040400055935600BDE1C200B8E0BF00B7A2
      9300FFF4EF00BE927E00BE927E00BE927E00BE927E00BE927E00FFDFCF006947
      31005DC47B0053C174003D6F3E00101510000000000000000000000000000000
      000000000000A08C7D00BA9B9800BA9B9800BA9B980085675700694731000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000DF7B0000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E6E6E600C8C8
      C800F9F9F900BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00EDEDED008080
      8000CACACA00C7C7C700959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFF9F600FFF4EF00FFF2EC00FFEEE600FFEAE000FFE7DB00FFE3D5006947
      310066C782005DC47B003D6F3E00101510000000000000000000000000000000
      0000A9878300C7B3A700D5BDB400DFC7C000C5AAA100B4978A00A98783000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E7830000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FCFCFC00F9F9F900F8F8F800F6F6F600F4F4F400F2F2F200EFEFEF008080
      8000CDCDCD00CACACA00959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00BE927E00BE927E00BE927E00BE927E00BE927E00FFE7DB006947
      310070CA8A0066C782003D6F3E0010151000000000000000000000000000A987
      8300E5D1C200F3DECE00D4BEAF00F4DCCB00D5BDAD00F2D7C400EBD1BE00A987
      8300000000000000000000000000000000000000000000000000000000000000
      000000000000000000009830000098300000C860000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00F2F2F2008080
      8000D1D1D100CDCDCD00959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00FFFFFF00FFFBF900FFF6F200FFF2EC00FFEEE600FFEAE0006947
      310079CC910070CA8A003D6F3E00101510000000000000000000A4A6A100D3C6
      B800F5E2D500F5E1D400DAC6B800F3DECE00E9D2C200E4CBBB00F1D6C300DBC3
      B100A4A6A1000000000000000000000000000000000000000000000000000000
      0000000000003098F80000609000006090000060900000609000006090000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00FFFFFF00FDFDFD00FAFAFA00F8F8F800F6F6F600F4F4F4008080
      8000D3D3D300D1D1D100959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00BE927E00BE927E00BE927E00BE927E00BE927E00FFEEE6006947
      310082CF970079CC91003D6F3E0010151000000000000000000099918900F6E6
      DB00F6E6DA00F6E5D900DBC8BC00EFDED000E5D5C900DFC7B800F2D8C700F4D8
      C500999189000000000000000000000000000000000033333300333333003333
      3300000000003098F80001FFFF0001FFFF0001FFFF0001FFFF00006090000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00F6F6F6008080
      8000D6D6D600D3D3D300959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF900FFF6F200FFF2EC006947
      31008BD29E0082CF97003D6F3E00101510000000000000000000A9878300F9EE
      E400F6E8DE00F7E9DF00F2E3D800E5D6CB00EFDDD000EFDACA00F2DBCA00F1D7
      C500A98783000000000000000000000000000000000000000000000000000000
      0000000000003098F8003098F8003098F8003098F8003098F8003098F8000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FAFAFA00F8F8F8008080
      8000D9D9D900D6D6D600959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00BE927E00BE927E00BE927E00BE927E00BE927E00FFF6F2006947
      310099D6A80090D3A1003D6F3E0010151000000000000000000099918900FAEF
      E800FCF9F700FFFFFF00FEFEFD00F8EDE500F5E3D600F4E0D100F3DDCC00F3DA
      C900999189000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00FAFAFA008080
      8000DDDDDD00DADADA00959595004040400055935600C1E3C500C1E3C500B7A2
      9300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF9006947
      3100A2D9AE0099D6A8003D6F3E00101510000000000000000000A4A6A100F2DB
      CB00FFFFFF00FFFFFF00FFFFFF00FDFAF800F5E4D800F4E1D400F3DECF00E6CE
      BD00A4A6A1000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD008080
      8000DFDFDF00DDDDDD00959595004040400055935600C1E3C500C1E3C500B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300ABDCB500A2D9AE003D6F3E0010151000000000000000000000000000A987
      8300F9EEE400FFFFFF00FEFEFE00FAF1EB00F6E6DB00F5E3D600E6CEBD00A987
      8300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800E2E2E200DFDFDF00959595004040400055935600C1E3C500C1E3C500C1E3
      C500C1E3C500C1E3C500C1E3C500C1E3C500C1E3C500C1E3C500C1E3C500BDE1
      C200B4DFBC00ABDCB500A2D9AE00101510000000000000000000000000000000
      0000A9878300F2DBCB00FAF0EA00F7EBE100F7E8DD00F2DBCB00A98783000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000E8860000F898000098300000000000000000
      000000000000000000000000000000000000ADADAD00E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E5E5E500E2E2E200DFDFDF00404040000000000055935600559356005593
      5600559356005593560055935600559356005593560055935600559356005593
      5600559356005593560055935600000000000000000000000000000000000000
      000000000000A4A6A10099918900A987830099918900A4A6A100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098300000983000009830000098300000000000000000
      00000000000000000000000000000000000000000000ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD0000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC3FFC3F00000000F81FEC3700000000
      F81FFC3F00000000F81FFC3F00000000F81FFC3F00000000F81FCC3300000000
      F01FFC3F00000000E00FFC3F00000000C007F81F00000000C007881100000000
      C007F81F00000000C007FC3F00000000C007FC3F00000000E00F0C3000000000
      F01FFC3F00000000F83FFC3F000000008001FC3FFC3F80010000F81FEC370000
      0000F81FFC3F00000000F81FFC3F00000000F81FFC3F00000000F81FCC330000
      0000F01FFC3F00000000E00FFC3F00000000C007F81F00000000C00788110000
      0000C007F81F00000000C007FC3F00000000C007FC3F00000000E00F0C300000
      0000F01FFC3F00008001F83FFC3F800100000000000000000000000000000000
      000000000000}
  end
  object FindDialog: TFindDialog
    Options = [frHideUpDown]
    OnFind = FindOne
    Left = 88
    Top = 184
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = FindOne
    OnReplace = ReplaceOne
    Left = 48
    Top = 184
  end
end
