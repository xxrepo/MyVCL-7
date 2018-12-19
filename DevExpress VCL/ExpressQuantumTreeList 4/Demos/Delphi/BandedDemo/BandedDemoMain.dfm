inherited BandedDemoMainForm: TBandedDemoMainForm
  Left = 88
  Top = 38
  Width = 891
  Height = 621
  Caption = 'ExpressQuantumTreeList4 BandedDemo'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 883
    Height = 25
    AutoSize = False
    Caption = 
      'Create and remove bands at runtime. Experiment using the Options' +
      ' available and see Help/About for other things to try.'
  end
  inherited sbMain: TStatusBar
    Top = 548
    Width = 883
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      'In this demo you can:'
      ''
      '- drag/drop columns between bands '
      ''
      '- move and size bands (thus moving several columns at once)'
      ''
      
        '- create/delete bands at runtime (see the Options menu or right-' +
        'click any band header )'
      ''
      
        '- temporarily hide bands and/or columns by dragging to the Custo' +
        'mization dialog  (see Options/Customization Form...).'
      ''
      
        '- see how removing a band puts its columns into the Columns page' +
        ' of the dialog, ready for re-use in a different band.'
      ''
      
        '- NOTE: if you haven'#39't done so already, you might like to practi' +
        'ce by completing the tutorial version of this demo (see the tuto' +
        'rials folder)')
    TabOrder = 2
  end
  object cxDBTreeList: TcxDBTreeList [3]
    Left = 0
    Top = 25
    Width = 883
    Height = 523
    Styles.StyleSheet = BandedDemoDataDM.TreeListStyleSheetDevExpress
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Common department info'
        Width = 331
      end
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Detailed department info'
        Width = 310
      end
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Manager info'
        Width = 445
      end>
    BufferedPaint = False
    DataController.DataSource = BandedDemoDataDM.dsDepartments
    DataController.ParentField = 'PARENTID'
    DataController.KeyField = 'ID'
    DragMode = dmAutomatic
    OptionsBehavior.AutomateLeftMostIndent = False
    OptionsData.Inserting = True
    OptionsView.Bands = True
    OptionsView.GridLineColor = 14916958
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.UseNodeColorForIndent = False
    PopupMenu = mnuNodeOptions
    Preview.Place = tlppTop
    Preview.Visible = True
    RootValue = -1
    TabOrder = 1
    OnDragOver = cxDBTreeListDragOver
    OnInitInsertingRecord = cxDBTreeListInitInsertingRecord
    object cxDBTreeListID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'ID'
      DataBinding.FieldName = 'ID'
      Width = 63
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListPARENTID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'PARENTID'
      DataBinding.FieldName = 'PARENTID'
      Width = 62
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListNAME: TcxDBTreeListColumn
      Caption.Text = 'NAME'
      DataBinding.FieldName = 'NAME'
      Width = 274
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListPHONE: TcxDBTreeListColumn
      RepositoryItem = eriTelephoneMaskEdit
      Caption.Text = 'PHONE'
      DataBinding.FieldName = 'PHONE'
      Width = 160
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListFAX: TcxDBTreeListColumn
      RepositoryItem = eriTelephoneMaskEdit
      Caption.Text = 'FAX'
      DataBinding.FieldName = 'FAX'
      Width = 90
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListBUDGET: TcxDBTreeListColumn
      Caption.Text = 'BUDGET'
      DataBinding.FieldName = 'BUDGET'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListVACANCY: TcxDBTreeListColumn
      Caption.Text = 'VACANCY'
      DataBinding.FieldName = 'VACANCY'
      Width = 120
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListManager: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = BandedDemoDataDM.dsPersons
      Caption.Text = 'Manager'
      DataBinding.FieldName = 'MANAGERID'
      Width = 117
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object cxDBTreeListManagerPhone: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Phone'
        end>
      Properties.ListSource = BandedDemoDataDM.dsPersons
      Properties.ReadOnly = False
      Caption.Text = 'Manager Phone'
      DataBinding.FieldName = 'MANAGERID'
      Width = 121
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object cxDBTreeListManagerEmail: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'EMAIL'
        end>
      Properties.ListSource = BandedDemoDataDM.dsPersons
      Properties.ReadOnly = False
      Caption.Text = 'Manager Email'
      DataBinding.FieldName = 'MANAGERID'
      Width = 207
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 2
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
      object miAddBand: TMenuItem [4]
        Caption = '&Create Band ...'
        Hint = 'Click to create a new band'
        OnClick = miAddBandClick
      end
      object miRemoveBands: TMenuItem [5]
        Caption = '&Delete Band ...'
        Hint = 'Click to remove an existing band'
        OnClick = miRemoveBandsClick
      end
      object N1: TMenuItem [6]
        Caption = '-'
      end
      object miColumnCustomization: TMenuItem [7]
        Action = actCustomizationForm
      end
      object miSeparator1: TMenuItem [8]
        Caption = '-'
      end
      object miGridLookFeel: TMenuItem [9]
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
      object miSeparator2: TMenuItem [10]
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
    object miBandDelete: TMenuItem
      Caption = '&Delete Band'
      Hint = 'Deletes selected Band'
      OnClick = miBandDeleteClick
    end
    object miBandHide: TMenuItem
      Caption = '&Hide Band'
      Hint = 'Hides selected Band'
      OnClick = miBandHideClick
    end
    object miCustomisationForm: TMenuItem
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
  end
end
