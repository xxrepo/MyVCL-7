inherited BandedFixedDemoMainForm: TBandedFixedDemoMainForm
  Left = 195
  Top = 130
  Width = 689
  Height = 527
  Caption = 'ExpressQuantumTreeList4 BandedFixedDemo'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 681
    Height = 33
    AutoSize = False
    Caption = 
      'Fix columns on the left and right using bands. Experiment using ' +
      'the Options available and see Help/About for other things to try' +
      '.'
  end
  inherited sbMain: TStatusBar
    Top = 454
    Width = 681
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      'In this demo you can:'
      ''
      
        '- click on columns to sort (hold down the shift key for sorting ' +
        'multiple columns)'
      ''
      '- scroll middle band horizontally without hiding the fixed bands'
      ''
      '- move columns into/out of the fixed bands'
      ''
      '- right-click a band and try the popup menu '
      ''
      '- check how little source code is required'
      ''
      
        '- NOTE: if you haven'#39't done so already, you might like to practi' +
        'ce by completing the tutorial version of this demo (see the tuto' +
        'rials folder)')
    TabOrder = 2
  end
  object cxDBTreeList: TcxDBTreeList [3]
    Left = 0
    Top = 33
    Width = 681
    Height = 421
    Styles.OnGetContentStyle = cxDBTreeListStylesGetContentStyle
    Styles.StyleSheet = BandedFixedDemoDataDM.TreeListStyleSheetDevExpress
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Employee'
        FixedKind = tlbfLeft
        Width = 261
      end
      item
        Caption.Text = 'Days'
        Width = 676
      end
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Row Total'
        FixedKind = tlbfRight
        Width = 102
      end>
    BufferedPaint = False
    DataController.DataSource = BandedFixedDemoDataDM.dsSheduler
    DataController.ParentField = 'ProjectManagerID'
    DataController.KeyField = 'USERID'
    OptionsBehavior.AutomateLeftMostIndent = False
    OptionsData.Deleting = False
    OptionsView.Bands = True
    OptionsView.Footer = True
    OptionsView.GridLineColor = 14916958
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.PaintStyle = tlpsCategorized
    OptionsView.UseNodeColorForIndent = False
    PopupMenu = mnuNodeOptions
    Preview.Place = tlppTop
    Preview.Visible = True
    RootValue = -1
    TabOrder = 1
    object cxDBTreeListID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'ID'
      DataBinding.FieldName = 'ID'
      Options.Editing = False
      Position.ColIndex = 12
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeListPROJECTID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'PROJECTID'
      DataBinding.FieldName = 'PROJECTID'
      Options.Editing = False
      Position.ColIndex = 13
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeListProjectManagerID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'ProjectManagerID'
      DataBinding.FieldName = 'ProjectManagerID'
      Options.Editing = False
      Position.ColIndex = 14
      Position.RowIndex = 0
      Position.BandIndex = -1
    end
    object cxDBTreeListEmployee: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = BandedFixedDemoDataDM.dsPersons
      Caption.Text = 'EMPLOYEE'
      DataBinding.FieldName = 'USERID'
      Options.Editing = False
      Width = 156
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      OnGetDisplayText = cxDBTreeListEmployeeGetDisplayText
      OnGetEditProperties = cxDBTreeListEmployeeGetEditProperties
    end
    object cxDBTreeListEmployeePhone: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Phone'
        end>
      Properties.ListSource = BandedFixedDemoDataDM.dsPersons
      Caption.Text = 'PHONE'
      DataBinding.FieldName = 'USERID'
      Width = 105
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListEmployeeEmail: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'EMAIL'
        end>
      Properties.ListSource = BandedFixedDemoDataDM.dsPersons
      Visible = False
      Caption.Text = 'EMAIL'
      DataBinding.FieldName = 'USERID'
      Width = 267
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListSUNDAY: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositoryCalcItem
      Caption.Text = 'SUNDAY'
      DataBinding.FieldName = 'SUNDAY'
      Options.Footer = True
      Width = 88
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListMONDAY: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositoryCalcItem
      Caption.Text = 'MONDAY'
      DataBinding.FieldName = 'MONDAY'
      Options.Footer = True
      Width = 88
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListTUESDAY: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositoryCalcItem
      Caption.Text = 'TUESDAY'
      DataBinding.FieldName = 'TUESDAY'
      Options.Footer = True
      Width = 88
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListWEDNESDAY: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositoryCalcItem
      Caption.Text = 'WEDNESDAY'
      DataBinding.FieldName = 'WEDNESDAY'
      Options.Footer = True
      Width = 85
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListTHURSDAY: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositoryCalcItem
      Caption.Text = 'THURSDAY'
      DataBinding.FieldName = 'THURSDAY'
      Options.Footer = True
      Width = 119
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListFRIDAY: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositoryCalcItem
      Caption.Text = 'FRIDAY'
      DataBinding.FieldName = 'FRIDAY'
      Options.Footer = True
      Width = 95
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListSATURDAY: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositoryCalcItem
      Caption.Text = 'SATURDAY'
      DataBinding.FieldName = 'SATURDAY'
      Options.Footer = True
      Width = 113
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListWeekSum: TcxDBTreeListColumn
      Caption.Text = 'SUM'
      DataBinding.FieldName = 'WeekSum'
      Options.Footer = True
      Options.Editing = False
      Width = 52
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 2
      SummaryFooter.Kind = skSum
    end
    object cxDBTreeListWeekAVG: TcxDBTreeListColumn
      Caption.Text = 'AVG'
      DataBinding.FieldName = 'WeekAVG'
      Options.Footer = True
      Options.Editing = False
      Width = 50
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 2
      SummaryFooter.Kind = skSum
    end
  end
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object miBandHorzSizing: TMenuItem [0]
        Caption = 'Band Horz &Sizing'
        Checked = True
        Hint = 'Enables horizontal band sizing'
        OnClick = miBandHorzSizingClick
      end
      object miBandVertSizing: TMenuItem [1]
        Caption = 'Band &Vert Sizing'
        Checked = True
        Hint = 'Enables vertical band sizing'
        OnClick = miBandVertSizingClick
      end
      object miBandMoving: TMenuItem [2]
        Caption = 'Band &Moving'
        Checked = True
        Hint = 'Enables band moving'
        OnClick = miBandMovingClick
      end
      object N2: TMenuItem [3]
        Caption = '-'
      end
      object miShowBands: TMenuItem [4]
        Caption = 'Show &Bands'
        Checked = True
        Hint = 'Shows bands within a tree list control'
        OnClick = miShowBandsClick
      end
      object miShowHeaders: TMenuItem [5]
        Caption = 'Show &Headers'
        Checked = True
        Hint = 'Shows column headers within a tree list control'
        OnClick = miShowHeadersClick
      end
      object miColumnCustomization: TMenuItem [6]
        Action = actCustomizationForm
      end
      object miSeparator1: TMenuItem [7]
        Caption = '-'
      end
      object miGridLookFeel: TMenuItem [8]
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            GroupIndex = 1
            Hint = 'Setting this option changes the demo appearance to Flat style'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miStandard: TMenuItem
            Tag = 1
            Caption = '&Standard'
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Standard styl' +
              'e'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miUltraFlat: TMenuItem
            Tag = 2
            Caption = '&Ultra Flat'
            Checked = True
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Ultra Flat st' +
              'yle'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object Office111: TMenuItem
            Tag = 3
            Caption = 'Office 11'
            GroupIndex = 1
            RadioItem = True
            OnClick = LookAndFeelChange
          end
        end
        object miNativeStyle: TMenuItem
          Tag = 4
          Caption = '&Native Style'
          Hint = 'Setting this option changes the demo appearance to Native style'
          OnClick = LookAndFeelChange
        end
      end
      object miSeparator2: TMenuItem [9]
        Caption = '-'
      end
    end
  end
  inherited alMain: TActionList
    object actCustomizationForm: TAction
      Category = 'Options'
      Caption = '&Customization Form ...'
      Hint = 'Shows the column customization form'
      OnExecute = actCustomizationFormExecute
    end
  end
  object mnuNodeOptions: TPopupMenu
    OnPopup = mnuNodeOptionsPopup
    Left = 88
    Top = 8
    object miFixBand: TMenuItem
      Caption = '&Fix Band'
      object miFixBandNone: TMenuItem
        Caption = '&None'
        Hint = 'Makes the band unfixed'
        RadioItem = True
        OnClick = miFixBandClick
      end
      object miFixBandLeft: TMenuItem
        Tag = 1
        Caption = '&Left'
        Hint = 'Fixes the band to the left of the TreeList '
        RadioItem = True
        OnClick = miFixBandClick
      end
      object miFixBandRight: TMenuItem
        Tag = 2
        Caption = '&Right'
        Hint = 'Fixes the band to the right of the TreeList '
        RadioItem = True
        OnClick = miFixBandClick
      end
    end
    object miBandHide: TMenuItem
      Caption = '&Hide Band'
      Hint = 'Hides a selected band'
      OnClick = miBandHideClick
    end
    object CustomisationForm1: TMenuItem
      Action = actCustomizationForm
    end
  end
  object cxEditRepository1: TcxEditRepository
    Left = 432
    Top = 48
    object eriTelephoneMaskEdit: TcxEditRepositoryMaskItem
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '(\((\d\d\d)?\))? \d(\d\d?)? - \d\d(\d\d)?( - \d\d)?'
    end
    object cxEditRepository1TextItem1: TcxEditRepositoryTextItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
    end
    object cxEditRepositoryCalcItem: TcxEditRepositoryCalcItem
    end
  end
end
