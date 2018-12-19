object EditorsInPlaceDemoMainForm: TEditorsInPlaceDemoMainForm
  Left = 55
  Top = 101
  Width = 967
  Height = 627
  Caption = 'ExpressQuantumGrid EditorsInPlaceDemo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 959
    Height = 25
    Align = alTop
    AutoSize = False
    Caption = 
      'This demo shows various column editors. Click '#39'About this demo'#39' ' +
      'for more information.'
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
    Top = 554
    Width = 959
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 25
    Width = 959
    Height = 529
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailFrameColor = 15451300
    RootLevelOptions.DetailTabsPosition = dtpTop
    RootLevelStyles.Tab = EditorsInPlaceDemoDataDM.cxStyle1
    RootLevelStyles.TabsBackground = EditorsInPlaceDemoDataDM.cxStyle4
    OnFocusedViewChanged = GridFocusedViewChanged
    object cvCustomers: TcxGridDBCardView
      DataController.DataSource = EditorsInPlaceDemoDataDM.dsCustomers
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CellAutoHeight = True
      OptionsView.SeparatorColor = 12937777
      Styles.StyleSheet = EditorsInPlaceDemoDataDM.GridCardViewStyleSheetDevExpress
      object cvCustomersCompany: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Company'
      end
      object cvCustomersState: TcxGridDBCardViewRow
        DataBinding.FieldName = 'State'
        PropertiesClassName = 'TcxMRUEditProperties'
        Properties.LookupItems.Strings = (
          'VA'
          'NY'
          'IL'
          'GA'
          'CA'
          'OK'
          'OH'
          'CT'
          'MI')
        Properties.OnButtonClick = cvCustomersStatePropertiesButtonClick
      end
      object cvCustomersCity: TcxGridDBCardViewRow
        DataBinding.FieldName = 'City'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
          end
          item
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cvCustomersCityPropertiesButtonClick
      end
      object cvCustomersPrefix: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Prefix'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Ms.'
          'Mr.'
          'Mrs.')
      end
      object cvCustomersFirstName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FirstName'
      end
      object cvCustomersLastName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LastName'
      end
      object cvCustomersCustomer: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Customer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
      end
      object cvCustomersZipCode: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ZipCode'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d\d\d\d\d - \d\d\d\d'
      end
      object cvCustomersAddress: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Address'
      end
      object cvCustomersFaxPhone: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FaxPhone'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\(\d\d\d\))? \d(\d\d?)? - \d\d - \d\d'
      end
      object cvCustomersDescription: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.WantReturns = False
      end
    end
    object cvOrders: TcxGridDBCardView
      DataController.DataSource = EditorsInPlaceDemoDataDM.dsOrders
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CellAutoHeight = True
      OptionsView.SeparatorColor = 12937777
      Styles.StyleSheet = EditorsInPlaceDemoDataDM.GridCardViewStyleSheetDevExpress
      object cvOrdersCustomerID: TcxGridDBCardViewRow
        Caption = 'Customer'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Company'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = EditorsInPlaceDemoDataDM.dsCustomers
      end
      object cvOrdersProductID: TcxGridDBCardViewRow
        Caption = 'Car'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Car'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = EditorsInPlaceDemoDataDM.dsCars
      end
      object cvOrdersPurchaseDate: TcxGridDBCardViewRow
        DataBinding.FieldName = 'PurchaseDate'
      end
      object cvOrdersTime: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.AssignedValues.MinValue = True
      end
      object cvOrdersPaymentType: TcxGridDBCardViewRow
        DataBinding.FieldName = 'PaymentType'
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
      end
      object cvOrdersQuantity: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Quantity'
        PropertiesClassName = 'TcxSpinEditProperties'
      end
      object cvOrdersPaymentAmount: TcxGridDBCardViewRow
        DataBinding.FieldName = 'PaymentAmount'
        PropertiesClassName = 'TcxCalcEditProperties'
      end
      object cvOrdersDescription: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxMemoProperties'
      end
    end
    object cvCars: TcxGridDBCardView
      DataController.DataSource = EditorsInPlaceDemoDataDM.dsCars
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cvCarsCustomDrawCell
      OptionsView.CardWidth = 500
      OptionsView.CellAutoHeight = True
      OptionsView.SeparatorColor = 12937777
      Styles.StyleSheet = EditorsInPlaceDemoDataDM.GridCardViewStyleSheetDevExpress
      object cvCarsCategory: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Category'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'SPORTS'
          'SALOON'
          'TRUCK')
      end
      object cvCarsCar: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Car'
      end
      object cvCarsPicture: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Picture'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.Stretch = True
        Options.ShowCaption = False
      end
      object cvCarsInfo: TcxGridDBCardViewRow
        Caption = 'Info'
        PropertiesClassName = 'TcxPopupEditProperties'
        Properties.PopupControl = EditorsInPlaceDemoCarsForm.pnlCarInfo
        Properties.PopupSizeable = False
      end
      object cvCarsHyperlink: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Hyperlink'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
      end
    end
    object lvCustomers: TcxGridLevel
      Caption = 'Customers'
      GridView = cvCustomers
    end
    object lvOrders: TcxGridLevel
      Caption = 'Orders'
      GridView = cvOrders
    end
    object lvCars: TcxGridLevel
      Caption = 'Cars'
      GridView = cvCars
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
      object miShowEditButtons: TMenuItem
        Caption = 'Show Edit Buttons'
        object miEditButtonsNever: TMenuItem
          Caption = 'Focused &Field Only'
          Checked = True
          Hint = 
            'The editor buttons are displayed only for the focused column in ' +
            'a table view.'
          RadioItem = True
          OnClick = miEditButtonsClick
        end
        object miEditButtonsForFocusedRecord: TMenuItem
          Tag = 1
          Caption = 'Focused &Card Only'
          Hint = 'The editor buttons are visible for the focused record.'
          RadioItem = True
          OnClick = miEditButtonsClick
        end
        object miEditButtonsAlways: TMenuItem
          Tag = 2
          Caption = '&Always'
          Hint = 'The editor buttons are always visible within the current view'
          RadioItem = True
          OnClick = miEditButtonsClick
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miLookFeel: TMenuItem
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            Hint = 
              'Setting this option changes the grid view appearance to Flat sty' +
              'le'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miStandard: TMenuItem
            Caption = '&Standard'
            Hint = 
              'Setting this option changes the grid view appearance to Standard' +
              ' style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miUltraFlat: TMenuItem
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
        object miNativeStyle: TMenuItem
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
    Top = 24
  end
end
