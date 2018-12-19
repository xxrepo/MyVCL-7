inherited EditorsInPlaceDemoMainForm: TEditorsInPlaceDemoMainForm
  Left = 99
  Top = 55
  Width = 875
  Height = 588
  Caption = 'ExpressQuantumTreeList4 EditorsInPlaceDemo'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 867
    Height = 25
    AutoSize = False
    Caption = 
      'This demo shows various column editors. See Help/About for more ' +
      'information'
  end
  inherited sbMain: TStatusBar
    Top = 515
    Width = 867
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      'In this demo you can:'
      ''
      
        '- keep this window open while you experiment with the various ed' +
        'itors'
      ''
      
        '- focus on the Company entry and type the first character of its' +
        ' name to see a filtered dropdown list.'
      ''
      
        '- focus on the Company Email entry and press the ellipsis button' +
        ' to send an email'
      ''
      
        '- focus on the Car entry and type the first character of its nam' +
        'e to see a filtered dropdown list.'
      ''
      '- display a calendar dropdown by editing a PurchaseDate'
      ''
      '- edit a Time via the time spin edit'
      ''
      '- display a calculator by editing a PaymentAmount'
      ''
      '- change the PaymentType via a dropdown image list'
      ''
      '- edit the Quantity via a spin edit'
      ''
      
        '- focus on the CarInfo column and click on its button to display' +
        ' details and:'
      ' (1) edit the Trademark via the MRU editor'
      ' (2) edit the Category via the Radiogroup editor'
      
        ' (3) display a resizable image by focusing & clicking on the ico' +
        'n below the fixed image'
      
        ' (4) visit the manufacturer'#39's website by double clicking on the ' +
        'URL'
      ''
      
        '- NOTE: if you haven'#39't done so already, you might like to practi' +
        'ce by completing the tutorial version of this demo (see the tuto' +
        'rials folder)')
  end
  object tlOrders: TcxDBTreeList [3]
    Left = 0
    Top = 25
    Width = 867
    Height = 490
    Styles.StyleSheet = EditorsInPlaceDemoDataDM.TreeListStyleSheetDevExpress
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Company'
        Width = 300
      end
      item
        Caption.Text = 'Car'
        Width = 289
      end
      item
        Caption.Text = 'Purchase Info'
        Width = 456
      end>
    BufferedPaint = False
    DataController.DataSource = EditorsInPlaceDemoDataDM.dsOrders
    DataController.ParentField = 'ID'
    DataController.KeyField = 'ID'
    OptionsBehavior.AutomateLeftMostIndent = False
    OptionsData.Inserting = True
    OptionsData.SmartRefresh = True
    OptionsView.Bands = True
    OptionsView.GridLineColor = clGray
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.ShowRoot = False
    RootValue = 255
    TabOrder = 2
    object tlOrdersCustomerID: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Company'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListSource = EditorsInPlaceDemoDataDM.dsCustomers
      Caption.Text = 'Company'
      DataBinding.FieldName = 'CustomerID'
      Width = 126
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object tlOrdersCompanyEmail: TcxDBTreeListColumn
      PropertiesClassName = 'TcxButtonEditProperties'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = tlOrdersCompanyEmailPropertiesButtonClick
      Caption.Text = 'Company Email'
      DataBinding.FieldName = 'CustomerEmail'
      Width = 174
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object tlOrdersProductID: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Car'
        end>
      Properties.ListSource = EditorsInPlaceDemoDataDM.dsCars
      Caption.Text = 'Car'
      DataBinding.FieldName = 'ProductID'
      Width = 227
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object tlOrdersCarInfo: TcxDBTreeListColumn
      PropertiesClassName = 'TcxPopupEditProperties'
      Properties.PopupControl = EditorsInPlaceDemoCarInfoForm.pnlCarInfo
      Properties.PopupSysPanelStyle = True
      Properties.OnCloseUp = tlOrdersCarInfoPropertiesCloseUp
      Properties.OnInitPopup = tlOrdersCarInfoPropertiesInitPopup
      Caption.Text = 'CarInfo'
      Width = 62
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
      OnGetDisplayText = tlOrdersCarInfoGetDisplayText
    end
    object tlOrdersPurchaseDate: TcxDBTreeListColumn
      Caption.Text = 'PurchaseDate'
      DataBinding.FieldName = 'PurchaseDate'
      Width = 93
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object tlOrdersTime: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTimeEditProperties'
      Properties.AssignedValues.MinValue = True
      Caption.Text = 'Time'
      DataBinding.FieldName = 'Time'
      Width = 82
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object tlOrdersPaymentType: TcxDBTreeListColumn
      PropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.Images = EditorsInPlaceDemoDataDM.PaymentTypeImages
      Properties.Items = <
        item
          Description = 'American Express'
          ImageIndex = 3
          Value = 'AmEx'
        end
        item
          Description = 'Master Card'
          ImageIndex = 2
          Value = 'Master'
        end
        item
          Description = 'Visa Card'
          ImageIndex = 1
          Value = 'Visa'
        end
        item
          Description = 'Cash'
          ImageIndex = 0
          Value = 'Cash'
        end>
      Caption.Text = 'PaymentType'
      DataBinding.FieldName = 'PaymentType'
      Width = 119
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object tlOrdersPaymentAmount: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCalcEditProperties'
      Caption.Text = 'PaymentAmount'
      DataBinding.FieldName = 'PaymentAmount'
      Width = 102
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object tlOrdersQuantity: TcxDBTreeListColumn
      PropertiesClassName = 'TcxSpinEditProperties'
      Caption.Text = 'Quantity'
      DataBinding.FieldName = 'Quantity'
      Width = 60
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
  end
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object miShowEditButtons: TMenuItem [0]
        Caption = 'Show &Edit Buttons'
        object miEditBtnsAlways: TMenuItem
          Caption = '&Always'
          Hint = 
            'If checked, the editor buttons are always visible within the Tre' +
            'eList '
          RadioItem = True
          OnClick = miShowEditBtnsClick
        end
        object miEditBtnsFocused: TMenuItem
          Tag = 1
          Caption = '&Focused node only'
          Hint = 'If checked, the editor buttons are visible for the focused node'
          RadioItem = True
          OnClick = miShowEditBtnsClick
        end
        object miEditBtnsNever: TMenuItem
          Tag = 2
          Caption = '&Never'
          Checked = True
          Hint = 
            'If checked, the editor buttons are displayed only for the focuse' +
            'd cell'
          RadioItem = True
          OnClick = miShowEditBtnsClick
        end
      end
      object N1: TMenuItem [1]
        Caption = '-'
      end
      object miGridLookFeel: TMenuItem [2]
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
      object miSeparator2: TMenuItem [3]
        Caption = '-'
      end
    end
  end
end
