object ViewCardSimpleDemoMainDM: TViewCardSimpleDemoMainDM
  OldCreateOrder = False
  Left = 235
  Top = 192
  Height = 272
  Width = 248
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
  object tlbDEPARTMENTS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'DEPARTMENTS.DB'
    Left = 144
    Top = 64
    object tlbDEPARTMENTSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tlbDEPARTMENTSNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object dsDEPARTMENTS: TDataSource
    DataSet = tlbDEPARTMENTS
    Left = 40
    Top = 64
  end
  object dsUSERS: TDataSource
    DataSet = tlbUSERS
    Left = 40
    Top = 120
  end
  object tlbUSERS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'DEPARTMENTID'
    MasterFields = 'ID'
    MasterSource = dsDEPARTMENTS
    TableName = 'USERS.DB'
    Left = 144
    Top = 120
  end
end
