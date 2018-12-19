object EditorsMaskDemoMainDM: TEditorsMaskDemoMainDM
  OldCreateOrder = False
  Left = 270
  Top = 89
  Height = 655
  Width = 733
  object StyleRepository: TcxStyleRepository
    Left = 160
    Top = 8
    object stBlueDark: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object stGold: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object stBlueLight: TcxStyle
      AssignedValues = [svColor]
      Color = 16247513
    end
    object stBlueBright: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object stYellowLight: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stGreyLight: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stBlueSky: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
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
    Left = 36
    Top = 12
  end
  object ADOTableUSERS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'DEPARTMENTID'
    MasterFields = 'ID'
    MasterSource = DataSourceDEPARTMENTS
    TableName = 'USERS.DB'
    Left = 36
    Top = 84
  end
  object DataSourceUSERS: TDataSource
    DataSet = ADOTableUSERS
    Left = 44
    Top = 132
  end
  object ADOTableDEPARTMENTS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'DEPARTMENTS.DB'
    Left = 168
    Top = 68
  end
  object DataSourceDEPARTMENTS: TDataSource
    DataSet = ADOTableDEPARTMENTS
    Left = 168
    Top = 140
  end
end
