object ViewNestedBandsDemoDataDM: TViewNestedBandsDemoDataDM
  OldCreateOrder = False
  Left = 384
  Top = 219
  Height = 409
  Width = 466
  object dsCars: TDataSource
    DataSet = tblCars
    Left = 104
    Top = 72
  end
  object dsOrders: TDataSource
    DataSet = tblOrders
    Left = 96
    Top = 128
  end
  object dsCustomers: TDataSource
    DataSet = tblCustomers
    Left = 120
    Top = 184
  end
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 56
    Top = 16
  end
  object tblCars: TTable
    Active = True
    OnCalcFields = tblCarsCalcFields
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'Cars.DB'
    Left = 48
    Top = 72
    object tblCarsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblCarsTrademark: TStringField
      DisplayWidth = 15
      FieldName = 'Trademark'
      Size = 50
    end
    object tblCarsModel: TStringField
      DisplayWidth = 40
      FieldName = 'Model'
      Size = 50
    end
    object tblCarsHP: TSmallintField
      FieldName = 'HP'
    end
    object tblCarsLiter: TFloatField
      FieldName = 'Liter'
    end
    object tblCarsCyl: TSmallintField
      FieldName = 'Cyl'
    end
    object tblCarsTransmissSpeedCount: TSmallintField
      FieldName = 'TransmissSpeedCount'
    end
    object tblCarsTransmissAutomatic: TStringField
      FieldName = 'TransmissAutomatic'
      Size = 3
    end
    object tblCarsMPG_City: TSmallintField
      FieldName = 'MPG_City'
    end
    object tblCarsMPG_Highway: TSmallintField
      FieldName = 'MPG_Highway'
    end
    object tblCarsCategory: TStringField
      DisplayWidth = 15
      FieldName = 'Category'
      Size = 7
    end
    object tblCarsDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
      Size = 10
    end
    object tblCarsHyperlink: TStringField
      FieldName = 'Hyperlink'
      Size = 50
    end
    object tblCarsPicture: TBlobField
      FieldName = 'Picture'
      Size = 10
    end
    object tblCarsPrice: TFloatField
      FieldName = 'Price'
    end
    object tblCarsCar: TStringField
      FieldKind = fkCalculated
      FieldName = 'Car'
      Size = 100
      Calculated = True
    end
  end
  object tblOrders: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'Orders.DB'
    Left = 48
    Top = 128
    object tblOrdersID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblOrdersCustomerID: TIntegerField
      FieldName = 'CustomerID'
    end
    object tblOrdersProductID: TIntegerField
      DisplayWidth = 25
      FieldName = 'ProductID'
    end
    object tblOrdersPurchaseDate: TDateTimeField
      DisplayWidth = 23
      FieldName = 'PurchaseDate'
    end
    object tblOrdersTime: TDateTimeField
      DisplayWidth = 23
      FieldName = 'Time'
    end
    object tblOrdersPaymentType: TStringField
      DisplayWidth = 23
      FieldName = 'PaymentType'
      Size = 7
    end
    object tblOrdersDescription: TMemoField
      DisplayWidth = 14
      FieldName = 'Description'
      BlobType = ftMemo
      Size = 10
    end
    object tblOrdersQuantity: TIntegerField
      DisplayWidth = 17
      FieldName = 'Quantity'
    end
    object tblOrdersPaymentAmount: TCurrencyField
      DisplayWidth = 21
      FieldName = 'PaymentAmount'
    end
  end
  object tblCustomers: TTable
    Active = True
    OnCalcFields = tblCustomersCalcFields
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'Customers.DB'
    Left = 48
    Top = 184
    object tblCustomersID: TIntegerField
      FieldName = 'ID'
    end
    object tblCustomersFirstName: TStringField
      DisplayWidth = 16
      FieldName = 'FirstName'
      Size = 25
    end
    object tblCustomersLastName: TStringField
      DisplayWidth = 16
      FieldName = 'LastName'
      Size = 25
    end
    object tblCustomersCompany: TStringField
      DisplayWidth = 21
      FieldName = 'Company'
      Size = 50
    end
    object tblCustomersPrefix: TStringField
      DisplayWidth = 17
      FieldName = 'Prefix'
      Size = 15
    end
    object tblCustomersTitle: TStringField
      FieldName = 'Title'
      Size = 15
    end
    object tblCustomersAddress: TStringField
      DisplayWidth = 21
      FieldName = 'Address'
      Size = 50
    end
    object tblCustomersCity: TStringField
      DisplayWidth = 17
      FieldName = 'City'
    end
    object tblCustomersState: TStringField
      DisplayWidth = 16
      FieldName = 'State'
      Size = 2
    end
    object tblCustomersZipCode: TStringField
      DisplayWidth = 17
      FieldName = 'ZipCode'
      Size = 10
    end
    object tblCustomersSource: TStringField
      FieldName = 'Source'
      Size = 10
    end
    object tblCustomersCustomer: TStringField
      DisplayWidth = 17
      FieldName = 'Customer'
      Size = 1
    end
    object tblCustomersHomePhone: TStringField
      FieldName = 'HomePhone'
      Size = 15
    end
    object tblCustomersFaxPhone: TStringField
      DisplayWidth = 17
      FieldName = 'FaxPhone'
      Size = 15
    end
    object tblCustomersSpouse: TStringField
      DisplayWidth = 10
      FieldName = 'Spouse'
      Size = 50
    end
    object tblCustomersOccupation: TStringField
      FieldName = 'Occupation'
      Size = 25
    end
    object tblCustomersDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
      Size = 10
    end
    object tblCustomersName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name'
      Size = 100
      Calculated = True
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 40
    Top = 272
    object cxStyle31: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object PaymentTypeImages: TImageList
    Left = 140
    Top = 264
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001800000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000840000840000FF0000840000840000840000840000840000840000840000
      0000000000008484008484008484008484008484008484008484008484008484
      0084840084840084840084840084840000000000000000000000000000FF0000
      FF0000FF00000000000000000000FFFF00FFFF00FFFF00000000000000000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000FF0000FF0000FF0000FF0000840000840000840000840000840000840000
      0000000000008484008484008484008484008484008484008484008484008484
      0084840084840084840084840084840000000000000000000000FF0000FF0000
      FF0000FF0000FF00000000FFFF00FFFF00FFFF00FFFF00FFFF00000000000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000840000840000FF0000840000FF0000840000840000840000840000840000
      0000000000008484008484008484008484008484008484008484008484008484
      0084840084840084840084840084840000000000000000FF0000FF0000FF0000
      FF0000FF00848400000000848400FFFF00FFFF00FFFF00FFFF00FFFF00000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000840000840000FF0000840000FF0000840000840000840000840000840000
      0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000FF0000FF0000
      FF0000FF00848400000000848400FFFF00FFFF00FFFF00FFFF00FFFF00000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000840000FF0000FF0000FF0000840000840000840000840000840000840000
      0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000FF0000FF0000
      FF0000FF00848400000000848400FFFF00FFFF00FFFF00FFFF00FFFF00000000
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000084000084000084000084
      0000FF0000840000FF0000840000840000840000840000840000840000840000
      0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000FF0000FF0000
      FF0000FF00848400000000848400FFFF00FFFF00FFFF00FFFF00FFFF00000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000FF0000840000FF0000840000840000840000840000840000840000840000
      0000000000840000840000840000840000840000840000840000840000840000
      8400008400008400008400008400000000000000000000FF0000FF0000FF0000
      FF0000FF00848400000000848400FFFF00FFFF00FFFF00FFFF00FFFF00000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000840000FF0000FF0000FF0000FF0000840000840000840000840000840000
      0000000000840000840000840000840000840000840000840000840000840000
      8400008400008400008400008400000000000000000000000000FF0000FF0000
      FF0000FF0000FF00000000FFFF00FFFF00FFFF00FFFF00FFFF00000000000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000084000084000084000084
      0000840000840000FF0000840000840000840000840000840000840000840000
      0000000000840000840000840000840000840000840000840000840000840000
      8400008400008400008400008400000000000000000000000000000000FF0000
      FF0000FF00000000000000000000FFFF00FFFF00FFFF00000000000000000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF800100000000E38F800100000000C10780010000000080038001
      0000000001018001000000000101800100000000010180010000000001018001
      0000000001018001000000008003800100000000C107800100000000E38F8001
      FFFFFFFFFFFF8001FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
