object ViewCardDemoMainForm: TViewCardDemoMainForm
  Left = 107
  Top = 75
  Width = 797
  Height = 523
  Caption = 'ExpressQuantumGrid ViewCard Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 789
    Height = 33
    Align = alTop
    AutoSize = False
    Caption = 
      'Use the new Card View'#39's functionality. Experiment by changing th' +
      'e Options. Click '#39'About this demo'#39' for more information.'
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
    Top = 453
    Width = 789
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 33
    Width = 789
    Height = 420
    Align = alClient
    TabOrder = 1
    object cvPersons: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.Visible = fvAlways
      DataController.DataSource = ViewCardDemoDataDM.dsPersons
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.CardExpanding = True
      OptionsCustomize.RowMoving = True
      OptionsView.CardWidth = 370
      OptionsView.CellAutoHeight = True
      object cvPersonsFullname: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FullName'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cvPersonsID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPersonsFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
        Position.BeginsLayer = True
      end
      object cvPersonsSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
        Position.BeginsLayer = True
      end
      object cvPersonsGENDER: TcxGridDBCardViewRow
        DataBinding.FieldName = 'GENDER'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ViewCardDemoDataDM.ilPics
        Properties.Items = <
          item
            Description = 'Female'
            ImageIndex = 0
            Value = False
          end
          item
            Description = 'Male'
            ImageIndex = 1
            Value = True
          end>
        Position.BeginsLayer = True
      end
      object cvPersonsBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
        Position.BeginsLayer = True
      end
      object cvPersonsDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
        Position.BeginsLayer = True
      end
      object cvPersonsBIRTHCOUNTRY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'ACRONYM'
          end
          item
            FieldName = 'NAME'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = ViewCardDemoDataDM.dsCountries
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPersonsNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
        Position.BeginsLayer = True
      end
      object cvPersonsHOMEPAGE: TcxGridDBCardViewRow
        DataBinding.FieldName = 'HOMEPAGE'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        Position.BeginsLayer = True
      end
      object cvPersonsBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.ScrollBars = ssVertical
        Options.Filtering = False
        Position.BeginsLayer = True
      end
    end
    object lvPersons: TcxGridLevel
      Caption = 'DevExpress'
      GridView = cvPersons
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 24
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
      object miShowEmptyRows: TMenuItem
        Caption = 'Show &empty rows'
        Checked = True
        Hint = 'Show/hide empty rows '
        OnClick = miShowEmptyRowsClick
      end
      object miFiltering: TMenuItem
        Caption = '&Filtering'
        Checked = True
        Hint = 'Enables data to be filtered visually'
        OnClick = miFilteringClick
      end
      object miExpandingCollapsing: TMenuItem
        Caption = 'Card E&xpanding/Collapsing'
        Checked = True
        Hint = 'Enables cards to be expanded/collapsed'
        OnClick = miExpandingCollapsingClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miRowsCustomization: TMenuItem
        Caption = 'Rows C&ustomization...'
        Hint = 'Shows the customization form for rows'
        OnClick = miRowsCustomizationClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfOffice11
    Left = 472
    Top = 24
  end
end
