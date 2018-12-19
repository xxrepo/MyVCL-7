object StylesCardViewDemoMainDM: TStylesCardViewDemoMainDM
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
      DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left     = 40
    Top = 8
  end
  object tblPersons: TTable
    Active = True
    DatabaseName = 'DemosDB'
    OnCalcFields = tblPersonsCalcFields
    TableName = 'Persons.DB'
    Left = 40
    Top = 56
    object tblPersonsFullName: TStringField
      FieldKind = fkCalculated
      FieldName = 'FullName'
      Size = 50
      Calculated = True
    end
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
    object tblPersonsBIRTHNAME: TStringField
      FieldName = 'BIRTHNAME'
      Size = 50
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
  object dsPersons: TDataSource
    DataSet = tblPersons
    Left = 40
    Top = 104
  end
  object StyleRepository: TcxStyleRepository
    Left = 216
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
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14933198
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clYellow
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 33023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cvssDevExpress: TcxGridCardViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle21
      Styles.IncSearch = cxStyle22
      Styles.Selection = cxStyle24
      Styles.CaptionRow = cxStyle16
      Styles.CardBorder = cxStyle17
      Styles.RowCaption = cxStyle23
    end
    object cvssSlate: TcxGridCardViewStyleSheet
      Caption = 'Slate'
      Styles.Content = cxStyle26
      Styles.ContentEven = cxStyle27
      Styles.ContentOdd = cxStyle28
      Styles.Inactive = cxStyle29
      Styles.Selection = cxStyle31
      Styles.CaptionRow = cxStyle25
      Styles.RowCaption = cxStyle30
    end
    object cvssHighContrast: TcxGridCardViewStyleSheet
      Caption = 'High Contrast'
      Styles.Content = cxStyle33
      Styles.ContentEven = cxStyle34
      Styles.ContentOdd = cxStyle35
      Styles.Inactive = cxStyle36
      Styles.Selection = cxStyle38
      Styles.CaptionRow = cxStyle32
      Styles.RowCaption = cxStyle37
    end
    object cvssUserDefined: TcxGridCardViewStyleSheet
      Caption = 'User Defined'
      Styles.Background = cxStyle39
      Styles.Content = cxStyle40
      Styles.ContentEven = cxStyle42
      Styles.ContentOdd = cxStyle43
      Styles.Inactive = cxStyle44
      Styles.Selection = cxStyle46
      Styles.CaptionRow = cxStyle41
      Styles.CardBorder = cxStyle47
      Styles.RowCaption = cxStyle45
    end
  end
  object tblCountries: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'Countries.DB'
    Left = 112
    Top = 56
  end
  object dsCountries: TDataSource
    DataSet = tblCountries
    Left = 112
    Top = 104
  end
  object EditRepository: TcxEditRepository
    Left = 216
    Top = 64
    object edrepGender: TcxEditRepositoryImageComboBoxItem
      Properties.Images = ilPics
      Properties.Items = <
        item
          Description = 'Female'
          ImageIndex = 0
          Value = False
        end
        item
          Description = 'Male'
          ImageIndex = 1
          Value = True
        end>
      Properties.MultiLineText = False
    end
    object edrepCountry: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'ACRONYM'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsCountries
    end
  end
  object ilPics: TImageList
    Left = 221
    Top = 120
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000100000000100180000000000000C
      0000000000000000000000000000000000000000001710FE1710FE1710FE1710
      FE334AA8334AA8334AA8334AA81710FE1710FE1710FE6C6C6D00000000000000
      00000000005F79E75F79E75F79E75F79E75F79E75F79E782A9D481A7D15D77E2
      5E77E3576ECE5E77E35F79E75F79E77381C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000262B6A1710FE1710FE1710
      FE4A8CB15EB6E85EB6E85EB6E81710FE1710FE7B7B7C00000000000000000000
      00005F79E75B73DA5B73DA5B73D95971D55D76E05A72D797C8FD97C8FD6E8DDD
      5F79E75C74DC5E78E55F79E76379D30000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000F0F0F07B7B8B1511951511
      CE4A8CB15EB6E85EB6E85AABDA151195262B6A00000000000000000000000000
      00005F79E75C75DE5970D35F79E75F79E76883BE85AFED97C8FD97C8FD84ACE2
      5F79E75B73D95A71D1919BC4E6E6E60000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00345A7142799A37667E37667EE1E1E200000000000000000000000000000000
      00005F79E75F79E7576ECE5F79E76A88E78BB6E58EBBEB91BFF197C8FD97C8FD
      5F77BF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000F0F0F04952
      555197C137667E2E46725197C137667E152D34467D836C6C6D89898AA8A8A900
      00008792C35A71D15971D55F79E780A7E68BB6E58BB6E58FBCED95C5F997C8FD
      7184AE0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000002F4F655EB6
      E85EB6E837667E27338837667E5EB6E85EB6E800FFFF00FFFF00FFFF00FFFF00
      00000000000000000000005F79E76C8ADF84ACD78AB4E396C6FA94C4F796C7FC
      93BCE80000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007B7B7C467D8337667E5EB6
      E85EB6E855A2CE24354D4A8CB15EB6E85EB6E800E0F000FFFF00FFFF00FFFF00
      0000000000000000000000B8BCCA9FA9C389B3E18DB8E88AB5E3A1C5EB90BEEF
      91BFF10000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF00FFFF2E88A35EB6
      E85EB6E85EB6E8F0F0F042799A5EB6E85EB6E85EB6E82F4F6500D2E100FFFFC4
      C4C40000000000000000000000000000008BB6E58FBCED8EBBEB89B2E094C4F7
      92C0F38AB5E3C5CFD90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF00FFFF04B3C35EB6
      E85EB6E85EB6E85EB6E85EB6E85EB6E85EB6E85EB6E824354D04B3C300FFFFC4
      C4C4000000000000000000000000E9F1FA8BB6E58EBBEB95C5F986AFDC93C1F4
      96C7FC91BFF1809EC10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000011818900FFFF2E88A33766
      7E5EB6E85EB6E85AABDA5EB6E824354D181D235AABDA5EB6E800FFFF00FFFFE1
      E1E2000000000000000000000000B6CAE18BB6E590BEF09FB4CC7798BD818182
      74747660758E47515C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000006C6C6D00F1FF259EB8181D
      235EB6E855A2CE152D342B465742799A5AABDA55A2CE5EB6E800FFFF00FFFF00
      0000000000000000000000000000A1BCDC86AEDA7494B76063675F748C495460
      3B3E4385ACD83535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000089898A00FFFF00FF
      FF5EB6E85EB6E85EB6E85EB6E85EB6E85197C15EB6E855A2CE00FFFF00939C00
      00000000000000000000000000000000005B6D838BB6E58BB6E593C1F497C8FD
      97C8FD85ACD83535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F0F0F000FFFF00FF
      FF3C98BB5EB6E83B738A345A715EB6E85EB6E85AABDA1294A600FFFF5A646800
      0000000000000000000000000000D9D9D94B55638BB6E58BB6E591BFF197C8FD
      97C8FD667F9A3535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A8A8A90093
      9C00FFFF00FFFF2E88A34A8CB13A8DAD259EB800FFFF00FFFFD3D3D300000000
      0000000000000000000000000000F2F2F23A3D4286AEDA454D58353537353537
      3535373535373535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D3D3
      D300FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00E0F00F707B00000000000000
      000000000000000000000000000000000035353740454D353537353537353537
      3535373535374E4E500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000097979889898AE1E1E200000000000000000000000000000000
      0000000000000000000000000000000000000000B3B3B4686869686869B3B3B4
      D9D9D90000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF008007800000000000800F000100000000
      801F000100000000F83F001F00000000E001001F00000000E001E01F00000000
      8001E01F000000008000F807000000008000F007000000008000F00700000000
      8001F00700000000C001F80700000000C001F00700000000E003F00700000000
      F007F80700000000FE3FFC1F0000000000000000000000000000000000000000
      000000000000}
  end
end
