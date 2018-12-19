object RowsMultiEditorsDemoDataDM: TRowsMultiEditorsDemoDataDM
  OldCreateOrder = False
  OnCreate = RowsMultiEditorsDemoDataDMCreate
  Left = 215
  Top = 266
  Height = 221
  Width = 286
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 40
    Top = 8
  end
  object queOrders: TQuery
    Active = True
    CachedUpdates = True
    AfterPost = queOrdersAfterPost
    AfterCancel = queOrdersAfterCancel
    OnUpdateRecord = queOrdersUpdateRecord
    DatabaseName = 'DemosDB'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '  Cars.Trademark, Cars.Model, Cars.HP, Cars.Liter, Cars.Cyl, '
      '  Cars.TransmissSpeedCount, Cars.TransmissAutomatic, '
      '  Cars.MPG_City, Cars.MPG_Highway, Cars.Category, '
      '  Cars.Hyperlink, Cars.Description Cars_Description, '
      '  Cars.Picture, Cars.Price, Customers.FirstName, '
      '  Customers.ID Customers_ID, Customers.LastName, '
      '  Customers.Company, Customers.Prefix, Customers.Title, '
      '  Customers.Address, Customers.City, Customers.State, '
      '  Customers.ZipCode, Customers.Source, Customers.Customer, '
      '  Customers.HomePhone, Customers.FaxPhone, '
      '  Customers.Spouse, Customers.Occupation, Customers.Email, '
      '  Customers.Description Customers_Description, '
      '  Orders.CustomerID, Orders.ID Orders_ID, Orders.ProductID, '
      
        '  Orders.PurchaseDate, Orders."Time" Orders_Time, Orders.Payment' +
        'Type, '
      '  Orders.PaymentAmount, Orders.Quantity, '
      '  Orders.Description Orders_Description, Cars.ID Cars_ID'
      'FROM "CARS.DB" Cars'
      '   LEFT OUTER JOIN "ORDERS.DB" Orders'
      '   ON  (Orders.ProductID = Cars.ID)  '
      '   LEFT OUTER JOIN "CUSTOMERS.DB" Customers'
      '   ON  (Orders.CustomerID = Customers.ID)  '
      'order by Orders.CustomerID')
    Left = 40
    Top = 64
    object queOrdersPurchaseDate: TDateTimeField
      FieldName = 'PurchaseDate'
    end
    object queOrdersTime: TDateTimeField
      DisplayLabel = 'Time'
      FieldName = 'Orders_Time'
    end
    object queOrdersPaymentType: TStringField
      FieldName = 'PaymentType'
      Size = 7
    end
    object queOrdersPaymentAmount: TFloatField
      FieldName = 'PaymentAmount'
    end
    object queOrdersQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object queOrdersFirstName: TStringField
      FieldName = 'FirstName'
      Size = 25
    end
    object queOrdersLastName: TStringField
      FieldName = 'LastName'
      Size = 25
    end
    object queOrdersCompany: TStringField
      FieldName = 'Company'
      Size = 50
    end
    object queOrdersPrefix: TStringField
      FieldName = 'Prefix'
      Size = 15
    end
    object queOrdersTitle: TStringField
      FieldName = 'Title'
      Size = 15
    end
    object queOrdersAddress: TStringField
      FieldName = 'Address'
      Size = 50
    end
    object queOrdersCity: TStringField
      FieldName = 'City'
    end
    object queOrdersState: TStringField
      FieldName = 'State'
      Size = 2
    end
    object queOrdersZipCode: TStringField
      FieldName = 'ZipCode'
      Size = 10
    end
    object queOrdersSource: TStringField
      FieldName = 'Source'
      Size = 10
    end
    object queOrdersCustomer: TStringField
      FieldName = 'Customer'
      Size = 1
    end
    object queOrdersHomePhone: TStringField
      FieldName = 'HomePhone'
      Size = 15
    end
    object queOrdersFaxPhone: TStringField
      FieldName = 'FaxPhone'
      Size = 15
    end
    object queOrdersSpouse: TStringField
      FieldName = 'Spouse'
      Size = 50
    end
    object queOrdersOccupation: TStringField
      FieldName = 'Occupation'
      Size = 25
    end
    object queOrdersEmail: TStringField
      FieldName = 'Email'
      Size = 255
    end
    object queOrdersTrademark: TStringField
      FieldName = 'Trademark'
      Size = 50
    end
    object queOrdersModel: TStringField
      FieldName = 'Model'
      Size = 50
    end
    object queOrdersHP: TSmallintField
      FieldName = 'HP'
    end
    object queOrdersLiter: TFloatField
      FieldName = 'Liter'
    end
    object queOrdersCyl: TSmallintField
      FieldName = 'Cyl'
    end
    object queOrdersTransmissSpeedCount: TSmallintField
      FieldName = 'TransmissSpeedCount'
    end
    object queOrdersTransmissAutomatic: TStringField
      FieldName = 'TransmissAutomatic'
      Size = 3
    end
    object queOrdersMPG_City: TSmallintField
      FieldName = 'MPG_City'
    end
    object queOrdersMPG_Highway: TSmallintField
      FieldName = 'MPG_Highway'
    end
    object queOrdersCategory: TStringField
      FieldName = 'Category'
      Size = 7
    end
    object queOrdersCars_Description: TMemoField
      FieldName = 'Cars_Description'
      BlobType = ftMemo
      Size = 10
    end
    object queOrdersHyperlink: TStringField
      FieldName = 'Hyperlink'
      Size = 50
    end
    object queOrdersPicture: TBlobField
      FieldName = 'Picture'
      BlobType = ftBlob
      Size = 10
    end
    object queOrdersPrice: TFloatField
      FieldName = 'Price'
    end
    object queOrdersCustomers_ID: TIntegerField
      FieldName = 'Customers_ID'
    end
    object queOrdersOrders_ID: TIntegerField
      FieldName = 'Orders_ID'
    end
    object queOrdersCars_ID: TIntegerField
      FieldName = 'Cars_ID'
    end
  end
  object dsOrders: TDataSource
    DataSet = queOrders
    Left = 120
    Top = 64
  end
  object StyleRepository: TcxStyleRepository
    Left = 120
    Top = 8
    object Sunny: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clNavy
    end
    object Dark: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14920832
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object Golden: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object Summer: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16379615
      TextColor = clBlack
    end
    object Autumn: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15252642
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 11032875
    end
    object Bright: TcxStyle
      AssignedValues = [svColor]
      Color = 16749885
    end
    object Cold: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object Spring: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15519398
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 12742441
    end
    object Light: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object Winter: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Depth: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object UserStyleSheet: TcxVerticalGridStyleSheet
      Styles.Background = Autumn
      Styles.Content = Summer
      Styles.Inactive = Bright
      Styles.Selection = Dark
      Styles.Category = Dark
      Styles.Header = Spring
      Styles.IncSearch = Golden
      BuiltIn = True
    end
  end
  object updOrders: TUpdateSQL
    ModifySQL.Strings = (
      'update "Orders.DB" Orders'
      'set'
      '  PurchaseDate = :PurchaseDate,'
      '  Orders."Time" = :Orders_Time,'
      '  PaymentType = :PaymentType,'
      '  PaymentAmount = :PaymentAmount,'
      '  Quantity = :Quantity'
      'where'
      '  ID = :Orders_ID')
    Left = 40
    Top = 120
  end
  object updCustomers: TUpdateSQL
    ModifySQL.Strings = (
      'update "Customers.DB"'
      'set'
      '  FirstName = :FirstName,'
      '  LastName = :LastName,'
      '  Company = :Company,'
      '  Prefix = :Prefix,'
      '  Title = :Title,'
      '  Address = :Address,'
      '  City = :City,'
      '  State = :State,'
      '  ZipCode = :ZipCode,'
      '  Source = :Source,'
      '  Customer = :Customer,'
      '  HomePhone = :HomePhone,'
      '  FaxPhone = :FaxPhone,'
      '  Spouse = :Spouse,'
      '  Occupation = :Occupation,'
      '  Email = :Email'
      'where'
      '  ID = :Customers_ID')
    Left = 112
    Top = 120
  end
  object updCars: TUpdateSQL
    ModifySQL.Strings = (
      'update "CARS.DB"'
      'set'
      '  Trademark = :Trademark,'
      '  Model = :Model,'
      '  HP = :HP,'
      '  Liter = :Liter,'
      '  Cyl = :Cyl,'
      '  TransmissSpeedCount = :TransmissSpeedCount,'
      '  TransmissAutomatic = :TransmissAutomatic,'
      '  MPG_City = :MPG_City,'
      '  MPG_Highway = :MPG_Highway,'
      '  Category = :Category,'
      '  Hyperlink = :Hyperlink,'
      '  Picture = :Picture,'
      '  Price = :Price'
      'where'
      '  ID = :Cars_ID')
    Left = 184
    Top = 120
  end
end
