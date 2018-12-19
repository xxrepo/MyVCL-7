object frmMain: TfrmMain
  Left = 300
  Top = 120
  Width = 900
  Height = 697
  Caption = 'ExpressQuantumGrid Master-Detail Chart Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 892
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = 
      '  This demo shows how the ChartView can be used as a detail view' +
      ' in a master-detail grid. Click '#39'About this demo'#39' for more infor' +
      'mation.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object grMain: TcxGrid
    Left = 0
    Top = 29
    Width = 892
    Height = 617
    Align = alClient
    TabOrder = 0
    object tvCustomers: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCustomers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      object tvCustomersID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Width = 34
      end
      object tvCustomersFirstName: TcxGridDBColumn
        DataBinding.FieldName = 'FirstName'
        Width = 77
      end
      object tvCustomersLastName: TcxGridDBColumn
        DataBinding.FieldName = 'LastName'
        Width = 79
      end
      object tvCustomersCompany: TcxGridDBColumn
        DataBinding.FieldName = 'Company'
        Width = 135
      end
      object tvCustomersAddress: TcxGridDBColumn
        DataBinding.FieldName = 'Address'
        Width = 133
      end
      object tvCustomersCity: TcxGridDBColumn
        DataBinding.FieldName = 'City'
        Width = 77
      end
      object tvCustomersState: TcxGridDBColumn
        DataBinding.FieldName = 'State'
        Width = 57
      end
      object tvCustomersZipCode: TcxGridDBColumn
        DataBinding.FieldName = 'ZipCode'
      end
      object tvCustomersEmail: TcxGridDBColumn
        DataBinding.FieldName = 'Email'
        Width = 181
      end
    end
    object chvOrders: TcxGridDBChartView
      Categories.DataBinding.FieldName = 'ID'
      Categories.OnGetValueDisplayText = chvOrdersCategoriesGetValueDisplayText
      DataController.DataSource = dsOrders
      DataController.DetailKeyFieldNames = 'CustomerID'
      DataController.MasterKeyFieldNames = 'ID'
      DiagramColumn.Active = True
      DiagramColumn.AxisCategory.GridLines = False
      DiagramColumn.AxisCategory.TickMarkKind = tmkNone
      Legend.Position = cppNone
      OptionsView.CategoriesPerPage = 10
      OnGetValueHint = chvOrdersGetValueHint
      object chvOrdersPaymentAmountSeries: TcxGridDBChartSeries
        DataBinding.FieldName = 'PaymentAmount'
        DisplayText = 'Payment Amount'
        SortOrder = soDescending
        ValueCaptionFormat = '$,0'
      end
      object chvOrdersProductIDSeries: TcxGridDBChartSeries
        DataBinding.FieldName = 'ProductID'
        Visible = False
      end
      object chvOrdersQuantitySeries: TcxGridDBChartSeries
        DataBinding.FieldName = 'Quantity'
        Visible = False
      end
    end
    object chvProducts: TcxGridDBChartView
      Categories.DataBinding.FieldName = 'Name'
      DataController.DataModeController.DetailInSQLMode = True
      DataController.DataSource = dsProducts
      DataController.DetailKeyFieldNames = 'CustomerID'
      DataController.MasterKeyFieldNames = 'ID'
      DiagramColumn.Active = True
      DiagramColumn.AxisValue.Title.Text = 'Copies'
      DiagramColumn.Values.VaryColorsByCategory = True
      Legend.Position = cppNone
      object chvProductsCopiesSeries: TcxGridDBChartSeries
        DataBinding.FieldName = 'SUM OF Quantity'
        DisplayText = 'Quantity'
      end
    end
    object grMainLevel1: TcxGridLevel
      GridView = tvCustomers
      MaxDetailHeight = 250
      Options.DetailTabsPosition = dtpTop
      object grMainLevel2: TcxGridLevel
        Caption = 'Orders'
        GridView = chvOrders
      end
      object grMainLevel3: TcxGridLevel
        Caption = 'Products'
        GridView = chvProducts
      end
    end
  end
  object dbMain: TDatabase
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 324
    Top = 116
  end
  object mmMain: TMainMenu
    Left = 468
    Top = 116
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
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
    Left = 508
    Top = 116
  end
  object dsOrders: TDataSource
    DataSet = tblOrders
    Left = 376
    Top = 172
  end
  object tblOrders: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'CustomerID'
    TableName = 'Orders.DB'
    Left = 404
    Top = 172
    object tblOrdersID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblOrdersCustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object tblOrdersProductID: TIntegerField
      FieldName = 'ProductID'
    end
    object tblOrdersPurchaseDate: TDateTimeField
      FieldName = 'PurchaseDate'
    end
    object tblOrdersTime: TDateTimeField
      FieldName = 'Time'
    end
    object tblOrdersPaymentType: TStringField
      FieldName = 'PaymentType'
      Size = 7
    end
    object tblOrdersPaymentAmount: TCurrencyField
      FieldName = 'PaymentAmount'
    end
    object tblOrdersDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
      Size = 10
    end
    object tblOrdersQuantity: TIntegerField
      FieldName = 'Quantity'
    end
  end
  object tblProducts: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'PRODUCTS.DB'
    Left = 388
    Top = 144
  end
  object tblCustomers: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'Customers.DB'
    Left = 388
    Top = 116
  end
  object dsCustomers: TDataSource
    DataSet = tblCustomers
    Left = 360
    Top = 116
  end
  object qryProducts: TQuery
    Active = True
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      'SELECT'
      '  O.CustomerID, P.Name, SUM(O.Quantity)'
      'FROM'
      '  Orders.db O, Products.db P'
      'WHERE'
      
        '  (O.ProductID = P.ID) AND (O.CustomerID = :CustomerID) AND (P.N' +
        'ame LIKE '#39'Express%'#39')'
      'GROUP BY'
      '  O.CustomerID, P.Name')
    Left = 404
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CustomerID'
        ParamType = ptUnknown
      end>
  end
  object dsProducts: TDataSource
    DataSet = qryProducts
    Left = 376
    Top = 200
  end
end
