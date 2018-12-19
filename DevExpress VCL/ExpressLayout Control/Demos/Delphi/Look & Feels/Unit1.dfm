object Form1: TForm1
  Left = 199
  Top = 117
  Width = 573
  Height = 506
  Caption = 'Look & Feels Demo'
  Color = clBtnFace
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 565
    Height = 479
    Align = alClient
    TabOrder = 0
    AutoContentSizes = [acsWidth, acsHeight]
    LookAndFeel = lfStandard
    OnCustomization = lcMainCustomization
    object SpeedButton1: TSpeedButton
      Left = 10
      Top = 10
      Width = 100
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
      Width = 100
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
      Width = 100
      Height = 22
      GroupIndex = 1
      Caption = 'Web Look && Feel'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 424
      Top = 10
      Width = 100
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
      Left = 339
      Top = 67
      Width = 121
      Height = 17
      BorderStyle = bsNone
      DataField = 'Event_Name'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 339
      Top = 94
      Width = 87
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
      Left = 339
      Top = 148
      Width = 185
      Height = 89
      BorderStyle = bsNone
      DataField = 'Event_Description'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 339
      Top = 121
      Width = 202
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
      Height = 149
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
      DataField = 'VenueNo'
      DataSource = DataSource1
      KeyField = 'VenueNo'
      ListField = 'Venue'
      ListSource = DataSource3
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
      Width = 234
      Height = 189
      BorderStyle = bsNone
      Center = False
      DataField = 'Venue_Map'
      DataSource = DataSource2
      TabOrder = 9
    end
    object DBMemo2: TDBMemo
      Left = 24
      Top = 385
      Width = 207
      Height = 59
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
    Left = 108
    Top = 84
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
end
