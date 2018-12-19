object ViewBandedFixedDemoDMMain: TViewBandedFixedDemoDMMain
  OldCreateOrder = False
  Left = 429
  Top = 128
  Height = 367
  Width = 305
  object tblSCHEDULER: TTable
    Active = True
    OnCalcFields = tblSCHEDULERCalcFields
    DatabaseName = 'DemosDB'
    TableName = 'SCHEDULER.DB'
    Left = 160
    Top = 64
    object tblSCHEDULERID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object PROJECTID: TIntegerField
      FieldName = 'PROJECTID'
    end
    object USERID: TIntegerField
      FieldName = 'USERID'
    end
    object SUNDAY: TSmallintField
      FieldName = 'SUNDAY'
    end
    object MONDAY: TSmallintField
      FieldName = 'MONDAY'
    end
    object TUESDAY: TSmallintField
      FieldName = 'TUESDAY'
    end
    object WEDNESDAY: TSmallintField
      FieldName = 'WEDNESDAY'
    end
    object THURSDAY: TSmallintField
      FieldName = 'THURSDAY'
    end
    object FRIDAY: TSmallintField
      FieldName = 'FRIDAY'
    end
    object SATURDAY: TSmallintField
      FieldName = 'SATURDAY'
    end
    object RowAvg: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RowAvg'
      Calculated = True
    end
    object RowSum: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RowSum'
      Calculated = True
    end
    object UserName: TStringField
      FieldKind = fkCalculated
      FieldName = 'UserName'
      Calculated = True
    end
    object FirstName: TStringField
      FieldKind = fkLookup
      FieldName = 'FirstName'
      LookupDataSet = tblUSERS
      LookupKeyFields = 'ID'
      LookupResultField = 'FNAME'
      KeyFields = 'USERID'
      Lookup = True
    end
    object MiddleName: TStringField
      FieldKind = fkLookup
      FieldName = 'MiddleName'
      LookupDataSet = tblUSERS
      LookupKeyFields = 'ID'
      LookupResultField = 'MNAME'
      KeyFields = 'USERID'
      Lookup = True
    end
    object LastName: TStringField
      FieldKind = fkLookup
      FieldName = 'LastName'
      LookupDataSet = tblUSERS
      LookupKeyFields = 'ID'
      LookupResultField = 'LNAME'
      KeyFields = 'USERID'
      Lookup = True
    end
  end
  object dsSCHEDULER: TDataSource
    DataSet = tblSCHEDULER
    Left = 32
    Top = 64
  end
  object dsUSERS: TDataSource
    DataSet = tblUSERS
    Left = 32
    Top = 112
  end
  object tblUSERS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'USERS.DB'
    Left = 160
    Top = 112
    object tblUSERSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblUSERSFNAME: TStringField
      FieldName = 'FNAME'
      Size = 25
    end
    object tblUSERSMNAME: TStringField
      FieldName = 'MNAME'
    end
    object tblUSERSLNAME: TStringField
      FieldName = 'LNAME'
      Size = 25
    end
    object tblUSERSEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tblUSERSPHONE: TStringField
      FieldName = 'PHONE'
      Size = 24
    end
    object tblUSERSDEPARTMENTID: TIntegerField
      FieldName = 'DEPARTMENTID'
    end
  end
  object tblPROJECTS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PROJECTS.DB'
    Left = 160
    Top = 168
    object tblPROJECTSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPROJECTSNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object tblPROJECTSMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
    end
  end
  object dsPROJECTS: TDataSource
    DataSet = tblPROJECTS
    Left = 32
    Top = 168
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
    Left = 32
    Top = 16
  end
end
