object DragDropDemoDataDM: TDragDropDemoDataDM
  OldCreateOrder = False
  Left = 492
  Top = 273
  Height = 315
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
    TableName = 'DEPARTMENTS.DB'
    Left = 32
    Top = 64
    object tblDepartmentsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblDepartmentsPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Visible = False
    end
    object tblDepartmentsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tblDepartmentsBUDGET: TFloatField
      FieldName = 'BUDGET'
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
    Left = 32
    Top = 112
  end
  object tblPersons: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'DepartmentID'
    MasterFields = 'ID'
    MasterSource = dsDepartments
    TableName = 'PERSONS.DB'
    Left = 120
    Top = 64
    object tblPersonsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPersonsName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object tblPersonsCountry: TStringField
      FieldName = 'Country'
      Size = 15
    end
    object tblPersonsPostalCode: TStringField
      FieldName = 'PostalCode'
      Size = 10
    end
    object tblPersonsCity: TStringField
      FieldName = 'City'
      Size = 15
    end
    object tblPersonsAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object tblPersonsPhone: TStringField
      FieldName = 'Phone'
      Size = 24
    end
    object tblPersonsFax: TStringField
      FieldName = 'Fax'
      Size = 24
    end
    object tblPersonsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object tblPersonsHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 100
    end
    object tblPersonsDepartmentID: TIntegerField
      FieldName = 'DepartmentID'
    end
  end
  object dsPersons: TDataSource
    DataSet = tblPersons
    Left = 120
    Top = 112
  end
  object StyleRepository: TcxStyleRepository
    Left = 160
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15252642
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 11032875
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15784893
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16048336
      TextColor = clBlack
    end
    object stlGroupNode: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15253902
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object stlFixedBand: TcxStyle
      AssignedValues = [svColor]
      Color = 15322014
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle7
      Styles.ContentOdd = cxStyle6
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
  end
  object tblDeptDict: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'DEPARTMENTS.DB'
    Left = 32
    Top = 176
  end
  object dsDeptDict: TDataSource
    DataSet = tblDeptDict
    Left = 32
    Top = 224
  end
  object dsPersDict: TDataSource
    DataSet = tblPersDict
    Left = 120
    Top = 224
  end
  object tblPersDict: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PERSONS.DB'
    Left = 120
    Top = 176
  end
end
