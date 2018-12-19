object StylesSimpleDemoDataDM: TStylesSimpleDemoDataDM
  OldCreateOrder = False
  Left = 285
  Top = 199
  Height = 222
  Width = 379
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
  object tblDEPARTMENTS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'DEPARTMENTS.DB'
    Left = 40
    Top = 56
  end
  object dsDEPARTMENTS: TDataSource
    DataSet = tblDEPARTMENTS
    Left = 40
    Top = 104
  end
  object tblPERSONS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PERSONS.DB'
    Left = 136
    Top = 56
    object tblPERSONSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPERSONSName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object tblPERSONSCountry: TStringField
      FieldName = 'Country'
      Size = 15
    end
    object tblPERSONSPostalCode: TStringField
      FieldName = 'PostalCode'
      Size = 10
    end
    object tblPERSONSCity: TStringField
      FieldName = 'City'
      Size = 15
    end
    object tblPERSONSAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object tblPERSONSPhone: TStringField
      FieldName = 'Phone'
      Size = 24
    end
    object tblPERSONSFax: TStringField
      FieldName = 'Fax'
      Size = 24
    end
    object tblPERSONSEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object tblPERSONSHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 100
    end
    object tblPERSONSDepartmentID: TIntegerField
      FieldName = 'DepartmentID'
    end
  end
  object dsPERSONS: TDataSource
    DataSet = tblPERSONS
    Left = 136
    Top = 104
  end
  object StyleRepository: TcxStyleRepository
    Left = 136
    Top = 8
    object Sunny: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clNavy
    end
    object Dark: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object Golden: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object Summer: TcxStyle
      AssignedValues = [svColor]
      Color = 15519398
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
      AssignedValues = [svColor]
      Color = 16247513
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
    object UserStyleSheet: TcxTreeListStyleSheet
      Caption = 'User Defined Style Sheet'
      Styles.Background = Dark
      Styles.Content = Autumn
      Styles.Inactive = Dark
      Styles.Selection = Bright
      Styles.BandBackground = Dark
      Styles.BandContent = Dark
      Styles.BandHeader = Depth
      Styles.ColumnHeader = Autumn
      Styles.ContentEven = Spring
      Styles.ContentOdd = Summer
      Styles.Footer = Light
      Styles.IncSearch = Golden
      Styles.Indicator = Dark
      Styles.Preview = Light
      BuiltIn = True
    end
  end
end
