object ColumnsSimpleDemoMainForm: TColumnsSimpleDemoMainForm
  Left = 300
  Top = 120
  Width = 800
  Height = 600
  Caption = 'ExpressQuantumGrid ColumnSimpleDemo'
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
    Width = 792
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = 
      '  This demo shows various column editors. Click '#39'About this demo' +
      #39' for more information.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 29
    Width = 792
    Height = 517
    Align = alClient
    TabOrder = 0
    OnFocusedViewChanged = GridFocusedViewChanged
    object tvCustomers: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ColumnsSimpleDemoDataDM.dsCustomers
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      object tvCustomersCompany: TcxGridDBColumn
        AlternateCaption = 'Company'
        Caption = 'Company (TextEdit)'
        DataBinding.FieldName = 'Company'
        OnGetCellHint = tvCustomersCompanyGetCellHint
      end
      object tvCustomersState: TcxGridDBColumn
        AlternateCaption = 'State'
        Caption = 'State (MRUEdit)'
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
        Properties.OnButtonClick = tvCustomersStatePropertiesButtonClick
        Width = 69
      end
      object tvCustomersCity: TcxGridDBColumn
        AlternateCaption = 'City'
        Caption = 'City (ButtonEdit)'
        DataBinding.FieldName = 'City'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
          end
          item
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = tvCustomersCityPropertiesButtonClick
        Width = 110
      end
      object tvCustomersPrefix: TcxGridDBColumn
        AlternateCaption = 'Prefix'
        Caption = 'Prefix (ComboBox)'
        DataBinding.FieldName = 'Prefix'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Ms.'
          'Mr.'
          'Mrs.')
        Width = 80
      end
      object tvCustomersFirstName: TcxGridDBColumn
        AlternateCaption = 'First Name'
        Caption = 'FirstName (TextEdit)'
        DataBinding.FieldName = 'FirstName'
        Width = 69
      end
      object tvCustomersLastName: TcxGridDBColumn
        AlternateCaption = 'Last Name'
        Caption = 'LastName (TextEdit)'
        DataBinding.FieldName = 'LastName'
        Width = 70
      end
      object tvCustomersCustomer: TcxGridDBColumn
        AlternateCaption = 'Customer'
        Caption = 'Customer (CheckBox)'
        DataBinding.FieldName = 'Customer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 79
      end
      object tvCustomersZipCode: TcxGridDBColumn
        AlternateCaption = 'ZipCode'
        Caption = 'ZipCode (MaskEdit)'
        DataBinding.FieldName = 'ZipCode'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '\d\d\d\d\d - \d\d\d\d'
        Width = 71
      end
      object tvCustomersAddress: TcxGridDBColumn
        AlternateCaption = 'Address'
        Caption = 'Address (TextEdit)'
        DataBinding.FieldName = 'Address'
      end
      object tvCustomersFaxPhone: TcxGridDBColumn
        AlternateCaption = 'Fax/Phone'
        Caption = 'FaxPhone (MaskEdit)'
        DataBinding.FieldName = 'FaxPhone'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\(\d\d\d\))? \d(\d\d?)? - \d\d - \d\d'
        Width = 87
      end
    end
    object tvOrders: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ColumnsSimpleDemoDataDM.dsOrders
      DataController.DetailKeyFieldNames = 'CustomerID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      object tvOrdersProductID: TcxGridDBColumn
        AlternateCaption = 'Car'
        Caption = 'Car (LookupComboBox)'
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
        Properties.ListSource = ColumnsSimpleDemoDataDM.dsCars
        Width = 250
      end
      object tvOrdersCarInfo: TcxGridDBColumn
        AlternateCaption = 'Car Information'
        Caption = 'CarInfo (PopupEdit)'
        PropertiesClassName = 'TcxPopupEditProperties'
        Properties.PopupControl = ColumnSimpleDemoCarsForm.pnlCarInfo
        Properties.OnCloseUp = tvOrdersCarInfoPropertiesCloseUp
        Properties.OnInitPopup = tvOrdersCarInfoPropertiesInitPopup
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 62
      end
      object tvOrdersPurchaseDate: TcxGridDBColumn
        AlternateCaption = 'Purchase Date'
        Caption = 'PurchaseDate (DateEdit)'
        DataBinding.FieldName = 'PurchaseDate'
        Width = 120
      end
      object tvOrdersTime: TcxGridDBColumn
        AlternateCaption = 'Purchase Time'
        Caption = 'Time (TimeEdit)'
        DataBinding.FieldName = 'Time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 100
      end
      object tvOrdersPaymentType: TcxGridDBColumn
        AlternateCaption = 'Payment Type'
        Caption = 'PaymentType (ImageComboBox)'
        DataBinding.FieldName = 'PaymentType'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ColumnsSimpleDemoDataDM.PaymentTypeImages
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
      object tvOrdersQuantity: TcxGridDBColumn
        AlternateCaption = 'Quantity'
        Caption = 'Quantity (SpinEdit)'
        DataBinding.FieldName = 'Quantity'
        PropertiesClassName = 'TcxSpinEditProperties'
        Width = 100
      end
      object tvOrdersPaymentAmount: TcxGridDBColumn
        AlternateCaption = 'Payment Amount'
        Caption = 'PaymentAmount (CalcEdit)'
        DataBinding.FieldName = 'PaymentAmount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
      end
      object tvOrdersDescription: TcxGridDBColumn
        AlternateCaption = 'Description'
        Caption = 'Description (BlobEdit)'
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
      end
    end
    object lvCustomers: TcxGridLevel
      GridView = tvCustomers
      MaxDetailHeight = 300
      object lvOrders: TcxGridLevel
        GridView = tvOrders
      end
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 24
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = 'Options'
      object miShowEditButtons: TMenuItem
        Caption = 'Show Edit Buttons'
        object miEditButtonsNever: TMenuItem
          Caption = 'Never'
          RadioItem = True
          OnClick = miEditButtonsClick
        end
        object miEditButtonsForFocusedRecord: TMenuItem
          Caption = 'For Focused Record'
          RadioItem = True
          OnClick = miEditButtonsClick
        end
        object miEditButtonsAlways: TMenuItem
          Caption = 'Always'
          RadioItem = True
          OnClick = miEditButtonsClick
        end
      end
      object miOptionsSelection: TMenuItem
        Caption = 'Options Selection'
        object miCellSelect: TMenuItem
          Caption = 'Cell Select'
          OnClick = miCellSelectClick
        end
        object miHideFocusRect: TMenuItem
          Caption = 'Hide Focus Rect when Inactive'
          OnClick = miHideFocusRectClick
        end
        object miHideSelection: TMenuItem
          Caption = 'Hide Selection when Inactive'
          OnClick = miHideSelectionClick
        end
        object miInvertSelect: TMenuItem
          Caption = 'Invert Select'
          OnClick = miInvertSelectClick
        end
        object miMultiSelect: TMenuItem
          Caption = 'Multi Select'
          OnClick = miMultiSelectClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miLookFeel: TMenuItem
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miStandard: TMenuItem
            Caption = '&Standard'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miUltraFlat: TMenuItem
            Caption = '&Ultra Flat'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miOffice11: TMenuItem
            Tag = 3
            Caption = '&Office11'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
        end
        object miNativeStyle: TMenuItem
          Caption = '&Native Style'
          OnClick = miNativeStyleClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 536
    Top = 24
  end
end
