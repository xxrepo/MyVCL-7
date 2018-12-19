object ConvertTreeList3DemoDataDM: TConvertTreeList3DemoDataDM
  OldCreateOrder = False
  Left = 310
  Top = 163
  Height = 229
  Width = 325
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
  object tblDepartments: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexName = 'xParentID'
    TableName = 'DEPARTMENTS.DB'
    Left = 40
    Top = 64
    object tblDepartmentsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDepartmentsPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object tblDepartmentsMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
    end
    object tblDepartmentsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tblDepartmentsBUDGET: TFloatField
      FieldName = 'BUDGET'
      currency = True
    end
    object tblDepartmentsLOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 50
    end
    object tblDepartmentsPHONE: TStringField
      FieldName = 'PHONE'
      Size = 50
    end
    object tblDepartmentsFAX: TStringField
      FieldName = 'FAX'
      Size = 50
    end
    object tblDepartmentsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object tblDepartmentsVACANCY: TBooleanField
      FieldName = 'VACANCY'
    end
  end
  object dsDepartments: TDataSource
    DataSet = tblDepartments
    Left = 40
    Top = 112
  end
end
