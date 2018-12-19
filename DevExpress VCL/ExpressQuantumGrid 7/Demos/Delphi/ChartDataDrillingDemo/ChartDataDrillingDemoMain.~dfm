object frmMain: TfrmMain
  Left = 300
  Top = 120
  Width = 850
  Height = 620
  Caption = 'ExpressQuantumGrid ChartDataDrilling Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 842
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = 
      '  This demo shows the chart'#39's data drilling capabilities. Click ' +
      #39'About this demo'#39' for more information.'
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
  object Grid: TcxGrid
    Left = 0
    Top = 29
    Width = 842
    Height = 537
    Align = alClient
    TabOrder = 0
    LevelTabs.Style = 9
    LookAndFeel.NativeStyle = True
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    object ChartView: TcxGridDBChartView
      Categories.DataBinding.FieldName = 'ID'
      Categories.DisplayText = 'Order'
      DataController.DataSource = dsOrders
      DiagramColumn.Active = True
      DiagramPie.Legend.Position = cppRight
      Legend.Position = cppNone
      OptionsView.CategoriesPerPage = 10
      ToolBox.CustomizeButton = True
      ToolBox.DataLevelsInfoVisible = dlivAlways
      ToolBox.DiagramSelector = True
      object ChartViewDataGroupPurchaseDate: TcxGridDBChartDataGroup
        DataBinding.FieldName = 'PurchaseDate'
        DisplayText = 'Purchase Date'
        SortOrder = soNone
        Visible = False
      end
      object ChartViewDataGroupProduct: TcxGridDBChartDataGroup
        DataBinding.FieldName = 'Product'
        DisplayText = 'Product'
      end
      object ChartViewDataGroupCustomer: TcxGridDBChartDataGroup
        DataBinding.FieldName = 'Customer'
        DisplayText = 'Customer'
      end
      object ChartViewDataGroupPaymentType: TcxGridDBChartDataGroup
        DataBinding.FieldName = 'PaymentType'
        DisplayText = 'Payment Type'
      end
      object ChartViewSeriesPaymentAmount: TcxGridDBChartSeries
        DataBinding.FieldName = 'PaymentAmount'
        DisplayText = 'Payment Amount'
        SortOrder = soDescending
      end
      object ChartViewSeriesQuantity: TcxGridDBChartSeries
        DataBinding.FieldName = 'Quantity'
        DisplayText = 'Quantity'
        Visible = False
      end
      object ChartViewSeriesCount: TcxGridDBChartSeries
        DisplayText = 'Order Count'
        Visible = False
        GroupSummaryKind = skCount
      end
    end
    object TableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = True
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = True
      NavigatorButtons.GotoBookmark.Visible = True
      NavigatorButtons.Filter.Visible = True
      DataController.DataSource = dsOrders
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '$0,'
          Kind = skSum
          Column = TableViewPaymentAmount
        end
        item
          Format = '0'
          Kind = skSum
          Column = TableViewQuantity
        end
        item
          Format = '0'
          Kind = skCount
          Column = TableViewOrderCount
        end>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnSorting = False
      OptionsSelection.MultiSelect = True
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      Styles.OnGetGroupStyle = TableViewStylesGetGroupStyle
      object TableViewProduct: TcxGridDBColumn
        DataBinding.FieldName = 'Product'
        Width = 131
      end
      object TableViewCustomer: TcxGridDBColumn
        DataBinding.FieldName = 'Customer'
        Width = 131
      end
      object TableViewPaymentType: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentType'
        Width = 91
      end
      object TableViewPurchaseDate: TcxGridDBColumn
        DataBinding.FieldName = 'PurchaseDate'
      end
      object TableViewQuantity: TcxGridDBColumn
        DataBinding.FieldName = 'Quantity'
        Width = 76
      end
      object TableViewPaymentAmount: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentAmount'
        Width = 107
      end
      object TableViewOrderCount: TcxGridDBColumn
        Caption = 'Order Count'
        GroupSummaryAlignment = taRightJustify
        Width = 83
      end
    end
    object GridLevelChart: TcxGridLevel
      Caption = '  Chart  '
      GridView = ChartView
    end
    object GridLevelTable: TcxGridLevel
      Caption = '  Table  '
      GridView = TableView
    end
  end
  object mmMain: TMainMenu
    Left = 300
    Top = 120
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
  object dbMain: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 232
    Top = 120
  end
  object dsOrders: TDataSource
    DataSet = tblOrders
    Left = 232
    Top = 156
  end
  object tblOrders: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'Orders.DB'
    Left = 260
    Top = 156
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
    object tblOrdersCustomer: TStringField
      FieldKind = fkLookup
      FieldName = 'Customer'
      LookupDataSet = tblCustomers
      LookupKeyFields = 'ID'
      LookupResultField = 'Company'
      KeyFields = 'CustomerID'
      Lookup = True
    end
    object tblOrdersProduct: TStringField
      FieldKind = fkLookup
      FieldName = 'Product'
      LookupDataSet = tblProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ProductID'
      Size = 100
      Lookup = True
    end
  end
  object tblCustomers: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'Customers.DB'
    Left = 260
    Top = 184
  end
  object tblProducts: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'PRODUCTS.DB'
    Left = 260
    Top = 212
  end
  object StyleRepository: TcxStyleRepository
    Left = 300
    Top = 156
    object styleActiveGroup: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
