object FilterByCodeDemoMainForm: TFilterByCodeDemoMainForm
  Left = 115
  Top = 197
  Width = 851
  Height = 545
  Caption = 'ExpressQuantumGrid FilterByCode Demo'
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
    Width = 843
    Height = 32
    Align = alTop
    Caption = 
      'This demo shows grid filtering. Try to change the combo box belo' +
      'w and column headers dropdown. Click '#39'About this demo'#39' for more ' +
      'information.'
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
    Top = 472
    Width = 843
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 73
    Width = 843
    Height = 399
    Align = alClient
    TabOrder = 1
    object tvCustomers: TcxGridDBTableView
      DataController.DataSource = FilterByCodeDemoMainDM.dsCustomers
      DataController.Filter.OnChanged = tvCustomersDataControllerFilterChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = FilterByCodeDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvCustomersFIRSTNAME: TcxGridDBColumn
        Caption = 'FirstName'
        DataBinding.FieldName = 'FIRSTNAME'
        Width = 76
      end
      object tvCustomersLASTNAME: TcxGridDBColumn
        Caption = 'LastName'
        DataBinding.FieldName = 'LASTNAME'
        Width = 86
      end
      object tvCustomersCOMPANYNAME: TcxGridDBColumn
        Caption = 'Company'
        DataBinding.FieldName = 'COMPANYNAME'
        Width = 146
      end
      object tvCustomersPAYMENTTYPE: TcxGridDBColumn
        Caption = 'PaymentType'
        DataBinding.FieldName = 'PAYMENTTYPE'
        RepositoryItem = FilterByCodeDemoMainDM.edrepDXPaymentTypeImageCombo
        Width = 119
      end
      object tvCustomersPRODUCTID: TcxGridDBColumn
        Caption = 'Product'
        DataBinding.FieldName = 'PRODUCTID'
        RepositoryItem = FilterByCodeDemoMainDM.edrepDXLookupProducts
        OnUserFiltering = tvCustomersPRODUCTIDUserFiltering
        Width = 120
        OnGetFilterValues = tvCustomersPRODUCTIDGetFilterValues
      end
      object tvCustomersCUSTOMER: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'CUSTOMER'
        Width = 65
      end
      object tvCustomersPURCHASEDATE: TcxGridDBColumn
        Caption = 'PurchaseDate'
        DataBinding.FieldName = 'PURCHASEDATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 88
      end
      object tvCustomersPAYMENTAMOUNT: TcxGridDBColumn
        Caption = 'PaymentAmount'
        DataBinding.FieldName = 'PAYMENTAMOUNT'
        Width = 75
      end
      object tvCustomersCOPIES: TcxGridDBColumn
        Caption = 'Copies'
        DataBinding.FieldName = 'COPIES'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.MaxValue = 100
        Width = 66
      end
    end
    object lvCustomers: TcxGridLevel
      GridView = tvCustomers
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 32
    Width = 843
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 4707838
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 92
      Height = 13
      Caption = 'Current Active Filter'
    end
    object cbFilters: TComboBox
      Left = 112
      Top = 10
      Width = 385
      Height = 19
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      Color = 16247513
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbFiltersChange
    end
  end
  object mmMain: TMainMenu
    Left = 640
    Top = 40
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOpions: TMenuItem
      Caption = '&Opions'
      object miFilterBoxPosition: TMenuItem
        Caption = 'FilterBox &position'
        object miFilterBoxPosTop: TMenuItem
          Caption = 'Top'
          Hint = 'The FilterBox is moved to the top of the GridView'
          RadioItem = True
          OnClick = miFilterBoxPosClick
        end
        object miFilterBoxPosBottom: TMenuItem
          Caption = 'Bottom'
          Checked = True
          Hint = 'The FilterBox is moved to the bottom of the GridView'
          RadioItem = True
          OnClick = miFilterBoxPosClick
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
    Left = 608
    Top = 40
  end
end
