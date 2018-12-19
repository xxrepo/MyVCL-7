object ViewBandedFixedDemoDataDM: TViewBandedFixedDemoDataDM
  OldCreateOrder = False
  Left = 429
  Top = 128
  Height = 367
  Width = 305
  object tblSCHEDULER: TTable
    Active = True
    DatabaseName = 'DemosDB'
    OnCalcFields = tblSCHEDULERCalcFields
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
    object SUNDAY: TSmallIntField
      FieldName = 'SUNDAY'
    end
    object MONDAY: TSmallIntField
      FieldName = 'MONDAY'
    end
    object TUESDAY: TSmallIntField
      FieldName = 'TUESDAY'
    end
    object WEDNESDAY: TSmallIntField
      FieldName = 'WEDNESDAY'
    end
    object THURSDAY: TSmallIntField
      FieldName = 'THURSDAY'
    end
    object FRIDAY: TSmallIntField
      FieldName = 'FRIDAY'
    end
    object SATURDAY: TSmallIntField
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
    Left     = 32
    Top = 16
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
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
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
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
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
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.FilterBox = cxStyle7
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle9
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
    end
  end
end
