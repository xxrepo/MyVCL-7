object EBarMegaDemoMainForm: TEBarMegaDemoMainForm
  Left = 248
  Top = 130
  Width = 801
  Height = 588
  Caption = 'ExpressBars Mega Demo'
  Color = clBtnFace
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 256
    Width = 793
    Height = 298
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter: TSplitter
      Left = 137
      Top = 0
      Height = 298
      MinSize = 40
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 137
      Height = 298
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object Image: TImage
        Left = 55
        Top = 254
        Width = 10
        Height = 10
        AutoSize = True
        Picture.Data = {
          07544269746D6170C6000000424DC60000000000000076000000280000000A00
          00000A0000000100040000000000500000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFCFFFFFFF000000FC40000FFF0000003C04CCCC4F000000334CC884C400
          0000384C4FFFFF000000F3BCCCCCC4000000FF3BCFF4C4000000FFF3BCCC4F00
          0000FFFFCCC4FC000000FFFFFFFCCF000000}
        Transparent = True
      end
      object dxSideBar: TdxSideBar
        Left = 0
        Top = 0
        Width = 137
        Height = 298
        Align = alClient
        BkGround.BeginColor = clSilver
        BkGround.EndColor = clGray
        BkGround.FillStyle = bfsHorz
        CanSelected = True
        GroupFont.Charset = DEFAULT_CHARSET
        GroupFont.Color = clWindowText
        GroupFont.Height = -11
        GroupFont.Name = 'MS Sans Serif'
        GroupFont.Style = []
        Groups = <
          item
            Caption = 'ExpressBars'
            Index = 0
            Items = <
              item
                Caption = 'MS Office Style'
                Index = 0
                LargeImage = 1
                SmallImage = 1
                StoredItem = dxSideBarStoreItem1
                Tag = 1
              end
              item
                Caption = 'Internet Explorer Style'
                Index = 1
                LargeImage = 0
                SmallImage = 0
                StoredItem = dxSideBarStoreItem2
                Tag = 2
              end
              item
                Caption = 'DataBase'
                Index = 2
                LargeImage = 2
                SmallImage = 2
                StoredItem = dxSideBarStoreItem3
                Tag = 3
              end>
          end>
        ActiveGroupIndex = 0
        GroupPopupMenu = dxSideBarPopupMenu
        ItemFont.Charset = DEFAULT_CHARSET
        ItemFont.Color = clWhite
        ItemFont.Height = -11
        ItemFont.Name = 'MS Sans Serif'
        ItemFont.Style = []
        ItemPopupMenu = dxSideBarPopupMenu
        LargeImages = LargeImage
        SmallImages = SmallImage
        Store = dxSideBarStore
        TransparentImages = True
        OnItemClick = dxSideBarItemClick
      end
    end
    object Panel2: TPanel
      Left = 140
      Top = 0
      Width = 653
      Height = 298
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Nb: TNotebook
        Left = 0
        Top = 0
        Width = 653
        Height = 272
        Align = alClient
        PageIndex = 1
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Clear'
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'MS Office'
          object PanelRE: TPanel
            Left = 0
            Top = 0
            Width = 653
            Height = 272
            Align = alClient
            BevelOuter = bvNone
            Caption = 'PanelRE'
            TabOrder = 0
            object Editor: TRichEdit
              Left = 0
              Top = 0
              Width = 653
              Height = 272
              Align = alClient
              Lines.Strings = (
                'Editor')
              TabOrder = 0
              OnChange = EditorChange
              OnSelectionChange = EditorSelectionChange
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'IE'
          object HTMLPanel: TPanel
            Left = 0
            Top = 0
            Width = 608
            Height = 332
            Align = alClient
            BevelOuter = bvNone
            Caption = 'HTMLPanel'
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DataBase'
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 608
            Height = 332
            Align = alClient
            DataSource = EBarMegaDemoMainDM.dsContacts
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CustName'
                Title.Caption = 'Customer Name'
                Width = 121
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Company'
                Width = 119
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'City'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'product'
                Title.Caption = 'Product'
                Width = 171
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PurchaseDate'
                Width = 96
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PaymentType'
                Width = 97
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PaymentAmount'
                Width = 103
                Visible = True
              end>
          end
        end
      end
      object dxBDStatus: TdxBarDockControl
        Left = 0
        Top = 272
        Width = 653
        Height = 26
        Align = dalBottom
        AllowDocking = False
        BarManager = BarManager
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
    end
  end
  object dxSideBarStore: TdxSideBarStore
    Categories.Strings = (
      'Express Bars')
    DefaultLargeImage = -1
    DefaultSmallImage = -1
    LargeImages = LargeImage
    SmallImages = SmallImage
    Left = 400
    Top = 224
    object dxSideBarStoreItem1: TdxStoredSideItem
      Tag = 1
      Caption = 'MS Office Style'
      Category = 0
      Enabled = True
      LargeImage = 1
      SmallImage = 1
    end
    object dxSideBarStoreItem2: TdxStoredSideItem
      Tag = 2
      Caption = 'Internet Explorer Style'
      Category = 0
      Enabled = True
      LargeImage = 0
      SmallImage = 0
    end
    object dxSideBarStoreItem3: TdxStoredSideItem
      Tag = 3
      Caption = 'DataBase'
      Category = 0
      Enabled = True
      LargeImage = 2
      SmallImage = 2
    end
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
        FloatLeft = 595
        FloatTop = 425
        FloatClientWidth = 391
        FloatClientHeight = 22
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarSubItemFile
            Visible = True
          end
          item
            Item = dxFilter
            Visible = True
          end
          item
            Item = dxBarSubItemEdit
            Visible = True
          end
          item
            Item = dxIEView
            Visible = True
          end
          item
            Item = dxGo
            Visible = True
          end
          item
            Item = dxFavorites
            Visible = True
          end
          item
            Item = dxBarSubItemFormat
            Visible = True
          end
          item
            Item = dxOptions
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
        DockedTop = 28
        DockingStyle = dsTop
        FloatLeft = 520
        FloatTop = 455
        FloatClientWidth = 202
        FloatClientHeight = 22
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
        DockedTop = 68
        DockingStyle = dsTop
        FloatLeft = 573
        FloatTop = 502
        FloatClientWidth = 389
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarComboFontName
            Visible = True
          end
          item
            Item = dxBarComboFontSize
            UserDefine = [udWidth]
            UserWidth = 118
            Visible = True
          end
          item
            BeginGroup = True
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
        OneOnRow = True
        Row = 2
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Colors'
        DockedDockingStyle = dsTop
        DockedLeft = 383
        DockedTop = 28
        DockingStyle = dsTop
        FloatLeft = 556
        FloatTop = 495
        FloatClientWidth = 100
        FloatClientHeight = 19
        ItemLinks = <
          item
            Item = dxBarComboFontColor
            UserDefine = [udWidth]
            UserWidth = 81
            Visible = True
          end>
        OneOnRow = False
        Row = 1
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Internet Buttons'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 108
        DockingStyle = dsTop
        FloatLeft = 599
        FloatTop = 402
        FloatClientWidth = 334
        FloatClientHeight = 40
        ItemLinks = <
          item
            Item = dxBackBtn
            Visible = True
          end
          item
            Item = dxForwardBtn
            Visible = True
          end
          item
            Item = dxStopBtn
            Visible = True
          end
          item
            Item = dxRefreshBtn
            Visible = True
          end
          item
            Item = dxHomeBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxSearchBtn
            Visible = True
          end>
        OneOnRow = True
        Row = 3
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'Links'
        DockedDockingStyle = dsTop
        DockedLeft = 298
        DockedTop = 148
        DockingStyle = dsTop
        FloatLeft = 561
        FloatTop = 474
        FloatClientWidth = 329
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxLinks
            Visible = True
          end
          item
            Item = dxProductsBtn
            Visible = True
          end
          item
            Item = dxDownloadsBtn
            Visible = True
          end
          item
            Item = dxFORUMBtn
            Visible = True
          end>
        OneOnRow = False
        Row = 4
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Address'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 148
        DockingStyle = dsTop
        FloatLeft = 396
        FloatTop = 286
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxAddressCombo
            UserDefine = [udWidth]
            UserWidth = 184
            Visible = True
          end>
        OneOnRow = False
        Row = 4
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'Filter'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 188
        DockingStyle = dsTop
        FloatLeft = 337
        FloatTop = 470
        FloatClientWidth = 622
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxCityCombo
            Visible = True
          end
          item
            Item = dxProductsCombo
            Visible = True
          end
          item
            Item = dxDate
            Visible = True
          end
          item
            Item = dxTypeCombo
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxClearBtn
            Visible = True
          end>
        OneOnRow = True
        Row = 5
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        Caption = 'DB Navigator'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 228
        DockingStyle = dsTop
        FloatLeft = 492
        FloatTop = 388
        FloatClientWidth = 230
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarDBNavFirst1
            Visible = True
          end
          item
            Item = dxBarDBNavPrev1
            Visible = True
          end
          item
            Item = dxBarDBNavNext1
            Visible = True
          end
          item
            Item = dxBarDBNavLast1
            Visible = True
          end
          item
            Item = dxBarDBNavInsert1
            Visible = True
          end
          item
            Item = dxBarDBNavDelete1
            Visible = True
          end
          item
            Item = dxBarDBNavEdit1
            Visible = True
          end
          item
            Item = dxBarDBNavPost1
            Visible = True
          end
          item
            Item = dxBarDBNavCancel1
            Visible = True
          end
          item
            Item = dxBarDBNavRefresh1
            Visible = True
          end>
        OneOnRow = True
        Row = 6
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'Status Bar'
        DockControl = dxBDStatus
        DockedDockControl = dxBDStatus
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 438
        FloatTop = 637
        FloatClientWidth = 23
        FloatClientHeight = 22
        Hidden = True
        ItemLinks = <
          item
            Item = dxBSPosition
            Visible = True
          end
          item
            Item = dxBSStatus
            Visible = True
          end
          item
            Item = dxBarProgress
            Visible = True
          end
          item
            Item = dxBSIEStatus
            Visible = True
          end>
        Name = 'Status Bar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        UseOwnFont = False
        UseRecentItems = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'File'
      'Edit'
      'Menus'
      'Options and Help'
      'Internet Buttons'
      'Links'
      'Filter'
      'Address'
      'View'
      'Format'
      'Go'
      'Status'
      'DB Navigator')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
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
      True
      True
      True
      True
      True
      True
      True)
    HotImages = ilHotImages
    DisabledLargeImages = ilDisabledImages
    LargeImages = Images
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = False
    Left = 176
    Top = 264
    DockControlHeights = (
      0
      0
      256
      0)
    object dxBarButtonNew: TdxBarLargeButton
      Tag = 1
      Caption = '&New'
      Category = 0
      Hint = 'New'
      Visible = ivAlways
      OnClick = dxBarButtonNewClick
      HotImageIndex = 16
      LargeImageIndex = 16
    end
    object dxBarButtonOpen: TdxBarLargeButton
      Tag = 1
      Caption = '&Open...'
      Category = 0
      Hint = 'Open'
      Visible = ivAlways
      ShortCut = 16463
      OnClick = dxBarButtonOpenClick
      HotImageIndex = 17
      LargeImageIndex = 17
    end
    object dxBarButtonClose: TdxBarLargeButton
      Tag = 1
      Caption = '&Close'
      Category = 0
      Hint = 'Close'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888880000000000000888033333333333088803333333333
        3088803333333333308880333333333330888033333333333088803333333333
        308880333333333330888700000000000788880FFF0888888884888000888888
        8884888888888888484888888888888844888888888888884448}
      OnClick = dxBarButtonCloseClick
      HotImageIndex = 29
      LargeImageIndex = 29
    end
    object dxBarButtonSave: TdxBarLargeButton
      Tag = 1
      Caption = '&Save'
      Category = 0
      Hint = 'Save'
      Visible = ivAlways
      ShortCut = 16467
      OnClick = dxBarButtonSaveClick
      HotImageIndex = 18
      LargeImageIndex = 18
    end
    object dxBarButtonSaveAs: TdxBarLargeButton
      Tag = 1
      Caption = 'Save &As...'
      Category = 0
      Hint = 'Save As'
      Visible = ivAlways
      OnClick = dxBarButtonSaveAsClick
      HotImageIndex = 30
      LargeImageIndex = 30
    end
    object dxBarSubItemFile: TdxBarSubItem
      Caption = '&File'
      Category = 2
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
          Item = dxBarButtonExit
          Visible = True
        end>
    end
    object dxBarSubItemEdit: TdxBarSubItem
      Tag = 1
      Caption = '&Edit'
      Category = 2
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
      Tag = 1
      Caption = '&Format'
      Category = 2
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
          BeginGroup = True
          Item = dxBarComboFontColor
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonURLDetection
          Visible = True
        end>
    end
    object dxBarButtonPrint: TdxBarLargeButton
      Tag = 1
      Caption = '&Print...'
      Category = 0
      Hint = 'Print'
      Visible = ivAlways
      OnClick = dxBarButtonPrintClick
      HotImageIndex = 19
      LargeImageIndex = 19
    end
    object dxBarButtonExit: TdxBarLargeButton
      Caption = 'E&xit'
      Category = 0
      Hint = 'Exit'
      Visible = ivAlways
      ShortCut = 32856
      OnClick = dxBarButtonExitClick
      HotImageIndex = 31
      LargeImageIndex = 31
    end
    object dxBarButtonUndo: TdxBarLargeButton
      Tag = 1
      Caption = '&Undo'
      Category = 1
      Hint = 'Undo'
      Visible = ivAlways
      ShortCut = 16474
      OnClick = dxBarButtonUndoClick
      HotImageIndex = 4
      LargeImageIndex = 4
    end
    object dxBarButtonCut: TdxBarLargeButton
      Tag = 1
      Caption = 'Cu&t'
      Category = 1
      Hint = 'Cut'
      Visible = ivAlways
      ShortCut = 16472
      OnClick = dxBarButtonCutClick
      HotImageIndex = 5
      LargeImageIndex = 5
    end
    object dxBarButtonCopy: TdxBarLargeButton
      Tag = 1
      Caption = '&Copy'
      Category = 1
      Hint = 'Copy'
      Visible = ivAlways
      ShortCut = 16451
      OnClick = dxBarButtonCopyClick
      HotImageIndex = 6
      LargeImageIndex = 6
    end
    object dxBarButtonPaste: TdxBarLargeButton
      Tag = 1
      Caption = '&Paste'
      Category = 1
      Hint = 'Paste'
      Visible = ivAlways
      ShortCut = 16470
      OnClick = dxBarButtonPasteClick
      HotImageIndex = 7
      LargeImageIndex = 7
    end
    object dxBarButtonClear: TdxBarLargeButton
      Tag = 1
      Caption = 'Cle&ar'
      Category = 1
      Hint = 'Clear'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888700000078888888808888880088
        8888808888880708888887088888077088888808F8F8F077088888808F8F8F07
        7088888808F8F8F077788888808F8F8F070888888808F8F8F708888888808F8F
        8808888888887000077888888888888888888888888888888888}
      OnClick = dxBarButtonClearClick
      HotImageIndex = 8
      LargeImageIndex = 8
    end
    object dxBarButtonSelectAll: TdxBarLargeButton
      Tag = 1
      Caption = 'Select A&ll'
      Category = 1
      Hint = 'Select All'
      Visible = ivAlways
      ShortCut = 16449
      OnClick = dxBarButtonSelectAllClick
      HotImageIndex = 32
      LargeImageIndex = 32
    end
    object dxBarButtonFind: TdxBarLargeButton
      Tag = 1
      Caption = '&Find...'
      Category = 1
      Hint = 'Find'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777700000777770000070F000777770F00070F000777770F
        0007000000070000000700F000000F00000700F000700F00000700F000700F00
        00077000000000000077770F00070F0007777700000700000777777000777000
        77777770F07770F0777777700077700077777777777777777777}
      ShortCut = 16454
      OnClick = dxBarButtonFindClick
    end
    object dxBarButtonReplace: TdxBarLargeButton
      Tag = 1
      Caption = 'R&eplace...'
      Category = 1
      Hint = 'Replace'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777770777888777777777007787787777070700078778770777770077
        8887777777770777877870777777777787787777777777078887770777777777
        7777777777777077777707770777777777770777077770777777800087777777
        7777707077777707077778087777777007777707777777000777}
      ShortCut = 16456
      OnClick = dxBarButtonReplaceClick
      HotImageIndex = 33
      LargeImageIndex = 33
    end
    object dxBarComboFontSize: TdxBarCombo
      Tag = 1
      Caption = '&Size:'
      Category = 9
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
      OnClick = dxBarComboFontSizeClick
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
      Tag = 1
      Caption = '&Bold'
      Category = 9
      Hint = 'Bold'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonBoldClick
      HotImageIndex = 9
      LargeImageIndex = 9
    end
    object dxBarButtonItalic: TdxBarLargeButton
      Tag = 1
      Caption = '&Italic'
      Category = 9
      Hint = 'Italic'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonItalicClick
      HotImageIndex = 10
      LargeImageIndex = 10
    end
    object dxBarButtonUnderline: TdxBarLargeButton
      Tag = 1
      Caption = '&Underline'
      Category = 9
      Hint = 'Underline'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonUnderlineClick
      HotImageIndex = 11
      LargeImageIndex = 11
    end
    object dxBarButtonBullets: TdxBarLargeButton
      Tag = 1
      Caption = '&Bullets'
      Category = 9
      Hint = 'Bullets'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxBarButtonBulletsClick
      HotImageIndex = 15
      LargeImageIndex = 15
    end
    object dxBarButtonAlignLeft: TdxBarLargeButton
      Tag = 1
      Caption = 'Align &Left'
      Category = 9
      Hint = 'Align Left'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ShortCut = 16460
      OnClick = dxBarButtonAlignLeftClick
      HotImageIndex = 12
      LargeImageIndex = 12
    end
    object dxBarButtonCenter: TdxBarLargeButton
      Tag = 1
      Caption = '&Center'
      Category = 9
      Hint = 'Center'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ShortCut = 16453
      OnClick = dxBarButtonCenterClick
      HotImageIndex = 13
      LargeImageIndex = 13
    end
    object dxBarButtonAlignRight: TdxBarLargeButton
      Tag = 1
      Caption = 'Align &Right'
      Category = 9
      Hint = 'Align Right'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      ShortCut = 16466
      OnClick = dxBarButtonAlignRightClick
      HotImageIndex = 14
      LargeImageIndex = 14
    end
    object dxBarButtonURLDetection: TdxBarLargeButton
      Tag = 1
      Caption = '&URL Detection'
      Category = 9
      Hint = 'URL Detection'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = dxBarButtonURLDetectionClick
    end
    object dxBarSubItemHelp: TdxBarSubItem
      Caption = '&Help'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButtonHelp
          Visible = True
        end
        item
          Item = dxBarLargeButton1
          Visible = True
        end
        item
          Item = dxBarButton1
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarLargeButton2
          Visible = True
        end
        item
          Item = dxBarButtonDXDownloads
          Visible = True
        end
        item
          Item = dxBarButtonDXOntheweb
          Visible = True
        end
        item
          Item = dxBarButtonForum
          Visible = True
        end
        item
          Item = dxBarButtonProducts
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButtonAbout
          Visible = True
        end>
    end
    object dxBarButtonFont: TdxBarLargeButton
      Tag = 1
      Caption = '&Font...'
      Category = 9
      Hint = 'Font'
      Visible = ivAlways
      OnClick = dxBarButtonFontClick
      HotImageIndex = 34
      LargeImageIndex = 34
    end
    object dxBarComboFontName: TdxBarFontNameCombo
      Caption = 'Font Name'
      Category = 9
      Hint = 'Font Name'
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
      OnClick = dxBarComboFontNameClick
      DropDownCount = 12
    end
    object dxBarComboFontColor: TdxBarColorCombo
      Caption = 'Font Color'
      Category = 9
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
      OnClick = dxBarComboFontColorClick
      Color = clBlack
    end
    object dxBackBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Back'
      Category = 4
      Enabled = False
      Hint = 'Back'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = BackPopupMenu
      PaintStyle = psCaption
      OnClick = dxBackBtnClick
      HotImageIndex = 20
      LargeImageIndex = 20
      Width = 50
    end
    object dxForwardBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Forward'
      Category = 4
      Enabled = False
      Hint = 'Forward'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = ForwardPopupMenu
      OnClick = dxForwardBtnClick
      HotImageIndex = 21
      LargeImageIndex = 21
      Width = 50
    end
    object dxStopBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Stop'
      Category = 4
      Hint = 'Stop'
      Visible = ivAlways
      OnClick = dxStopBtnClick
      HotImageIndex = 22
      LargeImageIndex = 22
      Width = 50
    end
    object dxRefreshBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Refresh'
      Category = 4
      Hint = 'Refresh'
      Visible = ivAlways
      OnClick = dxRefreshBtnClick
      HotImageIndex = 23
      LargeImageIndex = 23
      Width = 50
    end
    object dxHomeBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Home'
      Category = 4
      Hint = 'Home'
      Visible = ivAlways
      OnClick = dxHomeBtnClick
      HotImageIndex = 24
      LargeImageIndex = 24
      Width = 50
    end
    object dxSearchBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Search'
      Category = 4
      Hint = 'Search'
      Visible = ivAlways
      OnClick = dxSearchBtnClick
      HotImageIndex = 25
      LargeImageIndex = 25
      Width = 50
    end
    object dxAddressCombo: TdxBarCombo
      Tag = 2
      Align = iaClient
      Caption = 'Address'
      Category = 7
      Hint = 'Address'
      Visible = ivAlways
      OnChange = dxAddressComboChange
      OnKeyDown = dxAddressComboKeyDown
      ShowCaption = True
      Width = 20
      OnDrawItem = dxAddressComboDrawItem
      Items.Strings = (
        'http://www.devexpress.com'
        'http://www.automatedqa.com')
      ItemIndex = -1
    end
    object dxLinks: TdxBarStatic
      Tag = 2
      Caption = 'Links'
      Category = 5
      Hint = 'Links'
      Visible = ivAlways
    end
    object dxProductsBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Products'
      Category = 5
      Hint = 'http://www.devexpress.com/products'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDD000000000
        0000DDD7888888888880DDD7FFFFFFFFFF80DDC7FF7F77F77F80DC400007FFFF
        FF803C04CCCC4F777F80334CC884C4FFFF80384C4FFFFF777F80D3BCCCCCC4FF
        FF80DD3BCFF4C4777F80DDD3BCCC4FFFFF80DDD7CCC4FCF7FF80DDD7FFFCCFFF
        0000DDD7F77F777F8F7DDDD7FFFFFFFF87DDDDD7777777777DDD}
      PaintStyle = psCaptionGlyph
      OnClick = dxProductsBtnClick
      HotImageIndex = 26
      LargeImageIndex = 26
    end
    object dxDownloadsBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Downloads'
      Category = 5
      Hint = 'http://www.devexpress.com/downloads'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDD000000000
        0000DDD7888888888880DDD7FFFFFFFFFF80DDC7FF7F77F77F80DC400007FFFF
        FF803C04CCCC4F777F80334CC884C4FFFF80384C4FFFFF777F80D3BCCCCCC4FF
        FF80DD3BCFF4C4777F80DDD3BCCC4FFFFF80DDD7CCC4FCF7FF80DDD7FFFCCFFF
        0000DDD7F77F777F8F7DDDD7FFFFFFFF87DDDDD7777777777DDD}
      PaintStyle = psCaptionGlyph
      OnClick = dxProductsBtnClick
      HotImageIndex = 27
      LargeImageIndex = 27
    end
    object dxBarHistory: TdxBarLargeButton
      Tag = 2
      Caption = 'HistoryBtn'
      Category = 7
      Hint = 'HistoryBtn'
      Visible = ivAlways
      PaintStyle = psCaption
      OnClick = dxBarHistoryClick
    end
    object dxCityCombo: TdxBarTreeViewCombo
      Tag = 3
      Caption = 'State, Sity'
      Category = 6
      Hint = 'State, Sity'
      Visible = ivAlways
      OnChange = dxCityComboChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFF000FFFFFFFF0000F0F0FFFFFFFF0FFFF000FFFFFFFF0FFFFFFFFFF
        FFFFF0FFFFFFFFFF000FF0FFFFF0000F0F0FF0FFFFF0FFFF000FF0FFFFFFFFFF
        FFFFF0FFFF000FFFFFFFF0000F0F0FFFFFFFF0FFFF000FFFFFFFFFFFFFFFFFFF
        FFFF000FFFFFFFFFFFFF0F0FFFFFFFFFFFFF000FFFFFFFFFFFFF}
      ShowCaption = True
      Width = 96
      Indent = 19
      Items.Data = {
        090000001B0000000100000000000000FFFFFFFFFFFFFFFF0000000004000000
        024341230000000000000000000000FFFFFFFFFFFFFFFF00000000000000000A
        486F6D657376696C6C65230000000000000000000000FFFFFFFFFFFFFFFF0000
        0000000000000A4B696E677376696C6C65240000000000000000000000FFFFFF
        FFFFFFFFFF00000000000000000B4C6F7320416E67656C657326000000000000
        0000000000FFFFFFFFFFFFFFFF00000000000000000D53616E204672616E6369
        73636F1B0000000100000000000000FFFFFFFFFFFFFFFF000000000100000002
        4E4A230000000000000000000000FFFFFFFFFFFFFFFF00000000000000000A48
        696C6C7376696C6C651B0000000000000000000000FFFFFFFFFFFFFFFF000000
        0002000000024E59250000000000000000000000FFFFFFFFFFFFFFFF00000000
        000000000C4A6F686E736F6E76696C6C65210000000000000000000000FFFFFF
        FFFFFFFFFF0000000000000000084E657720596F726B1B000000000000000000
        0000FFFFFFFFFFFFFFFF000000000100000002494C2000000000000000000000
        00FFFFFFFFFFFFFFFF0000000000000000074368696361676F1B000000000000
        0000000000FFFFFFFFFFFFFFFF00000000020000000247412000000000000000
        00000000FFFFFFFFFFFFFFFF00000000000000000741746C616E746125000000
        0000000000000000FFFFFFFFFFFFFFFF00000000000000000C43617274657273
        76696C6C651B0000000000000000000000FFFFFFFFFFFFFFFF00000000010000
        00024F4B1F0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        064E65776D616E1B0000000000000000000000FFFFFFFFFFFFFFFF0000000001
        000000024F48220000000000000000000000FFFFFFFFFFFFFFFF000000000000
        000009436C6576656C616E641B0000000000000000000000FFFFFFFFFFFFFFFF
        0000000001000000024354230000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000A427269646765666F72641B0000000000000000000000FFFF
        FFFFFFFFFFFF0000000001000000024D49200000000000000000000000FFFFFF
        FFFFFFFFFF0000000000000000074C616E73696E67}
      ShowButtons = True
      ShowLines = True
      ShowRoot = True
      SortType = stNone
    end
    object dxProductsCombo: TdxBarLookupCombo
      Tag = 3
      Caption = 'Products'
      Category = 6
      Hint = 'Products'
      Visible = ivAlways
      OnChange = dxProductsComboChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDD000000000000000D0FFFF0FFFFFFFF0D0F77F0F777777F0D0CCCC0CCCCCC
        CC0D0C77C0C777777C0D0CCCC0CCCCCCCC0D0F77F0F777777F0D0FFFF0FFFFFF
        FF0D0F77F0F777777F0D0FFFF0FFFFFFFF0D000000000000000D0FFFCCCCFFF0
        DDDD0F777777FFF0DDDD0FFFCCCCFFF0DDDD000000000000DDDD}
      ShowCaption = True
      Width = 100
      KeyField = 'ID'
      ListField = 'Name;Description'
      ListSource = EBarMegaDemoMainDM.dsProducts
      RowCount = 10
      PopupWidth = 450
    end
    object dxDate: TdxBarDateCombo
      Tag = 3
      Caption = 'Date'
      Category = 6
      Hint = 'Date'
      Visible = ivAlways
      OnChange = dxDateChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 91
    end
    object dxIESelectAllBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Select A&ll'
      Category = 1
      Hint = 'Select All'
      Visible = ivAlways
      ShortCut = 16449
    end
    object dxIEView: TdxBarSubItem
      Tag = 2
      Caption = '&View'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxIEStop
          Visible = True
        end
        item
          Item = dxIERefreshBtn
          Visible = True
        end>
    end
    object dxGo: TdxBarSubItem
      Tag = 2
      Caption = '&Go'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxIEBackBtn
          Visible = True
        end
        item
          Item = dxIEForwardBtn
          Visible = True
        end>
    end
    object dxIEStop: TdxBarLargeButton
      Tag = 2
      Caption = 'Stop'
      Category = 8
      Hint = 'Stop'
      Visible = ivAlways
      ShortCut = 27
      OnClick = dxStopBtnClick
      HotImageIndex = 22
      LargeImageIndex = 22
    end
    object dxIERefreshBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Refresh'
      Category = 8
      Hint = 'Refresh'
      Visible = ivAlways
      ShortCut = 116
      OnClick = dxRefreshBtnClick
      HotImageIndex = 23
      LargeImageIndex = 23
    end
    object dxIEBackBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Back'
      Category = 10
      Enabled = False
      Hint = 'Back'
      Visible = ivAlways
      OnClick = dxBackBtnClick
      HotImageIndex = 20
      LargeImageIndex = 20
    end
    object dxIEForwardBtn: TdxBarLargeButton
      Tag = 2
      Caption = 'Forward'
      Category = 10
      Enabled = False
      Hint = 'Forward'
      Visible = ivAlways
      OnClick = dxForwardBtnClick
      HotImageIndex = 21
      LargeImageIndex = 21
    end
    object dxFavorites: TdxBarSubItem
      Tag = 2
      Caption = 'F&avorites'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxIELinks
          Visible = True
        end>
    end
    object dxIELinks: TdxBarSubItem
      Tag = 2
      Caption = '&Links'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxProductsBtn
          Visible = True
        end
        item
          Item = dxDownloadsBtn
          Visible = True
        end
        item
          Item = dxFORUMBtn
          Visible = True
        end>
    end
    object dxClearBtn: TdxBarLargeButton
      Caption = 'Clear'
      Category = 6
      Hint = 'Clear'
      Visible = ivAlways
      OnClick = dxClearBtnClick
      HotImageIndex = 8
      LargeImageIndex = 8
    end
    object dxFilter: TdxBarSubItem
      Tag = 3
      Caption = 'F&ilter'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxCityCombo
          Visible = True
        end
        item
          Item = dxProductsCombo
          Visible = True
        end
        item
          Item = dxDate
          Visible = True
        end
        item
          Item = dxTypeCombo
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxClearBtn
          Visible = True
        end>
    end
    object dxDBNavig: TdxBarSubItem
      Tag = 3
      Caption = '&DB Navigator'
      Category = 2
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxOptions: TdxBarButton
      Caption = '&Options'
      Category = 3
      Hint = 'Options'
      Visible = ivAlways
      PaintStyle = psCaption
      OnClick = dxOptionsClick
    end
    object dxFORUMBtn: TdxBarLargeButton
      Caption = 'Support Center'
      Category = 5
      Hint = 'https://www.devexpress.com/Support/Center'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDD000000000
        0000DDD7888888888880DDD7FFFFFFFFFF80DDC7FF7F77F77F80DC400007FFFF
        FF803C04CCCC4F777F80334CC884C4FFFF80384C4FFFFF777F80D3BCCCCCC4FF
        FF80DD3BCFF4C4777F80DDD3BCCC4FFFFF80DDD7CCC4FCF7FF80DDD7FFFCCFFF
        0000DDD7F77F777F8F7DDDD7FFFFFFFF87DDDDD7777777777DDD}
      PaintStyle = psCaptionGlyph
      OnClick = dxProductsBtnClick
      HotImageIndex = 28
      LargeImageIndex = 28
    end
    object dxTypeCombo: TdxBarImageCombo
      Caption = 'Payment Type'
      Category = 6
      Hint = 'Payment Type'
      Visible = ivAlways
      OnChange = dxTypeComboChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Width = 74
      Images = GridImageList
      Items.Strings = (
        'Cash'
        'Visa'
        'Master'
        'American Express')
      ItemIndex = -1
      ImageIndexes = (
        0
        1
        2
        3)
    end
    object dxBSPosition: TdxBarStatic
      Category = 11
      Hint = 'Cursor position'
      Visible = ivAlways
      BorderStyle = sbsLowered
      LeftIndent = 2
      RightIndent = 2
      Width = 150
    end
    object dxBSStatus: TdxBarStatic
      Category = 11
      Hint = 'Status'
      Visible = ivAlways
      BorderStyle = sbsLowered
      LeftIndent = 2
      RightIndent = 2
      Width = 80
    end
    object dxBarProgress: TdxBarProgressItem
      Caption = 'Progress'
      Category = 11
      Hint = 'Progress'
      Visible = ivAlways
      LeftIndent = 2
      RightIndent = 2
      ShowCaption = False
      Smooth = True
    end
    object dxBSIEStatus: TdxBarStatic
      Align = iaClient
      Category = 11
      Hint = 'Status'
      Visible = ivAlways
      BorderStyle = sbsLowered
      Height = 18
      LeftIndent = 2
      RightIndent = 2
    end
    object dxBarButtonAbout: TdxBarLargeButton
      Action = dmCommonData.actAbout
      Category = 3
      HotImageIndex = 35
    end
    object dxBarButtonDXDownloads: TdxBarLargeButton
      Action = dmCommonData.actDownloads
      Category = 3
    end
    object dxBarButtonDXOntheweb: TdxBarLargeButton
      Action = dmCommonData.actDXOnTheWeb
      Category = 3
    end
    object dxBarButtonHelp: TdxBarLargeButton
      Action = dmCommonData.actBarsHelp
      Category = 3
    end
    object dxBarButtonProducts: TdxBarLargeButton
      Action = dmCommonData.actProducts
      Category = 3
    end
    object dxBarButtonForum: TdxBarLargeButton
      Action = dmCommonData.actSupport
      Category = 3
    end
    object dxBarDBNavFirst1: TdxBarDBNavButton
      Caption = 'First'
      Category = 12
      Enabled = False
      Hint = 'First'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777087777778077777708777780007777770877800000777777088000000
        0777777087780000077777708777780007777770877777780777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnFirst
    end
    object dxBarDBNavPrev1: TdxBarDBNavButton
      Caption = 'Prior'
      Category = 12
      Enabled = False
      Hint = 'Prior'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777780777777777777800077777777778000007777777780000000
        7777777777800000777777777777800077777777777777807777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnPrior
    end
    object dxBarDBNavNext1: TdxBarDBNavButton
      Caption = 'Next'
      Category = 12
      Hint = 'Next'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777708777777777777770008777777777777000008777777777700000008
        7777777700000877777777770008777777777777087777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnNext
    end
    object dxBarDBNavLast1: TdxBarDBNavButton
      Caption = 'Last'
      Category = 12
      Hint = 'Last'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777087777778077777700087777807777770000087780777777000000088
        0777777000008778077777700087777807777770877777780777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnLast
    end
    object dxBarDBNavInsert1: TdxBarDBNavButton
      Caption = 'Insert'
      Category = 12
      Hint = 'Insert'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777000777
        7777777777000777777777777700077777777770000000007777777000000000
        7777777000000000777777777700077777777777770007777777777777000777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnInsert
    end
    object dxBarDBNavDelete1: TdxBarDBNavButton
      Caption = 'Delete'
      Category = 12
      Hint = 'Delete'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777770000000000777777000000000
        0777777000000000077777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnDelete
    end
    object dxBarDBNavEdit1: TdxBarDBNavButton
      Caption = 'Edit'
      Category = 12
      Hint = 'Edit'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777700000000007777777000000007777777770000007
        7777777777000077777777777770077777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnEdit
    end
    object dxBarDBNavPost1: TdxBarDBNavButton
      Caption = 'Post'
      Category = 12
      Enabled = False
      Hint = 'Post'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777770777777
        7777777700077777777777700000777777777700070007777777770077700077
        7777777777770007777777777777700077777777777777000777777777777770
        0777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnPost
    end
    object dxBarDBNavCancel1: TdxBarDBNavButton
      Caption = 'Cancel'
      Category = 12
      Enabled = False
      Hint = 'Cancel'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777007777700
        7777777000777000777777770007000777777777700000777777777777000777
        7777777770000077777777770007000777777770007770007777777007777700
        7777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnCancel
    end
    object dxBarDBNavRefresh1: TdxBarDBNavButton
      Caption = 'Refresh'
      Category = 12
      Hint = 'Refresh'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777778087777777777780087777
        7777777700877777777777780877777777777770077777777777777007770000
        0777777008777800077777780087800007777777000000080777777778000877
        0777777777777777777777777777777777777777777777777777}
      BarDBNavigator = dxBarDBNavigator
      NavButton = dxbnRefresh
    end
    object dxBarButton1: TdxBarLargeButton
      Action = dmCommonData.actRateDemo
      Category = 3
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = dmCommonData.actDockingHelp
      Category = 3
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = dmCommonData.actMyDX
      Category = 3
    end
    object dxBarGroup: TdxBarGroup
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
        'dxBarButtonURLDetection'
        'dxBarButtonFont'
        'dxBarComboFontName'
        'dxBarComboFontColor')
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'RTF'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Left = 432
    Top = 224
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
    Left = 256
    Top = 264
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'RTF'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist]
    Left = 432
    Top = 256
  end
  object PrintDialog: TPrintDialog
    Left = 368
    Top = 284
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 400
    Top = 256
  end
  object LargeImage: TImageList
    Height = 32
    Width = 32
    Left = 176
    Top = 296
    Bitmap = {
      494C010103000500040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000FF000000FF000000FF000000FF000000FF000000FF000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400FF000000FF00
      0000840000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400FF0000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000FF0000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400FF0000008400
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000FF00000084000000FF00000084000000FF00
      0000FF000000FF000000FF000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFF0000FFFF00000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400FF0000008400
      0000000000000000000000000000000000000000000084000000840000008400
      000084000000FF00000084000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000FFFF0000FFFF0000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400FF000000FF00
      000084000000000000000000000084000000840000008400000084000000FF00
      000084000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000008484840000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FF000000FF0000000000000000000000FFFF0000FFFF
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400FF000000FF00
      0000840000000000000084000000840000008400000084000000FF0000008400
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FF000000FF000000FF000000FF000000000000000000
      0000FFFF0000FFFF00000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C60000000000FFFF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400FF000000FF00
      0000FF00000084000000840000008400000084000000FF00000084000000FF00
      0000FF000000FF000000FF000000840000008400000084000000840000008400
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000000000008484
      84000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400FFFFFF00FFFFFF00FFFFFF00848484000000000084848400000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FF000000FF000000FF000000FF000000FFFF0000FF00
      00000000000000000000FFFF0000FFFF00000000000000000000C6C6C6000000
      0000FFFF0000FFFF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400C6C6C60000848400FF00
      0000FF00000084000000840000008400000084000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000000000000000
      00000000000084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FF000000FF000000FFFF0000FF000000FF000000FFFF
      0000FF000000FF0000000000000000000000FFFF0000FFFF000000000000FFFF
      0000FF000000FFFF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008484000084840000848400FF00
      0000FF000000FF0000008400000084000000FF00000084000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFFFF008484
      840084848400FFFFFF00FFFFFF00FFFFFF008484840000000000848484000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FF000000FF000000FF000000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF0000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400C6C6C60000848400FF00
      0000FF000000FF0000008400000084000000FF000000FF000000FF000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      000084000000840000008400000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FF000000FF000000FFFF0000FF000000FF000000FF00
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FFFF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400C6C6C6000084
      8400FF000000FF000000FF0000008400000084000000FF000000FF000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF0084848400000000008484
      84000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FF000000FF000000FF000000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400C6C6C6000084
      8400FF000000FF000000FF00000084000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600000000000000000000000000000000008484
      8400C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400C6C6C600C6C6
      C60000848400FF000000FF000000FF00000084000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000000000008484840000000000FFFF0000FFFF0000FFFF00000000
      0000C6C6C600C6C6C600FFFFFF00FFFFFF008484840084848400FFFFFF00FFFF
      FF00FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484000000
      000084848400000000000000000000000000000000008484000084840000FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      840000FFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000000000008484840000000000FFFF0000FFFF0000FFFF00000000
      000084848400C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF008484
      840084848400000000008400840084848400FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00008484
      000084840000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF0000848400C6C6C600FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      000000000000C6C6C600C6C6C600FFFFFF00FFFFFF0084848400FFFFFF008484
      8400000000000000000084008400FFFF000084848400FFFFFF00FFFFFF008484
      84000000000084848400000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00008484000084840000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C60084848400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000084
      840000FFFF00FFFFFF0084848400FF000000FF000000FF000000FF000000FF00
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000FFFF0000FFFF
      000000000000FFFF00000000000000000000FFFF0000FFFF000000000000FFFF
      00000000000084848400C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFF
      FF008484840084008400FFFF00008484000084848400FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF00008484000084840000FFFFFF00FFFFFF008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00000084840000FFFF0000FFFF00FF000000FF000000FF000000FF000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000FFFF0000FFFF
      00000000000000000000FFFF000000000000FFFF0000FFFF0000000000000000
      0000FFFF000000000000C6C6C600C6C6C600FFFFFF00FFFFFF0084848400FFFF
      FF008484840084008400FFFF0000FFFF0000FFFF000084848400FFFFFF00FFFF
      FF008484840000000000848484000000000000000000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF00008484000084840000FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000000848400FFFFFF0000FFFF00FF000000FF000000FF000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000FFFF0000FFFF
      00000000000000000000FFFF000000000000FFFF0000FFFF0000000000000000
      0000FFFF00000000000084848400C6C6C600FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF0084848400848400008484840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FF000000FF000000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008484
      000084840000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084000000840000000084840000FFFF0000FFFF00FF000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000000000000000
      0000000000008400000084000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000FFFF0000FFFF
      0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000C6C6
      C60000000000FFFF000000000000C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400000000000000000000000000FF000000FFFF0000FF00
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00008484000084840000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000FF00000000848400FFFFFF0000FFFF00FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000000000000000
      00008400000084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000FFFF0000FFFF
      0000000000008484840000000000FFFF0000FFFF0000FFFF000000000000C6C6
      C60000000000FFFF00000000000084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FFFF0000FF000000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF00008484000084840000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000084000000FF000000FF0000000084840000FFFF0000FFFF00FF00
      0000FF000000FF000000FF000000840000000000000000000000000000008400
      000084000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000084000000FF000000000000000000000000000000FFFF0000FFFF
      000000000000FFFFFF000000000000000000FFFF0000FFFF000000000000C6C6
      C600FFFFFF0000000000FFFF000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      00000000000084848400000000000000000000000000FFFF0000FF000000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF00008484000084840000FFFF
      FF00FFFFFF00C6C6C600C6C6C6008484840000000000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000FF000000FF00000000848400C6C6C60000FF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00008400000000000000FF000000000000000000000000000000FFFF0000FFFF
      000000000000FFFFFF008484840000000000FFFF0000FFFF000000000000C6C6
      C600FFFFFF0000000000FFFF00000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000008484
      84000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF00008484
      000084840000FFFFFF008484840000000000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FF000000FF000000FF000000FF0000000084
      840000FFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000840000000000000000000000FF00000000000000FFFF0000FFFF0000FFFF
      0000FFFF000000000000000000000000000000000000FFFF000000000000C6C6
      C60000000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000084848400000000000000
      00000000000000000000000000000000000000000000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF00008484000000000000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FF000000FF000000FF000000FF00
      0000FF00000000FFFF0000848400FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000084848400000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000000000848484000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FFFF0000FF000000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FFFF00000000000000000000FFFF
      0000FFFF000000000000FFFF0000FFFF0000FF000000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000084000000840000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FF000000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000840000008400000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFF0000FF000000FFFF0000FF000000FF00
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FFFF0000FFFF0000FF000000FFFF0000FF000000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FFFF
      0000FF000000FF000000FFFF0000FF000000FF000000FFFF0000FF000000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000F03FFFFFFFFFF3FFFFFC000000000000
      C00FFFFFFFFFC3FFFFF800000000000087C00FFFFFFF01FFFFF8000000000000
      8FE001FFFFFC01FFFFF80000000000008F80007FFFF000FF0000000000000000
      0E00001FFFC000FF00000000000000000400000FFF00007F0000000000000000
      00000007FC00007F000000000000000000000003E000003F0000000000000000
      0001F003C000003F00000000000000000003F8010000001F0000000000000000
      0007FC018000001F00000000000000000007FFFF8000000F0000000000000000
      800000018000000F000000000000000080000001800000070000FFC000000000
      C0000001800004070000000100000000C000000180000C030000000F00000000
      C0000001800000030000000F00000000C007F801800000010000000F00000000
      E007F803800000010000000F00000000E003F003800000000000000F00000000
      F001E003800000000000000F00000000F0000001800000030000000F00000000
      F80000058000000F0000000F00000000FC0000060200003F0000000F00000000
      FE00000E020000FF0000000F00000000FF00001EFF0003FF0000000F00000000
      FFC0007EFF000FFF0000000F00000000FFF801FEFF803FFF0000000F00000000
      FFFFE1FCFF80FFFF0000000F00000000FFFFFC79FFC3FFFF0000000F00000000
      FFFFFF03FFCFFFFF0000000F0000000000000000000000000000000000000000
      000000000000}
  end
  object SmallImage: TImageList
    Left = 216
    Top = 296
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400FF000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840084000000000000000000
      0000000000008400000084000000FF000000FF000000FF000000FF0000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400FF000000000000008400
      000084000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000FF00000000000000FFFF000000000000C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400FF000000840000008400
      0000FF000000FF000000FF000000840000008400000084000000FF000000FF00
      0000FF000000FF00000084000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      840084848400000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000FF000000FF000000FF00000000000000FFFF
      00000000000000000000FFFF0000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400FF000000FF0000008400
      000084000000FF00000084000000000000000000000000000000000000008400
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000FF000000FF000000FF000000FF000000FF00
      000000000000FFFF0000FFFF0000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400FF0000008400
      0000FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000848484000000
      000084848400848484000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFF0000FFFF0000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400C6C6C600FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFF0000000000000000
      0000FFFF000000000000C6C6C600000000008484840000000000848484008484
      8400000000000000000000000000000000008484000000000000C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C6C6C600FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFF0000FFFF00000000
      0000FFFF0000FFFF0000C6C6C600000000008484840084848400FF00FF00FFFF
      000000000000848484008484840000000000FFFF0000FFFF0000848400000000
      0000C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008400000000FFFF00FF00
      0000FF000000FF0000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFF0000000000000000
      0000FFFF00000000000000000000C6C6C600000000000000000084008400FFFF
      000084848400000000000000000000000000FFFF000000000000FFFF0000FFFF
      00008484000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000840000008400000000FF
      FF00FF000000FF0000008400000000000000000000000000000084000000FF00
      0000FF000000FF000000840000000000000000000000FFFF000000000000FFFF
      0000FFFF0000C6C6C600FFFF0000C6C6C6000000000000000000848484000000
      000000000000000000008484840000000000FF000000FF000000FFFF00000000
      0000FFFF0000FFFF00008484000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FF00
      000000FFFF00FF000000FF000000840000000000000084000000FF000000FF00
      0000FF000000FF000000840000000000000000000000FFFF0000000000000000
      0000FFFF0000C6C6C60000000000000000000000000000000000000000000000
      000084848400000000008484840000000000FFFF0000FF000000FF000000FF00
      0000FFFF000000000000FFFF0000FFFF00008484000000000000C6C6C6008484
      8400FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF00000000848400FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000FF000000FFFF0000FFFF0000000000000000
      0000FFFF0000C6C6C600FFFF0000FFFF00000000000000000000848484000000
      000084848400000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFF000000000000FFFF0000FFFF000084840000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000840000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000848484000000
      000000000000000000000000000000000000FFFF0000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFF000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFF0000FF000000FF00
      0000FFFF0000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C7FFFFDFFE000000383FFF1FFC000000
      300FFCCF000000002003F36F0000000000018FA70000000001C13EB700000000
      03FF02D3000000000001014B40000000800101091203000083C100C504030000
      81C100DC01030000C00120F100430000E002004700030000F006F71F00030000
      FC1EF47F00030000FFEDF9FF0003000000000000000000000000000000000000
      000000000000}
  end
  object BackPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
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
        Item = dxBarButtonSave
        Visible = True
      end
      item
        Item = dxBarButtonSaveAs
        Visible = True
      end>
    UseOwnFont = False
    Left = 216
    Top = 264
  end
  object ForwardPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <>
    UseOwnFont = False
    Left = 288
    Top = 264
  end
  object dxBarDBNavigator: TdxBarDBNavigator
    BarManager = BarManager
    CategoryName = 'DB Navigator'
    ConfirmDelete = False
    DataSource = EBarMegaDemoMainDM.dsContacts
    DBCheckLinks = <>
    VisibleButtons = [dxbnFirst, dxbnPrior, dxbnNext, dxbnLast, dxbnInsert, dxbnDelete, dxbnEdit, dxbnPost, dxbnCancel, dxbnRefresh]
    Left = 176
    Top = 224
  end
  object GridImageList: TImageList
    Left = 176
    Top = 328
    Bitmap = {
      494C010104000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      000000840000008400000084000000FF00000084000000840000008400000084
      0000008400000084000000840000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      00000084000000FF000000FF000000FF000000FF000000840000008400000084
      0000008400000084000000840000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      000000840000008400000084000000FF00000084000000FF0000008400000084
      0000008400000084000000840000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400008484000084840000000000000000000000FF000000FF000000
      FF000000FF000000FF0000848400000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      000000840000008400000084000000FF00000084000000FF0000008400000084
      00000084000000840000008400000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000848400000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      0000008400000084000000FF000000FF000000FF000000840000008400000084
      00000084000000840000008400000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000848400000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000840000008400000084
      00000084000000FF00000084000000FF00000084000000840000008400000084
      00000084000000840000008400000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000848400000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      00000084000000FF00000084000000FF00000084000000840000008400000084
      0000008400000084000000840000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000008400000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000848400000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      0000008400000084000000FF000000FF000000FF000000FF0000008400000084
      0000008400000084000000840000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000840000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000840000008400000084
      000000840000008400000084000000FF00000084000000840000008400000084
      0000008400000084000000840000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF800100000000E38F800100000000C10780010000000080038001
      0000000001018001000000000101800100000000010180010000000001018001
      0000000001018001000000008003800100000000C107800100000000E38F8001
      FFFFFFFFFFFF8001FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object dxSideBarPopupMenu: TdxSideBarPopupMenu
    Options = [sbmIconType, sbmAddGroup, sbmRemoveGroup, sbmCustomize, sbmRenameGroup, sbmRenameItem, sbmRemoveItem]
    Left = 216
    Top = 224
  end
  object FindDialog: TFindDialog
    OnFind = FindDialogFind
    Left = 368
    Top = 224
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = FindDialogFind
    OnReplace = ReplaceDialogReplace
    Left = 368
    Top = 256
  end
  object ilDisabledImages: TImageList
    Left = 256
    Top = 327
    Bitmap = {
      494C010124002700040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
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
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C80071717100C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800808080000000000000000000000000000000
      0000000000000000000080808000F5F5F500F5F5F50080808000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E1007B7B7B00C8C8C800808080000000000000000000000000000000
      00006A6A6A000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000007F7F7F0000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C800808080000000000000000000000000000000
      00000000000080808000F5F5F5006A6A6A006A6A6A00F5F5F500808080000000
      00000000000000000000000000000000000000000000CFCFCF00FBFBFB006A6A
      6A006A6A6A00F5F5F5006A6A6A006A6A6A00EEEEEE006A6A6A006A6A6A009494
      940091919100868686007B7B7B007777770000000000000000006A6A6A006A6A
      6A006A6A6A006A6A6A0000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000000000000000000000CFCFCF00FBFBFB00F9F9
      F900F7F7F7006A6A6A006A6A6A006A6A6A00EEEEEE00EBEBEB006A6A6A006A6A
      6A006A6A6A00E1E1E100C8C8C800808080000000000000000000000000000000
      000080808000F5F5F5006A6A6A00B5B5B500AEAEAE006A6A6A00F5F5F5008080
      80000000000000000000000000000000000000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8
      E8006A6A6A0091919100C8C8C80080808000000000006A6A6A009E9E9E000000
      00006A6A6A000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000007F7F7F0000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F900F7F7F7006A6A6A00F2F2F200F0F0F000EEEEEE00EBEBEB006A6A
      6A00E6E6E600E4E4E400C8C8C800808080000000000000000000000000008080
      8000F5F5F5006A6A6A00BDBDBD00BDBDBD00BDBDBD00BDBDBD006A6A6A00F5F5
      F5008080800000000000000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FCFCFC00E1E1E100808080006A6A6A009C9C9C006A6A6A006A6A6A00EBEB
      EB00E8E8E80094949400C8C8C80080808000000000006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F000000000000000000CFCFCF00A4A4A4009292
      9200A3A3A300FAFAFA00BEBEBE006A6A6A006A6A6A006A6A6A006A6A6A006A6A
      6A00E8E8E800E6E6E600C8C8C80080808000000000000000000080808000F6F6
      F6006A6A6A00C3C3C300FFFFFF00FFFFFF00FFFFFF00FFFFFF009D9D9D006A6A
      6A00F5F5F50080808000000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FEFEFE00A2A2A2006A6A6A00EBEBEB00E4E4E4006A6A6A006A6A6A00EFEF
      EF006A6A6A00E8E8E800C8C8C80080808000000000006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00EFEFEF009797
      9700F9F9F900FCFCFC00FAFAFA00A0A0A0006A6A6A00DEDEDE00F1F1F1006A6A
      6A00EBEBEB00E8E8E800C8C8C800808080000000000080808000F5F5F5006A6A
      6A00D2D2D200CECECE00C3C3C300FFFFFF00FFFFFF009D9D9D00B5B5B500AEAE
      AE006A6A6A00F5F5F500808080000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00ADADAD006A6A6A00D3D3D300F2F2F2006A6A6A006A6A6A00F1F1
      F1006A6A6A00EDEDED00C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00C9C9
      C900DCDCDC00FEFEFE00E8E8E80092929200B3B3B3006A6A6A00F4F4F4006A6A
      6A00EFEFEF00EDEDED00C8C8C800808080006A6A6A00FAFAFA008E8E8E00DCDC
      DC00D6D6D600D2D2D200CECECE00FFFFFF00FFFFFF009D9D9D00BABABA00B5B5
      B500AEAEAE006A6A6A00F5F5F5008080800000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF00F5F5F500B4B4B4008A8A8A00717171006A6A6A006A6A6A00F4F4
      F400F1F1F100EFEFEF00C8C8C800808080000000000000000000000000000000
      000000000000000000007E7E7E009B9B9B009B9B9B009B9B9B00000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00F1F1
      F10092929200929292009292920092929200DADADA00F8F8F8006A6A6A006A6A
      6A00F1F1F100EFEFEF00C8C8C800808080006A6A6A00FEFEFE008E8E8E00DCDC
      DC00DCDCDC00D6D6D600D2D2D200FFFFFF00FFFFFF009D9D9D00BDBDBD00BABA
      BA00B5B5B5006A6A6A00F5F5F5008080800000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E8E8E8006A6A6A007A7A7A00F6F6
      F6006A6A6A00F1F1F100C8C8C800808080000000000000000000000000000000
      000000000000000000007E7E7E000000000000000000000000009B9B9B000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00B4B4B400EFEFEF009B9B9B0099999900F8F8F800FAFAFA00F8F8F8006A6A
      6A00F4F4F400F1F1F100C8C8C80080808000000000006A6A6A00FCFCFC008E8E
      8E00DCDCDC00DCDCDC00FFFFFF00FFFFFF00FFFFFF009D9D9D00C3C3C300BDBD
      BD006A6A6A00F5F5F500808080000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00828282006A6A6A006A6A6A008A8A8A00D7D7D700F8F8
      F8006A6A6A00F4F4F400C8C8C800808080000000000000000000000000000000
      000000000000000000007E7E7E000000000000000000000000009B9B9B000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00E1E1E100ABABAB0092929200C2C2C200FEFEFE00FCFCFC00FAFAFA00F8F8
      F800F6F6F600F4F4F400C8C8C8008080800000000000000000006A6A6A00FEFE
      FE008E8E8E00DCDCDC00DCDCDC00BDBDBD00BDBDBD00CECECE00C3C3C3006A6A
      6A00F5F5F50080808000000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C800808080000000000000000000000000000000
      000000000000000000007E7E7E000000000000000000000000009B9B9B000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE009F9F9F0092929200E8E8E800FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C800808080000000000000000000000000006A6A
      6A00FFFFFF008E8E8E00DCDCDC00FFFFFF00FFFFFF009D9D9D006A6A6A00F5F5
      F5008080800000000000000000000000000000000000CFCFCF00FFFFFF006A6A
      6A00FFFFFF006A6A6A006A6A6A00FFFFFF006A6A6A006A6A6A00FFFFFF006A6A
      6A006A6A6A00F9F9F900C8C8C800808080000000000000000000000000000000
      000000000000000000007E7E7E009B9B9B009B9B9B009B9B9B00000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00CCCCCC00A1A1A100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C800808080000000000000000000000000000000
      00006A6A6A00FEFEFE008E8E8E00FFFFFF00FFFFFF006A6A6A00F5F5F5008080
      80000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F900808080000000000000000000000000000000
      000000000000000000007E7E7E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F900808080000000000000000000000000000000
      0000000000006A6A6A00FCFCFC008E8E8E008E8E8E00F5F5F500808080000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000000000000000
      000000000000000000007E7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000000000000000
      000000000000000000006A6A6A00FEFEFE00FAFAFA0080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7E007E7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006A6A6A006A6A6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D000000000000000000000000000000
      0000000000009D9D9D0071717100717171007171710000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00989898009898
      9800989898009898980098989800989898009898980098989800989898009898
      98009898980098989800989898000000000000000000BDBDBD00989898009898
      9800989898009898980098989800989898009898980098989800989898009898
      98009898980098989800989898000000000000000000AEAEAE00C5C5C500C0C0
      C00091919100D2D2D200D9D9D900DCDCDC00DCDCDC00DCDCDC00DCDCDC00A9A9
      A9008686860086868600868686007D7D7D0000000000000000009D9D9D007171
      710071717100969696009A9A9A00999999007171710071717100717171007171
      71007171710071717100717171007171710000000000BDBDBD00F1F1F100BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC00989898000000000000000000BDBDBD00F1F1F100BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC00989898000000000000000000AEAEAE00CACACA00C5C5
      C500919191005353530089898900FFFFFF00FFFFFF00FFFFFF00F0F0F000A9A9
      A9008A8A8A0086868600868686007D7D7D00000000009D9D9D0095959500A3A3
      A300A2A2A200A0A0A0009F9F9F009B9B9B0071717100C5C5C500C5C5C500C5C5
      C500C5C5C500C5C5C500C5C5C5007171710000000000BDBDBD00F3F3F300F1F1
      F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7E700E5E5E500E3E3
      E300E1E1E100BCBCBC00989898000000000000000000BDBDBD00F3F3F300F1F1
      F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7E700E5E5E500E3E3
      E300E1E1E100BCBCBC00989898000000000000000000AEAEAE00CFCFCF00CACA
      CA00919191000000000059595900FFFFFF00F8F8F800F0F0F000E1E1E100A9A9
      A900929292008A8A8A00868686007D7D7D00000000009D9D9D00A8A8A800A6A6
      A600A4A4A400A3A3A300A0A0A0009C9C9C007171710068686800686868006868
      68006A6A6A007E7E7E00C5C5C5007171710000000000BDBDBD00F3F3F300F3F3
      F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7E700E5E5
      E500E3E3E300BCBCBC00989898000000000000000000BDBDBD00F3F3F300F3F3
      F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7E700E5E5
      E500E3E3E300BCBCBC00989898000000000000000000AEAEAE00D5D5D500CFCF
      CF00919191009191910091919100919191009191910091919100919191009191
      910099999900929292008A8A8A007D7D7D00000000009D9D9D00A9A9A900A9A9
      A900A6A6A6009F9F9F009D9D9D009C9C9C00717171006C6C6C00686868006868
      68007D7D7D008A8A8A00C5C5C5007171710000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7
      E700E5E5E500BCBCBC00989898000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8E800E7E7
      E700E5E5E500BCBCBC00989898000000000000000000AEAEAE00DCDCDC00D7D7
      D700D2D2D200CDCDCD00C8C8C800C0C0C000A3A3A300C0C0C00092929200A7A7
      A7009F9F9F0099999900929292007D7D7D00000000009D9D9D00ABABAB00AAAA
      AA00ACACAC00D7D7D7009D9D9D009898980071717100747474006C6C6C007878
      78009292920092929200C5C5C5007171710000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8
      E800E7E7E700BCBCBC00989898000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F1F1F100EFEFEF00EEEEEE00ECECEC00EBEBEB00E8E8
      E800E7E7E700BCBCBC00989898000000000000000000AEAEAE00DFDFDF00DCDC
      DC00D7D7D700D2D2D200CDCDCD00C8C8C800A3A3A300D5D5D50092929200B1B1
      B100A7A7A7009F9F9F00999999007D7D7D00000000009D9D9D00ACACAC00ABAB
      AB00D7D7D700F8F8F800D7D7D70099999900717171007C7C7C00777777008A8A
      8A009A9A9A0090909000C5C5C5007171710000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EEEEEE00ECECEC00EBEB
      EB00E8E8E800BCBCBC00989898000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EEEEEE00ECECEC00EBEB
      EB00E8E8E800BCBCBC00989898000000000000000000AEAEAE00DFDFDF00DFDF
      DF00C8C8C800A3A3A300A3A3A300A3A3A300BBBBBB00D7D7D700D5D5D5009292
      920092929200ABABAB00A4A4A4007D7D7D00000000009D9D9D00AEAEAE00ADAD
      AD00AEAEAE00D7D7D700ADADAD009F9F9F007171710082828200A0A0A000BCBC
      BC008E8E8E00BCBCBC00C5C5C5007171710000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EFEFEF00EDED
      ED00EBEBEB00BCBCBC00989898000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EFEFEF00EDED
      ED00EBEBEB00BCBCBC00989898000000000000000000AEAEAE00DFDFDF00D7D7
      D700BBBBBB00DADADA00E1E1E100E4E4E400ABABAB00C8C8C800D7D7D700D5D5
      D500A8A8A80092929200ABABAB007D7D7D00000000009D9D9D00B1B1B100B0B0
      B000ADADAD00ACACAC00ABABAB00A1A1A100717171009E9E9E00D6D6D600D6D6
      D600D6D6D600D6D6D600C5C5C5007171710000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EFEF
      EF00EDEDED00EBEBEB00989898000000000000000000BDBDBD00F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F1F1F100EFEF
      EF00EDEDED00EBEBEB00989898000000000000000000AEAEAE00DFDFDF00BBBB
      BB00E8E8E800EDEDED00ECECEC00E8E8E800D4D4D400D9D9D900DADADA00D5D5
      D500C8C8C800A4A4A400929292007D7D7D00000000009D9D9D00B2B2B200B1B1
      B100B0B0B000ADADAD00ACACAC00A1A1A10071717100D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600C5C5C5007171710000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD006A6A6A006A6A6A006A6A
      6A006A6A6A00BDBDBD00BDBDBD000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD006A6A6A006A6A6A006A6A
      6A006A6A6A00BDBDBD00BDBDBD000000000000000000AEAEAE00BBBBBB00E1E1
      E100EFEFEF00F2F2F200EFEFEF00EBEBEB00C9C9C900C3C3C300DADADA00D6D6
      D600CFCFCF00BCBCBC00929292007D7D7D00000000009D9D9D00B4B4B400B3B3
      B300B1B1B100B0B0B000ADADAD00A3A3A30071717100D6D6D600D6D6D600D6D6
      D600CFCFCF00CDCDCD00C5C5C5007171710000000000BDBDBD00F4F4F400F4F4
      F400F4F4F400F4F4F400BDBDBD0000000000000000006A6A6A00C9C9C9006A6A
      6A000000000000000000000000000000000000000000BDBDBD00F4F4F400F4F4
      F400F4F4F400F4F4F400BDBDBD0000000000000000006A6A6A00C9C9C9006A6A
      6A000000000000000000000000000000000000000000AEAEAE00BBBBBB00E4E4
      E400F1F1F100F3F3F300EFEFEF00EBEBEB00DFDFDF00A2A2A200CFCFCF00D6D6
      D600CFCFCF00BCBCBC00929292007D7D7D00000000009D9D9D00B5B5B500B5B5
      B500B4B4B400B2B2B200B1B1B100A4A4A40071717100D6D6D600D6D6D600CFCF
      CF00D5D5D500CDCDCD00C5C5C500717171000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD000000000000000000000000006A6A6A006A6A6A00A2A2
      A200000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD000000000000000000000000006A6A6A006A6A6A00A2A2
      A2000000000000000000000000000000000000000000AEAEAE00DFDFDF00BBBB
      BB00ECECEC00EFEFEF00E3E3E3009A9A9A00DDDDDD0099999900C7C7C700D5D5
      D500C8C8C800AAAAAA00929292007D7D7D00000000009D9D9D00B4B4B400B5B5
      B500B5B5B500B4B4B400B2B2B200A4A4A40071717100D6D6D600CFCFCF00D9D9
      D900D9D9D900D5D5D500C5C5C500717171000000000000000000000000000000
      000000000000000000000000000000000000000000006A6A6A00000000006A6A
      6A00A2A2A20000000000A2A2A2006A6A6A000000000000000000000000000000
      000000000000000000000000000000000000000000006A6A6A00000000006A6A
      6A00A2A2A20000000000A2A2A2006A6A6A0000000000AEAEAE00DFDFDF00EAEA
      EA00BBBBBB00DCDCDC00E0E0E000C0C0C000B1B1B100B4B4B400CDCDCD00C8C8
      C800ADADAD0092929200000000007D7D7D000000000000000000A9A9A9009D9D
      9D00ABABAB00ABABAB00AFAFAF00A4A4A400717171009D9D9D009D9D9D009D9D
      9D009D9D9D009D9D9D009D9D9D009D9D9D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006A6A6A006A6A6A006A6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006A6A6A006A6A6A006A6A6A000000000000000000AEAEAE00DFDFDF00A3A3
      A300E1E1E100BBBBBB00C3C3C300C3C3C300C2C2C200BEBEBE00C0C0C000CBCB
      CB0092929200A3A3A300BCBCBC007D7D7D000000000000000000000000000000
      0000A9A9A9009D9D9D00ABABAB00ABABAB007171710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE000000000000000000000000000000
      00000000000000000000A9A9A9009D9D9D009D9D9D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B1B1B100919191007676760091919100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B9B9B900A4A4A400999999009999
      990099999900C0C0C00000000000000000000000000000000000909090006868
      6800686868006868680068686800686868006868680068686800686868006868
      680068686800686868000000000000000000AEAEAE00A9A9A900969696008F8F
      8F007A7A7A007A7A7A00000000000000000000000000AEAEAE00A9A9A9009696
      96008F8F8F007A7A7A007A7A7A00000000000000000000000000000000000000
      0000B1B1B100A2A2A200858585009C9C9C00999999008F8F8F0076767600B1B1
      B10000000000000000000000000000000000000000000000000000000000C8C8
      C8008080800080808000808080008F8F8F00A4A4A400D3D3D300C6C6C600E4E4
      E400B9B9B900999999007E7E7E0000000000000000000000000090909000F7F7
      F700C8C8C800C8C8C8009C9C9C00CECECE00BCBCBC009C9C9C00C8C8C800C8C8
      C800C8C8C800686868000000000000000000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900A9A9A9007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900A9A9A9007A7A7A0000000000000000000000000000000000A2A2
      A200D6D6D600E8E8E80091919100A7A7A700C8C8C800A6A6A600919191009191
      9100A2A2A200000000000000000000000000000000000000000000000000C8C8
      C800F3F3F300C8C8C800BABABA00A4A4A400E2E2E200E7E7E700E2E2E200DFDF
      DF00ECECEC00B7B7B7009999990000000000000000000000000090909000FCFC
      FC00F8F8F800F5F5F5009C9C9C00D4D4D400A7A7A7009C9C9C00E4E4E400E1E1
      E100C8C8C800686868000000000000000000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900B0B0B0007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900B0B0B0007A7A7A00000000000000000000000000A2A2A200EAEA
      EA00E9E9E900E8E8E800A9A9A900C8C8C800D8D8D800C8C8C8009F9F9F008D8D
      8D00C8C8C800A2A2A2000000000000000000000000000000000000000000C8C8
      C800F7F7F700F4F4F400A4A4A400C4C4C400F2F2F200E9E9E900C3C3C300C9C9
      C900DADADA00DADADA009393930000000000000000000000000090909000FFFF
      FF00FCFCFC00F8F8F8009C9C9C00DFDFDF00DADADA009C9C9C00E8E8E800E4E4
      E400C8C8C800686868000000000000000000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900B0B0B0007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900B0B0B0007A7A7A000000000000000000B1B1B100D6D6D600EAEA
      EA00EAEAEA00E9E9E900E8E8E80092929200A6A6A6009F9F9F009A9A9A008D8D
      8D00C8C8C800F0F0F000B1B1B10000000000000000000000000000000000C8C8
      C800FAFAFA00F7F7F700A4A4A400B2B2B200F8F8F800F0F0F000979797009797
      970097979700B4B4B400A0A0A00000000000000000000000000090909000FFFF
      FF00FFFFFF00FCFCFC009C9C9C00DFDFDF00DFDFDF009C9C9C00EBEBEB00E8E8
      E800C8C8C800686868000000000000000000AEAEAE00FCFCFC00DFDFDF00C9C9
      C900B0B0B0007A7A7A00000000000000000000000000AEAEAE00FCFCFC00DFDF
      DF00C9C9C900B0B0B0007A7A7A000000000000000000A2A2A200ECECEC00EBEB
      EB00EAEAEA00EAEAEA00E5E5E500C2C2C200B0B0B000A9A9A900929292008D8D
      8D00C8C8C800F5F5F500A2A2A20000000000000000000000000000000000C8C8
      C800FCFCFC00FAFAFA00A4A4A400C7C7C700FBFBFB00FBFBFB00F1F1F1009797
      9700C3C3C300CACACA009F9F9F0000000000000000000000000090909000FFFF
      FF00FFFFFF00FFFFFF009C9C9C009C9C9C009C9C9C009C9C9C00EFEFEF00EBEB
      EB00C8C8C800686868000000000000000000AEAEAE009F9F9F009F9F9F008B8B
      8B008B8B8B007A7A7A007A7A7A007B7B7B00AEAEAE009F9F9F009F9F9F008B8B
      8B008B8B8B007A7A7A007A7A7A0000000000B1B1B100D6D6D600ECECEC00EBEB
      EB00EAEAEA00E9E9E900CCCCCC00DEDEDE00D8D8D800CCCCCC00E9E9E9008D8D
      8D00C8C8C800E3E3E300D6D6D600B1B1B100000000000000000000000000C8C8
      C800FFFFFF00FCFCFC00F4F4F400A4A4A400D6D6D600F9F9F900EEEEEE00F1F1
      F10097979700BDBDBD0099999900000000009C9C9C009C9C9C0098989800DBDB
      DB00FFFFFF00FFFFFF00FFFFFF00FCFCFC00F8F8F800F5F5F500F2F2F200EFEF
      EF00C8C8C8009C9C9C009C9C9C009C9C9C00DCDCDC00AEAEAE00E9E9E900E9E9
      E900C7C7C700A9A9A9007A7A7A009F9F9F00AEAEAE00E9E9E900E9E9E900C7C7
      C700A9A9A9007A7A7A009D9D9D0000000000A2A2A200E3E3E300E2E2E200E2E2
      E200E2E2E200D6D6D600AAAAAA000000000000000000AAAAAA00CCCCCC008D8D
      8D00C8C8C800E2E2E200E2E2E200A2A2A200000000000000000000000000C8C8
      C800FFFFFF00FFFFFF00FCFCFC00E6E6E600A4A4A400D8D8D800C1C1C100C5C5
      C500C2C2C200999999007F7F7F0000000000000000009C9C9C00C9C9C9009898
      9800DBDBDB00FFFFFF00FFFFFF00FFFFFF00FCFCFC00F8F8F800F5F5F500DBDB
      DB009C9C9C00C9C9C9009C9C9C000000000000000000AEAEAE00FFFFFF00F2F2
      F200E5E5E500A9A9A9007A7A7A00C4C4C400AEAEAE00FFFFFF00F2F2F200E5E5
      E500A9A9A9009D9D9D000000000000000000A2A2A200E4E4E400E3E3E300E3E3
      E300E3E3E300DFDFDF00AAAAAA000000000000000000AAAAAA00DADADA008D8D
      8D00C8C8C800ECECEC00EDEDED00A2A2A200BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BABABA00A4A4A400999999009999
      990099999900C8C8C800808080000000000000000000000000009C9C9C00C9C9
      C90098989800DBDBDB00FFFFFF00FFFFFF00FFFFFF00FCFCFC00DBDBDB009C9C
      9C00C9C9C9009C9C9C0000000000000000000000000000000000AEAEAE009F9F
      9F00969696007A7A7A007A7A7A009F9F9F00AEAEAE009F9F9F00969696007A7A
      7A007A7A7A00000000000000000000000000B1B1B100D6D6D600E2E2E200E5E5
      E500EFEFEF00F9F9F900CCCCCC00AAAAAA00AAAAAA00CCCCCC00E8E8E8008D8D
      8D00C8C8C800ECECEC00D6D6D600B1B1B100BDBDBD00E8E8E800E8E8E800E8E8
      E800E6E6E600E0E0E000DBDBDB00D6D6D600BDBDBD00FAFAFA00F7F7F700F4F4
      F400F1F1F100C8C8C80080808000000000000000000000000000000000009C9C
      9C00C9C9C90098989800DBDBDB00FFFFFF00FFFFFF00DBDBDB009C9C9C00C9C9
      C9009C9C9C000000000000000000000000000000000000000000AEAEAE00FCFC
      FC00DCDCDC00A9A9A9007A7A7A0000000000AEAEAE00FCFCFC00DCDCDC00A9A9
      A9007A7A7A0000000000000000000000000000000000A2A2A200F4F4F400FEFE
      FE00FFFFFF00FFFFFF00FEFEFE00EBEBEB00E8E8E800E8E8E800E9E9E9008D8D
      8D00C8C8C800EBEBEB00A2A2A20076767600BDBDBD00BDBDBD00E8E8E800E8E8
      E800E8E8E800E8E8E800E3E3E300DDDDDD00D8D8D800BDBDBD00FBFBFB00F8F8
      F800C8C8C800C8C8C80080808000000000000000000000000000000000000000
      00009C9C9C00C9C9C90098989800DBDBDB00DBDBDB009C9C9C00C9C9C9009C9C
      9C00000000000000000000000000000000000000000000000000AEAEAE009F9F
      9F00969696007A7A7A009F9F9F0000000000AEAEAE009F9F9F00969696007A7A
      7A009F9F9F0000000000000000000000000000000000B1B1B100F0F0F000FFFF
      FF00FFFFFF00FFFFFF00FAFAFA00E6E6E600E8E8E800E8E8E800E8E8E8008D8D
      8D00C8C8C800D6D6D6007676760076767600BDBDBD00F4F4F400BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FEFEFE00C8C8
      C800808080008080800080808000000000000000000000000000000000000000
      0000000000009C9C9C00C9C9C9009898980098989800C9C9C9009C9C9C004A4A
      4A0040404000000000000000000000000000000000000000000000000000AEAE
      AE00FCFCFC007A7A7A00000000000000000000000000AEAEAE00FCFCFC007A7A
      7A00000000000000000000000000000000000000000000000000A2A2A200F0F0
      F000FFFFFF00FFFFFF00F0F0F000E6E6E600E6E6E600E8E8E800E8E8E8008D8D
      8D00C8C8C80076767600C9C9C9008D8D8D00BDBDBD00F4F4F400F4F4F400F4F4
      F400F1F1F100EFEFEF00ECECEC00E9E9E900BDBDBD00FFFFFF00FFFFFF00C8C8
      C800F4F4F400E1E1E10080808000000000000000000000000000000000000000
      000000000000000000009C9C9C00C9C9C900C9C9C9009C9C9C00000000005D5D
      5D0054545400000000000000000000000000000000000000000000000000AEAE
      AE00AEAEAE009F9F9F00000000000000000000000000AEAEAE00AEAEAE009F9F
      9F0000000000000000000000000000000000000000000000000000000000A2A2
      A200F0F0F000FEFEFE00E6E6E600E6E6E600E6E6E600E6E6E600E8E8E8008D8D
      8D0076767600C9C9C9008D8D8D0000000000BDBDBD00F4F4F400F4F4F400F4F4
      F400F4F4F400BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF00FFFFFF00C8C8
      C800E1E1E1008080800000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C0000000000000000005D5D
      5D005D5D5D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B1B1B100A2A2A200D6D6D600E6E6E600E6E6E600D6D6D600A2A2A2008D8D
      8D00C9C9C9008D8D8D000000000000000000BDBDBD00F4F4F400F4F4F400F4F4
      F400BDBDBD00C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B1B1B100A2A2A200A2A2A200B1B1B100000000008D8D
      8D008D8D8D0000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A9A9A9009595950095959500A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A9A9A9009595950095959500A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000D2D2D2008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000D2D2D2008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000A9A9A900959595008A8A8A0097979700959595008686860095959500A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      0000A9A9A900959595008A8A8A0097979700959595008686860095959500A9A9
      A900000000000000000000000000000000000000000000000000D2D2D200F1F1
      F100C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C80080808000000000000000000000000000D2D2D200F1F1
      F100C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C80080808000000000000000000000000000000000009595
      9500A4A4A400A9A9A900A3A3A3009E9E9E009999990095959500919191008B8B
      8B00959595000000000000000000000000000000000000000000000000009595
      9500A4A4A400A9A9A900A3A3A3009E9E9E009999990095959500919191008B8B
      8B00959595000000000000000000000000000000000000000000D2D2D200F4F4
      F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5E500E3E3E300E1E1
      E100E1E1E100C8C8C80080808000000000000000000000000000D2D2D200F4F4
      F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5E500E3E3E300E1E1
      E100E1E1E100C8C8C8008080800000000000000000000000000095959500B5B5
      B500B3B3B300ADADAD00A9A9A900909090009F9F9F009B9B9B00969696009292
      92008E8E8E00959595000000000000000000000000000000000095959500B5B5
      B500B3B3B300ADADAD00A9A9A900909090009F9F9F009B9B9B00969696009292
      92008E8E8E009595950000000000000000000000000000000000D2D2D200F6F6
      F600F4F4F4005D5D5D005D5D5D00EDEDED00EAEAEA00E8E8E8005D5D5D005D5D
      5D00E1E1E100C8C8C80080808000000000000000000000000000D2D2D200F6F6
      F600F4F4F40098989800EFEFEF00B5B5B500B5B5B500C9C9C900E5E5E500E3E3
      E300E1E1E100C8C8C800808080000000000000000000A9A9A900B4B4B400C0C0
      C000BBBBBB00B6B6B6009090900090909000A8A8A800A2A2A2009C9C9C009797
      9700929292008C8C8C00A9A9A9000000000000000000A9A9A900B4B4B400C0C0
      C000BBBBBB00B6B6B600B2B2B2009090900090909000A2A2A2009C9C9C009797
      9700929292008C8C8C00A9A9A900000000000000000000000000D2D2D200F8F8
      F800F6F6F600ADADAD009E9E9E005D5D5D00EDEDED005D5D5D005D5D5D005D5D
      5D00E3E3E300C8C8C80080808000000000000000000000000000D2D2D200F8F8
      F800F6F6F6009898980098989800989898009898980098989800C9C9C900E5E5
      E500E3E3E300C8C8C80080808000000000000000000095959500CCCCCC00C8C8
      C800C3C3C30090909000EFEFEF00909090009090900090909000909090009D9D
      9D00989898009393930095959500000000000000000095959500CCCCCC00C8C8
      C80090909000909090009090900090909000EBEBEB0090909000A4A4A4009D9D
      9D00989898009393930095959500000000000000000000000000D2D2D200FAFA
      FA00F8F8F800F6F6F600ADADAD009E9E9E005D5D5D007D7D7D005D5D5D00E8E8
      E800E5E5E500C8C8C80080808000000000000000000000000000D2D2D200FAFA
      FA00F8F8F80098989800CDCDCD0098989800EFEFEF00EDEDED0098989800C9C9
      C900E5E5E500C8C8C8008080800000000000A9A9A900A7A7A700D5D5D500D1D1
      D10090909000F8F8F800F4F4F400EFEFEF00EBEBEB00E8E8E80090909000A4A4
      A4009D9D9D009999990088888800A9A9A900A9A9A900A7A7A700D5D5D500D1D1
      D10090909000FDFDFD00F8F8F800F4F4F400EFEFEF00EBEBEB0090909000A4A4
      A4009D9D9D009999990088888800A9A9A9000000000000000000D2D2D200FDFD
      FD00FAFAFA00F8F8F800F6F6F600ADADAD009E9E9E005D5D5D00EDEDED00EAEA
      EA00E8E8E800C8C8C80080808000000000000000000000000000D2D2D200FDFD
      FD00FAFAFA0098989800989898009898980098989800EFEFEF00EDEDED009898
      9800E8E8E800C8C8C800808080000000000095959500C4C4C400DCDCDC009090
      9000FFFFFF00FDFDFD00F8F8F800F4F4F400F2F2F200EDEDED0090909000ACAC
      AC00A4A4A4009E9E9E00999999009595950095959500C4C4C400DCDCDC00DADA
      DA0090909000FFFFFF00FDFDFD00F8F8F800F4F4F400F2F2F200EDEDED009090
      9000A4A4A4009E9E9E0099999900959595000000000000000000D2D2D200FFFF
      FF00FDFDFD00FAFAFA00C2C2C200BBBBBB00B4B4B400A6A6A6005D5D5D00EDED
      ED00EAEAEA00C8C8C80080808000000000000000000000000000D2D2D200FFFF
      FF00FDFDFD00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1F100EFEFEF00EDED
      ED00EAEAEA00C8C8C800808080000000000095959500C2C2C200DFDFDF009090
      9000FFFFFF00FFFFFF00FDFDFD00FBFBFB00F6F6F600F2F2F20090909000B3B3
      B300ABABAB00A4A4A4009D9D9D009595950095959500C2C2C200DFDFDF00E1E1
      E10090909000FFFFFF00FFFFFF00FDFDFD00FBFBFB00F6F6F600F2F2F2009090
      9000ABABAB00A4A4A4009D9D9D00959595000000000000000000D2D2D200FFFF
      FF00FFFFFF00C2C2C200C2C2C2005D5D5D00F7F7F700B4B4B400A6A6A6005D5D
      5D00EEEEEE00C8C8C80080808000000000000000000000000000D2D2D200FFFF
      FF0098989800FEFEFE00FCFCFC0098989800989898009898980098989800F0F0
      F000EEEEEE00C8C8C8008080800000000000A9A9A900A4A4A400E1E1E100E3E3
      E30090909000FFFFFF00FFFFFF00FFFFFF00FBFBFB00F6F6F60090909000BABA
      BA00B1B1B100ABABAB0092929200A9A9A900A9A9A900A4A4A400E1E1E100E3E3
      E30090909000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB0090909000BABA
      BA00B1B1B100ABABAB0092929200A9A9A9000000000000000000D2D2D200FFFF
      FF00FFFFFF00C2C2C2005D5D5D00FCFCFC00F9F9F900F7F7F700B4B4B4005D5D
      5D00F0F0F000C8C8C80080808000000000000000000000000000D2D2D200FFFF
      FF00E5E5E50098989800FEFEFE00FCFCFC0098989800CDCDCD0098989800F2F2
      F200F0F0F000C8C8C80080808000000000000000000095959500E3E3E300E5E5
      E500E6E6E60090909000FFFFFF0090909000909090009090900090909000C0C0
      C000B8B8B800B1B1B10095959500000000000000000095959500E3E3E300E5E5
      E50090909000909090009090900090909000FFFFFF0090909000C9C9C900C0C0
      C000B8B8B800B1B1B10095959500000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F5F5
      F500DADADA00C8C8C80080808000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00E5E5E5009898980098989800989898009898980098989800F5F5
      F500DADADA00C8C8C800808080000000000000000000A9A9A900BFBFBF00E6E6
      E600E7E7E700E8E8E8009090900090909000DFDFDF00D7D7D700CECECE00C6C6
      C600BFBFBF00ADADAD00A9A9A9000000000000000000A9A9A900BFBFBF00E6E6
      E600E7E7E700E8E8E800E8E8E8009090900090909000D7D7D700CECECE00C6C6
      C600BFBFBF00ADADAD00A9A9A900000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900D2D2
      D200808080008080800080808000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00E5E5E500B5B5B500B5B5B500FCFCFC0098989800D2D2
      D20080808000808080008080800000000000000000000000000095959500D7D7
      D700E7E7E700E8E8E800E8E8E80090909000E4E4E400DCDCDC00D4D4D400CCCC
      CC00C2C2C200959595000000000000000000000000000000000095959500D7D7
      D700E7E7E700E8E8E800E8E8E80090909000E4E4E400DCDCDC00D4D4D400CCCC
      CC00C2C2C2009595950000000000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00D2D2
      D200F4F4F400E1E1E10080808000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00D2D2
      D200F4F4F400E1E1E10080808000000000000000000000000000000000009595
      9500C0C0C000E7E7E700E7E7E700E6E6E600E5E5E500E1E1E100DADADA00C0C0
      C000959595000000000000000000000000000000000000000000000000009595
      9500C0C0C000E7E7E700E7E7E700E6E6E600E5E5E500E1E1E100DADADA00C0C0
      C000959595000000000000000000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D2D2
      D200E1E1E1008080800000000000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D2D2
      D200E1E1E1008080800000000000000000000000000000000000000000000000
      0000A9A9A90095959500A7A7A700CACACA00CFCFCF00AEAEAE0095959500A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      0000A9A9A90095959500A7A7A700CACACA00CFCFCF00AEAEAE0095959500A9A9
      A900000000000000000000000000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2
      D200808080000000000000000000000000000000000000000000D2D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2
      D200808080000000000000000000000000000000000000000000000000000000
      00000000000000000000A9A9A9009595950095959500A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A9A9A9009595950095959500A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000D2D2D200D2D2
      D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2
      D200000000000000000000000000000000000000000000000000D2D2D200D2D2
      D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2D200D2D2
      D200000000000000000000000000000000000000000000000000C8C8C8008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800F1F1
      F100C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C80080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00C5C5C500C0C0
      C00091919100D2D2D200D9D9D900DCDCDC00DCDCDC00DCDCDC00DCDCDC00A9A9
      A9008686860086868600868686007D7D7D000000000099999900999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900000000000000000000000000000000000000000000000000C8C8C800F4F4
      F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5E500E3E3E300E1E1
      E100E1E1E100C8C8C8008080800000000000BDBDBD0098989800989898009898
      9800989898009898980098989800989898009898980098989800989898009898
      98000000000000000000000000000000000000000000AEAEAE00CACACA00C5C5
      C500919191005353530089898900FFFFFF00FFFFFF00FFFFFF00F0F0F000A9A9
      A9008A8A8A0086868600868686007D7D7D00B9B9B900FFFFFF00C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900999999000000000000000000000000000000000000000000C8C8C800F6F6
      F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5E500E3E3
      E300E1E1E100C8C8C8008080800000000000BDBDBD00BDBDBD00C6C6C600BCBC
      BC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC009898
      98000000000000000000000000000000000000000000AEAEAE00CFCFCF00CACA
      CA00919191000000000059595900FFFFFF00F8F8F800F0F0F000E1E1E100A9A9
      A900929292008A8A8A00868686007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00F5F5F500F1F1F100ECECEC00E8E8E8007B7B7B00DFDFDF00C9C9
      C900999999009999990000000000000000000000000000000000C8C8C800F8F8
      F800F6F6F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8E800E5E5
      E500E3E3E300C8C8C8008080800000000000BDBDBD00BDBDBD00D8D8D800E6E6
      E600E4E4E400E1E1E100DEDEDE00DBDBDB00D9D9D900D6D6D600D4D4D400BCBC
      BC009898980000000000000000000000000000000000AEAEAE00D5D5D500CFCF
      CF00919191009191910091919100919191009191910091919100919191009191
      910099999900929292008A8A8A007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB00F5F5F500F1F1F100ECECEC00B5B5B500E3E3E300C9C9
      C900B9B9B900ADADAD0099999900000000000000000000000000C8C8C800FAFA
      FA00F8F8F800F6F6F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEAEA00E8E8
      E800E5E5E500C8C8C8008080800000000000BDBDBD00E6E6E600BDBDBD00E4E4
      E400E6E6E600E5E5E500E1E1E100DFDFDF00DCDCDC00DADADA00D7D7D700D2D2
      D2009898980000000000000000000000000000000000AEAEAE00DCDCDC00D7D7
      D700D2D2D200CDCDCD00C8C8C800C0C0C000BABABA00B4B4B400AEAEAE00A7A7
      A7009F9F9F0099999900929292007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB00F5F5F500F1F1F100ECECEC00E8E8E800E3E3
      E300B9B9B900BCBCBC0099999900000000000000000000000000C8C8C800FDFD
      FD00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1F100EFEFEF00EDEDED00EAEA
      EA00E8E8E800C8C8C8008080800000000000BDBDBD00EDEDED00BDBDBD00DADA
      DA00E8E8E800E7E7E700E4E4E400E1E1E100DFDFDF00DCDCDC00DADADA00D7D7
      D700BCBCBC0098989800000000000000000000000000AEAEAE00DFDFDF00DCDC
      DC00D7D7D700D2D2D200CDCDCD00C8C8C800C2C2C200BCBCBC00B7B7B700B1B1
      B100A7A7A7009F9F9F00999999007D7D7D00B9B9B900B9B9B900B9B9B900B9B9
      B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900999999009999
      9900B9B9B900C4C4C40099999900000000000000000000000000C8C8C800FFFF
      FF00FDFDFD00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1F100EFEFEF00EDED
      ED00EAEAEA00C8C8C8008080800000000000BDBDBD00F0F0F000E6E6E600BDBD
      BD00E4E4E400E8E8E800E6E6E600E4E4E400E1E1E100DFDFDF00DCDCDC00DADA
      DA00D2D2D20098989800000000000000000000000000AEAEAE00DFDFDF00DFDF
      DF00A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300ABABAB00A4A4A4007D7D7D00B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F5F5F500F1F1F100ECEC
      EC00B9B9B900CFCFCF0099999900000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F5F5F500F2F2F200F0F0
      F000EEEEEE00C8C8C8008080800000000000BDBDBD00F3F3F300F0F0F000BDBD
      BD00DADADA00E7E7E700E8E8E800E7E7E700E5E5E500E1E1E100DFDFDF00DCDC
      DC00D8D8D800BCBCBC00989898000000000000000000AEAEAE00DFDFDF00A3A3
      A300FAFAFA00F6F6F600F2F2F200EFEFEF00ECECEC00E8E8E800E5E5E500E1E1
      E100E1E1E100A3A3A300ABABAB007D7D7D0000000000B9B9B900B9B9B900B9B9
      B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9B900B9B9
      B900D4D4D400B1B1B10099999900000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F5F5F500F2F2
      F200F0F0F000C8C8C8008080800000000000BDBDBD00F4F4F400F3F3F300E6E6
      E600BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD000000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0F000EDEDED00EAEAEA00E6E6
      E600E2E2E200A3A3A300B1B1B1007D7D7D0000000000CFCFCF00CFCFCF00FFFF
      FF00FFFFFF00FEFEFE00FBFBFB00F9F9F900F8F8F800F6F6F600F4F4F4009999
      9900BCBCBC00D4D4D40099999900000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F5F5
      F500C8C8C800C8C8C8008080800000000000BDBDBD00F4F4F400F4F4F400F3F3
      F300E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600BDBDBD0000000000000000000000000000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0F000EDEDED00EAEA
      EA00E6E6E600A3A3A300B7B7B7007D7D7D00000000000000000000000000CFCF
      CF00FFFFFF00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700F6F6F6009999
      9900999999009999990099999900000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00F9F9F900C8C8
      C80080808000808080008080800000000000BDBDBD00F4F4F400F4F4F400F4F4
      F400F3F3F300E6E6E600BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD006A6A6A006A6A6A006A6A6A006A6A6A0000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0F000EDED
      ED00EAEAEA00A3A3A300BCBCBC007D7D7D00000000000000000000000000CFCF
      CF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F9F9F900F8F8F800F6F6
      F600999999000000000000000000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00C8C8
      C800F4F4F400E1E1E1008080800000000000BDBDBD00F4F4F400F4F4F400F4F4
      F400F4F4F400BDBDBD0000000000000000000000000000000000000000000000
      0000000000006A6A6A00C9C9C9006A6A6A0000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0
      F000EDEDED00A3A3A300C5C5C5007D7D7D000000000000000000000000000000
      0000CFCFCF00FFFFFF00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700F8F8
      F800999999009999990000000000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00C8C8
      C800E1E1E10080808000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000A2A2A2006A6A6A006A6A6A0000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8F800F4F4
      F400F0F0F000A3A3A300000000007D7D7D000000000000000000000000000000
      000000000000CFCFCF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F9F9
      F900F8F8F8009999990000000000000000000000000000000000C8C8C800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C8
      C800808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006A6A6A00A2A2A2000000
      0000A2A2A2006A6A6A00000000006A6A6A0000000000AEAEAE00DFDFDF00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8
      F800F4F4F400A3A3A300BCBCBC007D7D7D000000000000000000000000000000
      000000000000CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF0000000000000000000000000000000000C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006A6A6A006A6A
      6A006A6A6A0000000000000000000000000000000000AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C80080808000000000006A6A6A00707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C800808080008E8E8E00AFAFAF009F9F9F007070
      7000000000000000000000000000A9A9A900A9A9A900A9A9A900A2A2A2009595
      95008080800000000000000000000000000000000000CFCFCF00FBFBFB00F9F9
      F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00FBFBFB00F9F9
      F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00FBFBFB00F9F9
      F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C80080808000A2A2A200DBDBDB00AFAFAF006A6A
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400C8C8C8008080800000000000CFCFCF00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400C8C8C8008080800000000000CFCFCF00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400C8C8C8008080800000000000A2A2A2008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00F8F8F800F5F5F500F2F2F200F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00F8F8F800F5F5F500F2F2F200F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00F8F8F800F5F5F500F2F2F200F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00EBEBEB00E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE00000000000000000000000000000000000000000000000000EFEF
      EF00EBEBEB00E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000E8E8E800C8C8C80080808000000000006A6A6A00707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C800808080008E8E8E00AFAFAF009F9F9F007070
      7000000000000000000000000000A9A9A900A9A9A900A9A9A900A2A2A2009595
      95008080800000000000000000000000000000000000CFCFCF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00C8C8C80080808000A2A2A200DBDBDB00AFAFAF006A6A
      6A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFAFA00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C8008080800000000000A2A2A2008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800F6F6F600F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000F8F8
      F800F6F6F600F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000F4F4F400C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FAFA
      FA00F8F8F800F6F6F600C8C8C80080808000000000006A6A6A00707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C800808080008E8E8E00AFAFAF009F9F9F007070
      7000000000000000000000000000A9A9A900A9A9A900A9A9A900A2A2A2009595
      95008080800000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F9008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F9008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F90080808000A2A2A200DBDBDB00AFAFAF006A6A
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF000000000000000000A2A2A2008E8E8E000000
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
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000B9B9B9009F9F9F009F9F9F00707070007070700070707000707070007070
      70007070700070707000707070000000000000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C8008080800000000000CFCFCF00F7F7F700C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800808080000000000000000000B9B9B900B9B9
      B900C8C8C800C8C8C800C8C8C800B9B9B9007070700000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000CFCFCF00F9F9F900F7F7
      F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8E800E6E6E600E4E4
      E400E1E1E100E1E1E100C8C8C8008080800000000000B9B9B900C8C8C800C8C8
      C800E5E5E500E5E5E500FCFCFC00C8C8C800B9B9B90070707000000000000000
      00000000000000000000000000000000000000000000CFCFCF00FBFBFB00F9F9
      F9006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006D6D6D00A4A4A400DEDE
      DE00E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00FBFBFB00F9F9
      F900DFDFDF006A6A6A006A6A6A006A6A6A006A6A6A00DCDCDC00E8E8E800E6E6
      E600E4E4E400E1E1E100C8C8C8008080800000000000CFCFCF00FBFBFB00F9F9
      F9006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A00E1E1E100C8C8C8008080800000000000C8C8C800E5E5E500F5F5
      F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8C800B9B9B900707070000000
      00000000000000000000000000000000000000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F9006A6A6A006A6A6A00ECECEC00F0F0F000CCCCCC006A6A6A007070
      7000E6E6E600E4E4E400C8C8C8008080800000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F900F1F1F100909090006A6A6A00DADADA00EEEEEE00EBEBEB00E8E8
      E800E6E6E600E4E4E400C8C8C8008080800000000000CFCFCF00FEFEFE00FBFB
      FB00F9F9F900F7F7F700F5F5F500F2F2F200F0F0F000EEEEEE00EBEBEB00E8E8
      E800E6E6E600E4E4E400C8C8C8008080800000000000C8C8C800FFFFFF00FAFA
      FA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8C800B9B9B9007070
      70000000000000000000000000000000000000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC006A6A6A006A6A6A00F5F5F500F2F2F200F0F0F0006A6A6A006A6A
      6A00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00B7B7B7006A6A6A00C8C8C800F0F0F000EEEEEE00EBEB
      EB00E8E8E800E6E6E600C8C8C8008080800000000000CFCFCF00FFFFFF00FEFE
      FE00FCFCFC00EBEBEB00A5A5A500777777006A6A6A0076767600A7A7A700E2E2
      E200E8E8E800E6E6E600C8C8C800808080000000000000000000C8C8C800FFFF
      FF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8C800B9B9
      B9007070700000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE006A6A6A006A6A6A00F8F8F800F6F6F600D7D7D7006A6A6A009D9D
      9D00EBEBEB00E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE00FCFCFC00D1D1D1006A6A6A00ADADAD00F4F4F400F1F1F100EFEF
      EF00EBEBEB00E8E8E800C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE008A8A8A006A6A6A00BDBDBD00F1F1F100EFEFEF00B3B3B3009898
      9800EBEBEB00E8E8E800C8C8C80080808000000000000000000000000000C8C8
      C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFFFF00C8C8
      C800B9B9B90070707000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A00ACACAC00E9E9
      E900EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00E8E8E8006A6A6A008B8B8B00F6F6F600F4F4F400F1F1
      F100EFEFEF00EDEDED00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00F8F8F800F8F8F800F6F6F600EDEDED006A6A
      6A00EFEFEF00EDEDED00C8C8C800808080000000000000000000000000000000
      0000C8C8C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5E500FFFF
      FF00C8C8C800B9B9B900808080000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FCFCFC00EFEFEF00B0B0B00071717100C6C6
      C600F1F1F100EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB006A6A6A006A6A6A00F4F4F400F6F6F600F4F4
      F400F1F1F100EFEFEF00C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FCFCFC00FAFAFA00F8F8F800F6F6F6006A6A
      6A00F1F1F100EFEFEF00C8C8C800808080000000000000000000000000000000
      000000000000C8C8C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEAEA00E5E5
      E500FFFFFF00C8C8C8009F9F9F000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FEFEFE00FCFCFC00F9F9F9006A6A6A007171
      7100F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E8E8E006A6A6A00DCDCDC00F8F8F800F6F6
      F600F4F4F400F1F1F100C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FEFEFE00FCFCFC00FAFAFA00F8F8F8006A6A
      6A00F4F4F400F1F1F100C8C8C800808080000000000000000000000000000000
      00000000000000000000C8C8C800FFFFFF00FAFAFA00F5F5F500EFEFEF00EAEA
      EA00E5E5E500FFFFFF009F9F9F000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FFFFFF00FEFEFE00D6D6D6006A6A6A007171
      7100F6F6F600F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2C2C2006A6A6A00AEAEAE00F9F9F900F8F8
      F800F6F6F600F4F4F400C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF006A6A6A006A6A6A00FFFFFF00FEFEFE00FCFCFC00FAFAFA006A6A
      6A00F6F6F600F4F4F400C8C8C800808080000000000000000000000000000000
      0000000000000000000000000000C8C8C800FFFFFF00FCFCFC00F8F8F800F2F2
      F200FDFDFD00E5E5E500B9B9B9000000000000000000CFCFCF00FFFFFF00FFFF
      FF006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006D6D6D00AEAEAE00F0F0
      F000F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D2D2D2006A6A6A006A6A6A006A6A6A0084848400FAFA
      FA00F8F8F800F6F6F600C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00F8F8F8006A6A6A006A6A6A00F7F7F700FFFFFF00FEFEFE00F6F6F6006A6A
      6A00F0F0F000F6F6F600C8C8C800808080000000000000000000000000000000
      000000000000000000000000000000000000C8C8C800FFFFFF00FCFCFC00FDFD
      FD00E5E5E500B9B9B900000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F9F9F900C8C8C8008080800000000000CFCFCF00FFFFFF00FFFF
      FF006A6A6A006A6A6A006A6A6A006A6A6A00FFFFFF00FFFFFF006A6A6A006A6A
      6A006A6A6A00F9F9F900C8C8C800808080000000000000000000000000000000
      00000000000000000000000000000000000000000000C8C8C800C8C8C800C8C8
      C800C8C8C80000000000000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F9008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F9008080800000000000CFCFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00F9F9F900808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000CFCFCF00CFCF
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
      0000000000008B8B8B006A6A6A006A6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      00000000000000000000D1D1D100808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      000000000000000000000000000000000000909090007C7C7C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF008B8B8B008B8B8B008B8B8B006A6A6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00F1F1F100EDEDED00EAEAEA00E6E6
      E600E1E1E100DEDEDE00DEDEDE007B7B7B000000000000000000000000000000
      00000000000000000000D1D1D100F2F2F200CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00808080000000000000000000000000000000
      000000000000000000000000000000000000949494009D9D9D007C7C7C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF008B8B8B00AFAFAF00C7C7C7006A6A6A0000000000000000008B8B
      8B008B8B8B008282820000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00F5F5F500F1F1F100EDEDED00EAEA
      EA00E8E8E800E4E4E400E0E0E0007B7B7B00000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00D1D1D100F6F6F600F2F2F200EFEFEF00EBEBEB00E9E9
      E900E6E6E600E2E2E200CECECE00808080000000000000000000000000000000
      00000000000000000000000000000000000000000000949494009E9E9E007C7C
      7C00000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF008B8B8B0000000000C7C7C7006A6A6A00000000008B8B8B008B8B
      8B00828282008282820082828200000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00FAFAFA00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200E4E4E4007B7B7B00B9B9B900E6E6E600BABABA00BABA
      BA00BABABA00BABABA00D1D1D100FAFAFA00B8B8B800B8B8B800B8B8B800B8B8
      B800B8B8B800E6E6E600CECECE00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009D9D
      9D007C7C7C000000000000000000000000000000000000000000000000000000
      0000AFAFAF00C7C7C70082828200828282006A6A6A00000000008B8B8B00AFAF
      AF00C7C7C700828282006A6A6A00000000000000000000000000000000000000
      0000000000000000000000000000CCCCCC00FFFFFF00FBFBFB00F7F7F700F3F3
      F300EFEFEF00ECECEC00E8E8E8007B7B7B00B9B9B900E9E9E900E6E6E600E3E3
      E300E0E0E000DDDDDD00D1D1D100FFFFFF00FBFBFB00F8F8F800F4F4F400F0F0
      F000EDEDED00E9E9E900CECECE00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A9A9A900B8B8
      B800989898009898980000000000000000000000000000000000000000000000
      000000000000AFAFAF00C7C7C700828282006A6A6A006A6A6A008B8B8B000000
      0000AFAFAF00828282006A6A6A0000000000D6D6D60092929200929292009292
      9200929292009292920092929200CCCCCC00FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200ECECEC007B7B7B00B9B9B900ECECEC00E9E9E900E6E6
      E600E3E3E300E0E0E000D1D1D100FFFFFF00B8B8B800B8B8B800B8B8B800B8B8
      B800B8B8B800EDEDED00CECECE00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B8B8B8007C7C7C0000000000000000000000000000000000000000000000
      00000000000000000000AFAFAF007A7A7A00878787006A6A6A008B8B8B008282
      82006A6A6A006A6A6A000000000000000000D6D6D600F2F2F200EFEFEF00EBEB
      EB00E8E8E800E4E4E400E1E1E100CCCCCC00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00F7F7F700F3F3F300EFEFEF007B7B7B00B9B9B900EFEFEF00ECECEC00E9E9
      E900E6E6E600E3E3E300D1D1D100FFFFFF00FFFFFF00FFFFFF00FBFBFB00F8F8
      F800F4F4F400F0F0F000CECECE0080808000000000009D9D9D006A6A6A006A6A
      6A006A6A6A006A6A6A006A6A6A006A6A6A000000000000000000000000009494
      9400B8B8B800A9A9A900A5A5A500000000000000000000000000000000000000
      000000000000000000000000000099999900C8C8C800969696006A6A6A006A6A
      6A008B8B8B00000000000000000000000000D6D6D600F6F6F600F2F2F200EFEF
      EF00EBEBEB00E9E9E900E6E6E600CCCCCC00FFFFFF00B2B2B200B2B2B200FFFF
      FF00CCCCCC008D8D8D008D8D8D008D8D8D00B9B9B900EFEFEF00EFEFEF00ECEC
      EC00E9E9E900E6E6E600D1D1D100FFFFFF00B8B8B800B8B8B800B8B8B800FBFB
      FB00F8F8F800CFCFCF008080800080808000000000009D9D9D00B8B8B800B8B8
      B800B8B8B800B8B8B8006A6A6A00000000000000000000000000000000009494
      9400B8B8B800A9A9A9007C7C7C00000000000000000000000000000000000000
      0000000000000000000099999900DEDEDE00D2D2D20099999900000000000000
      000000000000000000000000000000000000D6D6D600FAFAFA00CBCBCB00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CCCCCC00F4F4F4008D8D8D0000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF00ECECEC00E9E9E900D1D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00CFCFCF00FFFFFF0080808000000000009D9D9D00B8B8B800BCBC
      BC00B9B9B900B4B4B4006A6A6A00000000000000000000000000000000009494
      9400B8B8B800A9A9A9007C7C7C00000000000000000000000000000000000000
      00000000000099999900E5E5E50099999900E1E1E10099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00FBFBFB00F8F8
      F800F4F4F400F0F0F000EDEDED00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CCCCCC009D9D9D000000000000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00ECECEC00D1D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CFCFCF008080800000000000000000009D9D9D00B8B8B800D2D2
      D200BCBCBC00B9B9B900A5A5A5006A6A6A0000000000000000006A6A6A00D2D2
      D200B8B8B800A9A9A90098989800000000000000000000000000000000000000
      000099999900F0F0F00099999900BDBDBD00EBEBEB0099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00CBCBCB00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00000000000000000000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00D1D1D100D1D1D100D1D1D100D1D1D100D1D1D100D1D1
      D100D1D1D100D1D1D1000000000000000000000000009D9D9D00D2D2D2009D9D
      9D00D2D2D200BCBCBC00B9B9B900A5A5A5006A6A6A006A6A6A00D2D2D200B8B8
      B800B8B8B800A9A9A900A5A5A50000000000000000000000000000000000BDBD
      BD00FFFFFF009999990000000000BDBDBD00F0F0F00099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00F8F8F800F4F4F400F0F0F0008080800000000000000000000000
      000000000000000000000000000000000000B9B9B900EFEFEF00EFEFEF009999
      99007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00BABA
      BA007F7F7F00000000000000000000000000000000009D9D9D009D9D9D000000
      00009D9D9D00D2D2D200BCBCBC00B9B9B900B5B5B500B2B2B200B1B1B100B8B8
      B800A9A9A900989898000000000000000000000000000000000000000000BDBD
      BD00999999000000000000000000BDBDBD00F6F6F60099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00CBCBCB00CBCB
      CB00FFFFFF00D6D6D60080808000808080008080800000000000000000000000
      000000000000000000000000000000000000B9B9B900EFEFEF00EFEFEF009999
      9900EFEFEF00E1E1E1007F7F7F00E1E1E100D7D7D700BDBDBD007F7F7F00BABA
      BA007F7F7F00000000000000000000000000000000009D9D9D00000000000000
      0000000000009D9D9D00D2D2D200D2D2D200D2D2D200D2D2D200B8B8B8009898
      9800A5A5A500000000000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000BDBDBD00FFFFFF0099999900000000000000
      000000000000000000000000000000000000D6D6D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6D6D600F4F4F400808080000000000000000000000000000000
      000000000000000000000000000000000000B9B9B900EFEFEF00EFEFEF00EFEF
      EF0099999900EFEFEF007F7F7F007F7F7F00E1E1E1007F7F7F00DFDFDF00DFDF
      DF007F7F7F000000000000000000000000000000000000000000000000000000
      00000000000000000000A4A4A4009D9D9D009D9D9D009D9D9D00A4A4A4000000
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
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001FFFFC001FE7F8000FE098000FC3F
      8000F6D68000F81F8000C3178000F00F800096D68000E0078000BF198000C003
      8000BFFF800080018000FFFF800000008000803F800000008000B5DF80008001
      8000C5DF8000C0038000B5DF8000E0078000C43F8000F00F8000FDFF8000F81F
      C001FDFFC001FC3FFFFFF9FFFFFFFE7FFFFFFFFFC000F87F800180018000C000
      8001800180008000800180018000800080018001800080008001800180008000
      8001800180008000800180018000800080018001800080008001800180008000
      8001800180008000818F818F80008000C38FC38F80008000FFA4FFA48000C000
      FFF1FFF18000F07FFFFFFFFF8000FC7FFFFFFFFFFC3FFF03C0030381F00FE001
      C0030381E007E001C0030381C003E001C00303818001E001C00303818001E001
      C00300010000E001000000010180E0018001800301800001C003C00700000001
      E007C10780000001F007C10780000001F807E38FC0000001FC27E38FE0010003
      FE67FFFFF0030007FFFFFFFFFC278FFFFC3FFC3FC001C001F00FF00FC001C001
      E007E007C001C001C003C003C001C00180018001C001C00180018001C001C001
      00000000C001C00100000000C001C00100000000C001C00100000000C001C001
      80018001C001C00180018001C001C001C003C003C001C001E007E007C003C003
      F00FF00FC007C007FC3FFC3FC00FC00FC001FFFFC000FFFFC001FFFF8000800F
      C001000F80000007C001000F80000003C001000780000001C001000780000001
      C001000380000001C001000380000001C001000180008001C001000180008001
      C00100078000E001C00100008000E007C00103F88000F003C00387F88000F803
      C007FF928000F803C00FFFC78000FFFFC001C001C001FFFF8000800080009C03
      8000800080000C038000800080000C038000800080009FFF800080008000FFFF
      8000800080009C038000800080000C038000800080000C038000800080009FFF
      800080008000FFFF8000800080009C038000800080000C038000800080000C03
      C001C001C0019FFFFFFFFFFFFFFFFFFFFFFFC001C001C001F001800080008000
      C07F800080008000803F800080008000801F800080008000800F800080008000
      C007800080008000E003800080008000F001800080008000F801800080008000
      FC01800080008000FE01800080008000FF03800080008000FF87800080008000
      FFFFC001C001C001FFFFFFFFFFFFFFFFFFFFF8FFFE00FC00FF3FF07FFE00FC00
      FF1FF063FE008000FF8FF241FE000000FFC7F041FE000000FFC3F81100000000
      FFE3FC030000000080E1FE070000000081E1FC3F0001000081E1F83F00030001
      80C1F03F000700038001E23F007F00079003E63F007F0007B807EE3F00FF0007
      FC1FFE7F01FF800FFFFFFEFF03FFF87FFFFF8001E000FC00FE3F0000E000F800
      F81F0000E000E000E00F0000C000C00080070000800080000003000000008000
      00010000000000000000000000000000000100008000000080010000C0000000
      C0018001E0000001E000C003E0008003F000E001E0008003F803F00CE001C007
      FC0FF81EE003E00FFE3FFC3FE007F83F}
  end
  object ilHotImages: TImageList
    Left = 296
    Top = 327
    Bitmap = {
      494C010124002700040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
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
      00000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      00000000000000000000000000004E2E1C004E2E1C0000000000000000000000
      00000000000000000000000000000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A000006A300A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000530000005300000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C000000000000000000000000000000
      000000000000000000004E2E1C00EEE6E200EEE6E2004E2E1C00000000000000
      00000000000000000000000000000000000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000000BB800A48B7A004E2E1C000000000000000000000000000000
      0000801C00000000000000000000000000000000000000000000000000000000
      00000053000000000000000000000053000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C000000000000000000000000000000
      0000000000004E2E1C00EEE6E200801C0000801C0000EEE6E2004E2E1C000000
      00000000000000000000000000000000000000000000B2998800F8F6F300801C
      0000801C0000EEE6E100801C0000801C0000E3D7CF00801C0000801C0000001C
      F6000018EB000011D100000BB8000009AF000000000000000000801C0000801C
      0000801C0000801C000000000000000000000000000000000000000000000000
      00000053000000000000000000000000000000000000B2998800F8F6F300F4F0
      ED00F2EBE700801C0000801C0000801C0000E3D7CF00E0D0C900801C0000801C
      0000801C0000D1BCB000A48B7A004E2E1C000000000000000000000000000000
      00004E2E1C00EEE6E200801C0000F36C3600F2622B00801C0000EEE6E2004E2E
      1C000000000000000000000000000000000000000000B2998800FCFBFA00F8F6
      F300F4F0ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCB
      C200801C00000018EB00A48B7A004E2E1C0000000000801C0000CB4C1E000000
      0000801C00000000000000000000000000000000000000000000000000000000
      00000053000000000000000000000053000000000000B2998800FCFBFA00F8F6
      F300F4F0ED00F2EBE700801C0000EAE1DA00E7DCD500E3D7CF00E0D0C900801C
      0000D9C6BC00D5C1B600A48B7A004E2E1C000000000000000000000000004E2E
      1C00EEE6E200801C0000B47A5A00B47A5A00B47A5A00B47A5A00801C0000EEE6
      E2004E2E1C0000000000000000000000000000000000B2998800FFFFFF00801C
      0000FBF8F700DCBCAD008B2D0C00801C00009D492800801C0000801C0000E0D0
      C900DCCBC200001CF600A48B7A004E2E1C0000000000801C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000530000005300000000000000000000B2998800108710000077
      000010860F00F7F3F00042A14000801C0000801C0000801C0000801C0000801C
      0000DCCBC200D9C6BC00A48B7A004E2E1C0000000000000000004E2E1C00EEE9
      E300801C0000F4835100FFFFFF00FFFFFF00FFFFFF00FFFFFF00954B2C00801C
      0000EEE6E2004E2E1C00000000000000000000000000B2998800FFFFFF00801C
      0000FEFEFC00A3513100801C0000E5CFC500DCC0B200801C0000801C0000E5D9
      D300801C0000DCCBC200A48B7A004E2E1C0000000000801C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800C7E6C700037A
      0300EAF6E900FBF8F700F7F3F0000D830C00801C00009EC59500E9DED800801C
      0000E0D0C900DCCBC200A48B7A004E2E1C00000000004E2E1C00EEE6E200801C
      0000F79D6D00F7976700F4835100FFFFFF00FFFFFF00954B2C00F36C3600F262
      2B00801C0000EEE6E2004E2E1C000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00AB5F4100801C0000CC9E8A00EBE0D800801C0000801C0000E9DE
      D800801C0000E2D4CC00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF0055B0
      550089CA8900FEFEFC00B1D8AD00007700002A952800801C0000EDE3DE00801C
      0000E5D9D300E2D4CC00A48B7A004E2E1C00801C0000F7F3F000B8450000FAB2
      8800F8A77A00F79D6D00F7976700FFFFFF00FFFFFF00954B2C00F3743F00F36C
      3600F2622B00801C0000EEE6E2004E2E1C0000000000B2998800FFFFFF00801C
      0000FFFFFF00F3E6E100B16A4C009236150083200300801C0000801C0000EDE3
      DE00E9DED800E5D9D300A48B7A004E2E1C000000000000000000000000000000
      000000000000000000002C2C2C00494949004949490049494900000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00CCE9
      CC000077000000770000007700000077000089C58600F3EEEA00801C0000801C
      0000E9DED800E5D9D300A48B7A004E2E1C00801C0000FEFEFE00B8450000FAB2
      8800FAB28800F8A77A00F79D6D00FFFFFF00FFFFFF00954B2C00F4794500F374
      3F00F36C3600801C0000EEE6E2004E2E1C0000000000B2998800FFFFFF00801C
      0000FFFFFF00FFFFFF00FFFFFF00FEFEFC00E3C9BC00801C000088280800EFE9
      E300801C0000E9DED800A48B7A004E2E1C000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000494949000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF0028972800C2E5C200067F0600047D0400EDF2E900F7F3F000F3EEEA00801C
      0000EDE3DE00E9DED800A48B7A004E2E1C0000000000801C0000FCF8F600B845
      0000FAB28800FAB28800FFFFFF00FFFFFF00FFFFFF00954B2C00F4835100F479
      4500801C0000EEE6E2004E2E1C000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C2E0D00801C0000801C000092361500D0A69200F3EE
      EA00801C0000EDE3DE00A48B7A004E2E1C000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000494949000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF0097D097001C8F1C000077000045A74500FEFEFC00FBF8F700F7F3F000F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C000000000000000000801C0000FEFE
      FE00B8450000FAB28800FAB28800B47A5A00B47A5A00F7976700F4835100801C
      0000EEE6E2004E2E1C00000000000000000000000000B2998800FFFFFF00801C
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000494949000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FBFEFB000B820B0000770000AFDCAF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C00000000000000000000000000801C
      0000FFFFFF00B8450000FAB28800FFFFFF00FFFFFF00954B2C00801C0000EEE6
      E2004E2E1C0000000000000000000000000000000000B2998800FFFFFF00801C
      0000FFFFFF00801C0000801C0000FFFFFF00801C0000801C0000FFFFFF00801C
      0000801C0000F4F0ED00A48B7A004E2E1C000000000000000000000000000000
      000000000000000000002C2C2C00494949004949490049494900000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF005DB45D000D840D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C000000000000000000000000000000
      0000801C0000FEFEFE00B8450000FFFFFF00FFFFFF00801C0000EEE6E2004E2E
      1C000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C000000000000000000000000000000
      000000000000801C0000FCF8F600B8450000B8450000EEE7E3004E2E1C000000
      0000000000000000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000000000000000
      000000000000000000002C2C2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000000000000000
      00000000000000000000801C0000FEFEFE00F7F3F0004E2E1C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002C2C2C002C2C2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000801C0000801C000000000000000000000000
      0000000000000000000000000000000000000000000044138F002C0873002D09
      76002D0978002D0978002D0976002C08730044138F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B000000000000000000000000000000
      000000000000824542004D1C1C004D1C1C004D1C1C0000000000000000000000
      00000000000000000000000000000000000044138F00340B8600370D92003A10
      9C00370F9600390F9A003A0F9C00370D9100320A8200330D7600000000000000
      000000000000000000000000000000000000000000006B798100004577000045
      7700004577000045770000457700004577000045770000457700004577000045
      77000045770000457700004577000000000000000000C0575400C47F7900BC75
      700056402F00AF9E9600B4AAA500BBB0AA00BBB0AA00BBB0AA00BBB0AA00735B
      4C007B2B28007B2B28007B2B2800522A1B000000000000000000774545004D1C
      1C004D1C1C008C3C370093413B008E413A004D1C1C004D1C1C004D1C1C004D1C
      1C004D1C1C004D1C1C004D1C1C004D1C1C00320A7E00360D8E003A109C00380F
      980030248B00311186003D12A6003A0F9C00350C8B002D0A7200000000000000
      000000000000000000000000000000000000000000006B79810073EDF6000278
      BF000278BF000278BF000278BF000278BF000278BF000278BF000278BF000278
      BF000278BF000278BF00004577000000000000000000C0575400CB888300C47F
      790056402F001A0F0B0044362D00FFFFFF00FFFFFF00FFFFFF00EBDCD400735B
      4C007F2E2C007B2B28007B2B2800522A1B0000000000774545008B3A3600A94A
      4400A7494300A34742009E45400090413B004D1C1C00EB787700EB787700EB78
      7700EB787700EB787700EB7877004D1C1C0044138F00360D91003B11A0002E09
      7A003983D1002E3295003A119E003B11A100350C8B00231A4B00004500000045
      0000004500000045000000450000345F2E00000000006B79810079F0F60073ED
      F6006CE9F40066E3F3005FE0F30059DAF20053D7F2004DD3F20046CEF00040C9
      EF003AC4EF000278BF00004577000000000000000000C0575400D3928C00CB88
      830056402F000000000020130D00FFFFFF00F4EDE900EBDCD400D8BBAB00735B
      4C00873634007F2E2C007B2B2800522A1B000000000077454500B54E4A00B24D
      4800AD4B4600A9494400A447420092423C004D1C1C0000320000003200000032
      00000035000016410A00EB7877004D1C1C000000000044138F00350D8F002625
      87001C5C99001E48900032138E00390F990028165F00156D130012880C001384
      0C0017770D001C650F002352110000450000000000006B79810079F0F60079F0
      F60073EDF6006CE9F40066E3F3005FE0F30059DAF20053D7F2004DD3F20046CE
      F00040C9EF000278BF00004577000000000000000000C0575400DA9C9600D392
      8C0056402F0056402F0056402F0056402F0056402F0056402F0056402F005640
      2F008E3F3C00873634007F2E2C00522A1B000000000077454500BA504C00B74F
      4B00B04D4800A04641009C433F0093423C004D1C1C0000370000003200000032
      0000014A050018511100EB7877004D1C1C00334C79000F2656001B1367002445
      9D00206BB4001D66AD002038930016125400073121000D810A00147513000C8C
      090013840C00186F0E001E59100000450000000000006B79810079F0F60079F0
      F60079F0F60073EDF6006CE9F40066E3F3005FE0F30059DAF20053D7F2004DD3
      F20046CEF0000278BF00004577000000000000000000C0575400E7ABA500E0A1
      9C00D7979100CF8E8800C7837F00BC757000B84841009D797800873634009E50
      4D00964744008E3F3C0087363400522A1B000000000077454500BD524E00BC51
      4D00B4555200D5A09E0084444100893F39004D1C1C0000400200003700000144
      030004660F001B5C1600EB7877004D1C1C00021A530000144100114077002977
      C0002877C0002573BB001E66AC0006285800011A2D00256C2B00A0C0A5002D81
      2D0011890C0016700D000045000000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60073EDF6006CE9F40066E3F3005FE0F30059DAF20053D7
      F2004DD3F2000278BF00004577000000000000000000C0575400EBB0AA00E7AB
      A500E0A19C00D7979100CF8E8800C7837F00B8484100C9A18E0087363400AA5E
      5A009E504D00964744008E3F3C00522A1B000000000077454500C2545000C052
      4F00D5A09E00FCEDED00D5A09E008C403A004D1C1C0001490400074102001656
      0900077214001F571300EB7877004D1C1C0002195200031F52002369AF003083
      CB002F82CA002C7DC5002675BD00134E8C00011B2D0042757900547EA300356E
      7600075F0500004500000000000000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60079F0F60076EFF6006FEBF60066E3F3005FE0F30059DA
      F20053D7F2000278BF00004577000000000000000000C0575400EBB0AA00EBB0
      AA00C7837F00B8484100B8484100B8484100A4736500CAA79200C9A18E008736
      340087363400A1555100994C4800522A1B000000000077454500C9575300C655
      5100C2585300D5A09E00B55652009A4641004D1C1C00074E060073671300C68E
      29001F590A00C68E2900EB7877004D1C1C00031C59000B3272003487CF00388E
      D700368BD4003186CE002C7DC500236FB60004214B00236CB0002574BB001F64
      A5002B699D00000000000000000000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60079F0F60079F0F60076EFF6006FEBF60069E6F40063E2
      F3005CDDF2000278BF00004577000000000000000000C0575400EBB0AA00BAA6
      A000B56F6300CEAD9700D8C0A500DAC5A7002F41D300867FB000CBA79200C9A1
      8E008E56490087363400A1555100522A1B000000000077454500CF595600CB58
      5400C6565100C2545000BD524E009F4842004D1C1C0055661600F6AF6600F6AF
      6600F6AF6600F6AF6600EB7877004D1C1C00041F66000A2E7400215FAB002D77
      C100398ED500358AD3002E80C900236DB400062856002A77BD002D7FC700297A
      C200226BB0002B699D000000000000000000000000006B79810079F0F60079F0
      F60079F0F60079F0F60079F0F60079F0F60079F0F60076EFF6006FEBF60069E6
      F40063E2F3005CDDF200004577000000000000000000C0575400EBB0AA00B56F
      6300E1D1B200E6DABB00E5D9B800E1CFB1009E97B700BDA7A600CFAD9700C9A1
      8E00BB8A79008750490087363400522A1B000000000077454500D35B5900D05A
      5700CC585400C7565200C2545000A04942004D1C1C00F6AF6600F6AF6600F6AF
      6600F6AF6600F6AF6600EB7877004D1C1C00334C79000C2B7B00092986000A2D
      870013429100266CB500236AB000092F6800103C70003588D0003488D0002F81
      CA002879C100236EAC000000000000000000000000006B7981006B7981006B79
      81006B7981006B7981006B7981006B7981006B798100801C0000801C0000801C
      0000801C00006B7981006B7981000000000000000000C0575400B56F6300D8C0
      A600EAE2C100EDE7C500EAE1C000E3D5B600797DC4007273BB00CCAD9A00CAA5
      9000C2988600A972670087363400522A1B000000000077454500DA5D5B00D55B
      5900D15A5700CC585400C7565200A44A43004D1C1C00F6AF6600F6AF6600F6AF
      66009D9D8B00168FF600EB7877004D1C1C000000000017388B000E329C000C2F
      9500092881000727720005236200011646002D76B7003E95DD003A8FD8003487
      D0002D7DC6001869AB000000000000000000000000006B7981007BF2F6007BF2
      F6007BF2F6007BF2F6006B7981000000000000000000801C0000DC8F6800801C
      00000000000000000000000000000000000000000000C0575400B56F6300DAC5
      AA00EBE5C200EEEBC700EAE2C100E3D5B700C1B5B1001D2FDD00A190A500CAA5
      9000C2988600AA72670087363400522A1B000000000077454500DE5F5E00DC5E
      5C00D75C5A00D35B5800CE595600A64B45004D1C1C00F6AF6600F6AF66009D9D
      8B0011A5F400168FF600EB7877004D1C1C0000000000334C79000C2C82000E32
      99000928830005236E00021D58000C43790022659C002B74B0003483C6003589
      D1002C7BC100004D7700000000000000000000000000000000006B7981006B79
      81006B7981006B798100000000000000000000000000801C0000801C0000AC56
      25000000000000000000000000000000000000000000C0575400EBB0AA00B56F
      6300E5D8B700E9DEBD00C0BDC1000C24E700BDB1B0000D20E700887BAD00C9A4
      8F00BA8978009656500087363400522A1B000000000077454500D75D5B00DC5E
      5D00DC5E5C00D75C5A00D35A5800A94C46004D1C1C00F6AF66009D9D8B000DB4
      F6000DB4F60011A5F400EB7877004D1C1C000000000000000000506B9F00334C
      7900334C7900506B9F00000000000077B8002E7BB8002C76B400266CA6002369
      A4001C5B9200004D770000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000801C000000000000801C
      0000AC56250000000000AC562500801C000000000000C0575400EBB0AA00E0CC
      C700B56F6300D1B29C00CEBAA9006069C5003E4ACF004F54BC00B2918E00B888
      7A009D5E4D008736340000000000522A1B0000000000000000009C554D007745
      4500B7524F00B7524F00C7575500A64B46004D1C1C0077454500774545007745
      4500774545007745450077454500774545000000000000000000000000000000
      00000000000000000000000000000077B8000077B8003689CA002C76B4001F62
      980016528000004D770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000801C0000801C0000801C00000000000000000000C0575400EBB0AA00B848
      4100D9B8AF00B56F6300B5806F00B6826F00B57F6D00B1786800B0796C00B88E
      820087363400B8484100B8706C00522A1B000000000000000000000000000000
      00009C554D0077454500B7524F00B7524F004D1C1C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000077B8001F7EBF000F65A5000A5D
      9C00004D77000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0575400C0575400C057
      5400C0575400C0575400C0575400C0575400C0575400C0575400C0575400C057
      5400C0575400C0575400C0575400C05754000000000000000000000000000000
      000000000000000000009C554D00774545007745450000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7744F00BC591F009C4A1A009C4A
      1A009C4A1A00BB7E5B0000000000000000000000000000000000000000000000
      0000000000000000000091625E00066807000045000006680700000000000000
      00000000000000000000000000000000000000000000000000004F3E33001D1C
      17001D1C17001D1C17001D1C17001D1C17001D1C17001D1C17001D1C17001D1C
      17001D1C17001D1C17000000000000000000966447008E5C40007D442800753D
      23006428100064281000000000000000000000000000966447008E5C40007D44
      2800753D2300642810006428100000000000000000000000000000000000A48B
      7A004E2E1C004E2E1C004E2E1C00863E1800BC591F00E0A57400B68A6900EDC5
      9D00C47745009C4A1A006A2D0F00000000000000000000000000000000000000
      000091625E00814C4B00035406000A77110005760D0003670600004500009162
      5E000000000000000000000000000000000000000000000000004F3E3300F2EB
      E700A48B7A00A48B7A00004D77001F99D400047DB400004D7700A48B7A00A48B
      7A00A48B7A001D1C1700000000000000000096644700FBF8F800DAB8A500BF8C
      7300975B3B006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300975B3B006428100000000000000000000000000000000000A48B
      7A00EBE2DD00A48B7A009F755E00BC591F00F3C59200FFD39300FFCA8300FFC2
      7A00FED9AC00C4743F009C4A1A0000000000000000000000000000000000814C
      4B00D49F9E00FFC1C1000668070011861F0033B655000D871C00036B07000668
      0700814C4B0000000000000000000000000000000000000000004F3E3300FAF7
      F600F4EFED00EFE7E300004D77002BA3DE001A5B7600004D7700D5C1B600D0BA
      AD00A48B7A001D1C1700000000000000000096644700FBF8F800DAB8A500BF8C
      7300A66644006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300A66644006428100000000000000000000000000000000000A48B
      7A00F2EBE900EEE5E100BC591F00D78A5400FFE9B800FFD89700A5896000BA95
      6400EDB77600E0B18A00B2450C00000000000000000000000000814C4B00FFC6
      C600FFC5C500FFC4C4000F88210033B655003AE1650033B65500097B14000360
      0C0033B65500814C4B00000000000000000000000000000000004F3E3300FFFF
      FF00FAF7F600F4EFED00004D770045B8F60037ADEA00004D7700DAC9BF00D5C1
      B600A48B7A001D1C1700000000000000000096644700FBF8F800DAB8A500BF8C
      7300A66644006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300A66644006428100000000000000000000000000000000000A48B
      7A00F7F2F000F2EBE900BC591F009F684D00F6F4E100FFE6B1004F4739004F47
      39004F4739009C6C5300BC561800000000000000000091625E00D49F9E00FFC7
      C700FFC6C600FFC5C500FFC4C400007700000E861C000C7B1600097510000360
      0C0033B65500E6DAD90091625E000000000000000000000000004F3E3300FFFF
      FF00FFFFFF00FAF7F600004D770045B8F60045B8F600004D7700E0D0C900DAC9
      BF00A48B7A001D1C1700000000000000000096644700FBF8F800DAB8A500BF8C
      7300A66644006428100000000000000000000000000096644700FBF8F800DAB8
      A500BF8C7300A66644006428100000000000000000000000000000000000A48B
      7A00FBF8F800F7F2F000BC591F00D58E5C00FCFAEA00FFFBE300FFE9B5004F47
      39009C886900D4936300B75419000000000000000000814C4B00FFCBCB00FFCA
      CA00FFC7C700FFC6C600EDBDBD009D7E7E00149628000F882100007700000360
      0C0033B65500FFE2E200814C4B000000000000000000000000004F3E3300FFFF
      FF00FFFFFF00FFFFFF00004D7700004D7700004D7700004D7700E5D8D100E0D0
      C900A48B7A001D1C170000000000000000009664470088503500885035007839
      1C0078391C006428100064281000542B13009664470088503500885035007839
      1C0078391C00642810006428100000000000000000000000000000000000A48B
      7A00FFFFFF00FBF8F800EFE3E000BC591F00D5A78600F8F3E300E2DAC700FCE6
      B8004F473900D78041009C4A1A000000000091625E00D49F9E00FFCBCB00FFCA
      CA00FFC7C700F4C6C60099929200B7B2B500B1A6A90099929200E6C9C9000360
      0C0033B65500FFB6B600D49F9E0091625E00004D7700004D770000457700B1AF
      AD00FFFFFF00FFFFFF00FFFFFF00FAF7F600F4EFED00EFE7E300EAE0D900E5D8
      D100A48B7A00004D7700004D7700004D7700D3B5930096644700E6CCBF00E6CC
      BF00BB896F00975B3B00642810008850350096644700E6CCBF00E6CCBF00BB89
      6F00975B3B00642810007745450000000000000000000000000000000000A48B
      7A00FFFFFF00FFFFFF00FBF8F800E0C5BB00BC591F00D9AB8C00B2816300D88B
      5300DD8749009C4A1A004F2D1C0000000000814C4B00FFB6B600FFB5B500FFB5
      B500FFB5B500C19F9F0073595900000000000000000073595900B88E8E000360
      0C0033B65500FFB5B500FFB5B500814C4B0000000000004D77001C92C2000045
      7700B1AFAD00FFFFFF00FFFFFF00FFFFFF00FAF7F600F4EFED00EFE7E300B1AF
      AD00004D77001C92C200004D7700000000000000000096644700FFFFFF00EDE1
      DD00E9C5B000975B3B0064281000B880770096644700FFFFFF00EDE1DD00E9C5
      B000975B3B007745450000000000000000006B7981006B7981006B7981006B79
      81006B7981006B7981006B7981006B7981006C737800BC591F009C4A1A009C4A
      1A009C4A1A00A48B7A004E2E1C0000000000814C4B00FFB7B700FFB6B600FFB6
      B600FFB6B600D8B2B20073595900000000000000000073595900CEA6A6000360
      0C0033B65500FFCCCC00FFCECE00814C4B000000000000000000004D77001C92
      C20000457700B1AFAD00FFFFFF00FFFFFF00FFFFFF00FAF7F600B1AFAD00004D
      77001C92C200004D770000000000000000000000000000000000966447008850
      35007D44280064281000642810008850350096644700885035007D4428006428
      1000642810000000000000000000000000006B7981004CD3F7004CD3F7004CD3
      F70046CEF70037C1EF002CB6E9001FAAE3006B798100F7F2F000F2EBE900EEE5
      E100E9DED900A48B7A004E2E1C000000000091625E00D49F9E00FFB5B500FFBA
      BA00FFD4D400FCEFEF0099929200735959007359590099929200F6C4C4000360
      0C0033B65500FFCCCC00D49F9E0091625E00000000000000000000000000004D
      77001C92C20000457700B1AFAD00FFFFFF00FFFFFF00B1AFAD00004D77001C92
      C200004D7700000000000000000000000000000000000000000096644700FBF8
      F800D4B29D00975B3B00642810000000000096644700FBF8F800D4B29D00975B
      3B00642810000000000000000000000000006B7981006B7981004CD3F7004CD3
      F7004CD3F7004CD3F7003FC7F30030BBEB0025B0E6006B798100FAF6F400F4EF
      ED00A48B7A00A48B7A004E2E1C000000000000000000814C4B00FFE1E100FFFB
      FB00FFFFFF00FFFFFF00FCFBFB00EECBCB00EBC4C400FAC4C400FFC5C5000360
      0C0033B65500FFCACA00814C4B00004500000000000000000000000000000000
      0000004D77001C92C20000457700B1AFAD00B1AFAD00004D77001C92C200004D
      7700000000000000000000000000000000000000000000000000966447008850
      35007D44280064281000885035000000000096644700885035007D4428006428
      1000885035000000000000000000000000006B7981007BF2F6006B7981006B79
      81006B7981006B7981006B7981006B7981006B7981006B798100FEFCFC00A48B
      7A004E2E1C004E2E1C004E2E1C00000000000000000091625E00E6DAD900FFFF
      FF00FFFFFF00FFFFFF00FFF0F000FFBFBF00FFC1C100FFC2C200FFC4C4000360
      0C0033B65500D49F9E0000450000004500000000000000000000000000000000
      000000000000004D77001C92C20000457700004577001C92C200004D77000000
      4A00000033000000000000000000000000000000000000000000000000009664
      4700FBF8F8006428100000000000000000000000000096644700FBF8F8006428
      1000000000000000000000000000000000006B7981007BF2F6007BF2F6007BF2
      F60073EBF60069E5F4005FDEF30057D8F3006B798100FFFFFF00FFFFFF00A48B
      7A00EFE5DE00D0BAAD004E2E1C00000000000000000000000000814C4B00E6DA
      D900FFFFFF00FFFFFF00FFD7D700FFBDBD00FFBFBF00FFC1C100FFC2C2000360
      0C0033B655000045000032BF4F0003600C000000000000000000000000000000
      00000000000000000000004D77001C92C2001C92C200004D7700000000000000
      8000000064000000000000000000000000000000000000000000000000009664
      4700966447008850350000000000000000000000000096644700966447008850
      3500000000000000000000000000000000006B7981007BF2F6007BF2F6007BF2
      F6007BF2F6006B7981006B7981006B7981006B798100FFFFFF00FFFFFF00A48B
      7A00D0BAAD004E2E1C000000000000000000000000000000000000000000814C
      4B00E6DAD900FFFBFB00FFBDBD00FFBCBC00FFBDBD00FFBFBF00FFC1C1000360
      0C000045000032BF4F0003600C00000000000000000000000000000000000000
      0000000000000000000000000000004D7700004D770000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B7981007BF2F6007BF2F6007BF2
      F6006B798100A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A004E2E1C000000000000000000000000000000000000000000000000000000
      000091625E00814C4B00D49F9E00FFBCBC00FFBDBD00D49F9E00814C4B000360
      0C0032BF4F0003600C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B7981006B7981006B79
      8100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091625E00814C4B00814C4B0091625E00000000000360
      0C0003600C000000000000000000000000000000000000000000000000000000
      00000000000000000000545B5C003D4344003D434400545B5C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000545B5C003D4344003D434400545B5C00000000000000
      0000000000000000000000000000000000000000000000000000B89F8E004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000B89F8E004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000545B5C003D43440009580D0009700C00066F0900035804003D434400545B
      5C00000000000000000000000000000000000000000000000000000000000000
      0000545B5C003D43440009580D0009700C00066F0900035804003D434400545B
      5C00000000000000000000000000000000000000000000000000B89F8E00E9DE
      D800A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A004E2E1C00000000000000000000000000B89F8E00E9DE
      D800A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A004E2E1C00000000000000000000000000000000003D43
      44001879220016871F00118018000D7A110009750C00066F0900046C05000264
      03003D4344000000000000000000000000000000000000000000000000003D43
      44001879220016871F00118018000D7A110009750C00066F0900046C05000264
      03003D4344000000000000000000000000000000000000000000B89F8E00EDE3
      DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4BA00D3BFB400D0BA
      AD00D0BAAD00A48B7A004E2E1C00000000000000000000000000B89F8E00EDE3
      DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4BA00D3BFB400D0BA
      AD00D0BAAD00A48B7A004E2E1C000000000000000000000000003D4344002A95
      3900239331001D8C2800188820004F3E33000E7D13000A770D0006720900046C
      0600026903003D434400000000000000000000000000000000003D4344002A95
      3900239331001D8C2800188820004F3E33000E7D13000A770D0006720900046C
      0600026903003D43440000000000000000000000000000000000B89F8E00F0E9
      E500EDE3DE000000800000008000E2D4CC00DECEC600DAC9C000000080000000
      8000D0BAAD00A48B7A004E2E1C00000000000000000000000000B89F8E00F0E9
      E500EDE3DE0000810000E5D9D300299D2700299D270056B45300D7C4BA00D3BF
      B400D0BAAD00A48B7A004E2E1C000000000000000000545B5C003287440036A4
      49002E9E3F00289836004F3E33004F3E330016871D000F8016000B780F000772
      0A00046D060002650300545B5C000000000000000000545B5C003287440036A4
      49002E9E3F002898360022922D004F3E33004F3E33000F8016000B780F000772
      0A00046D060002650300545B5C00000000000000000000000000B89F8E00F3EE
      EB00F0E9E5003142D900232FC40000008000E2D4CC0000008000000080000000
      8000D3BFB400A48B7A004E2E1C00000000000000000000000000B89F8E00F3EE
      EB00F0E9E500008100000081000000810000008100000081000056B45300D7C4
      BA00D3BFB400A48B7A004E2E1C0000000000000000003D4344004CB6680043AF
      5B003CAA51004F3E3300E6DAD3004F3E33004F3E33004F3E33004F3E33000C7A
      100007740A00056E06003D43440000000000000000003D4344004CB6680043AF
      5B004F3E33004F3E33004F3E33004F3E3300E0D0C7004F3E3300118218000C7A
      100007740A00056E06003D434400000000000000000000000000B89F8E00F7F3
      F200F3EEEB00F0E9E5003142D900232FC400000080000C0F9D0000008000DAC9
      C000D7C4BA00A48B7A004E2E1C00000000000000000000000000B89F8E00F7F3
      F200F3EEEB000081000033BD6B0000810000E5D9D300E2D4CC000081000056B4
      5300D7C4BA00A48B7A004E2E1C0000000000545B5C00346746005BC17D0053BC
      70004F3E3300F4EFED00EDE5E000E6DAD300E0D0C700DCCBC1004F3E33001182
      18000C7A100008750B0004590600545B5C00545B5C00346746005BC17D0053BC
      70004F3E3300FBFAFA00F4EFED00EDE5E000E6DAD300E0D0C7004F3E33001182
      18000C7A100008750B0004590600545B5C000000000000000000B89F8E00FBFA
      F800F7F3F200F3EEEB00F0E9E5003142D900232FC40000008000E2D4CC00DECE
      C600DAC9C000A48B7A004E2E1C00000000000000000000000000B89F8E00FBFA
      F800F7F3F20000810000008100000081000000810000E5D9D300E2D4CC000081
      0000DAC9C000A48B7A004E2E1C00000000003D43440050996D006ACC90004F3E
      3300FFFFFF00FBFAFA00F4EFED00EDE5E000EAE0D900E2D5CC004F3E3300198C
      2300128218000C7B110009750C003D4344003D43440050996D006ACC900065CA
      89004F3E3300FFFFFF00FBFAFA00F4EFED00EDE5E000EAE0D900E2D5CC004F3E
      3300128218000C7B110009750C003D4344000000000000000000B89F8E00FFFF
      FF00FBFAF800F7F3F2004862FA004056EE00384CE3002938CE0000008000E2D4
      CC00DECEC600A48B7A004E2E1C00000000000000000000000000B89F8E00FFFF
      FF00FBFAF800F7F3F200F3EEEB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4
      CC00DECEC600A48B7A004E2E1C00000000003D4344004F926B0070D199004F3E
      3300FFFFFF00FFFFFF00FBFAFA00F7F4F300F0EAE600EAE0D9004F3E33002295
      2D00188A2100128218000D7811003D4344003D4344004F926B0070D1990074D4
      9D004F3E3300FFFFFF00FFFFFF00FBFAFA00F7F4F300F0EAE600EAE0D9004F3E
      3300188A2100128218000D7811003D4344000000000000000000B89F8E00FFFF
      FF00FFFFFF004862FA004862FA0000008000F2EBE900384CE3002938CE000000
      8000E3D7CF00A48B7A004E2E1C00000000000000000000000000B89F8E00FFFF
      FF0000810000FCFCFC00FAF7F60000810000008100000081000000810000E7DC
      D500E3D7CF00A48B7A004E2E1C0000000000545B5C00355F470076D5A00079D8
      A5004F3E3300FFFFFF00FFFFFF00FFFFFF00F7F4F300F0EAE6004F3E33002B9E
      3A0020922D00188A22000E5F1300545B5C00545B5C00355F470076D5A00079D8
      A5004F3E3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F4F3004F3E33002B9E
      3A0020922D00188A22000E5F1300545B5C000000000000000000B89F8E00FFFF
      FF00FFFFFF004862FA0000008000FAF7F600F6F0EF00F2EBE900384CE3000000
      8000E7DCD500A48B7A004E2E1C00000000000000000000000000B89F8E00FFFF
      FF00ADD59D0000810000FCFCFC00FAF7F6000081000033BD6B0000810000EAE1
      DC00E7DCD500A48B7A004E2E1C0000000000000000003D4344007AD8A6007DDC
      AA0081DEAF004F3E3300FFFFFF004F3E33004F3E33004F3E33004F3E330035A5
      4700289A370020922C003D43440000000000000000003D4344007AD8A6007DDC
      AA004F3E33004F3E33004F3E33004F3E3300FFFFFF004F3E330042B25A0035A5
      4700289A370020922C003D434400000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00F2EBE900EEE6
      E200C9AD9D00A48B7A004E2E1C00000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00ADD59D000081000000810000008100000081000000810000EEE6
      E200C9AD9D00A48B7A004E2E1C000000000000000000545B5C004F8B6C0080DD
      AD0082E0B10086E1B4004F3E33004F3E33006FD495005DC67F004DBA68003FAD
      540033A4450024863100545B5C000000000000000000545B5C004F8B6C0080DD
      AD0082E0B10086E1B40087E3B4004F3E33004F3E33005DC67F004DBA68003FAD
      540033A4450024863100545B5C00000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00B89F
      8E004E2E1C004E2E1C004E2E1C00000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00ADD59D00299D2700299D2700FAF7F60000810000B89F
      8E004E2E1C004E2E1C004E2E1C000000000000000000000000003D4344006CBA
      930082E0B10083E1B40084E1B4004F3E330079D9A50069CE8E0058C1780049B6
      64003BA550003D434400000000000000000000000000000000003D4344006CBA
      930082E0B10083E1B40084E1B4004F3E330079D9A50069CE8E0058C1780049B6
      64003BA550003D43440000000000000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600B89F
      8E00EFE5DE00D0BAAD004E2E1C00000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600B89F
      8E00EFE5DE00D0BAAD004E2E1C00000000000000000000000000000000003D43
      4400528C700082E0B20082E0B10080DEAF007EDCAA0074D49E0065CA88004497
      5C003D4344000000000000000000000000000000000000000000000000003D43
      4400528C700082E0B20082E0B10080DEAF007EDCAA0074D49E0065CA88004497
      5C003D4344000000000000000000000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00B89F
      8E00D0BAAD004E2E1C0000000000000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00B89F
      8E00D0BAAD004E2E1C0000000000000000000000000000000000000000000000
      0000545B5C003D43440039634E005DA07F0063AB86003F7055003D434400545B
      5C00000000000000000000000000000000000000000000000000000000000000
      0000545B5C003D43440039634E005DA07F0063AB86003F7055003D434400545B
      5C00000000000000000000000000000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B89F
      8E004E2E1C000000000000000000000000000000000000000000B89F8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B89F
      8E004E2E1C000000000000000000000000000000000000000000000000000000
      00000000000000000000545B5C003D4344003D434400545B5C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000545B5C003D4344003D434400545B5C00000000000000
      0000000000000000000000000000000000000000000000000000B89F8E00B89F
      8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F
      8E00000000000000000000000000000000000000000000000000B89F8E00B89F
      8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F8E00B89F
      8E00000000000000000000000000000000000000000000000000A48B7A004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A1B00522A
      1B00522A1B00522A1B00522A1B00522A1B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A48B7A00E9DE
      D800A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0575400C47F7900BC75
      700056402F00AF9E9600B4AAA500BBB0AA00BBB0AA00BBB0AA00BBB0AA00735B
      4C007B2B28007B2B28007B2B2800522A1B00000000006C4734006C4734006C47
      34006C4734006C4734006C4734006C4734006C4734006C4734006C4734006C47
      3400000000000000000000000000000000000000000000000000A48B7A00EDE3
      DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4BA00D3BFB400D0BA
      AD00D0BAAD00A48B7A004E2E1C00000000006B79810000457700004577000045
      7700004577000045770000457700004577000045770000457700004577000045
      77000000000000000000000000000000000000000000C0575400CB888300C47F
      790056402F001A0F0B0044362D00FFFFFF00FFFFFF00FFFFFF00EBDCD400735B
      4C007F2E2C007B2B28007B2B2800522A1B0089736300FFFFFF00A68F7E00A68F
      7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F7E00A68F
      7E006C4734000000000000000000000000000000000000000000A48B7A00F0E9
      E500EDE3DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4BA00D3BF
      B400D0BAAD00A48B7A004E2E1C00000000006B7981006B798100148AC4000278
      BF000278BF000278BF000278BF000278BF000278BF000278BF000278BF000045
      77000000000000000000000000000000000000000000C0575400D3928C00CB88
      830056402F000000000020130D00FFFFFF00F4EDE900EBDCD400D8BBAB00735B
      4C00873634007F2E2C007B2B2800522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FBF4EF00F7E9DE00F3DECE00F0D4BF00EECAB10010264100E7B89700A68F
      7E006C4734006C47340000000000000000000000000000000000A48B7A00F3EE
      EB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9C000D7C4
      BA00D3BFB400A48B7A004E2E1C00000000006B7981006B7981005DADC40046CF
      F40040C9F2003AC4EF0033BCEB002CB7E90026B1E70021ACE5001CA6E2000278
      BF000045770000000000000000000000000000000000C0575400DA9C9600D392
      8C0056402F0056402F0056402F0056402F0056402F0056402F0056402F005640
      2F008E3F3C00873634007F2E2C00522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBF4EF00F7E9DE00F3DECE00F0D4BF0028983100EAC1A400A68F
      7E0089736300916347006C473400000000000000000000000000A48B7A00F7F3
      F200F3EEEB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4CC00DECEC600DAC9
      C000D7C4BA00A48B7A004E2E1C00000000006B79810049D0F6006B79810053C7
      E70048CFF40042CBF3003BC4EF0034BFED002DB8EA0028B4E70021ADE50016A1
      E0000045770000000000000000000000000000000000C0575400E7ABA500E0A1
      9C00D7979100CF8E8800C7837F00BC757000B56C6800AD645E00A65A56009E50
      4D00964744008E3F3C0087363400522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBF4EF00F7E9DE00F3DECE00F0D4BF00EECAB100EAC1
      A40089736300A6785B006C473400000000000000000000000000A48B7A00FBFA
      F800F7F3F200F3EEEB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4CC00DECE
      C600DAC9C000A48B7A004E2E1C00000000006B79810062E1F6006B79810059B1
      C9004CD3F7004AD1F60042CAF3003BC4EF0035BFED002DB8EA0028B4E70021AD
      E5000278BF0000457700000000000000000000000000C0575400EBB0AA00E7AB
      A500E0A19C00D7979100CF8E8800C7837F00C07A7500B8706C00B1686400AA5E
      5A009E504D00964744008E3F3C00522A1B008973630089736300897363008973
      63008973630089736300897363008973630089736300897363006C4734006C47
      340089736300B5876A006C473400000000000000000000000000A48B7A00FFFF
      FF00FBFAF800F7F3F200F3EEEB00F0E9E500EDE3DE00E9DED800E5D9D300E2D4
      CC00DECEC600A48B7A004E2E1C00000000006B7981006CE9F60049D0F6006B79
      810054C7E7004CD3F70049D0F60042CAF3003BC4EF0034BFED002DB8EA0028B4
      E7001CA3DD0000457700000000000000000000000000C0575400EBB0AA00EBB0
      AA00B8484100B8484100B8484100B8484100B8484100B8484100B8484100B848
      4100B8484100A1555100994C4800522A1B0089736300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF4EF00F7E9DE00F3DECE00F0D4
      BF0089736300C79A7D006C473400000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FCFCFC00FAF7F600F6F0EF00F2EBE900EEE6E200EAE1DC00E7DC
      D500E3D7CF00A48B7A004E2E1C00000000006B79810077F0F6006CE9F6006B79
      810058B4CC004CD1F6004CD3F7004AD1F60043CBF3003CC5F00035BFED002EBA
      EA0023B0E5000278BF00004577000000000000000000C0575400EBB0AA00B848
      4100F8F2EF00F3E9E300EEE0D900E9D9CF00E5D1C600E0CABC00DCC2B400D8BB
      AB00D8BBAB00B8484100A1555100522A1B000000000089736300897363008973
      6300897363008973630089736300897363008973630089736300897363008973
      6300CFA384007B6859006C473400000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00F2EBE900EEE6E200EAE1
      DC00E7DCD500A48B7A004E2E1C00000000006B7981007BF2F60077F0F60049D0
      F6006B7981006B7981006B7981006B7981006B7981006B7981006B7981006B79
      81006B7981006B7981006B7981000000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FBF6F400F6EDE900F0E3DE00EBDCD400E6D5CA00E2CEC100DEC6
      B800D9BFAF00B8484100AA5E5A00522A1B0000000000C2929200C2929200FFFF
      FF00FFFFFF00FCFBFA00F8F6F300F4F0ED00F2EDE900EFE9E300EDE3DE006C47
      340092786700CFA384006C473400000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00F2EBE900EEE6
      E200A48B7A00A48B7A004E2E1C00000000006B7981007BF2F6007BF2F60077F0
      F60049D0F60049D0F60049D0F60049D0F60049D0F60049D0F60049D0F60049D0
      F6006B79810000000000000000000000000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3DE00EBDCD400E6D5CA00E2CE
      C100DEC6B800B8484100B1686400522A1B00000000000000000000000000C292
      9200FFFFFF00C5A69600C5A69600C5A69600C5A69600C5A69600EFE9E3006C47
      34006C4734006C4734006C473400000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600F6F0EF00A48B
      7A004E2E1C004E2E1C004E2E1C00000000006B7981007BF2F6007BF2F6007BF2
      F60077F0F60049D0F6006B7981006B7981006B7981006B7981006B7981006B79
      8100801C0000801C0000801C0000801C000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3DE00EBDCD400E6D5
      CA00E2CEC100B8484100B8706C00522A1B00000000000000000000000000C292
      9200FFFFFF00FFFFFF00FFFFFF00FCFBFA00F8F6F300F4F0ED00F2EDE900EFE9
      E3006C4734000000000000000000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FAF7F600A48B
      7A00EFE5DE00D0BAAD004E2E1C00000000006B7981007BF2F6007BF2F6007BF2
      F6007BF2F6006B79810000000000000000000000000000000000000000000000
      000000000000801C0000DC8F6800801C000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3DE00EBDC
      D400E6D5CA00B8484100C47F7900522A1B000000000000000000000000000000
      0000C2929200FFFFFF00C5A69600C5A69600C5A69600C5A69600C5A69600F2ED
      E9006C4734006C47340000000000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00A48B
      7A00D0BAAD004E2E1C000000000000000000000000006B7981006B7981006B79
      81006B7981000000000000000000000000000000000000000000000000000000
      000000000000AC562500801C0000801C000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF6F400F6EDE900F0E3
      DE00EBDCD400B848410000000000522A1B000000000000000000000000000000
      000000000000C2929200FFFFFF00FFFFFF00FFFFFF00FCFBFA00F8F6F300F4F0
      ED00F2EDE9006C47340000000000000000000000000000000000A48B7A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A48B
      7A004E2E1C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000801C0000AC5625000000
      0000AC562500801C000000000000801C000000000000C0575400EBB0AA00B848
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF6F400F6ED
      E900F0E3DE00B8484100B8706C00522A1B000000000000000000000000000000
      000000000000C2929200C2929200C2929200C2929200C2929200C2929200C292
      9200C2929200C292920000000000000000000000000000000000A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000801C0000801C
      0000801C000000000000000000000000000000000000C0575400C0575400C057
      5400C0575400C0575400C0575400C0575400C0575400C0575400C0575400C057
      5400C0575400C0575400C0575400C05754000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000801C0000451C1C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C00B8450000F6800000C2660000451C
      1C00000000000000000000000000785B4800785B4800785B4800705340006343
      31004E2E1C0000000000000000000000000000000000B2998800F8F6F300F4F0
      ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C00AC562500F6B87700F6800000801C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FCFBFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5C1B600A48B7A004E2E1C0000000000B2998800FCFBFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5C1B600A48B7A004E2E1C0000000000B2998800FCFBFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5C1B600A48B7A004E2E1C0000000000AC562500B84500000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000F3EEEA00EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000F3EEEA00EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000F3EEEA00EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000E5D9
      D300E0D0C900DCCBC200A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FEFEFC00000000000000000000000000000000000000000000000000E5D9
      D300E0D0C900DCCBC200A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FEFEFC000000000000000000000000000000000000000000000000000000
      000000000000DCCBC200A48B7A004E2E1C0000000000801C0000451C1C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C00B8450000F6800000C2660000451C
      1C00000000000000000000000000785B4800785B4800785B4800705340006343
      31004E2E1C0000000000000000000000000000000000B2998800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5D9D300A48B7A004E2E1C00AC562500F6B87700F6800000801C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3F000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C0000000000AC562500B84500000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000EDE3DE00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FBF8F700F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C0000000000801C0000451C1C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C00B8450000F6800000C2660000451C
      1C00000000000000000000000000785B4800785B4800785B4800705340006343
      31004E2E1C0000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C00AC562500F6B87700F6800000801C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B29988000000000000000000AC562500B84500000000
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
      1C004E2E1C004E2E1C004E2E1C000000000000000000000000004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C00000000000000000000000000000000000000
      0000917560006B513F006B513F00451C1C00451C1C00451C1C00451C1C00451C
      1C00451C1C00451C1C00451C1C000000000000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C0000000000B2998800F2EBE700A48B
      7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B7A00A48B
      7A00A48B7A00A48B7A00A48B7A004E2E1C000000000000000000917560009175
      6000A48B7A00A48B7A00A48B7A0091756000451C1C0000000000000000000000
      00000000000000000000000000000000000000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C0000000000B2998800F4F0ED00F2EB
      E700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCBC200D9C6BC00D5C1
      B600D1BCB000D0BAAD00A48B7A004E2E1C000000000091756000A48B7A00A48B
      7A00D0C2BA00D0C2BA00FBF7F400A48B7A0091756000451C1C00000000000000
      00000000000000000000000000000000000000000000B2998800F8F6F300F4F0
      ED00801C0000801C0000801C0000801C0000801C0000811E0100A1543500D0B4
      A600D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00D8B7A700801C0000801C0000801C0000801C0000D0B0A000DCCBC200D9C6
      BC00D5C1B600D1BCB000A48B7A004E2E1C0000000000B2998800F8F6F300F4F0
      ED00801C0000801C0000801C0000801C0000801C0000801C0000801C0000801C
      0000801C0000D1BCB000A48B7A004E2E1C0000000000A48B7A00D0C2BA00EDE6
      E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B7A0091756000451C1C000000
      00000000000000000000000000000000000000000000B2998800FCFBFA00F8F6
      F300F4F0ED00801C0000801C0000E3D3CA00E7DCD500C1917A00801C0000821F
      0200D9C6BC00D5C1B600A48B7A004E2E1C0000000000B2998800FCFBFA00F8F6
      F300F4F0ED00EBDDD500953C1B00801C0000D0AB9A00E3D7CF00E0D0C900DCCB
      C200D9C6BC00D5C1B600A48B7A004E2E1C0000000000B2998800FCFBFA00F8F6
      F300F4F0ED00F2EBE700EEE6E100EAE1DA00E7DCD500E3D7CF00E0D0C900DCCB
      C200D9C6BC00D5C1B600A48B7A004E2E1C0000000000A48B7A00FFFFFF00F6F2
      F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B7A0091756000451C
      1C000000000000000000000000000000000000000000B2998800FFFFFF00FEFE
      FC00FBF8F700801C0000801C0000EEE6E100EAE1DA00E7DCD500801C0000801C
      0000DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800FFFFFF00FEFE
      FC00FBF8F700F7F3F000B26E5200801C0000BF8A7200E7DCD500E3D7CF00E0D0
      C900DCCBC200D9C6BC00A48B7A004E2E1C0000000000B2998800FFFFFF00FEFE
      FC00FBF8F700E6D0C600A455350087250600801C000086240500A4573800D7BD
      B100DCCBC200D9C6BC00A48B7A004E2E1C000000000000000000A48B7A00FFFF
      FF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B7A009175
      6000451C1C0000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FEFEFC00801C0000801C0000F3EEEA00EFE9E300CFA69500801C00009D4A
      2A00E0D0C900DCCBC200A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FEFEFC00FBF8F700CA9A8600801C0000AA604100EDE3DE00E9DED800E5D9
      D300E0D0C900DCCBC200A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FEFEFC0092361500801C0000B7785D00EADED700E7D9D100AD694B009944
      2400E0D0C900DCCBC200A48B7A004E2E1C00000000000000000000000000A48B
      7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFFFF00A48B
      7A0091756000451C1C00000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000801C0000801C0000801C0000A95E4000E1CC
      C200E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FEFEFC00E3C9BC00801C000092371600EFE9E300EDE3DE00E9DE
      D800E5D9D300E2D4CC00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000F3EDE700F3EEEA00EFE9E300E6D5CC00801C
      0000E5D9D300E2D4CC00A48B7A004E2E1C000000000000000000000000000000
      0000A48B7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2BA00FFFF
      FF00A48B7A00917560004E2E1C000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FBF8F700EAD8CF00AC65460083200200BF88
      6F00E9DED800E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAF6F300801C0000801C0000EEE3DD00EFE9E300EDE3
      DE00E9DED800E5D9D300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FBF8F700F7F3F000F3EEEA00EFE9E300801C
      0000E9DED800E5D9D300A48B7A004E2E1C000000000000000000000000000000
      000000000000A48B7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CEC600D0C2
      BA00FFFFFF00A48B7A006B513F000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FEFEFC00FBF8F700F6F0ED00801C00008320
      0200EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00953A1800801C0000D7B1A000F3EEEA00EFE9
      E300EDE3DE00E9DED800A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FEFEFC00FBF8F700F7F3F000F3EEEA00801C
      0000EDE3DE00E9DED800A48B7A004E2E1C000000000000000000000000000000
      00000000000000000000A48B7A00FFFFFF00F6F2F000EDE6E200E2D9D400D9CE
      C600D0C2BA00FFFFFF006B513F000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FFFFFF00FEFEFC00D0A59200801C00008320
      0200EFE9E300EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BD806600801C0000AC624300F6F0ED00F3EE
      EA00EFE9E300EDE3DE00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00801C0000801C0000FFFFFF00FEFEFC00FBF8F700F7F3F000801C
      0000EFE9E300EDE3DE00A48B7A004E2E1C000000000000000000000000000000
      0000000000000000000000000000A48B7A00FFFFFF00FBF8F700F2EDEA00E7E0
      DC00FCFAF800D0C2BA00917560000000000000000000B2998800FFFFFF00FFFF
      FF00801C0000801C0000801C0000801C0000801C0000821E0100AC624300EBDC
      D400F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CE9E8900801C0000801C0000801C00008F300F00F7F3
      F000F3EEEA00EFE9E300A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00F7EFEB00801C0000801C0000F4EBE600FFFFFF00FEFEFC00F3E9E300801C
      0000EADCD300EFE9E300A48B7A004E2E1C000000000000000000000000000000
      000000000000000000000000000000000000A48B7A00FFFFFF00FBF8F700FBFA
      F800D0C2BA0091756000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFB
      FA00F8F6F300F4F0ED00A48B7A004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00801C0000801C0000801C0000801C0000FFFFFF00FFFFFF00801C0000801C
      0000801C0000F4F0ED00A48B7A004E2E1C000000000000000000000000000000
      00000000000000000000000000000000000000000000A48B7A00A48B7A00A48B
      7A00A48B7A0000000000000000000000000000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C0000000000B2998800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFBFA00F8F6F300F4F0ED004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2998800B299
      8800B2998800B2998800B2998800B2998800B2998800B2998800B2998800B299
      8800B2998800B2998800B2998800000000000000000000000000B2998800B299
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
      000000000000BB390800801C0000801C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7937200782C0800782C0800782C0800782C
      0800782C0800782C0800782C0800782C08000000000000000000000000000000
      00000000000000000000C49791004E2E1C004E2E1C004E2E1C004E2E1C004E2E
      1C004E2E1C004E2E1C004E2E1C004E2E1C000000000000000000000000000000
      000000000000000000000000000000000000A43B1700B82A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5672900BB390800BB390800BB390800801C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7937200F4DECF00F2D7C400EFCFB800EDC6
      AC00EABFA100E7B79700E7B79700782C08000000000000000000000000000000
      00000000000000000000C4979100EAE0DA00B1978600B1978600B1978600B197
      8600B1978600B1978600B19786004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000009A411D00CB4B1D00B82A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5672900BB390800E5672900EB8A5B00801C00000000000000000000BB39
      0800BB3908008C32070000000000000000000000000000000000000000000000
      0000000000000000000000000000D7937200F7E7DD00F4DECF00F2D7C400EFCF
      B800EECAB200EBC2A700E9BB9C00782C080000000000002B5300002B5300002B
      5300002B5300002B5300C4979100F0E9E500EAE0DA00E5D8D100E0D0C900DDCC
      C400D8C5BB00D3BDB100B19786004E2E1C000000000000000000000000000000
      000000000000000000000000000000000000000000009A411D00CB4C1E00B82A
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5672900BB39080000000000EB8A5B00801C000000000000BB390800BB39
      08008C3207008C3207008C320700000000000000000000000000000000000000
      0000000000000000000000000000D7937200FBF2EB00C6693D00C6693D00C669
      3D00C6693D00C6693D00EBC2A700782C08000077B8005FCCEA000077BA000077
      BA000077BA000077BA00C4979100F7F2EF00CC802800CC802800CC802800CC80
      2800CC802800D8C5BB00B19786004E2E1C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A411D00CB4B
      1D00B82A00000000000000000000000000000000000000000000000000000000
      0000E5672900EB8A5B008C3207008C320700801C000000000000BB390800E567
      2900EB8A5B008C320700801C0000000000000000000000000000000000000000
      0000000000000000000000000000D7937200FFFFFF00FCF6F200F8EDE300F6E3
      D500F3DAC900F0D3BD00EECAB200782C08000077B80069D4EE005FCCEA0057C6
      E7004EBFE30045BAE000C4979100FFFFFF00FAF6F400F3EDEA00EDE3E000E7DC
      D500E2D4CC00DDCCC400B19786004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1592B00E970
      3E00C0441900C044190000000000000000000000000000000000000000000000
      000000000000E5672900EB8A5B008C320700801C0000801C0000BB3908000000
      0000E56729008C320700801C000000000000C0A595005F402D005F402D005F40
      2D005F402D005F402D005F402D00D7937200FFFFFF00C6693D00C6693D00C669
      3D00C6693D00C6693D00F0D3BD00782C08000077B80073DAF20069D4EE005FCC
      EA0057C6E7004EBFE300C4979100FFFFFF00CC802800CC802800CC802800CC80
      2800CC802800E2D4CC00B19786004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009A41
      1D00E9703E00B82A000000000000000000000000000000000000000000000000
      00000000000000000000E5672900872905008A351100801C0000BB3908008C32
      0700801C0000801C00000000000000000000C0A59500EAE0DA00E5D8D100E0D0
      C900DAC9BF00D5C1B600D0BAAD00D7937200FFFFFF00FFFFFF00FFFFFF00FCF6
      F200F8EDE300F6E3D500F3DAC900782C08000077B8007DE1F60073DAF20069D4
      EE005FCCEA0057C6E700C4979100FFFFFF00FFFFFF00FFFFFF00FAF6F400F3ED
      EA00EDE3E000E7DCD500B19786004E2E1C0000000000B54F1C00801C0000801C
      0000801C0000801C0000801C0000801C00000000000000000000000000009A41
      1D00E9703E00D1592B00C4552B00000000000000000000000000000000000000
      000000000000000000000000000057473B00A48B7A008F432300801C0000801C
      0000BB390800000000000000000000000000C0A59500F0E9E500EAE0DA00E5D8
      D100E0D0C900DDCCC400D8C5BB00D7937200FFFFFF00C6693D00C6693D00FFFF
      FF00D7937200963A1600963A1600963A16000077B8007DE1F6007DE1F60073DA
      F20069D4EE005FCCEA00C4979100FFFFFF00CC802800CC802800CC802800FAF6
      F400F3EDEA00C09291004E2E1C004E2E1C0000000000B54F1C00E9703E00E970
      3E00E9703E00E9703E00801C0000000000000000000000000000000000009A41
      1D00E9703E00D1592B00B82A0000000000000000000000000000000000000000
      0000000000000000000057473B00C5B5AA00B89F8E0057473B00000000000000
      000000000000000000000000000000000000C0A59500F7F2EF00D5936900D593
      6900D5936900D5936900D5936900D7937200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7937200EFE5DE00963A1600000000000077B8007DE1F6007DE1F6007DE1
      F60073DAF20069D4EE00C4979100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAF6F400C0929100FFFFFF004E2E1C0000000000B54F1C00E9703E00DE76
      4800DD724300D96B3C00801C0000000000000000000000000000000000009A41
      1D00E9703E00D1592B00B82A0000000000000000000000000000000000000000
      00000000000057473B00D0C2BA0057473B00D0BAAD0057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00FAF6F400F3ED
      EA00EDE3E000E7DCD500E2D4CC00D7937200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E1937200B54F1C0000000000000000000077B8007DE1F6007DE1F6007DE1
      F6007DE1F60073DAF200C4979100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C09291004E2E1C000000000000000000B54F1C00E9703E00F39D
      7700DE764800DD724300C4552B00801C00000000000000000000801C0000F39D
      7700E9703E00D1592B00C0441900000000000000000000000000000000000000
      000057473B00E7DCD50057473B00967A6700E1D0CA0057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00D5936900D593
      6900D5936900D5936900D5936900D7937200D7937200D7937200D7937200D793
      7200D79372000000000000000000000000000077B8007DE1F6007DE1F6007DE1
      F6007DE1F6007DE1F600C4979100C4979100C4979100C4979100C4979100C497
      9100C4979100C4979100000000000000000000000000B54F1C00F39D7700B54F
      1C00F39D7700DE764900DD734400C5552C00801C0000801C0000F39D7700E970
      3E00E9703E00D1592B00C4552B0000000000000000000000000000000000967A
      6700FFFFFF0057473B0000000000967A6700E7DCD50057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00FFFFFF00FFFF
      FF00FAF6F400F3EDEA00EDE3E000E7DCD5004E2E1C0000000000000000000000
      0000000000000000000000000000000000000077B8007DE1F6007DE1F6000045
      8000002B5300002B5300002B5300002B5300002B5300002B5300002B53000077
      BA00002B530000000000000000000000000000000000B54F1C00B54F1C000000
      0000B54F1C00F39D7700DE774900DD734400DA6D4000D8683A00D8663700E970
      3E00D1592B00C04419000000000000000000000000000000000000000000967A
      670057473B000000000000000000967A6700F0E9E60057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00D5936900D593
      6900FFFFFF00C0A595004E2E1C004E2E1C004E2E1C0000000000000000000000
      0000000000000000000000000000000000000077B8007DE1F6007DE1F6000045
      80007DE1F60053C2E600002B530053C2E60035ABDA00047DBD00002B53000077
      BA00002B530000000000000000000000000000000000B54F1C00000000000000
      000000000000B54F1C00F39D7700F39D7700F39D7700F39D7700E9703E00C044
      1900C4552B00000000000000000000000000000000000000000000000000967A
      6700000000000000000000000000967A6700FFFFFF0057473B00000000000000
      000000000000000000000000000000000000C0A59500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A59500EFE5DE004E2E1C000000000000000000000000000000
      0000000000000000000000000000000000000077B8007DE1F6007DE1F6007DE1
      F600004580007DE1F600002B5300002B530053C2E600002B53004ABCE2004ABC
      E200002B53000000000000000000000000000000000000000000000000000000
      00000000000000000000F2541900B54F1C00B54F1C00B54F1C00F25419000000
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
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001FFFFC001FE7F8000FE098000FC3F
      8000F6D68000F81F8000C3178000F00F800096D68000E0078000BF198000C003
      8000BFFF800080018000FFFF800000008000803F800000008000B5DF80008001
      8000C5DF8000C0038000B5DF8000E0078000C43F8000F00F8000FDFF8000F81F
      C001FDFFC001FC3FFFFFF9FFFFFFFE7F807FFFFFC000F87F003F80018000C000
      003F800180008000000080018000800080008001800080000000800180008000
      0001800180008000000380018000800000078001800080000003800180008000
      00038001800080008003818F800080008003C38F80008000C203FFA48000C000
      FE03FFF18000F07FFF07FFFF8000FC7FFFFFFFFFFF03FC3FC0030381E001F00F
      C0030381E001E007C0030381E001C003C0030381E0018001C0030381E0018001
      C0030001E001000000000001E00101808001800300010180C003C00700010000
      E007C10700018000F007C10700018000F807E38F0001C000FC27E38F0003E001
      FE67FFFF0007F003FFFFFFFF8FFFFC27FC3FFC3FC001C001F00FF00FC001C001
      E007E007C001C001C003C003C001C00180018001C001C00180018001C001C001
      00000000C001C00100000000C001C00100000000C001C00100000000C001C001
      80018001C001C00180018001C001C001C003C003C001C001E007E007C003C003
      F00FF00FC007C007FC3FFC3FC00FC00FC001FFFFC000FFFFC001FFFF8000800F
      C001000F80000007C001000F80000003C001000780000001C001000780000001
      C001000380000001C001000380000001C001000180008001C001000180008001
      C00100078000E001C00100008000E007C00103F88000F003C00387F88000F803
      C007FF928000F803C00FFFC78000FFFFC001C001C001FFFF8000800080009C03
      8000800080000C038000800080000C038000800080009FFF800080008000FFFF
      8000800080009C038000800080000C038000800080000C038000800080009FFF
      800080008000FFFF8000800080009C038000800080000C038000800080000C03
      C001C001C0019FFFFFFFFFFFFFFFFFFFFFFFC001C001C001F001800080008000
      C07F800080008000803F800080008000801F800080008000800F800080008000
      C007800080008000E003800080008000F001800080008000F801800080008000
      FC01800080008000FE01800080008000FF03800080008000FF87800080008000
      FFFFC001C001C001FFFFFFFFFFFFFFFFFFFFF8FFFE00FC00FF3FF07FFE00FC00
      FF1FF063FE008000FF8FF241FE000000FFC7F041FE000000FFC3F81100000000
      FFE3FC030000000080E1FE070000000081E1FC3F0001000081E1F83F00030001
      80C1F03F000700038001E23F007F00079003E63F007F0007B807EE3F00FF0007
      FC1FFE7F01FF800FFFFFFEFF03FFF87FFFFF8001E000FC00FE3F0000E000F800
      F81F0000E000E000E00F0000C000C00080070000800080000003000000008000
      00010000000000000000000000000000000100008000000080010000C0000000
      C0018001E0000001E000C003E0008003F000E001E0008003F803F00CE001C007
      FC0FF81EE003E00FFE3FFC3FE007F83F}
  end
  object Images: TImageList
    Left = 220
    Top = 332
    Bitmap = {
      494C010124002700040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
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
      0000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000694731006947310000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300000FB600B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006E0000006E00000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300694731000000000000000000000000000000
      0000000000000000000069473100F2ECE900F2ECE90069473100000000000000
      00000000000000000000000000000000000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC1000018C800B7A29300694731000000000000000000000000000000
      0000983000000000000000000000000000000000000000000000000000000000
      0000006E00000000000000000000006E000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A29300694731000000000000000000000000000000
      00000000000069473100F2ECE9009830000098300000F2ECE900694731000000
      00000000000000000000000000000000000000000000C3AE9F00FAF8F6009830
      000098300000F2ECE8009830000098300000EAE0DA0098300000983000000030
      F800002CF0000022DC000018C8000014C0000000000000000000983000009830
      0000983000009830000000000000000000000000000000000000000000000000
      0000006E000000000000000000000000000000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00983000009830000098300000EAE0DA00E7DBD500983000009830
      000098300000DCCBC100B7A29300694731000000000000000000000000000000
      000069473100F2ECE90098300000F6865000F57C430098300000F2ECE9006947
      31000000000000000000000000000000000000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7
      D00098300000002CF000B7A29300694731000000000098300000D76733000000
      0000983000000000000000000000000000000000000000000000000000000000
      0000006E00000000000000000000006E000000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F5F0ED0098300000EFE8E300EDE4DF00EAE0DA00E7DBD5009830
      0000E2D3CB00DFCFC600B7A29300694731000000000000000000000000006947
      3100F2ECE90098300000C4937500C4937500C4937500C493750098300000F2EC
      E9006947310000000000000000000000000000000000C3AE9F00FFFFFF009830
      0000FCFAF900E4CBBF00A2451A0098300000B16440009830000098300000E7DB
      D500E4D7D0000030F800B7A29300694731000000000098300000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006E0000006E00000000000000000000C3AE9F00209E20000090
      0000209D1F00F9F6F4005DB55A00983000009830000098300000983000009830
      0000E4D7D000E2D3CB00B7A2930069473100000000000000000069473100F2EE
      EA0098300000F79B6C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AA6644009830
      0000F2ECE90069473100000000000000000000000000C3AE9F00FFFFFF009830
      0000FEFEFD00B66C4A0098300000EBDAD200E4CEC3009830000098300000EBE2
      DD0098300000E4D7D000B7A29300694731000000000098300000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00D4ECD4000893
      0800EFF8EE00FCFAF900F9F6F4001B9B1A0098300000B2D2AA00EEE6E1009830
      0000E7DBD500E4D7D000B7A29300694731000000000069473100F2ECE9009830
      0000F9B18700F9AC8100F79B6C00FFFFFF00FFFFFF00AA664400F6865000F57C
      430098300000F2ECE900694731000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00BD7A5B0098300000D8B2A100F0E7E1009830000098300000EEE6
      E10098300000E9DED800B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF0070C1
      7000A0D6A000FEFEFD00C2E1BF000090000042AA400098300000F1EAE6009830
      0000EBE2DD00E9DED800B7A293006947310098300000F9F6F400C8600000FBC3
      9F00FABA9300F9B18700F9AC8100FFFFFF00FFFFFF00AA664400F68D5900F686
      5000F57C430098300000F2ECE9006947310000000000C3AE9F00FFFFFF009830
      0000FFFFFF00F6ECE800C2846700A85027009B3608009830000098300000F1EA
      E600EEE6E100EBE2DD00B7A29300694731000000000000000000000000000000
      0000000000000000000044444400646464006464640064646400000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00D8EE
      D80000900000009000000090000000900000A0D29D00F6F2EF00983000009830
      0000EEE6E100EBE2DD00B7A293006947310098300000FEFEFE00C8600000FBC3
      9F00FBC39F00FABA9300F9B18700FFFFFF00FFFFFF00AA664400F7926000F68D
      5900F686500098300000F2ECE9006947310000000000C3AE9F00FFFFFF009830
      0000FFFFFF00FFFFFF00FFFFFF00FEFEFD00EAD5CB00983000009F3F1300F3EE
      EA0098300000EEE6E100B7A29300694731000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000646464000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF0040AC4000D0EBD000109710000C950C00F1F5EE00F9F6F400F6F2EF009830
      0000F1EAE600EEE6E100B7A29300694731000000000098300000FDFAF800C860
      0000FBC39F00FBC39F00FFFFFF00FFFFFF00FFFFFF00AA664400F79B6C00F792
      600098300000F2ECE900694731000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A3471C009830000098300000A8502700DBB9A800F6F2
      EF0098300000F1EAE600B7A29300694731000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000646464000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00ACDBAC0030A530000090000060BA6000FEFEFD00FCFAF900F9F6F400F6F2
      EF00F3EEEA00F1EAE600B7A2930069473100000000000000000098300000FEFE
      FE00C8600000FBC39F00FBC39F00C4937500C4937500F9AC8100F79B6C009830
      0000F2ECE90069473100000000000000000000000000C3AE9F00FFFFFF009830
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A29300694731000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000646464000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FCFEFC00189A180000900000C0E4C000FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A29300694731000000000000000000000000009830
      0000FFFFFF00C8600000FBC39F00FFFFFF00FFFFFF00AA66440098300000F2EC
      E9006947310000000000000000000000000000000000C3AE9F00FFFFFF009830
      0000FFFFFF009830000098300000FFFFFF009830000098300000FFFFFF009830
      000098300000F7F4F100B7A29300694731000000000000000000000000000000
      0000000000000000000044444400646464006464640064646400000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF0078C478001C9C1C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A29300694731000000000000000000000000000000
      000098300000FEFEFE00C8600000FFFFFF00FFFFFF0098300000F2ECE9006947
      31000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F100694731000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F100694731000000000000000000000000000000
      00000000000098300000FDFAF800C8600000C8600000F2EDEA00694731000000
      0000000000000000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000000000000000
      0000000000000000000044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000000000000000
      0000000000000000000098300000FEFEFE00F9F6F40069473100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004444440044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000983000009830000000000000000000000000
      000000000000000000000000000000000000000000005F25A50044138C004514
      8F00461591004615910045148F0044138C005F25A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D422F006D42
      2F006D422F006D422F006D422F006D422F006D422F006D422F006D422F006D42
      2F006D422F006D422F006D422F006D422F000000000000000000000000000000
      0000000000009A605D0068303000683030006830300000000000000000000000
      0000000000000000000000000000000000005F25A5004D189D00511CA8005420
      B000511EAB00531FAF00541FB000511CA7004B179A004C1B8F00000000000000
      0000000000000000000000000000000000000000000085929900006090000060
      9000006090000060900000609000006090000060900000609000006090000060
      90000060900000609000006090000000000000000000CE726F00D1979200CB8E
      8A00715A4800C0B2AB00C4BCB800CAC1BC00CAC1BC00CAC1BC00CAC1BC008C76
      67009443400094434000944340006D422F000000000000000000906060006830
      300068303000A3565100A95B5500A45B54006830300068303000683030006830
      3000683030006830300068303000683030004B169600501BA4005420B000521E
      AD00493BA2004A219D005723B900541FB0004F1AA20045168B00000000000000
      00000000000000000000000000000000000000000000859299008CF1F8000691
      CD000691CD000691CD000691CD000691CD000691CD000691CD000691CD000691
      CD000691CD000691CD00006090000000000000000000CE726F00D79F9B00D197
      9200715A48002E1F18005F504600FFFFFF00FFFFFF00FFFFFF00F0E4DE008C76
      67009747440094434000944340006D422F000000000090606000A2545000BB65
      5F00BA645E00B6625D00B2605A00A65C550068303000F0919000F0919000F091
      9000F0919000F0919000F0919000683030005F25A500501CA7005521B4004715
      9300539BDC00474BAA005421B2005521B5004F1AA2003A2E6600006000000060
      00000060000000600000006000004D7A4700000000008592990092F4F8008CF1
      F80086EEF70080EAF6007AE7F60074E3F5006EE0F50068DDF50061D9F4005AD5
      F30054D1F3000691CD00006090000000000000000000CE726F00DDA8A300D79F
      9B00715A48000000000036241B00FFFFFF00F7F1EE00F0E4DE00E1CABD008C76
      67009E504D0097474400944340006D422F000000000090606000C5696500C368
      6300BF666100BB645F00B7625D00A85D560068303000004B0000004B0000004B
      0000004E0100285C1700F091900068303000000000005F25A5004F1CA5003D3C
      9E003177AE003363A6004B24A400531FAE0040287A0027872400239F1900249C
      19002A901C00317F1F00396D220000600000000000008592990092F4F80092F4
      F8008CF1F80086EEF70080EAF6007AE7F60074E3F5006EE0F50068DDF50061D9
      F4005AD5F3000691CD00006090000000000000000000CE726F00E3B0AB00DDA8
      A300715A4800715A4800715A4800715A4800715A4800715A4800715A4800715A
      4800A45956009E504D00974744006D422F000000000090606000C96B6700C76A
      6600C1686300B4615C00B05E5900A95D56006830300000510200004B0000004B
      000005650D002C6C2100F0919000683030004C6792001F3D71002F2581003B60
      B1003685C4003280BF003652A90028236F00124A37001B991700268E24001AA3
      1400249C19002C891D003374200000600000000000008592990092F4F80092F4
      F80092F4F8008CF1F80086EEF70080EAF6007AE7F60074E3F5006EE0F50068DD
      F50061D9F4000691CD00006090000000000000000000CE726F00EDBDB800E7B5
      B000E0ACA700DAA49F00D49B9700CB8E8A00C8635C00B19291009E504D00B26B
      6800AB625F00A45956009E504D006D422F000000000090606000CC6D6900CB6C
      6800C4706D00DFB4B2009C5F5C00A059530068303000025A060000510200045F
      0A000C801E002F772800F091900068303000062E6E0001265B00215A90004190
      CE003F90CE003C8CCA003380BE000F407300032E45003C864300B4CEB8004699
      460022A01900298A1B000060000000000000000000008592990092F4F80092F4
      F80092F4F80092F4F8008CF1F80086EEF70080EAF6007AE7F60074E3F5006EE0
      F50068DDF5000691CD00006090000000000000000000CE726F00F0C1BC00EDBD
      B800E7B5B000E0ACA700DAA49F00D49B9700C8635C00D5B5A4009E504D00BC79
      7500B26B6800AB625F00A45956006D422F000000000090606000D06F6B00CE6D
      6A00DFB4B200FDF1F100DFB4B200A35A54006830300004640C00125B07002871
      1400118B260034722400F091900068303000062D6D0009346D003A83C000499B
      D700489AD6004495D2003D8ECC002569A300042F45005D8E92006F96B6004F88
      8F00117A0D00006000000000000000000000000000008592990092F4F80092F4
      F80092F4F80092F4F80092F4F8008FF3F80089F0F80080EAF6007AE7F60074E3
      F5006EE0F5000691CD00006090000000000000000000CE726F00F0C1BC00F0C1
      BC00D49B9700C8635C00C8635C00C8635C00B78C7F00D6BAA800D5B5A4009E50
      4D009E504D00B5706C00AE6763006D422F000000000090606000D5726E00D370
      6C00D0736E00DFB4B200C5716D00AF615B006830300011690F008C812400D3A4
      410035741600D3A44100F09190006830300008317400184B8B004D9EDA0052A4
      E00050A2DE004A9DD9004495D2003A89C6000B3766003986C1003C8DCA00357E
      B8004383B100000000000000000000000000000000008592990092F4F80092F4
      F80092F4F80092F4F80092F4F80092F4F8008FF3F80089F0F80083ECF7007DE9
      F60077E5F5000691CD00006090000000000000000000CE726F00F0C1BC00C9B9
      B400C5897D00D9BFAC00E1CEB800E3D2BA00485BDD009D97C100D7BAA800D5B5
      A400A47164009E504D00B5706C006D422F000000000090606000DA747100D773
      6F00D3716C00D06F6B00CC6D6900B3635D006830300070802900F8C08000F8C0
      8000F8C08000F8C08000F0919000683030000C35800016478D00377ABD004690
      CF0053A4DF004FA1DD004798D5003987C400103F71004290CC004597D4004193
      D0003885C1004383B1000000000000000000000000008592990092F4F80092F4
      F80092F4F80092F4F80092F4F80092F4F80092F4F8008FF3F80089F0F80083EC
      F7007DE9F60077E5F500006090000000000000000000CE726F00F0C1BC00C589
      7D00E8DCC300ECE3CA00EBE2C800E8DAC200B2ACC700CCBAB900DABFAC00D5B5
      A400CAA192009E6B64009E504D006D422F000000000090606000DD767400DB75
      7200D8736F00D4716D00D06F6B00B4645D0068303000F8C08000F8C08000F8C0
      8000F8C08000F8C08000F0919000683030004C6792001943940015419D001746
      9E00255DA7003D86C5003A84C1001448820020568A004E9FDB004D9FDB004899
      D6004092CF003A88BE0000000000000000000000000085929900859299008592
      9900859299008592990085929900859299008592990098300000983000009830
      00009830000085929900859299000000000000000000CE726F00C5897D00E1CE
      B900EFE9CF00F1EDD200EFE8CE00EADFC6009295D1008B8CCA00D8BFAF00D6B8
      A600D0AD9D00BB8B81009E504D006D422F000000000090606000E3787600DF76
      7400DC757200D8736F00D4716D00B7655E0068303000F8C08000F8C08000F8C0
      8000B1B1A20029A5F800F091900068303000000000002A52A2001D4BB0001A48
      AA0014409900113E8B000D397C0003286100468FC70058AAE50054A5E1004D9E
      DB004595D3002C83BD000000000000000000000000008592990094F5F80094F5
      F80094F5F80094F5F80085929900000000000000000098300000E4A582009830
      00000000000000000000000000000000000000000000CE726F00C5897D00E3D2
      BC00F0EBD000F2F0D400EFE9CF00EADFC700CFC5C2003248E500B5A6B800D6B8
      A600D0AD9D00BC8B81009E504D006D422F000000000090606000E67A7900E479
      7700E0777500DD767300D9747100B966600068303000F8C08000F8C08000B1B1
      A20022B8F70029A5F800F091900068303000000000004C67920019449A001D4B
      AE0014409B000E39880006327300195E9200387FB000438DC1004D9BD3004EA0
      DC004494CF000068900000000000000000000000000000000000859299008592
      990085929900859299000000000000000000000000009830000098300000BE71
      3C000000000000000000000000000000000000000000CE726F00F0C1BC00C589
      7D00EBE1C700EEE6CC00CECCCF001A3BED00CCC2C1001C36ED009F94BF00D5B7
      A500C9A09100AB716B009E504D006D422F000000000090606000E0787600E479
      7800E4797700E0777500DD757300BB67610068303000F8C08000B1B1A2001CC4
      F8001CC4F80022B8F700F09190006830300000000000000000006B85B3004C67
      92004C6792006B85B300000000000090C8004794C800448FC4003D86B9003A83
      B7003176A8000068900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098300000000000009830
      0000BE713C0000000000BE713C009830000000000000CE726F00F0C1BC00E7D8
      D400C5897D00DCC3B000D9C9BB007B83D2005865DA006A6FCB00C3A7A400C89F
      9300B17968009E504D00000000006D422F000000000000000000B07068009060
      6000C76D6A00C76D6A00D4727000B96661006830300090606000906060009060
      6000906060009060600090606000906060000000000000000000000000000000
      00000000000000000000000000000090C8000090C80050A0D600448FC400357C
      AD00286D98000068900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009830000098300000983000000000000000000000CE726F00F0C1BC00C863
      5C00E2C8C000C5897D00C5988900C69A8900C5978700C2918200C1928600C8A4
      9A009E504D00C8635C00C88A86006D422F000000000000000000000000000000
      0000B070680090606000C76D6A00C76D6A006830300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000090C8003496CD001E7FB8001778
      B000006890000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F000000000000000000000000000000
      00000000000000000000B0706800906060009060600000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C78D6A00CB743400B0652E00B065
      2E00B0652E00CA96760000000000000000000000000000000000000000000000
      00000000000000000000A77C7900108212000060000010821200000000000000
      00000000000000000000000000000000000000000000000000006A584C003230
      2A0032302A0032302A0032302A0032302A0032302A0032302A0032302A003230
      2A0032302A0032302A000000000000000000AB7E6200A4775A00955F3F008E57
      39007E4020007E402000000000000000000000000000AB7E6200A4775A00955F
      3F008E5739007E4020007E40200000000000000000000000000000000000B7A2
      93006947310069473100694731009D582C00CB743400E7B88D00C6A18300F1D2
      B100D1906000B0652E0084461F00000000000000000000000000000000000000
      0000A77C790099676600096F1000169022000E8F1C000881100000600000A77C
      79000000000000000000000000000000000000000000000000006A584C00F5F0
      ED00B7A29300B7A293000068900035AEDE000B95C40000689000B7A29300B7A2
      9300B7A2930032302A000000000000000000AB7E6200FCFAFA00E3C8B800CDA3
      8C00AC7655007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00AC7655007E40200000000000000000000000000000000000B7A2
      9300F0E9E500B7A29300B38E7900CB743400F6D2A800FFDDA900FFD69B00FFD0
      9300FEE2BE00D18D5900B0652E00000000000000000000000000000000009967
      6600DEB3B200FFCFCF0010821200229D34004CC670001B9E3100088511001082
      12009967660000000000000000000000000000000000000000006A584C00FBF9
      F800F7F3F100F3EDEA000068900043B6E6002E768F0000689000DFCFC600DBC9
      BF00B7A2930032302A000000000000000000AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E40200000000000000000000000000000000000B7A2
      9300F5F0EE00F2EBE800CB743400E0A16F00FFEEC800FFE1AC00B8A07B00C9AA
      7E00F1C78F00E7C2A100C360190000000000000000000000000099676600FFD3
      D300FFD2D200FFD1D1001F9F37004CC6700054E87F004CC6700014942600097B
      19004CC6700099676600000000000000000000000000000000006A584C00FFFF
      FF00FBF9F800F7F3F1000068900060C8F80051BFEF0000689000E3D5CD00DFCF
      C600B7A2930032302A000000000000000000AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E40200000000000000000000000000000000000B7A2
      9300F9F5F400F5F0EE00CB743400B3826800F8F7E800FFECC2006A6253006A62
      53006A625300B0866E00CB712B000000000000000000A77C7900DEB3B200FFD4
      D400FFD3D300FFD2D200FFD1D100009000001D9D310019942800148E2000097B
      19004CC67000ECE3E200A77C79000000000000000000000000006A584C00FFFF
      FF00FFFFFF00FBF9F8000068900060C8F80060C8F80000689000E7DBD500E3D5
      CD00B7A2930032302A000000000000000000AB7E6200FCFAFA00E3C8B800CDA3
      8C00B9805F007E402000000000000000000000000000AB7E6200FCFAFA00E3C8
      B800CDA38C00B9805F007E40200000000000000000000000000000000000B7A2
      9300FCFAFA00F9F5F400CB743400DFA47700FDFBEF00FFFCEA00FFEEC5006A62
      5300B09F8300DEA97D00C76F2D00000000000000000099676600FFD7D700FFD6
      D600FFD4D400FFD3D300F1CCCC00B196960026AB3F001F9F370000900000097B
      19004CC67000FFE9E900996766000000000000000000000000006A584C00FFFF
      FF00FFFFFF00FFFFFF0000689000006890000068900000689000EBE1DC00E7DB
      D500B7A2930032302A000000000000000000AB7E62009F6B4E009F6B4E009153
      3100915331007E4020007E4020006F432400AB7E62009F6B4E009F6B4E009153
      3100915331007E4020007E40200000000000000000000000000000000000B7A2
      9300FFFFFF00FCFAFA00F3EAE700CB743400DFBA9D00FAF6EA00E9E3D400FDEC
      C8006A625300E0985B00B0652E0000000000A77C7900DEB3B200FFD7D700FFD6
      D600FFD4D400F7D3D300AEA8A800C7C3C500C2B9BB00AEA8A800ECD5D500097B
      19004CC67000FFC6C600DEB3B200A77C7900006890000068900000609000C2C0
      BF00FFFFFF00FFFFFF00FFFFFF00FBF9F800F7F3F100F3EDEA00EFE7E200EBE1
      DC00B7A29300006890000068900000689000DDC5A900AB7E6200ECD8CD00ECD8
      CD00CAA08900AC7655007E4020009F6B4E00AB7E6200ECD8CD00ECD8CD00CAA0
      8900AC7655007E4020009060600000000000000000000000000000000000B7A2
      9300FFFFFF00FFFFFF00FCFAFA00E7D2CA00CB743400E2BDA300C3997D00E1A2
      6E00E59E6400B0652E006A4630000000000099676600FFC6C600FFC5C500FFC5
      C500FFC5C500CFB3B3008C74740000000000000000008C747400C8A4A400097B
      19004CC67000FFC5C500FFC5C50099676600000000000068900030A8D0000060
      9000C2C0BF00FFFFFF00FFFFFF00FFFFFF00FBF9F800F7F3F100F3EDEA00C2C0
      BF000068900030A8D000006890000000000000000000AB7E6200FFFFFF00F1E8
      E500EED2C100AC7655007E402000C8989000AB7E6200FFFFFF00F1E8E500EED2
      C100AC7655009060600000000000000000008592990085929900859299008592
      990085929900859299008592990085929900868C9100CB743400B0652E00B065
      2E00B0652E00B7A29300694731000000000099676600FFC7C700FFC6C600FFC6
      C600FFC6C600E1C3C3008C74740000000000000000008C747400D9B9B900097B
      19004CC67000FFD8D800FFD9D9009967660000000000000000000068900030A8
      D00000609000C2C0BF00FFFFFF00FFFFFF00FFFFFF00FBF9F800C2C0BF000068
      900030A8D0000068900000000000000000000000000000000000AB7E62009F6B
      4E00955F3F007E4020007E4020009F6B4E00AB7E62009F6B4E00955F3F007E40
      20007E4020000000000000000000000000008592990067DDF90067DDF90067DD
      F90061D9F90051CFF30044C6EE0034BCEA0085929900F9F5F400F5F0EE00F2EB
      E800EEE6E200B7A293006947310000000000A77C7900DEB3B200FFC5C500FFC9
      C900FFDEDE00FDF3F300AEA8A8008C7474008C747400AEA8A800F8D1D100097B
      19004CC67000FFD8D800DEB3B200A77C79000000000000000000000000000068
      900030A8D00000609000C2C0BF00FFFFFF00FFFFFF00C2C0BF000068900030A8
      D000006890000000000000000000000000000000000000000000AB7E6200FCFA
      FA00DEC3B100AC7655007E40200000000000AB7E6200FCFAFA00DEC3B100AC76
      55007E402000000000000000000000000000859299008592990067DDF90067DD
      F90067DDF90067DDF90059D4F60049CAF0003CC1EC0085929900FBF8F700F7F3
      F100B7A29300B7A2930069473100000000000000000099676600FFE8E800FFFC
      FC00FFFFFF00FFFFFF00FDFCFC00F2D7D700F0D1D100FBD1D100FFD2D200097B
      19004CC67000FFD6D60099676600006000000000000000000000000000000000
      00000068900030A8D00000609000C2C0BF00C2C0BF000068900030A8D0000068
      9000000000000000000000000000000000000000000000000000AB7E62009F6B
      4E00955F3F007E4020009F6B4E0000000000AB7E62009F6B4E00955F3F007E40
      20009F6B4E000000000000000000000000008592990094F5F800859299008592
      9900859299008592990085929900859299008592990085929900FEFDFD00B7A2
      93006947310069473100694731000000000000000000A77C7900ECE3E200FFFF
      FF00FFFFFF00FFFFFF00FFF4F400FFCDCD00FFCFCF00FFD0D000FFD1D100097B
      19004CC67000DEB3B20000600000006000000000000000000000000000000000
      0000000000000068900030A8D000006090000060900030A8D000006890000000
      650000004C00000000000000000000000000000000000000000000000000AB7E
      6200FCFAFA007E402000000000000000000000000000AB7E6200FCFAFA007E40
      2000000000000000000000000000000000008592990094F5F80094F5F80094F5
      F8008CF0F80083EBF7007AE6F60072E1F60085929900FFFFFF00FFFFFF00B7A2
      9300F3EBE600DBC9BF006947310000000000000000000000000099676600ECE3
      E200FFFFFF00FFFFFF00FFE0E000FFCCCC00FFCDCD00FFCFCF00FFD0D000097B
      19004CC67000006000004BCD6A00097B19000000000000000000000000000000
      000000000000000000000068900030A8D00030A8D00000689000000000000000
      980000007E00000000000000000000000000000000000000000000000000AB7E
      6200AB7E62009F6B4E00000000000000000000000000AB7E6200AB7E62009F6B
      4E00000000000000000000000000000000008592990094F5F80094F5F80094F5
      F80094F5F80085929900859299008592990085929900FFFFFF00FFFFFF00B7A2
      9300DBC9BF006947310000000000000000000000000000000000000000009967
      6600ECE3E200FFFCFC00FFCCCC00FFCBCB00FFCCCC00FFCDCD00FFCFCF00097B
      1900006000004BCD6A00097B1900000000000000000000000000000000000000
      0000000000000000000000000000006890000068900000000000000000000000
      9800000098000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008592990094F5F80094F5F80094F5
      F80085929900B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300694731000000000000000000000000000000000000000000000000000000
      0000A77C790099676600DEB3B200FFCBCB00FFCCCC00DEB3B20099676600097B
      19004BCD6A00097B190000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000085929900859299008592
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A77C79009967660099676600A77C790000000000097B
      1900097B19000000000000000000000000000000000000000000000000000000
      000000000000000000006F767700575E5F00575E5F006F767700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F767700575E5F00575E5F006F767700000000000000
      0000000000000000000000000000000000000000000000000000C8B3A4006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000C8B3A4006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      00006F767700575E5F0015731B00158A1A001089140009730C00575E5F006F76
      7700000000000000000000000000000000000000000000000000000000000000
      00006F767700575E5F0015731B00158A1A001089140009730C00575E5F006F76
      7700000000000000000000000000000000000000000000000000C8B3A400EEE6
      E100B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A2930069473100000000000000000000000000C8B3A400EEE6
      E100B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A293006947310000000000000000000000000000000000575E
      5F002C923800299E340022982B001B932200158E1A00108914000B860D00067E
      0900575E5F00000000000000000000000000000000000000000000000000575E
      5F002C923800299E340022982B001B932200158E1A00108914000B860D00067E
      0900575E5F000000000000000000000000000000000000000000C8B3A400F1EA
      E600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1C900DDCDC400DBC9
      BF00DBC9BF00B7A2930069473100000000000000000000000000C8B3A400F1EA
      E600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1C900DDCDC400DBC9
      BF00DBC9BF00B7A2930069473100000000000000000000000000575E5F0042AA
      53003AA94A0032A33F002B9F36006A584C001D95240016901C00108B15000B86
      0F0007830900575E5F0000000000000000000000000000000000575E5F0042AA
      53003AA94A0032A33F002B9F36006A584C001D95240016901C00108B15000B86
      0F0007830900575E5F0000000000000000000000000000000000C8B3A400F4EE
      EB00F1EAE6000000980000009800E9DED800E6D9D300E3D5CE00000098000000
      9800DBC9BF00B7A2930069473100000000000000000000000000C8B3A400F4EE
      EB00F1EAE60001990100EBE2DD0041B13E0041B13E0071C46E00E0D1C900DDCD
      C400DBC9BF00B7A293006947310000000000000000006F7677004B9E5F0050B7
      640047B259003FAD50006A584C006A584C00289E32001F98280018911E00118B
      16000C870F00077F0A006F76770000000000000000006F7677004B9E5F0050B7
      640047B259003FAD500038A846006A584C006A584C001F98280018911E00118B
      16000C870F00077F0A006F767700000000000000000000000000C8B3A400F6F2
      F000F4EEEB004A5DE2003948D10000009800E9DED80000009800000098000000
      9800DDCDC400B7A2930069473100000000000000000000000000C8B3A400F6F2
      F000F4EEEB00019901000199010001990100019901000199010071C46E00E0D1
      C900DDCDC400B7A29300694731000000000000000000575E5F0067C682005EC0
      760056BC6C006A584C00ECE3DD006A584C006A584C006A584C006A584C001993
      2000128D17000D881000575E5F000000000000000000575E5F0067C682005EC0
      76006A584C006A584C006A584C006A584C00E7DBD4006A584C00229A2B001993
      2000128D17000D881000575E5F00000000000000000000000000C8B3A400F9F6
      F500F6F2F000F4EEEB004A5DE2003948D10000009800191FB10000009800E3D5
      CE00E0D1C900B7A2930069473100000000000000000000000000C8B3A400F9F6
      F500F6F2F000019901004CCC850001990100EBE2DD00E9DED8000199010071C4
      6E00E0D1C900B7A2930069473100000000006F7677004D81610076CF95006ECB
      8A006A584C00F7F3F100F1EBE700ECE3DD00E7DBD400E4D7CF006A584C00229A
      2B001A932000138E18000C740F006F7677006F7677004D81610076CF95006ECB
      8A006A584C00FCFBFB00F7F3F100F1EBE700ECE3DD00E7DBD4006A584C00229A
      2B001A932000138E18000C740F006F7677000000000000000000C8B3A400FCFB
      FA00F9F6F500F6F2F000F4EEEB004A5DE2003948D10000009800E9DED800E6D9
      D300E3D5CE00B7A2930069473100000000000000000000000000C8B3A400FCFB
      FA00F9F6F50001990100019901000199010001990100EBE2DD00E9DED8000199
      0100E3D5CE00B7A293006947310000000000575E5F006BAE870084D8A6006A58
      4C00FFFFFF00FCFBFB00F7F3F100F1EBE700EFE7E200E9DFD8006A584C002DA3
      3900239A2C001A942100158E1A00575E5F00575E5F006BAE870084D8A6007FD6
      A0006A584C00FFFFFF00FCFBFB00F7F3F100F1EBE700EFE7E200E9DFD8006A58
      4C00239A2C001A942100158E1A00575E5F000000000000000000C8B3A400FFFF
      FF00FCFBFA00F9F6F500637CFB005A71F2005267EA004152D90000009800E9DE
      D800E6D9D300B7A2930069473100000000000000000000000000C8B3A400FFFF
      FF00FCFBFA00F9F6F500F6F2F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DE
      D800E6D9D300B7A293006947310000000000575E5F006AA885008ADCAE006A58
      4C00FFFFFF00FFFFFF00FCFBFB00F9F7F600F4EFEC00EFE7E2006A584C0038AA
      46002CA13700239A2C001B912200575E5F00575E5F006AA885008ADCAE008DDE
      B1006A584C00FFFFFF00FFFFFF00FCFBFB00F9F7F600F4EFEC00EFE7E2006A58
      4C002CA13700239A2C001B912200575E5F000000000000000000C8B3A400FFFF
      FF00FFFFFF00637CFB00637CFB0000009800F5F0EE005267EA004152D9000000
      9800EAE0DA00B7A2930069473100000000000000000000000000C8B3A400FFFF
      FF0001990100FDFDFD00FBF9F80001990100019901000199010001990100EDE4
      DF00EAE0DA00B7A2930069473100000000006F7677004E7A62008FDFB40092E1
      B8006A584C00FFFFFF00FFFFFF00FFFFFF00F9F7F600F4EFEC006A584C0043B2
      540036A845002CA138001D7A24006F7677006F7677004E7A62008FDFB40092E1
      B8006A584C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F7F6006A584C0043B2
      540036A845002CA138001D7A24006F7677000000000000000000C8B3A400FFFF
      FF00FFFFFF00637CFB0000009800FBF9F800F8F4F300F5F0EE005267EA000000
      9800EDE4DF00B7A2930069473100000000000000000000000000C8B3A400FFFF
      FF00BFDFB10001990100FDFDFD00FBF9F800019901004CCC850001990100EFE8
      E400EDE4DF00B7A29300694731000000000000000000575E5F0093E1B90095E4
      BC0099E6C0006A584C00FFFFFF006A584C006A584C006A584C006A584C004EB8
      620040AF510036A84400575E5F000000000000000000575E5F0093E1B90095E4
      BC006A584C006A584C006A584C006A584C00FFFFFF006A584C005DC375004EB8
      620040AF510036A84400575E5F00000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300F5F0EE00F2EC
      E900D5BFB100B7A2930069473100000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00BFDFB1000199010001990100019901000199010001990100F2EC
      E900D5BFB100B7A293006947310000000000000000006F7677006AA2860098E5
      BF009AE7C2009DE8C4006A584C006A584C0089DEAA0078D3970068C9820059BF
      6F004CB760003B9D4A006F76770000000000000000006F7677006AA2860098E5
      BF009AE7C2009DE8C4009EEAC4006A584C006A584C0078D3970068C9820059BF
      6F004CB760003B9D4A006F767700000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300C8B3
      A400694731006947310069473100000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00BFDFB10041B13E0041B13E00FBF9F80001990100C8B3
      A400694731006947310069473100000000000000000000000000575E5F0086C9
      A9009AE7C2009BE8C4009CE8C4006A584C0092E2B80083D9A40073CF910064C6
      7E0055B86B00575E5F0000000000000000000000000000000000575E5F0086C9
      A9009AE7C2009BE8C4009CE8C4006A584C0092E2B80083D9A40073CF910064C6
      7E0055B86B00575E5F0000000000000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800C8B3
      A400F3EBE600DBC9BF0069473100000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800C8B3
      A400F3EBE600DBC9BF006947310000000000000000000000000000000000575E
      5F006DA38A009AE7C3009AE7C20098E6C00096E4BC008DDEB2007FD69F005FAC
      7700575E5F00000000000000000000000000000000000000000000000000575E
      5F006DA38A009AE7C3009AE7C20098E6C00096E4BC008DDEB2007FD69F005FAC
      7700575E5F000000000000000000000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00C8B3
      A400DBC9BF006947310000000000000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00C8B3
      A400DBC9BF006947310000000000000000000000000000000000000000000000
      00006F767700575E5F00537D690078B497007DBD9D00598A7000575E5F006F76
      7700000000000000000000000000000000000000000000000000000000000000
      00006F767700575E5F00537D690078B497007DBD9D00598A7000575E5F006F76
      7700000000000000000000000000000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3
      A400694731000000000000000000000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3
      A400694731000000000000000000000000000000000000000000000000000000
      000000000000000000006F767700575E5F00575E5F006F767700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F767700575E5F00575E5F006F767700000000000000
      0000000000000000000000000000000000000000000000000000C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400000000000000000000000000000000000000000000000000C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400000000000000000000000000000000000000000000000000B7A293006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D422F006D42
      2F006D422F006D422F006D422F006D422F006D422F006D422F006D422F006D42
      2F006D422F006D422F006D422F006D422F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7A29300EEE6
      E100B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A2930069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE726F00D1979200CB8E
      8A00715A4800C0B2AB00C4BCB800CAC1BC00CAC1BC00CAC1BC00CAC1BC008C76
      67009443400094434000944340006D422F000000000086624D0086624D008662
      4D0086624D0086624D0086624D0086624D0086624D0086624D0086624D008662
      4D00000000000000000000000000000000000000000000000000B7A29300F1EA
      E600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1C900DDCDC400DBC9
      BF00DBC9BF00B7A2930069473100000000008592990000609000006090000060
      9000006090000060900000609000006090000060900000609000006090000060
      90000000000000000000000000000000000000000000CE726F00D79F9B00D197
      9200715A48002E1F18005F504600FFFFFF00FFFFFF00FFFFFF00F0E4DE008C76
      67009747440094434000944340006D422F00A08C7D00FFFFFF00B9A59600B9A5
      9600B9A59600B9A59600B9A59600B9A59600B9A59600B9A59600B9A59600B9A5
      960086624D000000000000000000000000000000000000000000B7A29300F4EE
      EB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1C900DDCD
      C400DBC9BF00B7A293006947310000000000859299008592990026A1D1000691
      CD000691CD000691CD000691CD000691CD000691CD000691CD000691CD000060
      90000000000000000000000000000000000000000000CE726F00DDA8A300D79F
      9B00715A48000000000036241B00FFFFFF00F7F1EE00F0E4DE00E1CABD008C76
      67009E504D0097474400944340006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FCF7F300F9EEE600F6E6D900F4DECD00F2D6C200203D5C00EDC8AC00B9A5
      960086624D0086624D0000000000000000000000000000000000B7A29300F6F2
      F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9D300E3D5CE00E0D1
      C900DDCDC400B7A293006947310000000000859299008592990078BFD10061DA
      F7005AD5F50054D1F3004CCBF00044C7EE003DC2ED0037BEEB0030B9E9000691
      CD000060900000000000000000000000000000000000CE726F00E3B0AB00DDA8
      A300715A4800715A4800715A4800715A4800715A4800715A4800715A4800715A
      4800A45956009E504D00974744006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCF7F300F9EEE600F6E6D900F4DECD0040AD4A00EFCFB700B9A5
      9600A08C7D00A77D620086624D00000000000000000000000000B7A29300F9F6
      F500F6F2F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9D300E3D5
      CE00E0D1C900B7A2930069473100000000008592990064DBF800859299006ED4
      ED0063DAF7005DD7F60055D1F3004DCDF10046C8EF003FC4ED0037BFEB0029B5
      E7000060900000000000000000000000000000000000CE726F00EDBDB800E7B5
      B000E0ACA700DAA49F00D49B9700CB8E8A00C5868200BF7E7900B9757100B26B
      6800AB625F00A45956009E504D006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FCF7F300F9EEE600F6E6D900F4DECD00F2D6C200EFCF
      B700A08C7D00B991760086624D00000000000000000000000000B7A29300FCFB
      FA00F9F6F500F6F2F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DED800E6D9
      D300E3D5CE00B7A293006947310000000000859299007CE8F8008592990074C2
      D50067DDF90065DCF8005DD6F60055D1F3004ECDF10046C8EF003FC4ED0037BF
      EB000691CD0000609000000000000000000000000000CE726F00F0C1BC00EDBD
      B800E7B5B000E0ACA700DAA49F00D49B9700CE938E00C88A8600C2827E00BC79
      7500B26B6800AB625F00A45956006D422F00A08C7D00A08C7D00A08C7D00A08C
      7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D0086624D008662
      4D00A08C7D00C59E840086624D00000000000000000000000000B7A29300FFFF
      FF00FCFBFA00F9F6F500F6F2F000F4EEEB00F1EAE600EEE6E100EBE2DD00E9DE
      D800E6D9D300B7A2930069473100000000008592990086EEF80064DBF8008592
      99006FD4ED0067DDF90064DBF8005DD6F60055D1F3004DCDF10046C8EF003FC4
      ED0030B6E50000609000000000000000000000000000CE726F00F0C1BC00F0C1
      BC00C8635C00C8635C00C8635C00C8635C00C8635C00C8635C00C8635C00C863
      5C00C8635C00B5706C00AE6763006D422F00A08C7D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF7F300F9EEE600F6E6D900F4DE
      CD00A08C7D00D4AF950086624D00000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FDFDFD00FBF9F800F8F4F300F5F0EE00F2ECE900EFE8E400EDE4
      DF00EAE0DA00B7A2930069473100000000008592990090F4F80086EEF8008592
      990073C4D80067DCF80067DDF90065DCF8005ED7F60056D2F4004ECDF10047C9
      EF003AC1EB000691CD00006090000000000000000000CE726F00F0C1BC00C863
      5C00FAF5F300F6EEEA00F2E7E200EEE2DA00EBDCD300E7D6CB00E4D0C400E1CA
      BD00E1CABD00C8635C00B5706C006D422F0000000000A08C7D00A08C7D00A08C
      7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C7D00A08C
      7D00DAB69C009482740086624D00000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300F5F0EE00F2ECE900EFE8
      E400EDE4DF00B7A2930069473100000000008592990094F5F80090F4F80064DB
      F800859299008592990085929900859299008592990085929900859299008592
      99008592990085929900859299000000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4DE00ECDFD600E9D9CF00E6D3
      C800E2CDC000C8635C00BC7975006D422F0000000000D0A8A800D0A8A800FFFF
      FF00FFFFFF00FDFCFB00FAF8F600F7F4F100F5F1EE00F3EEEA00F1EAE6008662
      4D00A8918100DAB69C0086624D00000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300F5F0EE00F2EC
      E900B7A29300B7A2930069473100000000008592990094F5F80094F5F80090F4
      F80064DBF80064DBF80064DBF80064DBF80064DBF80064DBF80064DBF80064DB
      F8008592990000000000000000000000000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4DE00ECDFD600E9D9
      CF00E6D3C800C8635C00C2827E006D422F00000000000000000000000000D0A8
      A800FFFFFF00D2B9AB00D2B9AB00D2B9AB00D2B9AB00D2B9AB00F3EEEA008662
      4D0086624D0086624D0086624D00000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800F8F4F300B7A2
      9300694731006947310069473100000000008592990094F5F80094F5F80094F5
      F80090F4F80064DBF80085929900859299008592990085929900859299008592
      99009830000098300000983000009830000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4DE00ECDF
      D600E9D9CF00C8635C00C88A86006D422F00000000000000000000000000D0A8
      A800FFFFFF00FFFFFF00FFFFFF00FDFCFB00FAF8F600F7F4F100F5F1EE00F3EE
      EA0086624D000000000000000000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FBF9F800B7A2
      9300F3EBE600DBC9BF0069473100000000008592990094F5F80094F5F80094F5
      F80094F5F8008592990000000000000000000000000000000000000000000000
      00000000000098300000E4A582009830000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EAE600F0E4
      DE00ECDFD600C8635C00D19792006D422F000000000000000000000000000000
      0000D0A8A800FFFFFF00D2B9AB00D2B9AB00D2B9AB00D2B9AB00D2B9AB00F5F1
      EE0086624D0086624D0000000000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00B7A2
      9300DBC9BF006947310000000000000000000000000085929900859299008592
      9900859299000000000000000000000000000000000000000000000000000000
      000000000000BE713C00983000009830000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1EE00F4EA
      E600F0E4DE00C8635C00000000006D422F000000000000000000000000000000
      000000000000D0A8A800FFFFFF00FFFFFF00FFFFFF00FDFCFB00FAF8F600F7F4
      F100F5F1EE0086624D0000000000000000000000000000000000B7A29300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7A2
      9300694731000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098300000BE713C000000
      0000BE713C0098300000000000009830000000000000CE726F00F0C1BC00C863
      5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF8F700F8F1
      EE00F4EAE600C8635C00C88A86006D422F000000000000000000000000000000
      000000000000D0A8A800D0A8A800D0A8A800D0A8A800D0A8A800D0A8A800D0A8
      A800D0A8A800D0A8A80000000000000000000000000000000000B7A29300B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000983000009830
      00009830000000000000000000000000000000000000CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE726F00CE72
      6F00CE726F00CE726F00CE726F00CE726F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300694731000000000098300000603030000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A2930069473100C8600000F8980000D08000006030
      30000000000000000000000000009176630091766300917663008A6E5A007D5E
      4A006947310000000000000000000000000000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A2930069473100BE713C00F8C89000F89800009830
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FDFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCFC600B7A293006947310000000000C3AE9F00FDFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCFC600B7A293006947310000000000C3AE9F00FDFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFCFC600B7A293006947310000000000BE713C00C86000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400F6F2EF00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400F6F2EF00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400F6F2EF00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000EBE2
      DD00E7DBD500E4D7D000B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD00000000000000000000000000000000000000000000000000EBE2
      DD00E7DBD500E4D7D000B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD000000000000000000000000000000000000000000000000000000
      000000000000E4D7D000B7A29300694731000000000098300000603030000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A2930069473100C8600000F8980000D08000006030
      30000000000000000000000000009176630091766300917663008A6E5A007D5E
      4A006947310000000000000000000000000000000000C3AE9F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBE2DD00B7A2930069473100BE713C00F8C89000F89800009830
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6F400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A293006947310000000000BE713C00C86000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000F6F2
      EF00F3EEEA00F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000F6F2
      EF00F3EEEA00F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000F1EAE600B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FCFAF900F9F6
      F400F6F2EF00F3EEEA00B7A29300694731000000000098300000603030000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A2930069473100C8600000F8980000D08000006030
      30000000000000000000000000009176630091766300917663008A6E5A007D5E
      4A006947310000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F1006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F1006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F10069473100BE713C00F8C89000F89800009830
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F000000000000000000BE713C00C86000000000
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
      3100694731006947310069473100000000000000000000000000694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000000000000000000000000000000000
      0000A78E7B00856C5900856C5900603030006030300060303000603030006030
      30006030300060303000603030000000000000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A293006947310000000000C3AE9F00F5F0ED00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300694731000000000000000000A78E7B00A78E
      7B00B7A29300B7A29300B7A29300A78E7B006030300000000000000000000000
      00000000000000000000000000000000000000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000C3AE9F00F7F4F100F5F0
      ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7D000E2D3CB00DFCF
      C600DCCBC100DBC9BF00B7A293006947310000000000A78E7B00B7A29300B7A2
      9300DBD0C900DBD0C900FCF9F700B7A29300A78E7B0060303000000000000000
      00000000000000000000000000000000000000000000C3AE9F00FAF8F600F7F4
      F100983000009830000098300000983000009830000099330300B56F4E00DBC4
      B900DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100E1C7BA0098300000983000009830000098300000DBC1B400E4D7D000E2D3
      CB00DFCFC600DCCBC100B7A293006947310000000000C3AE9F00FAF8F600F7F4
      F100983000009830000098300000983000009830000098300000983000009830
      000098300000DCCBC100B7A293006947310000000000B7A29300DBD0C900F1EC
      E900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A29300A78E7B00603030000000
      00000000000000000000000000000000000000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F1009830000098300000EADDD600EDE4DF00CFA79300983000009A35
      0700E2D3CB00DFCFC600B7A293006947310000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F0E5DF00AA562F0098300000DBBDAF00EAE0DA00E7DBD500E4D7
      D000E2D3CB00DFCFC600B7A293006947310000000000C3AE9F00FDFCFB00FAF8
      F600F7F4F100F5F0ED00F2ECE800EFE8E300EDE4DF00EAE0DA00E7DBD500E4D7
      D000E2D3CB00DFCFC600B7A293006947310000000000B7A29300FFFFFF00F8F5
      F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A29300A78E7B006030
      30000000000000000000000000000000000000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF9009830000098300000F2ECE800EFE8E300EDE4DF00983000009830
      0000E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900F9F6F400C3886D0098300000CDA18B00EDE4DF00EAE0DA00E7DB
      D500E4D7D000E2D3CB00B7A293006947310000000000C3AE9F00FFFFFF00FEFE
      FD00FCFAF900ECDBD300B7704F009E3C0F00983000009D3B0E00B7725200E0CC
      C200E4D7D000E2D3CB00B7A29300694731000000000000000000B7A29300FFFF
      FF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A29300A78E
      7B006030300000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD009830000098300000F6F2EF00F3EEEA00DAB9AA0098300000B165
      4200E7DBD500E4D7D000B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD00FCFAF900D6AF9D0098300000BC7B5C00F1EAE600EEE6E100EBE2
      DD00E7DBD500E4D7D000B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FEFEFD00A850270098300000C7917800EFE6E000EDE2DC00BF836600AE5F
      3B00E7DBD500E4D7D000B7A2930069473100000000000000000000000000B7A2
      9300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFFFF00B7A2
      9300A78E7B0060303000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000983000009830000098300000BB795A00E8D8
      D000EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FEFEFD00EAD5CB0098300000A8512900F3EEEA00F1EAE600EEE6
      E100EBE2DD00E9DED800B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000F6F1ED00F6F2EF00F3EEEA00ECDFD8009830
      0000EBE2DD00E9DED800B7A29300694731000000000000000000000000000000
      0000B7A29300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0C900FFFF
      FF00B7A29300A78E7B00694731000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FCFAF900EFE1DA00BE7F61009B360700CD9F
      8900EEE6E100EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBF8F6009830000098300000F2EAE500F3EEEA00F1EA
      E600EEE6E100EBE2DD00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FCFAF900F9F6F400F6F2EF00F3EEEA009830
      0000EEE6E100EBE2DD00B7A29300694731000000000000000000000000000000
      000000000000B7A29300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9D300DBD0
      C900FFFFFF00B7A29300856C59000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FEFEFD00FCFAF900F8F4F100983000009B36
      0700F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA542C0098300000E0C2B400F6F2EF00F3EE
      EA00F1EAE600EEE6E100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FEFEFD00FCFAF900F9F6F400F6F2EF009830
      0000F1EAE600EEE6E100B7A29300694731000000000000000000000000000000
      00000000000000000000B7A29300FFFFFF00F8F5F400F1ECE900E9E2DE00E2D9
      D300DBD0C900FFFFFF00856C59000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FFFFFF00FEFEFD00DBB8A800983000009B36
      0700F3EEEA00F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC98800098300000BE7C5E00F8F4F100F6F2
      EF00F3EEEA00F1EAE600B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF009830000098300000FFFFFF00FEFEFD00FCFAF900F9F6F4009830
      0000F3EEEA00F1EAE600B7A29300694731000000000000000000000000000000
      0000000000000000000000000000B7A29300FFFFFF00FCFAF900F5F1EF00EDE7
      E400FDFBFA00DBD0C900A78E7B000000000000000000C3AE9F00FFFFFF00FFFF
      FF0098300000983000009830000098300000983000009A330400BE7C5E00F0E4
      DE00F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D9B2A000983000009830000098300000A5491F00F9F6
      F400F6F2EF00F3EEEA00B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00F9F3F0009830000098300000F7F0EC00FFFFFF00FEFEFD00F6EEEA009830
      0000EFE4DD00F3EEEA00B7A29300694731000000000000000000000000000000
      000000000000000000000000000000000000B7A29300FFFFFF00FCFAF900FCFB
      FA00DBD0C900A78E7B00000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FB00FAF8F600F7F4F100B7A293006947310000000000C3AE9F00FFFFFF00FFFF
      FF0098300000983000009830000098300000FFFFFF00FFFFFF00983000009830
      000098300000F7F4F100B7A29300694731000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300B7A29300B7A2
      9300B7A2930000000000000000000000000000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F1006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F1006947310000000000C3AE9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFCFB00FAF8F600F7F4F100694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE9F00C3AE
      9F00C3AE9F00C3AE9F00C3AE9F00000000000000000000000000C3AE9F00C3AE
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
      000000000000CA53130098300000983000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B009144130091441300914413009144
      1300914413009144130091441300914413000000000000000000000000000000
      00000000000000000000D1ACA700694731006947310069473100694731006947
      3100694731006947310069473100694731000000000000000000000000000000
      000000000000000000000000000000000000B7552A00C8420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EB814100CA531300CA531300CA5313009830000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00F7E6DA00F5E0D100F3DAC800F1D3
      BE00EFCDB500EDC7AC00EDC7AC00914413000000000000000000000000000000
      00000000000000000000D1ACA700EFE7E300C2AC9D00C2AC9D00C2AC9D00C2AC
      9D00C2AC9D00C2AC9D00C2AC9D00694731000000000000000000000000000000
      000000000000000000000000000000000000AF5C3200D7663200C84200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EB814100CA531300EB814100F0A17600983000000000000000000000CA53
      1300CA531300A34B110000000000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00F9EDE500F7E6DA00F5E0D100F3DA
      C800F2D6C300F0D0BA00EECAB000914413000000000000436E0000436E000043
      6E0000436E0000436E00D1ACA700F4EEEB00EFE7E300EBE1DC00E7DBD500E5D8
      D100E1D2CA00DDCCC200C2AC9D00694731000000000000000000000000000000
      00000000000000000000000000000000000000000000AF5C3200D7673300C842
      0000000000000000000000000000000000000000000000000000000000000000
      0000EB814100CA53130000000000F0A176009830000000000000CA531300CA53
      1300A34B1100A34B1100A34B1100000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00FCF5F000D3835700D3835700D383
      5700D3835700D3835700F0D0BA00914413000090C8007AD8EF000290C9000290
      C9000290C9000290C900D1ACA700F9F5F300D8984000D8984000D8984000D898
      4000D8984000E1D2CA00C2AC9D00694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AF5C3200D766
      3200C84200000000000000000000000000000000000000000000000000000000
      0000EB814100F0A17600A34B1100A34B11009830000000000000CA531300EB81
      4100F0A17600A34B110098300000000000000000000000000000000000000000
      0000000000000000000000000000E0A98B00FFFFFF00FDF8F500FAF1EA00F8EA
      DF00F6E3D500F4DDCC00F2D6C300914413000090C80083DEF2007AD8EF0072D3
      ED0069CDEA0060C9E700D1ACA700FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4
      DF00E9DED800E5D8D100C2AC9D00694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DC744300EE8A
      5800CE5F2D00CE5F2D0000000000000000000000000000000000000000000000
      000000000000EB814100F0A17600A34B11009830000098300000CA5313000000
      0000EB814100A34B11009830000000000000CEB8AA007A5A46007A5A46007A5A
      46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D3835700D3835700D383
      5700D3835700D3835700F4DDCC00914413000090C8008CE3F50083DEF2007AD8
      EF0072D3ED0069CDEA00D1ACA700FFFFFF00D8984000D8984000D8984000D898
      4000D8984000E9DED800C2AC9D00694731000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF5C
      3200EE8A5800C842000000000000000000000000000000000000000000000000
      00000000000000000000EB8141009E410D00A14E220098300000CA531300A34B
      110098300000983000000000000000000000CEB8AA00EFE7E300EBE1DC00E7DB
      D500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFFFF00FFFFFF00FDF8
      F500FAF1EA00F8EADF00F6E3D500914413000090C80095E8F8008CE3F50083DE
      F2007AD8EF0072D3ED00D1ACA700FFFFFF00FFFFFF00FFFFFF00FBF8F700F6F1
      EF00F1EAE700EDE4DF00C2AC9D006947310000000000C56A3100983000009830
      000098300000983000009830000098300000000000000000000000000000AF5C
      3200EE8A5800DC744300D1704300000000000000000000000000000000000000
      000000000000000000000000000072625500B7A29300A55E3900983000009830
      0000CA531300000000000000000000000000CEB8AA00F4EEEB00EFE7E300EBE1
      DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D3835700D3835700FFFF
      FF00E0A98B00AB542800AB542800AB5428000090C80095E8F80095E8F8008CE3
      F50083DEF2007AD8EF00D1ACA700FFFFFF00D8984000D8984000D8984000FBF8
      F700F6F1EF00CEA8A700694731006947310000000000C56A3100EE8A5800EE8A
      5800EE8A5800EE8A58009830000000000000000000000000000000000000AF5C
      3200EE8A5800DC744300C8420000000000000000000000000000000000000000
      0000000000000000000072625500D2C5BC00C8B3A40072625500000000000000
      000000000000000000000000000000000000CEB8AA00F9F5F300DFA98300DFA9
      8300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E0A98B00F3EBE600AB542800000000000090C80095E8F80095E8F80095E8
      F8008CE3F50083DEF200D1ACA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBF8F700CEA8A700FFFFFF006947310000000000C56A3100EE8A5800E68F
      6300E58B5E00E28556009830000000000000000000000000000000000000AF5C
      3200EE8A5800DC744300C8420000000000000000000000000000000000000000
      00000000000072625500DBD0C90072625500DBC9BF0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00FBF8F700F6F1
      EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E8A98B00C56A310000000000000000000090C80095E8F80095E8F80095E8
      F80095E8F8008CE3F500D1ACA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEA8A700694731000000000000000000C56A3100EE8A5800F6B1
      9000E68F6300E58B5E00D170430098300000000000000000000098300000F6B1
      9000EE8A5800DC744300CE5F2D00000000000000000000000000000000000000
      000072625500EDE4DF0072625500AB938100E8DBD60072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00DFA98300DFA9
      8300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A98B00E0A98B00E0A9
      8B00E0A98B000000000000000000000000000090C80095E8F80095E8F80095E8
      F80095E8F80095E8F800D1ACA700D1ACA700D1ACA700D1ACA700D1ACA700D1AC
      A700D1ACA700D1ACA700000000000000000000000000C56A3100F6B19000C56A
      3100F6B19000E68F6400E58C5F00D27044009830000098300000F6B19000EE8A
      5800EE8A5800DC744300D170430000000000000000000000000000000000AB93
      8100FFFFFF007262550000000000AB938100EDE4DF0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FBF8F700F6F1EF00F1EAE700EDE4DF006947310000000000000000000000
      0000000000000000000000000000000000000090C80095E8F80095E8F8000060
      980000436E0000436E0000436E0000436E0000436E0000436E0000436E000290
      C90000436E0000000000000000000000000000000000C56A3100C56A31000000
      0000C56A3100F6B19000E6906400E58C5F00E3875A00E1825400E1805100EE8A
      5800DC744300CE5F2D000000000000000000000000000000000000000000AB93
      8100726255000000000000000000AB938100F4EEEC0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00DFA98300DFA9
      8300FFFFFF00CEB8AA0069473100694731006947310000000000000000000000
      0000000000000000000000000000000000000090C80095E8F80095E8F8000060
      980095E8F8006ED0EC0000436E006ED0EC004EBDE3000B95CC0000436E000290
      C90000436E0000000000000000000000000000000000C56A3100000000000000
      000000000000C56A3100F6B19000F6B19000F6B19000F6B19000EE8A5800CE5F
      2D00D1704300000000000000000000000000000000000000000000000000AB93
      8100000000000000000000000000AB938100FFFFFF0072625500000000000000
      000000000000000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEB8AA00F3EBE600694731000000000000000000000000000000
      0000000000000000000000000000000000000090C80095E8F80095E8F80095E8
      F8000060980095E8F80000436E0000436E006ED0EC0000436E0065CBE90065CB
      E90000436E000000000000000000000000000000000000000000000000000000
      00000000000000000000F56F2D00C56A3100C56A3100C56A3100F56F2D000000
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
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001FFFFC001FE7F8000FE098000FC3F
      8000F6D68000F81F8000C3178000F00F800096D68000E0078000BF198000C003
      8000BFFF800080018000FFFF800000008000803F800000008000B5DF80008001
      8000C5DF8000C0038000B5DF8000E0078000C43F8000F00F8000FDFF8000F81F
      C001FDFFC001FC3FFFFFF9FFFFFFFE7F807FFFFFC000F87F003F80018000C000
      003F800180008000000080018000800080008001800080000000800180008000
      0001800180008000000380018000800000078001800080000003800180008000
      00038001800080008003818F800080008003C38F80008000C203FFA48000C000
      FE03FFF18000F07FFF07FFFF8000FC7FFFFFFFFFFF03FC3FC0030381E001F00F
      C0030381E001E007C0030381E001C003C0030381E0018001C0030381E0018001
      C0030001E001000000000001E00101808001800300010180C003C00700010000
      E007C10700018000F007C10700018000F807E38F0001C000FC27E38F0003E001
      FE67FFFF0007F003FFFFFFFF8FFFFC27FC3FFC3FC001C001F00FF00FC001C001
      E007E007C001C001C003C003C001C00180018001C001C00180018001C001C001
      00000000C001C00100000000C001C00100000000C001C00100000000C001C001
      80018001C001C00180018001C001C001C003C003C001C001E007E007C003C003
      F00FF00FC007C007FC3FFC3FC00FC00FC001FFFFC000FFFFC001FFFF8000800F
      C001000F80000007C001000F80000003C001000780000001C001000780000001
      C001000380000001C001000380000001C001000180008001C001000180008001
      C00100078000E001C00100008000E007C00103F88000F003C00387F88000F803
      C007FF928000F803C00FFFC78000FFFFC001C001C001FFFF8000800080009C03
      8000800080000C038000800080000C038000800080009FFF800080008000FFFF
      8000800080009C038000800080000C038000800080000C038000800080009FFF
      800080008000FFFF8000800080009C038000800080000C038000800080000C03
      C001C001C0019FFFFFFFFFFFFFFFFFFFFFFFC001C001C001F001800080008000
      C07F800080008000803F800080008000801F800080008000800F800080008000
      C007800080008000E003800080008000F001800080008000F801800080008000
      FC01800080008000FE01800080008000FF03800080008000FF87800080008000
      FFFFC001C001C001FFFFFFFFFFFFFFFFFFFFF8FFFE00FC00FF3FF07FFE00FC00
      FF1FF063FE008000FF8FF241FE000000FFC7F041FE000000FFC3F81100000000
      FFE3FC030000000080E1FE070000000081E1FC3F0001000081E1F83F00030001
      80C1F03F000700038001E23F007F00079003E63F007F0007B807EE3F00FF0007
      FC1FFE7F01FF800FFFFFFEFF03FFF87FFFFF8001E000FC00FE3F0000E000F800
      F81F0000E000E000E00F0000C000C00080070000800080000003000000008000
      00010000000000000000000000000000000100008000000080010000C0000000
      C0018001E0000001E000C003E0008003F000E001E0008003F803F00CE001C007
      FC0FF81EE003E00FFE3FFC3FE007F83F}
  end
end
