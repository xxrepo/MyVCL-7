object BandedFixedDemoDataDM: TBandedFixedDemoDataDM
  OldCreateOrder = False
  Left = 310
  Top = 163
  Height = 373
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
  object tblSheduler: TTable
    Active = True
    DatabaseName = 'DemosDB'
    OnCalcFields = tblShedulerCalcFields
    TableName = 'SCHEDULER.DB'
    Left = 40
    Top = 64
    object tblShedulerID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblShedulerPROJECTID: TIntegerField
      FieldName = 'PROJECTID'
      ReadOnly = True
      Visible = False
    end
    object tblShedulerProjectManagerID: TIntegerField
      FieldKind = fkLookup
      FieldName = 'ProjectManagerID'
      LookupDataSet = tblProjects
      LookupKeyFields = 'ID'
      LookupResultField = 'MANAGERID'
      KeyFields = 'PROJECTID'
      ReadOnly = True
      Visible = False
      Lookup = True
    end
    object tblShedulerUSERID: TIntegerField
      FieldName = 'USERID'
      ReadOnly = True
    end
    object tblShedulerSUNDAY: TSmallIntField
      FieldName = 'SUNDAY'
    end
    object tblShedulerMONDAY: TSmallIntField
      FieldName = 'MONDAY'
    end
    object tblShedulerTUESDAY: TSmallIntField
      FieldName = 'TUESDAY'
    end
    object tblShedulerWEDNESDAY: TSmallIntField
      FieldName = 'WEDNESDAY'
    end
    object tblShedulerTHURSDAY: TSmallIntField
      FieldName = 'THURSDAY'
    end
    object tblShedulerFRIDAY: TSmallIntField
      FieldName = 'FRIDAY'
    end
    object tblShedulerSATURDAY: TSmallIntField
      FieldName = 'SATURDAY'
    end
    object tblShedulerWeekSum: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'WeekSum'
      Calculated = True
    end
    object tblShedulerWeekAVG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'WeekAVG'
      DisplayFormat = '#.#'
      Calculated = True
    end
  end
  object dsSheduler: TDataSource
    DataSet = tblSheduler
    Left = 40
    Top = 112
  end
  object dsPersons: TDataSource
    DataSet = tblPersons
    Left = 144
    Top = 112
  end
  object tblPersons: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PERSONS.DB'
    Left = 144
    Top = 64
    object tblPersonsID: TIntegerField
      FieldName = 'ID'
    end
    object tblPersonsName: TStringField
      FieldName = 'Name'
      Size = 50
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
  object dsProjects: TDataSource
    DataSet = tblProjects
    Left = 208
    Top = 112
  end
  object tblProjects: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PROJECTS.DB'
    Left = 208
    Top = 64
    object tblProjectsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblProjectsNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object tblProjectsMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
    end
  end
end
