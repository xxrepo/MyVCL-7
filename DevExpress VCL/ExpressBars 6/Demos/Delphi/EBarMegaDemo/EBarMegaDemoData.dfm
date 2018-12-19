object EBarMegaDemoMainDM: TEBarMegaDemoMainDM
  OldCreateOrder = False
  Left = 296
  Top = 116
  Height = 256
  Width = 218
  object tblContacts: TTable
    Active = True
    OnCalcFields = tblContactsCalcFields
    DatabaseName = 'EBarMegaDemo'
    TableName = 'Contacts.DB'
    Left = 36
    Top = 127
    object tblContactsID: TAutoIncField
      FieldName = 'ID'
    end
    object tblContactsProductID: TIntegerField
      FieldName = 'ProductID'
    end
    object tblContactsFirstName: TStringField
      FieldName = 'FirstName'
      Size = 25
    end
    object tblContactsLastName: TStringField
      FieldName = 'LastName'
      Size = 25
    end
    object tblContactsCompany: TStringField
      FieldName = 'Company'
      Size = 50
    end
    object tblContactsAddress: TStringField
      FieldName = 'Address'
      Size = 50
    end
    object tblContactsCity: TStringField
      FieldName = 'City'
    end
    object tblContactsState: TStringField
      FieldName = 'State'
      Size = 2
    end
    object tblContactsPurchaseDate: TDateField
      FieldName = 'PurchaseDate'
      DisplayFormat = 'aaa mm/dd/yy'
    end
    object tblContactsPaymentType: TStringField
      FieldName = 'PaymentType'
      Size = 7
    end
    object tblContactsPaymentAmount: TBCDField
      FieldName = 'PaymentAmount'
      Size = 15
    end
    object tblContactsproduct: TStringField
      FieldKind = fkLookup
      FieldName = 'product'
      LookupDataSet = tblProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ProductID'
      Size = 25
      Lookup = True
    end
    object tblContactsCustName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustName'
      Size = 50
      Calculated = True
    end
  end
  object tblProducts: TTable
    Active = True
    DatabaseName = 'EBarMegaDemo'
    TableName = 'products.db'
    Left = 104
    Top = 129
    object tblProductsID: TIntegerField
      FieldName = 'ID'
    end
    object tblProductsNAME: TStringField
      DisplayWidth = 22
      FieldName = 'NAME'
      Size = 25
    end
    object tblProductsDescription: TStringField
      DisplayWidth = 55
      FieldName = 'Description'
      Size = 55
    end
  end
  object Database: TDatabase
    Connected = True
    DatabaseName = 'EBarMegaDemo'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 32
    Top = 16
  end
  object dsProducts: TDataSource
    DataSet = tblProducts
    Left = 103
    Top = 73
  end
  object dsContacts: TDataSource
    DataSet = tblContacts
    Left = 38
    Top = 75
  end
end
