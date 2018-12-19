object MasterDetailTableDemoMainDM: TMasterDetailTableDemoMainDM
  OldCreateOrder = False
  Left = 270
  Top = 205
  Height = 387
  Width = 658
  object dsFilms: TDataSource
    DataSet = tblFilms
    Left = 48
    Top = 96
  end
  object dsFilmsPersonsStaff: TDataSource
    DataSet = tblFilmsPersonsStaff
    Left = 48
    Top = 192
  end
  object dsPersons: TDataSource
    DataSet = tblPersons
    Left = 144
    Top = 192
  end
  object dsPersonsLine: TDataSource
    DataSet = tblPersonsLine
    Left = 216
    Top = 192
  end
  object tblFilms: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'Films.DB'
    Left = 48
    Top = 56
  end
  object tblFilmsPersonsStaff: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'FILMID'
    MasterFields = 'ID'
    MasterSource = dsFilms
    TableName = 'FilmsPersonsStaff.DB'
    Left = 48
    Top = 152
  end
  object tblPersons: TTable
    Active = True
    DatabaseName = 'DemosDB'
    OnCalcFields = tblPersonsCalcFields
    TableName = 'Persons.DB'
    Left = 144
    Top = 152
    object tblPersonsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPersonsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object tblPersonsSECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Size = 50
    end
    object tblPersonsGENDER: TBooleanField
      FieldName = 'GENDER'
    end
    object tblPersonsNAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'NAME'
      Size = 50
      Calculated = True
    end
    object tblPersonsDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
    end
    object tblPersonsBIRTHCOUNTRY: TIntegerField
      FieldName = 'BIRTHCOUNTRY'
    end
    object tblPersonsLOCATIONOFBIRTH: TStringField
      FieldName = 'LOCATIONOFBIRTH'
      Size = 50
    end
    object tblPersonsBIOGRAPHY: TMemoField
      FieldName = 'BIOGRAPHY'
      BlobType = ftMemo
    end
    object tblPersonsNICKNAME: TStringField
      FieldName = 'NICKNAME'
      Size = 50
    end
  end
  object tblPersonsLine: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PersonsLine.DB'
    Left = 216
    Top = 152
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
    Left     = 48
    Top = 8
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 328
    Top = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
    end
  end
end
