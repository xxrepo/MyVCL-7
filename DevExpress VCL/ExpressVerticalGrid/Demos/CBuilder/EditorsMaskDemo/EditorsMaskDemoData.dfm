object EditorsMaskDemoDataDM: TEditorsMaskDemoDataDM
  OldCreateOrder = False
  Left = 326
  Top = 211
  Height = 239
  Width = 273
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
  object tblUSERS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'DEPARTMENTID'
    MasterFields = 'ID'
    MasterSource = dsDEPARTMENTS
    TableName = 'USERS.DB'
    Left = 28
    Top = 68
  end
  object dsUSERS: TDataSource
    DataSet = tblUSERS
    Left = 28
    Top = 124
  end
  object tblDEPARTMENTS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'DIVISIONS.DB'
    Left = 168
    Top = 68
  end
  object dsDEPARTMENTS: TDataSource
    DataSet = tblDEPARTMENTS
    Left = 168
    Top = 124
  end
end
