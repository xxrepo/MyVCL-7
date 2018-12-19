object Form1: TForm1
  Left = 444
  Top = 336
  Width = 573
  Height = 549
  Caption = 'Look & Feels Demo'
  Color = clBtnFace
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 36
    Width = 565
    Height = 479
    Align = alBottom
    TabOrder = 1
    AutoContentSizes = [acsWidth, acsHeight]
    LookAndFeel = lfStandard
    OnCustomization = lcMainCustomization
    object SpeedButton1: TSpeedButton
      Left = 10
      Top = 10
      Width = 132
      Height = 22
      GroupIndex = 1
      Down = True
      Caption = 'Standard Look && Feel'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Tag = 1
      Left = 148
      Top = 10
      Width = 132
      Height = 22
      GroupIndex = 1
      Caption = 'Office Look && Feel'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Tag = 2
      Left = 286
      Top = 10
      Width = 132
      Height = 22
      GroupIndex = 1
      Caption = 'Web Look && Feel'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 424
      Top = 10
      Width = 132
      Height = 22
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'Customize Layout...'
      Flat = True
      OnClick = SpeedButton4Click
    end
    object Bevel1: TBevel
      Left = 10
      Top = 38
      Width = 545
      Height = 3
      Shape = bsTopLine
    end
    object DBEdit1: TDBEdit
      Left = 337
      Top = 67
      Width = 204
      Height = 17
      BorderStyle = bsNone
      DataField = 'Event_Name'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 337
      Top = 94
      Width = 89
      Height = 17
      BorderStyle = bsNone
      DataField = 'Event_Date'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 467
      Top = 94
      Width = 74
      Height = 17
      BorderStyle = bsNone
      DataField = 'Event_Time'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBMemo1: TDBMemo
      Left = 337
      Top = 148
      Width = 204
      Height = 89
      BorderStyle = bsNone
      DataField = 'Event_Description'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 337
      Top = 121
      Width = 204
      Height = 17
      BorderStyle = bsNone
      DataField = 'Ticket_price'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBImage1: TDBImage
      Left = 24
      Top = 67
      Width = 216
      Height = 170
      BorderStyle = bsNone
      DataField = 'Event_Photo'
      DataSource = DataSource1
      TabOrder = 0
    end
    object dxDBLookupEdit1: TDBLookupComboBox
      Left = 22
      Top = 293
      Width = 247
      Height = 21
      Ctl3D = True
      DataField = 'VenueNo'
      DataSource = DataSource1
      KeyField = 'VenueNo'
      ListField = 'Venue'
      ListSource = DataSource3
      ParentCtl3D = False
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 340
      Width = 243
      Height = 17
      BorderStyle = bsNone
      DataField = 'Capacity'
      DataSource = DataSource2
      TabOrder = 7
    end
    object DBImage2: TDBImage
      Left = 277
      Top = 295
      Width = 264
      Height = 129
      BorderStyle = bsNone
      Center = False
      DataField = 'Venue_Map'
      DataSource = DataSource2
      TabOrder = 9
    end
    object DBMemo2: TDBMemo
      Left = 24
      Top = 385
      Width = 243
      Height = 39
      BorderStyle = bsNone
      DataField = 'Remarks'
      DataSource = DataSource2
      TabOrder = 8
    end
    object DBNavigator1: TDBNavigator
      Left = 162
      Top = 444
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 10
    end
    object lcMain_Root: TdxLayoutGroup
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      object lcMainGroup1: TdxLayoutGroup
        LookAndFeel = lfStandard
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        Locked = True
        ShowBorder = False
        object lcMainItem1: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          ShowCaption = False
          Control = SpeedButton1
          ControlOptions.ShowBorder = False
        end
        object lcMainItem8: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          ShowCaption = False
          Control = SpeedButton2
          ControlOptions.ShowBorder = False
        end
        object lcMainItem13: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          ShowCaption = False
          Control = SpeedButton3
          ControlOptions.ShowBorder = False
        end
        object lcMainItem14: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          ShowCaption = False
          Control = SpeedButton4
          ControlOptions.ShowBorder = False
        end
      end
      object lcMainItem15: TdxLayoutItem
        Control = Bevel1
        ControlOptions.ShowBorder = False
      end
      object lcMainGroup7: TdxLayoutGroup
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutGroup1: TdxLayoutGroup
          Caption = 'Picture'
          object lcMainItem7: TdxLayoutItem
            AutoAligns = []
            AlignVert = avClient
            Caption = 'dxDBGraphicEdit1'
            ShowCaption = False
            Control = DBImage1
          end
        end
        object lcMainGroup4: TdxLayoutGroup
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = 'Event'
          object lcMainItem2: TdxLayoutItem
            Caption = 'Name:'
            Control = DBEdit1
          end
          object lcMainGroup2: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcMainGroup8: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcMainItem3: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = 'Date:'
                Control = DBEdit4
              end
              object lcMainItem4: TdxLayoutItem
                Caption = 'Time:'
                Control = DBEdit2
              end
            end
            object lcMainItem6: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = 'Ticket Price:'
              Control = DBEdit5
            end
            object lcMainItem5: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = 'Description:'
              Control = DBMemo1
            end
          end
        end
      end
      object lcMainGroup5: TdxLayoutGroup
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Caption = 'Venue'
        LayoutDirection = ldHorizontal
        object lcMainGroup6: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object lcMainItem9: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = 'Name:'
            CaptionOptions.Layout = clTop
            Control = dxDBLookupEdit1
            ControlOptions.ShowBorder = False
          end
          object lcMainItem10: TdxLayoutItem
            Caption = 'Capacity:'
            CaptionOptions.Layout = clTop
            Control = DBEdit3
          end
          object lcMainItem12: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = 'Notes:'
            CaptionOptions.Layout = clTop
            Control = DBMemo2
          end
        end
        object lcMainItem11: TdxLayoutItem
          AutoAligns = []
          AlignHorz = ahClient
          AlignVert = avClient
          Caption = 'Map:'
          CaptionOptions.Layout = clTop
          Control = DBImage2
        end
      end
      object dxLayoutItem1: TdxLayoutItem
        AutoAligns = [aaVertical]
        AlignHorz = ahCenter
        Control = DBNavigator1
        ControlOptions.AutoColor = True
        ControlOptions.ShowBorder = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 36
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Caption = '  Printout Capabilities:'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object btnDesign: TBitBtn
      Left = 138
      Top = 5
      Width = 99
      Height = 25
      Caption = '&Design...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnDesignClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555777555
        5555555555000757755555575500005007555570058880000075570870088078
        007555787887087777755550880FF0800007708080888F7088077088F0708F78
        88077000F0778080005555508F0008800755557878FF88777075570870080088
        0755557075888070755555575500075555555555557775555555}
    end
    object btnPrintPreview: TBitBtn
      Left = 240
      Top = 5
      Width = 99
      Height = 25
      Caption = 'Pre&view...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnPrintPreviewClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
        08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
        80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
        22220FFFFFFF070222220FFFFFFF002222220000000002222222}
    end
    object btnPrint: TBitBtn
      Left = 342
      Top = 5
      Width = 99
      Height = 25
      Caption = '&Print...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnPrintClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        22222200000000000222208888888880802200000000000008020888888BBB88
        0002088888877788080200000000000008800888888888808080200000000008
        0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
        022222220FFFFFFFF02222222000000000222222222222222222}
    end
    object btnPageSetup: TBitBtn
      Left = 444
      Top = 5
      Width = 99
      Height = 25
      Caption = 'Page Set&up...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnPageSetupClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777777777777777777744444777777444444444444444744444484F444
        444744888884FFFFF44744888884FFFFF44744888884FFFFF44744888884FFFF
        F44744888884FFFFF44744888884FFFFF44744888884FFFFF447448888474FFF
        F447744444777444447777777777777777777777777777777777}
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 460
    Top = 112
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'events.db'
    Left = 488
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 476
    Top = 140
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    IndexFieldNames = 'VenueNo'
    MasterFields = 'VenueNo'
    MasterSource = DataSource1
    TableName = 'venues.db'
    Left = 504
    Top = 140
  end
  object DataSource3: TDataSource
    DataSet = Table3
    Left = 476
    Top = 180
  end
  object Table3: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'venues.db'
    Left = 504
    Top = 180
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 71
    Top = 174
    object lfStandard: TdxLayoutStandardLookAndFeel
    end
    object lfOffice: TdxLayoutOfficeLookAndFeel
      ItemOptions.ControlBorderStyle = lbsFlat
    end
    object lfWeb: TdxLayoutWebLookAndFeel
      GroupOptions.CaptionOptions.Color = 15132160
      GroupOptions.Color = 14811135
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    Version = 0
    Left = 71
    Top = 125
    object dxComponentPrinter1Link1: TdxLayoutControlReportLink
      Active = True
      Component = lcMain
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 3380
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 210010
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 38323.826234328700000000
      ReportDocument.Creator = 'Pavel'
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsPagination.Controls = False
      OnInitializeItem = dxComponentPrinter1Link1InitializeItem
      BuiltInReportLink = True
      HiddenComponents = {
        6C634D61696E47726F7570310D0A6C634D61696E4974656D310D0A6C634D6169
        6E4974656D380D0A6C634D61696E4974656D31330D0A6C634D61696E4974656D
        31340D0A64784C61796F75744974656D310D0A}
      ExcludedComponents = {
        6C634D61696E47726F7570310D0A6C634D61696E4974656D310D0A6C634D6169
        6E4974656D380D0A6C634D61696E4974656D31330D0A6C634D61696E4974656D
        31340D0A64784C61796F75744974656D310D0A}
      AggregatedReportLinks = {}
    end
  end
end
