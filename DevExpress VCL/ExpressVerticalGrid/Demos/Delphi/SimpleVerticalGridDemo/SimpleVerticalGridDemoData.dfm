object SimpleVerticalGridDemoMainDM: TSimpleVerticalGridDemoMainDM
  OldCreateOrder = False
  Left = 242
  Top = 107
  Height = 310
  Width = 384
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 56
    Top = 32
  end
  object tblCars: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'Cars.DB'
    Left = 120
    Top = 32
  end
  object dsCars: TDataSource
    DataSet = tblCars
    Left = 184
    Top = 32
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 264
    Top = 32
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14590588
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13795663
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clYellow
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14590588
      TextColor = clWhite
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15120279
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor]
      Color = 16049100
    end
    object cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle3
      Styles.Inactive = cxStyle5
      Styles.Selection = cxStyle7
      Styles.Category = cxStyle2
      Styles.Header = cxStyle4
      Styles.IncSearch = cxStyle6
      BuiltIn = True
    end
  end
end
