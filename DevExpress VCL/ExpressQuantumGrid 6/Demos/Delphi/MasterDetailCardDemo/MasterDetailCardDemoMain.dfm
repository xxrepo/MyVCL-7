object MasterDetailCardDemoMainForm: TMasterDetailCardDemoMainForm
  Left = 63
  Top = 44
  Width = 907
  Height = 661
  Caption = 'ExpressQuantumGrid Master Detail Card Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object lblMaster: TLabel
    Left = 0
    Top = 61
    Width = 899
    Height = 22
    Align = alTop
    Caption = 'Master : Films'
    Color = 15790320
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblStyle: TLabel
    Left = 0
    Top = 32
    Width = 899
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'Standard master-detail style'
    Color = 15790320
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 56
    Width = 899
    Height = 5
    Align = alTop
    Shape = bsTopLine
  end
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 899
    Height = 32
    Align = alTop
    Caption = 
      'Initially displays as separate master and detail data. Use the O' +
      'ptions in order to show both tables in a single grid. Click '#39'Abo' +
      'ut this demo'#39' for more information.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 83
    Width = 899
    Height = 237
    Align = alClient
    TabOrder = 0
    object tvFilms: TcxGridDBTableView
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = MasterDetailCardDemoDataDM.dsFilms
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.CellAutoHeight = True
      OptionsView.Indicator = True
      Preview.Column = colFilmsPlotOutline
      Preview.Visible = True
      Styles.StyleSheet = MasterDetailCardDemoDataDM.GridTableViewStyleSheetDevExpress
      object colFilmsCaption: TcxGridDBColumn
        Caption = 'Caption'
        DataBinding.FieldName = 'Caption'
      end
      object colFilmsYear: TcxGridDBColumn
        Caption = 'Year'
        DataBinding.FieldName = 'Year'
      end
      object colFilmsRuntime: TcxGridDBColumn
        Caption = 'Runtime'
        DataBinding.FieldName = 'Runtime'
      end
      object colFilmsPhoto: TcxGridDBColumn
        Caption = 'Photo'
        DataBinding.FieldName = 'Photo'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekPict
        Properties.PictureGraphicClassName = 'TJPEGImage'
      end
      object colFilmsTagline: TcxGridDBColumn
        Caption = 'Tagline'
        DataBinding.FieldName = 'Tagline'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 350
      end
      object colFilmsPlotOutline: TcxGridDBColumn
        Caption = 'PlotOutline'
        DataBinding.FieldName = 'PlotOutline'
      end
    end
    object cvFilmsPersons: TcxGridDBCardView
      DataController.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
      DataController.DetailKeyFieldNames = 'FilmID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.CellAutoHeight = True
      OptionsView.SeparatorColor = 12937777
      Styles.StyleSheet = MasterDetailCardDemoDataDM.GridCardViewStyleSheetDevExpress
      object cvFilmsPersonsName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Name'
        Kind = rkCaption
      end
      object cvFilmsPersonsPersonLineID: TcxGridDBCardViewRow
        Caption = 'PersonLine'
        DataBinding.FieldName = 'PersonLineID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = MasterDetailCardDemoDataDM.dsPersonsLine
      end
      object cvFilmsPersonsFIRSTNAME: TcxGridDBCardViewRow
        Caption = 'FirstName'
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvFilmsPersonsSECONDNAME: TcxGridDBCardViewRow
        Caption = 'SecondName'
        DataBinding.FieldName = 'SECONDNAME'
      end
      object cvFilmsPersonsNICKNAME: TcxGridDBCardViewRow
        Caption = 'NickName'
        DataBinding.FieldName = 'NICKNAME'
      end
      object cvFilmsPersonsDATEOFBIRTH: TcxGridDBCardViewRow
        Caption = 'DateOfBirth'
        DataBinding.FieldName = 'DATEOFBIRTH'
        PropertiesClassName = 'TcxDateEditProperties'
      end
      object cvFilmsPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow
        Caption = 'LocationOfBirth'
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
      end
      object cvFilmsPersonsBIRTHNAME: TcxGridDBCardViewRow
        Caption = 'BirthName'
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvFilmsPersonsBIOGRAPHY: TcxGridDBCardViewRow
        Caption = 'Biography'
        DataBinding.FieldName = 'BIOGRAPHY'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Properties.MemoScrollBars = ssVertical
      end
      object cvFilmsPersonsGender: TcxGridDBCardViewRow
        Caption = 'Male'
        DataBinding.FieldName = 'Gender'
        PropertiesClassName = 'TcxCheckBoxProperties'
      end
      object cvFilmsPersonsHOMEPAGE: TcxGridDBCardViewRow
        Caption = 'HomePage'
        DataBinding.FieldName = 'HOMEPAGE'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
      end
    end
    object lvFilms: TcxGridLevel
      GridView = tvFilms
      Options.DetailFrameColor = clHighlight
      Options.DetailFrameWidth = 0
      object lvFilmsPersons: TcxGridLevel
        GridView = cvFilmsPersons
        Visible = False
      end
    end
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 320
    Width = 899
    Height = 268
    Align = alBottom
    Color = 15451300
    TabOrder = 1
    object lblDetail: TLabel
      Left = 1
      Top = 1
      Width = 897
      Height = 22
      Align = alTop
      Caption = 'Detail: People involved with the film'
      Color = 15790320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 23
      Width = 897
      Height = 244
      Align = alClient
      BevelOuter = bvNone
      Color = 15451300
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 7
        Width = 58
        Height = 13
        Caption = '&Occupation:'
        FocusControl = cbOccupation
      end
      object Label2: TLabel
        Left = 24
        Top = 45
        Width = 53
        Height = 13
        Caption = 'First &Name:'
        FocusControl = edFirstName
      end
      object Label8: TLabel
        Left = 24
        Top = 85
        Width = 71
        Height = 13
        Caption = '&Second Name:'
        FocusControl = edSecondName
      end
      object Label9: TLabel
        Left = 24
        Top = 125
        Width = 56
        Height = 13
        Caption = '&Nick Name:'
        FocusControl = edNickName
      end
      object Label7: TLabel
        Left = 24
        Top = 165
        Width = 56
        Height = 13
        Caption = 'Home &Page'
        FocusControl = edHomePage
      end
      object Label6: TLabel
        Left = 264
        Top = 86
        Width = 55
        Height = 13
        Caption = 'Birth N&ame:'
        FocusControl = edBirthName
      end
      object Label4: TLabel
        Left = 264
        Top = 46
        Width = 80
        Height = 13
        Caption = '&Location of Birth:'
        FocusControl = edLocationOfBirth
      end
      object Label3: TLabel
        Left = 264
        Top = 6
        Width = 62
        Height = 13
        Caption = 'Date of &Birth:'
        FocusControl = deDateOfBirth
      end
      object Label5: TLabel
        Left = 520
        Top = 21
        Width = 47
        Height = 13
        Caption = 'Bio&graphy'
        FocusControl = meBiography
      end
      object cbOccupation: TcxDBLookupComboBox
        Left = 24
        Top = 21
        Width = 185
        Height = 21
        DataBinding.DataField = 'PersonLineID'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = MasterDetailCardDemoDataDM.dsPersonsLine
        Style.Color = 16247513
        Style.StyleController = cxEditStyleController1
        TabOrder = 0
      end
      object edFirstName: TcxDBTextEdit
        Left = 24
        Top = 61
        Width = 185
        Height = 21
        DataBinding.DataField = 'FIRSTNAME'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Style.StyleController = cxEditStyleController1
        TabOrder = 1
      end
      object edSecondName: TcxDBTextEdit
        Left = 24
        Top = 101
        Width = 185
        Height = 21
        DataBinding.DataField = 'SECONDNAME'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Style.StyleController = cxEditStyleController1
        TabOrder = 2
      end
      object edNickName: TcxDBTextEdit
        Left = 24
        Top = 141
        Width = 185
        Height = 21
        DataBinding.DataField = 'NICKNAME'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Style.StyleController = cxEditStyleController1
        TabOrder = 3
      end
      object edHomePage: TcxDBHyperLinkEdit
        Left = 24
        Top = 181
        Width = 473
        Height = 21
        DataBinding.DataField = 'HOMEPAGE'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        ParentFont = False
        Style.StyleController = cxEditStyleController1
        TabOrder = 4
      end
      object DBNavigator1: TcxDBNavigator
        Left = 24
        Top = 213
        Width = 285
        Height = 25
        DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        TabOrder = 5
      end
      object edBirthName: TcxDBTextEdit
        Left = 264
        Top = 102
        Width = 233
        Height = 21
        DataBinding.DataField = 'BIRTHNAME'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Style.StyleController = cxEditStyleController1
        TabOrder = 6
      end
      object edLocationOfBirth: TcxDBTextEdit
        Left = 264
        Top = 62
        Width = 233
        Height = 21
        DataBinding.DataField = 'LOCATIONOFBIRTH'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Style.StyleController = cxEditStyleController1
        TabOrder = 7
      end
      object deDateOfBirth: TcxDBDateEdit
        Left = 264
        Top = 22
        Width = 121
        Height = 21
        DataBinding.DataField = 'DATEOFBIRTH'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Style.StyleController = cxEditStyleController1
        TabOrder = 8
      end
      object meBiography: TcxDBMemo
        Left = 520
        Top = 45
        Width = 353
        Height = 156
        DataBinding.DataField = 'BIOGRAPHY'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        Properties.ScrollBars = ssVertical
        Style.StyleController = cxEditStyleController1
        TabOrder = 9
      end
      object chbMale: TcxDBCheckBox
        Left = 264
        Top = 136
        Width = 121
        Height = 21
        Caption = 'Male'
        DataBinding.DataField = 'Gender'
        DataBinding.DataSource = MasterDetailCardDemoDataDM.dsFilmsPersons
        ParentColor = False
        Style.StyleController = cxEditStyleController1
        TabOrder = 10
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 588
    Width = 899
    Height = 19
    AutoHint = True
    Panels = <>
  end
  object mmMain: TMainMenu
    Left = 488
    Top = 32
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = 'O&ptions'
      object miGrid4: TMenuItem
        Caption = 'ExpressQuantumGrid Master-Detail display style'
        Hint = 
          'ExpressQuantumGrid master-detail display style Combines two sepa' +
          'rate grid views into the master-detail representation'
        OnClick = miGrid4Click
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object cxEditStyleController1: TcxEditStyleController
    Style.Color = 16247513
    Left = 553
    Top = 31
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 520
    Top = 32
  end
end
