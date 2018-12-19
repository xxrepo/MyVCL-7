object frmMain: TfrmMain
  Left = 300
  Top = 120
  AutoScroll = False
  Caption = 'ExpressQuantumGrid LayoutView Demo'
  ClientHeight = 602
  ClientWidth = 684
  Color = clBtnFace
  Constraints.MinHeight = 660
  Constraints.MinWidth = 700
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 684
    Height = 145
    Align = alTop
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 668
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 
      'This demo illustrates the basic features provided by Layout View' +
      's (runtime field customization in cards, card collapsing, multip' +
      'le selection and runtime record layout customization). There are' +
      ' some known issues in beta 1. Refer to the "About this demo" men' +
      'u, for the detailed description.'
    WordWrap = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 145
    Width = 684
    Height = 457
    Align = alClient
    TabOrder = 0
    LevelTabs.Slants.Positions = []
    LookAndFeel.NativeStyle = True
    object LayoutView: TcxGridDBLayoutView
      FilterBox.Visible = fvNever
      OptionsCustomize.RecordExpanding = True
      OptionsView.MinValueWidth = 40
      Styles.Content = stValues
      Styles.Item = stItems
      Styles.RecordCaption = stRecordCaption
      DataController.DataSource = dsCars
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object LayoutViewRecId: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'RecId'
        Visible = False
        LayoutItem = LayoutViewLayoutItem1
      end
      object LayoutViewID: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'ID'
        LayoutItem = LayoutViewLayoutItem2
      end
      object LayoutViewTrademark: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Trademark'
        LayoutItem = LayoutViewLayoutItem3
      end
      object LayoutViewModel: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Model'
        LayoutItem = LayoutViewLayoutItem4
      end
      object LayoutViewHP: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'HP'
        LayoutItem = LayoutViewLayoutItem5
      end
      object LayoutViewLiter: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Liter'
        LayoutItem = LayoutViewLayoutItem6
      end
      object LayoutViewCyl: TcxGridDBLayoutViewItem
        Caption = 'Cylinder'
        DataBinding.FieldName = 'Cyl'
        LayoutItem = LayoutViewLayoutItem7
      end
      object LayoutViewTransmissSpeedCount: TcxGridDBLayoutViewItem
        Caption = 'Speed Count'
        DataBinding.FieldName = 'TransmissSpeedCount'
        LayoutItem = LayoutViewLayoutItem8
      end
      object LayoutViewTransmissAutomatic: TcxGridDBLayoutViewItem
        Caption = 'Automatic'
        DataBinding.FieldName = 'TransmissAutomatic'
        RepositoryItem = EditRepositoryAutomatic
        LayoutItem = LayoutViewLayoutItem9
      end
      object LayoutViewMPG_City: TcxGridDBLayoutViewItem
        Caption = 'City (mpg)'
        DataBinding.FieldName = 'MPG_City'
        LayoutItem = LayoutViewLayoutItem10
      end
      object LayoutViewMPG_Highway: TcxGridDBLayoutViewItem
        Caption = 'Highway (mpg)'
        DataBinding.FieldName = 'MPG_Highway'
        LayoutItem = LayoutViewLayoutItem11
      end
      object LayoutViewCategory: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Category'
        LayoutItem = LayoutViewLayoutItem12
      end
      object LayoutViewDescription: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Description'
        RepositoryItem = EditRepositoryMemo
        LayoutItem = LayoutViewLayoutItem13
      end
      object LayoutViewHyperlink: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Hyperlink'
        RepositoryItem = EditRepositoryHyperLink
        LayoutItem = LayoutViewLayoutItem14
      end
      object LayoutViewPicture: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Picture'
        RepositoryItem = EditRepositoryImage
        LayoutItem = LayoutViewLayoutItem15
      end
      object LayoutViewPrice: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'Price'
        RepositoryItem = EditRepositoryPrice
        LayoutItem = LayoutViewLayoutItem16
      end
      object LayoutViewGroup_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemIndex = 1
        ShowBorder = False
        Index = -1
      end
      object LayoutViewGroup1: TdxLayoutGroup
        CaptionOptions.Text = 'Engine'
        Parent = LayoutViewGroup3
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 1
      end
      object LayoutViewGroup2: TdxLayoutGroup
        CaptionOptions.Text = 'Transmission'
        Parent = LayoutViewGroup3
        ButtonOptions.Buttons = <>
        Index = 0
      end
      object LayoutViewGroup3: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        ButtonOptions.Buttons = <>
        LayoutDirection = ldTabbed
        ShowBorder = False
        Index = -1
      end
      object LayoutViewLayoutItem1: TcxGridLayoutItem
        Index = -1
      end
      object LayoutViewLayoutItem2: TcxGridLayoutItem
        Index = -1
      end
      object LayoutViewLayoutItem3: TcxGridLayoutItem
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Visible = False
        Parent = LayoutViewGroup11
        SizeOptions.Width = 151
        Index = 0
      end
      object LayoutViewLayoutItem4: TcxGridLayoutItem
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Visible = False
        CaptionOptions.AlignVert = tavBottom
        Parent = LayoutViewGroup11
        SizeOptions.Width = 151
        Index = 1
      end
      object LayoutViewLayoutItem5: TcxGridLayoutItem
        AlignHorz = ahClient
        Parent = LayoutViewGroup8
        SizeOptions.Width = 64
        Index = 4
      end
      object LayoutViewLayoutItem6: TcxGridLayoutItem
        AlignHorz = ahClient
        Parent = LayoutViewGroup8
        SizeOptions.Width = 75
        Index = 2
      end
      object LayoutViewLayoutItem7: TcxGridLayoutItem
        AlignHorz = ahLeft
        Parent = LayoutViewGroup8
        SizeOptions.Width = 118
        Index = 0
      end
      object LayoutViewLayoutItem8: TcxGridLayoutItem
        AlignHorz = ahClient
        Parent = LayoutViewGroup10
        Index = 0
      end
      object LayoutViewLayoutItem9: TcxGridLayoutItem
        AlignHorz = ahClient
        Parent = LayoutViewGroup10
        Index = 2
      end
      object LayoutViewLayoutItem10: TcxGridLayoutItem
        AlignHorz = ahClient
        Parent = LayoutViewGroup9
        Index = 0
      end
      object LayoutViewLayoutItem11: TcxGridLayoutItem
        AlignHorz = ahClient
        Parent = LayoutViewGroup9
        Index = 2
      end
      object LayoutViewLayoutItem12: TcxGridLayoutItem
        Parent = LayoutViewGroup5
        SizeOptions.Width = 89
        Index = 0
      end
      object LayoutViewLayoutItem13: TcxGridLayoutItem
        CaptionOptions.Visible = False
        Parent = LayoutViewGroup6
        SizeOptions.Height = 100
        Index = 1
      end
      object LayoutViewLayoutItem14: TcxGridLayoutItem
        CaptionOptions.Visible = False
        Parent = LayoutViewGroup7
        Index = 3
      end
      object LayoutViewLayoutItem15: TcxGridLayoutItem
        CaptionOptions.Visible = False
        Parent = LayoutViewGroup11
        SizeOptions.Height = 94
        SizeOptions.Width = 212
        Index = 2
      end
      object LayoutViewLayoutItem16: TcxGridLayoutItem
        AlignVert = avBottom
        Parent = LayoutViewGroup5
        SizeOptions.Width = 78
        Index = 2
      end
      object LayoutViewGroup4: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        CaptionOptions.Visible = False
        Parent = LayoutViewGroup_Root
        SizeOptions.Width = 296
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object LayoutViewGroup5: TdxLayoutGroup
        Parent = LayoutViewGroup4
        SizeOptions.Width = 131
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 2
      end
      object LayoutViewGroup6: TdxLayoutGroup
        CaptionOptions.Text = 'New Group'
        CaptionOptions.Visible = False
        Parent = LayoutViewGroup_Root
        SizeOptions.Width = 267
        ButtonOptions.Buttons = <>
        LayoutDirection = ldTabbed
        ShowBorder = False
        Index = 1
      end
      object LayoutViewGroup7: TdxLayoutGroup
        CaptionOptions.Text = 'Information'
        Parent = LayoutViewGroup6
        ButtonOptions.Buttons = <>
        Index = 0
      end
      object LayoutViewGroup8: TdxLayoutGroup
        CaptionOptions.Text = 'Engine'
        Parent = LayoutViewGroup7
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object LayoutViewSpaceItem1: TdxLayoutEmptySpaceItem
        CaptionOptions.Text = 'Empty Space Item'
        Parent = LayoutViewGroup4
        SizeOptions.Height = 10
        SizeOptions.Width = 11
        Index = 1
      end
      object LayoutViewGroup10: TdxLayoutGroup
        CaptionOptions.Text = 'Transmission'
        Parent = LayoutViewGroup7
        ButtonOptions.Buttons = <>
        ItemIndex = -1
        LayoutDirection = ldHorizontal
        Index = 1
      end
      object LayoutViewSeparatorItem1: TdxLayoutSeparatorItem
        CaptionOptions.Text = 'Separator'
        Parent = LayoutViewGroup5
        SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
        SizeOptions.SizableHorz = False
        SizeOptions.SizableVert = False
        Index = 1
      end
      object LayoutViewGroup9: TdxLayoutGroup
        CaptionOptions.Text = 'Fuel ecomomy'
        Parent = LayoutViewGroup7
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 2
      end
      object LayoutViewSpaceItem2: TdxLayoutEmptySpaceItem
        AlignHorz = ahClient
        CaptionOptions.Text = 'Empty Space Item'
        Parent = LayoutViewGroup9
        SizeOptions.Height = 10
        SizeOptions.Width = 22
        Index = 1
      end
      object LayoutViewSpaceItem3: TdxLayoutEmptySpaceItem
        CaptionOptions.Text = 'Empty Space Item'
        Parent = LayoutViewGroup8
        SizeOptions.Height = 10
        SizeOptions.Width = 21
        Index = 1
      end
      object LayoutViewSpaceItem4: TdxLayoutEmptySpaceItem
        CaptionOptions.Text = 'Empty Space Item'
        Parent = LayoutViewGroup8
        SizeOptions.Height = 10
        SizeOptions.Width = 15
        Index = 3
      end
      object LayoutViewSpaceItem5: TdxLayoutEmptySpaceItem
        CaptionOptions.Text = 'Empty Space Item'
        Parent = LayoutViewGroup10
        SizeOptions.Height = 10
        SizeOptions.Width = 30
        Index = 1
      end
      object LayoutViewGroup11: TdxLayoutGroup
        Parent = LayoutViewGroup4
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = 0
      end
    end
    object GridLevel1: TcxGridLevel
      GridView = LayoutView
    end
  end
  object rgViewMode: TRadioGroup
    Left = 8
    Top = 61
    Width = 233
    Height = 78
    Caption = 'View Mode'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Single Record'
      'Single Row'
      'Multiple Rows'
      'Single Column'
      'Multiple Columns')
    TabOrder = 1
    OnClick = rgViewModeClick
  end
  object btnCustomize: TcxButton
    Left = 563
    Top = 110
    Width = 113
    Height = 29
    Anchors = [akTop, akRight]
    Caption = 'Customize Layout'
    TabOrder = 2
    OnClick = btnCustomizeClick
    LookAndFeel.NativeStyle = True
  end
  object cbCenterRecords: TCheckBox
    Left = 263
    Top = 70
    Width = 97
    Height = 17
    Caption = 'Center Records'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = cbCenterRecordsClick
  end
  object cbShowOnlyEntireRecords: TCheckBox
    Left = 263
    Top = 93
    Width = 153
    Height = 17
    Caption = 'Only Entire Records'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = cbShowOnlyEntireRecordsClick
  end
  object cbMultiSelectRecords: TCheckBox
    Left = 263
    Top = 116
    Width = 145
    Height = 17
    Caption = 'Multi-select Records'
    TabOrder = 5
    OnClick = cbMultiSelectRecordsClick
  end
  object cbRecordCaptions: TCheckBox
    Left = 414
    Top = 70
    Width = 137
    Height = 17
    Caption = 'Record Captions'
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = cbRecordCaptionsClick
  end
  object cbExpandableRecords: TCheckBox
    Left = 414
    Top = 93
    Width = 171
    Height = 17
    Caption = 'Record Expand Button'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = cbExpandableRecordsClick
  end
  object dsCars: TDataSource
    DataSet = mdCars
    Left = 72
    Top = 138
  end
  object mmMain: TMainMenu
    Left = 44
    Top = 138
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miView: TMenuItem
      Caption = '&View'
      object miCustomize: TMenuItem
        Caption = 'Customize...'
        OnClick = miCustomizeClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object EditRepository: TcxEditRepository
    Left = 100
    Top = 138
    object EditRepositoryImage: TcxEditRepositoryImageItem
      Properties.GraphicClassName = 'TJPEGImage'
      Properties.Stretch = True
    end
    object EditRepositoryMemo: TcxEditRepositoryMemoItem
      Properties.VisibleLineCount = 10
    end
    object EditRepositoryHyperLink: TcxEditRepositoryHyperLinkItem
    end
    object EditRepositoryPrice: TcxEditRepositoryCurrencyItem
      Properties.AutoSelect = False
      Properties.HideSelection = False
    end
    object EditRepositoryAutomatic: TcxEditRepositoryCheckBoxItem
      Properties.ValueChecked = 'Yes'
      Properties.ValueUnchecked = 'No'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 156
    Top = 139
    PixelsPerInch = 96
    object stValues: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      TextColor = clMaroon
    end
    object stItems: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stRecordCaption: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
    end
  end
  object mdCars: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0F000000040000000C000300494400320000000100
      0A0054726164656D61726B0032000000010006004D6F64656C00020000000200
      030048500008000000060006004C6974657200020000000200040043796C0002
      000000020014005472616E736D6973735370656564436F756E74000300000001
      0013005472616E736D6973734175746F6D617469630002000000020009004D50
      475F43697479000200000002000C004D50475F48696768776179000700000001
      00090043617465676F727900000000000E000C004465736372697074696F6E00
      3200000001000A0048797065726C696E6B000000000011000800506963747572
      650008000000060006005072696365000101000000010D0000004D6572636564
      65732D42656E7A010E000000534C35303020526F616473746572012E010177BE
      9F1A2FDD13400108000105000103000000596573011000011700010600000053
      504F5254534B060000456E67696E6520342C3936362D636320534F4843203234
      2D76616C7665203930B020562D382E20486967682D7072657373757265206469
      652D6361737420616C6C6F792063796C696E64657220626C6F636B2C20616C6C
      6F792068656164732E200D0A0D0A4E657420706F776572203330322068702040
      20352C3630302072706D0D0A0D0A4E657420746F7271756520333339206C622D
      667420746F72717565204020322C3730302D342C3235302072706D0D0A0D0A43
      6F6D7072657373696F6E20726174696F2031302E303A312E0D0A0D0A4675656C
      20726571756972656D656E74205072656D69756D20756E6C65616465642C2039
      312070756D70206F6374616E652E0D0A0D0A4675656C20616E642069676E6974
      696F6E2073797374656D204D4520322E3820656E67696E65206D616E6167656D
      656E742E20496E74656772617465642073657175656E7469616C206D756C7469
      706F696E74206675656C20696E6A656374696F6E20616E642070686173656420
      7477696E2D737061726B2069676E6974696F6E20696E636C7564657320696E64
      6976696475616C2063796C696E64657220636F6E74726F6C206F66206675656C
      2073707261792C20737061726B2074696D696E672F706861736520616E642061
      6E74696B6E6F636B2E2054776F20686967682D656E657267792069676E697469
      6F6E20636F696C7320616E642074776F20737061726B20706C75677320706572
      2063796C696E6465722C2077697468203130302C3030302D6D696C6520737061
      726B20706C756720696E74657276616C732E20456C656374726F6E6963207468
      726F74746C6520636F6E74726F6C2E0D0A0D0A496E74616B652073797374656D
      204D61676E657369756D20322D7374616765207265736F6E616E636520696E74
      616B65206D616E69666F6C6420696E637265617365732072756E6E6572206C65
      6E677468206174206C6F7765722072706D20666F7220696D70726F7665642072
      6573706F6E73652E20537461696E6C6573732D737465656C2065786861757374
      2073797374656D2077697468206475616C206368726F6D652066696E69736865
      72732E0D0A0D0A5472616E736D697373696F6E20456C656374726F6E69632035
      2D7370656564206175746F6D617469632077697468206472697665722D616461
      707469766520636F6E74726F6C2E20546F75636820536869667420616C6C6F77
      732064726976657220746F206D616E75616C6C7920646F776E73686966742061
      6E6420616C6C6F77207570736869667473206279206E756467696E6720746865
      207368696674206C6576657220746F20746865206C656674206F722072696768
      742066726F6D2074686520447269766520706F736974696F6E2E204472697665
      722D73656C65637461626C652077696E746572206D6F64652073746172747320
      76656869636C65206D6F76696E6720696E20326E642067656172206F72206120
      7370656369616C207365636F6E642052657665727365206765617220746F2068
      656C7020696D70726F76652074616B656F6666206F6E20736C69707065727920
      73757266616365732E20446973706C617920696E20696E737472756D656E7420
      636C757374657220696E646963617465732073656C6563746564206765617220
      72616E676520616E642077696E7465722F7374616E64617264206D6F64652E0D
      0A0D0A526561722061786C6520726174696F20322E38323A310D0A200D0A0D0A
      2A204D53525020696E636C756465732024363635207472616E73706F72746174
      696F6E20616E642068616E646C696E672063686172676520616E64206578636C
      7564657320616C6C2074617865732C207469746C652F646F63756D656E746172
      7920666565732C20726567697374726174696F6E2C20746167732C204D657263
      656465732D42656E7A204465616C657220707265702C206C61626F7220616E64
      20696E7374616C6C6174696F6E20636861726765732C20696E737572616E6365
      2C206F7074696F6E616C2065717569706D656E7420616E64206163636573736F
      726965732C206365727469666963617465206F6620636F6D706C69616E636520
      6F72206E6F6E2D636F6D706C69616E636520666565732C20616E642066696E61
      6E636520636861726765732E2041637475616C20707269636573206D61792076
      617279206279204465616C65722E200D0A200D0A0117000000687474703A2F2F
      7777772E6D657263656465732E636F6D0000000001000000008075F440}
    SortOptions = []
    Left = 128
    Top = 138
    object mdCarsID: TAutoIncField
      FieldName = 'ID'
    end
    object mdCarsTrademark: TStringField
      FieldName = 'Trademark'
      Size = 50
    end
    object mdCarsModel: TStringField
      FieldName = 'Model'
      Size = 50
    end
    object mdCarsHP: TSmallintField
      FieldName = 'HP'
    end
    object mdCarsLiter: TFloatField
      FieldName = 'Liter'
    end
    object mdCarsCyl: TSmallintField
      FieldName = 'Cyl'
    end
    object mdCarsTransmissSpeedCount: TSmallintField
      FieldName = 'TransmissSpeedCount'
    end
    object mdCarsTransmissAutomatic: TStringField
      FieldName = 'TransmissAutomatic'
      Size = 3
    end
    object mdCarsMPG_City: TSmallintField
      FieldName = 'MPG_City'
    end
    object mdCarsMPG_Highway: TSmallintField
      FieldName = 'MPG_Highway'
    end
    object mdCarsCategory: TStringField
      FieldName = 'Category'
      Size = 7
    end
    object mdCarsDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
      Size = 10
    end
    object mdCarsHyperlink: TStringField
      FieldName = 'Hyperlink'
      Size = 50
    end
    object mdCarsPicture: TBlobField
      FieldName = 'Picture'
      BlobType = ftParadoxOle
      Size = 10
    end
    object mdCarsPrice: TFloatField
      FieldName = 'Price'
    end
  end
end
