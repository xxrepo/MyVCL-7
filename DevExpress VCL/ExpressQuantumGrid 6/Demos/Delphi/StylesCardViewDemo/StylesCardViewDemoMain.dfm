object StylesCardViewDemoMainForm: TStylesCardViewDemoMainForm
  Left = 270
  Top = 120
  Width = 824
  Height = 630
  Caption = 'ExpressQuantumGrid StylesCardView Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 816
    Height = 33
    Align = alTop
    AutoSize = False
    Caption = 
      'Practice using style sheets in a card view. Experiment by changi' +
      'ng the Options View and pressing the Edit User-Defined Style She' +
      'et button below. Click '#39'About this demo'#39' for more information.'
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
  object sbMain: TStatusBar
    Left = 0
    Top = 557
    Width = 816
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object cxGrid: TcxGrid
    Left = 177
    Top = 33
    Width = 639
    Height = 524
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = cxGridActiveTabChanged
    OnLayoutChanged = cxGridLayoutChanged
    object cvDevExpress: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = StylesCardViewDemoMainDM.dsPersons
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CardWidth = 300
      OptionsView.CellAutoHeight = True
      Styles.StyleSheet = StylesCardViewDemoMainDM.cvssDevExpress
      object cvDevExpressFullname: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FullName'
        Kind = rkCaption
      end
      object cvDevExpressID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
      end
      object cvDevExpressFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvDevExpressSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
      end
      object cvDevExpressGENDER: TcxGridDBCardViewRow
        DataBinding.FieldName = 'GENDER'
        RepositoryItem = StylesCardViewDemoMainDM.edrepGender
      end
      object cvDevExpressBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvDevExpressDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
      end
      object cvDevExpressBIRTHCOUNTRY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        RepositoryItem = StylesCardViewDemoMainDM.edrepCountry
      end
      object cvDevExpressLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
      end
      object cvDevExpressNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
      end
      object cvDevExpressBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        Options.Filtering = False
      end
    end
    object cvSlate: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = StylesCardViewDemoMainDM.dsPersons
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CardWidth = 300
      OptionsView.CellAutoHeight = True
      Styles.StyleSheet = StylesCardViewDemoMainDM.cvssSlate
      object cvSlateFullName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FullName'
        Kind = rkCaption
      end
      object cvSlateID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
      end
      object cvSlateFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvSlateSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
      end
      object cvSlateGENDER: TcxGridDBCardViewRow
        DataBinding.FieldName = 'GENDER'
        RepositoryItem = StylesCardViewDemoMainDM.edrepGender
      end
      object cvSlateBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvSlateDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
      end
      object cvSlateBIRTHCOUNTRY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        RepositoryItem = StylesCardViewDemoMainDM.edrepCountry
      end
      object cvSlateLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
      end
      object cvSlateBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        Options.Filtering = False
      end
      object cvSlateNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
      end
    end
    object cvHighContrast: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = StylesCardViewDemoMainDM.dsPersons
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CardWidth = 300
      OptionsView.CellAutoHeight = True
      Styles.StyleSheet = StylesCardViewDemoMainDM.cvssHighContrast
      object cvHighContrastFullName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FullName'
        Kind = rkCaption
      end
      object cvHighContrastID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
      end
      object cvHighContrastFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvHighContrastSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
      end
      object cvHighContrastGENDER: TcxGridDBCardViewRow
        DataBinding.FieldName = 'GENDER'
        RepositoryItem = StylesCardViewDemoMainDM.edrepGender
      end
      object cvHighContrastBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvHighContrastDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
      end
      object cvHighContrastBIRTHCOUNTRY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        RepositoryItem = StylesCardViewDemoMainDM.edrepCountry
      end
      object cvHighContrastLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
      end
      object cvHighContrastBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        Options.Filtering = False
      end
      object cvHighContrastNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
      end
    end
    object cvUserDefined: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = StylesCardViewDemoMainDM.dsPersons
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CardWidth = 300
      OptionsView.CellAutoHeight = True
      Styles.StyleSheet = StylesCardViewDemoMainDM.cvssUserDefined
      object cvUserDefinedFullName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FullName'
        Kind = rkCaption
      end
      object cvUserDefinedID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
      end
      object cvUserDefinedFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvUserDefinedSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
      end
      object cvUserDefinedGENDER: TcxGridDBCardViewRow
        DataBinding.FieldName = 'GENDER'
        RepositoryItem = StylesCardViewDemoMainDM.edrepGender
      end
      object cvUserDefinedBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvUserDefinedDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
      end
      object cvUserDefinedBIRTHCOUNTRY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        RepositoryItem = StylesCardViewDemoMainDM.edrepCountry
      end
      object cvUserDefinedLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
      end
      object cvUserDefinedBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        Options.Filtering = False
      end
      object cvUserDefinedNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
      end
    end
    object lvDevExpress: TcxGridLevel
      Caption = 'DevExpress'
      GridView = cvDevExpress
    end
    object lvSlate: TcxGridLevel
      Caption = 'Slate'
      GridView = cvSlate
    end
    object lvHighContrast: TcxGridLevel
      Caption = 'High Contrast'
      GridView = cvHighContrast
    end
    object lvUserDefined: TcxGridLevel
      Caption = 'User Defined'
      GridView = cvUserDefined
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 33
    Width = 177
    Height = 524
    Align = alLeft
    BevelOuter = bvNone
    Color = 15451300
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 177
      Height = 105
      Align = alTop
      Caption = 'Options View'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 27
        Width = 53
        Height = 13
        Caption = 'Card Width'
      end
      object Label2: TLabel
        Left = 8
        Top = 51
        Width = 87
        Height = 13
        Caption = 'Card Border Width'
      end
      object spedCardWidth: TcxSpinEdit
        Left = 112
        Top = 23
        Properties.MaxValue = 1000.000000000000000000
        Properties.OnChange = spedCardWidthPropertiesChange
        Style.Color = 16247513
        TabOrder = 0
        Value = 300
        OnKeyPress = spedCardWidthKeyPress
        Width = 48
      end
      object spedCardBorderWidth: TcxSpinEdit
        Left = 112
        Top = 47
        Properties.MaxValue = 100.000000000000000000
        Properties.OnChange = cxSpinEdit2PropertiesChange
        Style.Color = 16247513
        Style.Shadow = False
        TabOrder = 1
        Value = 2
        OnKeyPress = spedCardWidthKeyPress
        Width = 48
      end
      object cbCellAutoHeight: TcxCheckBox
        Left = 10
        Top = 74
        AutoSize = False
        Caption = 'Cell Auto Height'
        ParentColor = False
        Properties.OnChange = cbSellAutoHeightPropertiesChange
        State = cbsChecked
        Style.Color = 15451300
        TabOrder = 2
        Height = 21
        Width = 143
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 480
      Width = 177
      Height = 44
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object btnEdit: TcxButton
        Left = 8
        Top = 8
        Width = 161
        Height = 25
        Caption = 'Edit User Defined StyleSheet...'
        Enabled = False
        TabOrder = 0
        OnClick = btnEditClick
      end
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 8
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
      Caption = 'Options'
      object miLookFeel: TMenuItem
        Caption = '&Look&&Feel'
        object KInd1: TMenuItem
          Caption = 'Kind'
          object Flat1: TMenuItem
            Caption = '&Flat'
            Hint = 
              'Setting this option changes the grid view appearance to Flat sty' +
              'le'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object Standard1: TMenuItem
            Caption = '&Standard'
            Hint = 
              'Setting this option changes the grid view appearance to Standard' +
              ' style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object UltraFlat1: TMenuItem
            Caption = '&Ultra Flat'
            Checked = True
            Hint = 
              'Setting this option changes the grid view appearance to Ultra Fl' +
              'at style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miOffice11: TMenuItem
            Tag = 3
            Caption = '&Office11'
            Hint = 
              'Setting this option changes the grid view appearance to Office11' +
              ' style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
        end
        object NativeStyle1: TMenuItem
          Caption = '&Native Style'
          Checked = True
          Hint = 
            'Setting this option changes the appearance of grid items to the ' +
            'native style'
          OnClick = miNativeStyleClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 472
    Top = 8
  end
end
