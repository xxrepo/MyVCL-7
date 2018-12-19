object ViewCardDemoMainForm: TViewCardDemoMainForm
  Left = 107
  Top = 75
  Width = 797
  Height = 523
  Caption = 'ExpressQuantumGrid ViewCard Demo'
  Color = clBtnFace
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
    Top = 450
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
    Height = 417
    Align = alClient
    TabOrder = 1
    object cvPersons: TcxGridDBCardView
      DataController.DataSource = ViewCardDemoDataDM.dsPersons
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Filtering.Visible = fvAlways
      OptionsCustomize.CardExpanding = True
      OptionsCustomize.RowMoving = True
      OptionsView.CardWidth = 370
      OptionsView.CellAutoHeight = True
      object cvPersonsFullname: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FullName'
        Kind = rkCaption
      end
      object cvPersonsID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cvPersonsFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvPersonsSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
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
      end
      object cvPersonsBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvPersonsDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
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
      end
      object cvPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
        Visible = False
      end
      object cvPersonsNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
      end
      object cvPersonsHOMEPAGE: TcxGridDBCardViewRow
        DataBinding.FieldName = 'HOMEPAGE'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
      end
      object cvPersonsBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.ScrollBars = ssVertical
        Options.Filtering = False
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
    NativeStyle = True
    Left = 472
    Top = 24
  end
end
